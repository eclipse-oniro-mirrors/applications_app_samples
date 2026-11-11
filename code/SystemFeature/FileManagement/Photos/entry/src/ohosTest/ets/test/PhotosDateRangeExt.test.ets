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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0001 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0001 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0002 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 1, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0002 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0003 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 1, 0, 0, 0).getTime(), new Date(2024, 0, 2, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0003 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0004 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 2, 0, 0, 0).getTime(), new Date(2023, 1, 2, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0004 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0005 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 2, 0, 0, 0).getTime(), new Date(2023, 1, 2, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0005 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0006 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 2, 0, 0, 0).getTime(), new Date(2023, 1, 3, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0006 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0007 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 3, 0, 0, 0).getTime(), new Date(2024, 2, 3, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0007 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0008 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 3, 0, 0, 0).getTime(), new Date(2024, 2, 3, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0008 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0009 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 3, 0, 0, 0).getTime(), new Date(2024, 2, 4, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0009 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0010 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 4, 0, 0, 0).getTime(), new Date(2023, 3, 4, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0010 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0011 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 4, 0, 0, 0).getTime(), new Date(2023, 3, 4, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0011 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0012 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 4, 0, 0, 0).getTime(), new Date(2023, 3, 5, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0012 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0013 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 5, 0, 0, 0).getTime(), new Date(2024, 4, 5, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0013 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0014 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 5, 0, 0, 0).getTime(), new Date(2024, 4, 5, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0014 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0015 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 5, 0, 0, 0).getTime(), new Date(2024, 4, 6, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0015 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0016 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 6, 0, 0, 0).getTime(), new Date(2023, 5, 6, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0016 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0017 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 6, 0, 0, 0).getTime(), new Date(2023, 5, 6, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0017 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0018 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 6, 0, 0, 0).getTime(), new Date(2023, 5, 7, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0018 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0019 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 7, 0, 0, 0).getTime(), new Date(2024, 6, 7, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0019 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0020 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 7, 0, 0, 0).getTime(), new Date(2024, 6, 7, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0020 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0021 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 7, 0, 0, 0).getTime(), new Date(2024, 6, 8, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0021 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0022 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 8, 0, 0, 0).getTime(), new Date(2023, 7, 8, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0022 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0023 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 8, 0, 0, 0).getTime(), new Date(2023, 7, 8, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0023 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0024 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 8, 0, 0, 0).getTime(), new Date(2023, 7, 9, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0024 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0025 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 9, 0, 0, 0).getTime(), new Date(2024, 8, 9, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0025 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0026 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 9, 0, 0, 0).getTime(), new Date(2024, 8, 9, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0026 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0027 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 9, 0, 0, 0).getTime(), new Date(2024, 8, 10, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0027 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0028 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 10, 0, 0, 0).getTime(), new Date(2023, 9, 10, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0028 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0029 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 10, 0, 0, 0).getTime(), new Date(2023, 9, 10, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0029 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0030 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 10, 0, 0, 0).getTime(), new Date(2023, 9, 11, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0030 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0031 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 11, 0, 0, 0).getTime(), new Date(2024, 10, 11, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0031 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0032 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 11, 0, 0, 0).getTime(), new Date(2024, 10, 11, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0032 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0033 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 11, 0, 0, 0).getTime(), new Date(2024, 10, 12, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0033 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0034 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 12, 0, 0, 0).getTime(), new Date(2023, 11, 12, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0034 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0035 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 12, 0, 0, 0).getTime(), new Date(2023, 11, 12, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0035 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0036 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 12, 0, 0, 0).getTime(), new Date(2023, 11, 13, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0036 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0037 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 13, 0, 0, 0).getTime(), new Date(2024, 0, 13, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0037 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0038 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 13, 0, 0, 0).getTime(), new Date(2024, 0, 13, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0038 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0039 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 13, 0, 0, 0).getTime(), new Date(2024, 0, 14, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0039 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0040 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 14, 0, 0, 0).getTime(), new Date(2023, 1, 14, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0040 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0041 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 14, 0, 0, 0).getTime(), new Date(2023, 1, 14, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0041 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0042 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 14, 0, 0, 0).getTime(), new Date(2023, 1, 15, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0042 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0043 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 15, 0, 0, 0).getTime(), new Date(2024, 2, 15, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0043 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0044 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 15, 0, 0, 0).getTime(), new Date(2024, 2, 15, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0044 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0045 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 15, 0, 0, 0).getTime(), new Date(2024, 2, 16, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0045 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0046 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 16, 0, 0, 0).getTime(), new Date(2023, 3, 16, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0046 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0047 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 16, 0, 0, 0).getTime(), new Date(2023, 3, 16, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0047 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0048 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 16, 0, 0, 0).getTime(), new Date(2023, 3, 17, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0048 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0049 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 17, 0, 0, 0).getTime(), new Date(2024, 4, 17, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0049 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0050 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 17, 0, 0, 0).getTime(), new Date(2024, 4, 17, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0050 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0051 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 17, 0, 0, 0).getTime(), new Date(2024, 4, 18, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0051 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0052 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 18, 0, 0, 0).getTime(), new Date(2023, 5, 18, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0052 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0053 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 18, 0, 0, 0).getTime(), new Date(2023, 5, 18, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0053 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0054 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 18, 0, 0, 0).getTime(), new Date(2023, 5, 19, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0054 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0055 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 19, 0, 0, 0).getTime(), new Date(2024, 6, 19, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0055 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0056 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 19, 0, 0, 0).getTime(), new Date(2024, 6, 19, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0056 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0057 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 19, 0, 0, 0).getTime(), new Date(2024, 6, 20, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0057 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0058 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 20, 0, 0, 0).getTime(), new Date(2023, 7, 20, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0058 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0059 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 20, 0, 0, 0).getTime(), new Date(2023, 7, 20, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0059 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0060 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 20, 0, 0, 0).getTime(), new Date(2023, 7, 21, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0060 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0061 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 21, 0, 0, 0).getTime(), new Date(2024, 8, 21, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0061 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0062 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 21, 0, 0, 0).getTime(), new Date(2024, 8, 21, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0062 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0063 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 21, 0, 0, 0).getTime(), new Date(2024, 8, 22, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0063 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0064 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 22, 0, 0, 0).getTime(), new Date(2023, 9, 22, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0064 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0065 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 22, 0, 0, 0).getTime(), new Date(2023, 9, 22, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0065 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0066 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 22, 0, 0, 0).getTime(), new Date(2023, 9, 23, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0066 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0067 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 23, 0, 0, 0).getTime(), new Date(2024, 10, 23, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0067 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0068 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 23, 0, 0, 0).getTime(), new Date(2024, 10, 23, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0068 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0069 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 23, 0, 0, 0).getTime(), new Date(2024, 10, 24, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0069 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0070 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 24, 0, 0, 0).getTime(), new Date(2023, 11, 24, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0070 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0071 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 24, 0, 0, 0).getTime(), new Date(2023, 11, 24, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0071 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0072 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 24, 0, 0, 0).getTime(), new Date(2023, 11, 25, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0072 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0073 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 25, 0, 0, 0).getTime(), new Date(2024, 0, 25, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0073 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0074 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 25, 0, 0, 0).getTime(), new Date(2024, 0, 25, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0074 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0075 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 25, 0, 0, 0).getTime(), new Date(2024, 0, 26, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0075 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0076 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 26, 0, 0, 0).getTime(), new Date(2023, 1, 26, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0076 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0077 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 26, 0, 0, 0).getTime(), new Date(2023, 1, 26, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0077 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0078 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 26, 0, 0, 0).getTime(), new Date(2023, 1, 27, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0078 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0079 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 27, 0, 0, 0).getTime(), new Date(2024, 2, 27, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0079 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0080 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 27, 0, 0, 0).getTime(), new Date(2024, 2, 27, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0080 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0081 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 27, 0, 0, 0).getTime(), new Date(2024, 2, 28, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0081 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0082 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 1, 0, 0, 0).getTime(), new Date(2023, 3, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0082 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0083 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 1, 0, 0, 0).getTime(), new Date(2023, 3, 1, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0083 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0084 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 1, 0, 0, 0).getTime(), new Date(2023, 3, 2, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0084 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0085 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 2, 0, 0, 0).getTime(), new Date(2024, 4, 2, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0085 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0086 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 2, 0, 0, 0).getTime(), new Date(2024, 4, 2, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0086 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0087 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 2, 0, 0, 0).getTime(), new Date(2024, 4, 3, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0087 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0088 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 3, 0, 0, 0).getTime(), new Date(2023, 5, 3, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0088 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0089 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 3, 0, 0, 0).getTime(), new Date(2023, 5, 3, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0089 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0090 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 3, 0, 0, 0).getTime(), new Date(2023, 5, 4, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0090 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0091 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 4, 0, 0, 0).getTime(), new Date(2024, 6, 4, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0091 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0092 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 4, 0, 0, 0).getTime(), new Date(2024, 6, 4, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0092 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0093 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 4, 0, 0, 0).getTime(), new Date(2024, 6, 5, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0093 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0094 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 5, 0, 0, 0).getTime(), new Date(2023, 7, 5, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0094 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0095 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 5, 0, 0, 0).getTime(), new Date(2023, 7, 5, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0095 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0096 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 5, 0, 0, 0).getTime(), new Date(2023, 7, 6, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0096 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0097 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 6, 0, 0, 0).getTime(), new Date(2024, 8, 6, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0097 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0098 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 6, 0, 0, 0).getTime(), new Date(2024, 8, 6, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0098 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0099 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 6, 0, 0, 0).getTime(), new Date(2024, 8, 7, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0099 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0100 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 7, 0, 0, 0).getTime(), new Date(2023, 9, 7, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0100 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0101 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 7, 0, 0, 0).getTime(), new Date(2023, 9, 7, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0101 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0102 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 7, 0, 0, 0).getTime(), new Date(2023, 9, 8, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0102 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0103 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 8, 0, 0, 0).getTime(), new Date(2024, 10, 8, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0103 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0104 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 8, 0, 0, 0).getTime(), new Date(2024, 10, 8, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0104 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0105 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 8, 0, 0, 0).getTime(), new Date(2024, 10, 9, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0105 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0106 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 9, 0, 0, 0).getTime(), new Date(2023, 11, 9, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0106 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0107 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 9, 0, 0, 0).getTime(), new Date(2023, 11, 9, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0107 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0108 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 9, 0, 0, 0).getTime(), new Date(2023, 11, 10, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0108 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0109 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 10, 0, 0, 0).getTime(), new Date(2024, 0, 10, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0109 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0110 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 10, 0, 0, 0).getTime(), new Date(2024, 0, 10, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0110 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0111 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 10, 0, 0, 0).getTime(), new Date(2024, 0, 11, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0111 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0112 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 11, 0, 0, 0).getTime(), new Date(2023, 1, 11, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0112 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0113 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 11, 0, 0, 0).getTime(), new Date(2023, 1, 11, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0113 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0114 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 11, 0, 0, 0).getTime(), new Date(2023, 1, 12, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0114 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0115 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 12, 0, 0, 0).getTime(), new Date(2024, 2, 12, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0115 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0116 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 12, 0, 0, 0).getTime(), new Date(2024, 2, 12, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0116 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0117 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 12, 0, 0, 0).getTime(), new Date(2024, 2, 13, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0117 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0118 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 13, 0, 0, 0).getTime(), new Date(2023, 3, 13, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0118 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0119 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 13, 0, 0, 0).getTime(), new Date(2023, 3, 13, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0119 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0120 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 13, 0, 0, 0).getTime(), new Date(2023, 3, 14, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0120 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0121 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 14, 0, 0, 0).getTime(), new Date(2024, 4, 14, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0121 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0122 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 14, 0, 0, 0).getTime(), new Date(2024, 4, 14, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0122 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0123 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 14, 0, 0, 0).getTime(), new Date(2024, 4, 15, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0123 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0124 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 15, 0, 0, 0).getTime(), new Date(2023, 5, 15, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0124 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0125 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 15, 0, 0, 0).getTime(), new Date(2023, 5, 15, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0125 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0126 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 15, 0, 0, 0).getTime(), new Date(2023, 5, 16, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0126 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0127 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 16, 0, 0, 0).getTime(), new Date(2024, 6, 16, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0127 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0128 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 16, 0, 0, 0).getTime(), new Date(2024, 6, 16, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0128 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0129 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 16, 0, 0, 0).getTime(), new Date(2024, 6, 17, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0129 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0130 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 17, 0, 0, 0).getTime(), new Date(2023, 7, 17, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0130 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0131 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 17, 0, 0, 0).getTime(), new Date(2023, 7, 17, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0131 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0132 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 17, 0, 0, 0).getTime(), new Date(2023, 7, 18, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0132 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0133 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 18, 0, 0, 0).getTime(), new Date(2024, 8, 18, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0133 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0134 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 18, 0, 0, 0).getTime(), new Date(2024, 8, 18, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0134 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0135 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 18, 0, 0, 0).getTime(), new Date(2024, 8, 19, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0135 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0136 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 19, 0, 0, 0).getTime(), new Date(2023, 9, 19, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0137
     * @tc.name      testPhotosDateSameDayExt0137
     * @tc.desc      Compares extended same-day sample 46. case 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0137 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 19, 0, 0, 0).getTime(), new Date(2023, 9, 19, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0138
     * @tc.name      testPhotosDateSameDayExt0138
     * @tc.desc      Compares extended same-day sample 46. case 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0138 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 19, 0, 0, 0).getTime(), new Date(2023, 9, 20, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0138 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0139
     * @tc.name      testPhotosDateSameDayExt0139
     * @tc.desc      Compares extended same-day sample 47. case 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0139 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 20, 0, 0, 0).getTime(), new Date(2024, 10, 20, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0140
     * @tc.name      testPhotosDateSameDayExt0140
     * @tc.desc      Compares extended same-day sample 47. case 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0140 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 20, 0, 0, 0).getTime(), new Date(2024, 10, 20, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0140 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0141
     * @tc.name      testPhotosDateSameDayExt0141
     * @tc.desc      Compares extended same-day sample 47. case 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0141 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 20, 0, 0, 0).getTime(), new Date(2024, 10, 21, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0141 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0142
     * @tc.name      testPhotosDateSameDayExt0142
     * @tc.desc      Compares extended same-day sample 48. case 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0142 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 21, 0, 0, 0).getTime(), new Date(2023, 11, 21, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0143
     * @tc.name      testPhotosDateSameDayExt0143
     * @tc.desc      Compares extended same-day sample 48. case 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0143 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 21, 0, 0, 0).getTime(), new Date(2023, 11, 21, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0144
     * @tc.name      testPhotosDateSameDayExt0144
     * @tc.desc      Compares extended same-day sample 48. case 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0144 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 21, 0, 0, 0).getTime(), new Date(2023, 11, 22, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0144 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0145
     * @tc.name      testPhotosDateSameDayExt0145
     * @tc.desc      Compares extended same-day sample 49. case 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0145 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 22, 0, 0, 0).getTime(), new Date(2024, 0, 22, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0146
     * @tc.name      testPhotosDateSameDayExt0146
     * @tc.desc      Compares extended same-day sample 49. case 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0146 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 22, 0, 0, 0).getTime(), new Date(2024, 0, 22, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0147
     * @tc.name      testPhotosDateSameDayExt0147
     * @tc.desc      Compares extended same-day sample 49. case 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0147 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 22, 0, 0, 0).getTime(), new Date(2024, 0, 23, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0147 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0148
     * @tc.name      testPhotosDateSameDayExt0148
     * @tc.desc      Compares extended same-day sample 50. case 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0148 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 23, 0, 0, 0).getTime(), new Date(2023, 1, 23, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0149
     * @tc.name      testPhotosDateSameDayExt0149
     * @tc.desc      Compares extended same-day sample 50. case 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0149 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 23, 0, 0, 0).getTime(), new Date(2023, 1, 23, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0150
     * @tc.name      testPhotosDateSameDayExt0150
     * @tc.desc      Compares extended same-day sample 50. case 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0150 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 23, 0, 0, 0).getTime(), new Date(2023, 1, 24, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0150 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0151
     * @tc.name      testPhotosDateSameDayExt0151
     * @tc.desc      Compares extended same-day sample 51. case 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0151 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 24, 0, 0, 0).getTime(), new Date(2024, 2, 24, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0152
     * @tc.name      testPhotosDateSameDayExt0152
     * @tc.desc      Compares extended same-day sample 51. case 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0152 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 24, 0, 0, 0).getTime(), new Date(2024, 2, 24, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0153
     * @tc.name      testPhotosDateSameDayExt0153
     * @tc.desc      Compares extended same-day sample 51. case 153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0153 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 24, 0, 0, 0).getTime(), new Date(2024, 2, 25, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0153 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0154
     * @tc.name      testPhotosDateSameDayExt0154
     * @tc.desc      Compares extended same-day sample 52. case 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0154 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 25, 0, 0, 0).getTime(), new Date(2023, 3, 25, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0155
     * @tc.name      testPhotosDateSameDayExt0155
     * @tc.desc      Compares extended same-day sample 52. case 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0155 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 25, 0, 0, 0).getTime(), new Date(2023, 3, 25, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0155 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0156
     * @tc.name      testPhotosDateSameDayExt0156
     * @tc.desc      Compares extended same-day sample 52. case 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0156 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 25, 0, 0, 0).getTime(), new Date(2023, 3, 26, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0156 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0157
     * @tc.name      testPhotosDateSameDayExt0157
     * @tc.desc      Compares extended same-day sample 53. case 157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0157 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 26, 0, 0, 0).getTime(), new Date(2024, 4, 26, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0158
     * @tc.name      testPhotosDateSameDayExt0158
     * @tc.desc      Compares extended same-day sample 53. case 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0158 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 26, 0, 0, 0).getTime(), new Date(2024, 4, 26, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0159
     * @tc.name      testPhotosDateSameDayExt0159
     * @tc.desc      Compares extended same-day sample 53. case 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0159 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 26, 0, 0, 0).getTime(), new Date(2024, 4, 27, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0159 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0160
     * @tc.name      testPhotosDateSameDayExt0160
     * @tc.desc      Compares extended same-day sample 54. case 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0160 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 27, 0, 0, 0).getTime(), new Date(2023, 5, 27, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0160 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0161
     * @tc.name      testPhotosDateSameDayExt0161
     * @tc.desc      Compares extended same-day sample 54. case 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0161 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 27, 0, 0, 0).getTime(), new Date(2023, 5, 27, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0162
     * @tc.name      testPhotosDateSameDayExt0162
     * @tc.desc      Compares extended same-day sample 54. case 162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0162 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 27, 0, 0, 0).getTime(), new Date(2023, 5, 28, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0162 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0163
     * @tc.name      testPhotosDateSameDayExt0163
     * @tc.desc      Compares extended same-day sample 55. case 163
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0163 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 1, 0, 0, 0).getTime(), new Date(2024, 6, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0164
     * @tc.name      testPhotosDateSameDayExt0164
     * @tc.desc      Compares extended same-day sample 55. case 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0164 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 1, 0, 0, 0).getTime(), new Date(2024, 6, 1, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0165
     * @tc.name      testPhotosDateSameDayExt0165
     * @tc.desc      Compares extended same-day sample 55. case 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0165 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 1, 0, 0, 0).getTime(), new Date(2024, 6, 2, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0165 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0166
     * @tc.name      testPhotosDateSameDayExt0166
     * @tc.desc      Compares extended same-day sample 56. case 166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0166 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 2, 0, 0, 0).getTime(), new Date(2023, 7, 2, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0167
     * @tc.name      testPhotosDateSameDayExt0167
     * @tc.desc      Compares extended same-day sample 56. case 167
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0167 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 2, 0, 0, 0).getTime(), new Date(2023, 7, 2, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0168
     * @tc.name      testPhotosDateSameDayExt0168
     * @tc.desc      Compares extended same-day sample 56. case 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0168 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 2, 0, 0, 0).getTime(), new Date(2023, 7, 3, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0168 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0169
     * @tc.name      testPhotosDateSameDayExt0169
     * @tc.desc      Compares extended same-day sample 57. case 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0169 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 3, 0, 0, 0).getTime(), new Date(2024, 8, 3, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0170
     * @tc.name      testPhotosDateSameDayExt0170
     * @tc.desc      Compares extended same-day sample 57. case 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0170 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 3, 0, 0, 0).getTime(), new Date(2024, 8, 3, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0170 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0171
     * @tc.name      testPhotosDateSameDayExt0171
     * @tc.desc      Compares extended same-day sample 57. case 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0171 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 3, 0, 0, 0).getTime(), new Date(2024, 8, 4, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0171 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0172
     * @tc.name      testPhotosDateSameDayExt0172
     * @tc.desc      Compares extended same-day sample 58. case 172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0172 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 4, 0, 0, 0).getTime(), new Date(2023, 9, 4, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0173
     * @tc.name      testPhotosDateSameDayExt0173
     * @tc.desc      Compares extended same-day sample 58. case 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0173 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 4, 0, 0, 0).getTime(), new Date(2023, 9, 4, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0174
     * @tc.name      testPhotosDateSameDayExt0174
     * @tc.desc      Compares extended same-day sample 58. case 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0174 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 4, 0, 0, 0).getTime(), new Date(2023, 9, 5, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0174 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0175
     * @tc.name      testPhotosDateSameDayExt0175
     * @tc.desc      Compares extended same-day sample 59. case 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0175 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 5, 0, 0, 0).getTime(), new Date(2024, 10, 5, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0175 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0176
     * @tc.name      testPhotosDateSameDayExt0176
     * @tc.desc      Compares extended same-day sample 59. case 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0176 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 5, 0, 0, 0).getTime(), new Date(2024, 10, 5, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0177
     * @tc.name      testPhotosDateSameDayExt0177
     * @tc.desc      Compares extended same-day sample 59. case 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0177 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 5, 0, 0, 0).getTime(), new Date(2024, 10, 6, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0177 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0178
     * @tc.name      testPhotosDateSameDayExt0178
     * @tc.desc      Compares extended same-day sample 60. case 178
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0178 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 6, 0, 0, 0).getTime(), new Date(2023, 11, 6, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0179
     * @tc.name      testPhotosDateSameDayExt0179
     * @tc.desc      Compares extended same-day sample 60. case 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0179 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 6, 0, 0, 0).getTime(), new Date(2023, 11, 6, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0180
     * @tc.name      testPhotosDateSameDayExt0180
     * @tc.desc      Compares extended same-day sample 60. case 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0180 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 6, 0, 0, 0).getTime(), new Date(2023, 11, 7, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0180 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0181
     * @tc.name      testPhotosDateSameDayExt0181
     * @tc.desc      Compares extended same-day sample 61. case 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0181 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 7, 0, 0, 0).getTime(), new Date(2024, 0, 7, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0181 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0182
     * @tc.name      testPhotosDateSameDayExt0182
     * @tc.desc      Compares extended same-day sample 61. case 182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0182 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 7, 0, 0, 0).getTime(), new Date(2024, 0, 7, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0182 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0183
     * @tc.name      testPhotosDateSameDayExt0183
     * @tc.desc      Compares extended same-day sample 61. case 183
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0183 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 7, 0, 0, 0).getTime(), new Date(2024, 0, 8, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0183 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0184
     * @tc.name      testPhotosDateSameDayExt0184
     * @tc.desc      Compares extended same-day sample 62. case 184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0184 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 8, 0, 0, 0).getTime(), new Date(2023, 1, 8, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0184 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0185
     * @tc.name      testPhotosDateSameDayExt0185
     * @tc.desc      Compares extended same-day sample 62. case 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0185 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 8, 0, 0, 0).getTime(), new Date(2023, 1, 8, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0185 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0186
     * @tc.name      testPhotosDateSameDayExt0186
     * @tc.desc      Compares extended same-day sample 62. case 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0186 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 8, 0, 0, 0).getTime(), new Date(2023, 1, 9, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0186 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0187
     * @tc.name      testPhotosDateSameDayExt0187
     * @tc.desc      Compares extended same-day sample 63. case 187
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0187 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 9, 0, 0, 0).getTime(), new Date(2024, 2, 9, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0187 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0188
     * @tc.name      testPhotosDateSameDayExt0188
     * @tc.desc      Compares extended same-day sample 63. case 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0188 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 9, 0, 0, 0).getTime(), new Date(2024, 2, 9, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0188 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0189
     * @tc.name      testPhotosDateSameDayExt0189
     * @tc.desc      Compares extended same-day sample 63. case 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0189 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 9, 0, 0, 0).getTime(), new Date(2024, 2, 10, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0189 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0190
     * @tc.name      testPhotosDateSameDayExt0190
     * @tc.desc      Compares extended same-day sample 64. case 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0190 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 10, 0, 0, 0).getTime(), new Date(2023, 3, 10, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0190 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0191
     * @tc.name      testPhotosDateSameDayExt0191
     * @tc.desc      Compares extended same-day sample 64. case 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0191 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 10, 0, 0, 0).getTime(), new Date(2023, 3, 10, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0191 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0192
     * @tc.name      testPhotosDateSameDayExt0192
     * @tc.desc      Compares extended same-day sample 64. case 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0192 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 10, 0, 0, 0).getTime(), new Date(2023, 3, 11, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0192 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0193
     * @tc.name      testPhotosDateSameDayExt0193
     * @tc.desc      Compares extended same-day sample 65. case 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0193 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 11, 0, 0, 0).getTime(), new Date(2024, 4, 11, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0193 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0194
     * @tc.name      testPhotosDateSameDayExt0194
     * @tc.desc      Compares extended same-day sample 65. case 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0194 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 11, 0, 0, 0).getTime(), new Date(2024, 4, 11, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0194 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0195
     * @tc.name      testPhotosDateSameDayExt0195
     * @tc.desc      Compares extended same-day sample 65. case 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0195 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 11, 0, 0, 0).getTime(), new Date(2024, 4, 12, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0195 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0196
     * @tc.name      testPhotosDateSameDayExt0196
     * @tc.desc      Compares extended same-day sample 66. case 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0196 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 12, 0, 0, 0).getTime(), new Date(2023, 5, 12, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0196 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0197
     * @tc.name      testPhotosDateSameDayExt0197
     * @tc.desc      Compares extended same-day sample 66. case 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0197 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 12, 0, 0, 0).getTime(), new Date(2023, 5, 12, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0197 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0198
     * @tc.name      testPhotosDateSameDayExt0198
     * @tc.desc      Compares extended same-day sample 66. case 198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0198 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 12, 0, 0, 0).getTime(), new Date(2023, 5, 13, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0198 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0199
     * @tc.name      testPhotosDateSameDayExt0199
     * @tc.desc      Compares extended same-day sample 67. case 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0199 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 13, 0, 0, 0).getTime(), new Date(2024, 6, 13, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0199 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0200
     * @tc.name      testPhotosDateSameDayExt0200
     * @tc.desc      Compares extended same-day sample 67. case 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0200 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 13, 0, 0, 0).getTime(), new Date(2024, 6, 13, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0200 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0201
     * @tc.name      testPhotosDateSameDayExt0201
     * @tc.desc      Compares extended same-day sample 67. case 201
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0201 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 13, 0, 0, 0).getTime(), new Date(2024, 6, 14, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0201 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0202
     * @tc.name      testPhotosDateSameDayExt0202
     * @tc.desc      Compares extended same-day sample 68. case 202
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0202 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 14, 0, 0, 0).getTime(), new Date(2023, 7, 14, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0202 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0203
     * @tc.name      testPhotosDateSameDayExt0203
     * @tc.desc      Compares extended same-day sample 68. case 203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0203 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 14, 0, 0, 0).getTime(), new Date(2023, 7, 14, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0203 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0204
     * @tc.name      testPhotosDateSameDayExt0204
     * @tc.desc      Compares extended same-day sample 68. case 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0204 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 14, 0, 0, 0).getTime(), new Date(2023, 7, 15, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0204 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0205
     * @tc.name      testPhotosDateSameDayExt0205
     * @tc.desc      Compares extended same-day sample 69. case 205
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0205 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 15, 0, 0, 0).getTime(), new Date(2024, 8, 15, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0205 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0206
     * @tc.name      testPhotosDateSameDayExt0206
     * @tc.desc      Compares extended same-day sample 69. case 206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0206 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 15, 0, 0, 0).getTime(), new Date(2024, 8, 15, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0206 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0207
     * @tc.name      testPhotosDateSameDayExt0207
     * @tc.desc      Compares extended same-day sample 69. case 207
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0207 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 15, 0, 0, 0).getTime(), new Date(2024, 8, 16, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0207 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0208
     * @tc.name      testPhotosDateSameDayExt0208
     * @tc.desc      Compares extended same-day sample 70. case 208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0208 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 16, 0, 0, 0).getTime(), new Date(2023, 9, 16, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0208 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0209
     * @tc.name      testPhotosDateSameDayExt0209
     * @tc.desc      Compares extended same-day sample 70. case 209
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0209 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 16, 0, 0, 0).getTime(), new Date(2023, 9, 16, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0209 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0210
     * @tc.name      testPhotosDateSameDayExt0210
     * @tc.desc      Compares extended same-day sample 70. case 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0210 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 16, 0, 0, 0).getTime(), new Date(2023, 9, 17, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0210 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0211
     * @tc.name      testPhotosDateSameDayExt0211
     * @tc.desc      Compares extended same-day sample 71. case 211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0211 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 17, 0, 0, 0).getTime(), new Date(2024, 10, 17, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0211 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0212
     * @tc.name      testPhotosDateSameDayExt0212
     * @tc.desc      Compares extended same-day sample 71. case 212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0212 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 17, 0, 0, 0).getTime(), new Date(2024, 10, 17, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0212 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0213
     * @tc.name      testPhotosDateSameDayExt0213
     * @tc.desc      Compares extended same-day sample 71. case 213
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0213 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 17, 0, 0, 0).getTime(), new Date(2024, 10, 18, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0213 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0214
     * @tc.name      testPhotosDateSameDayExt0214
     * @tc.desc      Compares extended same-day sample 72. case 214
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0214 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 18, 0, 0, 0).getTime(), new Date(2023, 11, 18, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0214 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0215
     * @tc.name      testPhotosDateSameDayExt0215
     * @tc.desc      Compares extended same-day sample 72. case 215
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0215 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 18, 0, 0, 0).getTime(), new Date(2023, 11, 18, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0215 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0216
     * @tc.name      testPhotosDateSameDayExt0216
     * @tc.desc      Compares extended same-day sample 72. case 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0216 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 18, 0, 0, 0).getTime(), new Date(2023, 11, 19, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0216 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0217
     * @tc.name      testPhotosDateSameDayExt0217
     * @tc.desc      Compares extended same-day sample 73. case 217
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0217 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 19, 0, 0, 0).getTime(), new Date(2024, 0, 19, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0217 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0218
     * @tc.name      testPhotosDateSameDayExt0218
     * @tc.desc      Compares extended same-day sample 73. case 218
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0218 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 19, 0, 0, 0).getTime(), new Date(2024, 0, 19, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0218 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0219
     * @tc.name      testPhotosDateSameDayExt0219
     * @tc.desc      Compares extended same-day sample 73. case 219
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0219 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 19, 0, 0, 0).getTime(), new Date(2024, 0, 20, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0219 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0220
     * @tc.name      testPhotosDateSameDayExt0220
     * @tc.desc      Compares extended same-day sample 74. case 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0220 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 20, 0, 0, 0).getTime(), new Date(2023, 1, 20, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0220 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0221
     * @tc.name      testPhotosDateSameDayExt0221
     * @tc.desc      Compares extended same-day sample 74. case 221
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0221 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 20, 0, 0, 0).getTime(), new Date(2023, 1, 20, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0221 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0222
     * @tc.name      testPhotosDateSameDayExt0222
     * @tc.desc      Compares extended same-day sample 74. case 222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0222 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 20, 0, 0, 0).getTime(), new Date(2023, 1, 21, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0222 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0223
     * @tc.name      testPhotosDateSameDayExt0223
     * @tc.desc      Compares extended same-day sample 75. case 223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0223 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 21, 0, 0, 0).getTime(), new Date(2024, 2, 21, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0223 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0224
     * @tc.name      testPhotosDateSameDayExt0224
     * @tc.desc      Compares extended same-day sample 75. case 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0224 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 21, 0, 0, 0).getTime(), new Date(2024, 2, 21, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0224 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0225
     * @tc.name      testPhotosDateSameDayExt0225
     * @tc.desc      Compares extended same-day sample 75. case 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0225 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 21, 0, 0, 0).getTime(), new Date(2024, 2, 22, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0225 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0226
     * @tc.name      testPhotosDateSameDayExt0226
     * @tc.desc      Compares extended same-day sample 76. case 226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0226 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 22, 0, 0, 0).getTime(), new Date(2023, 3, 22, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0226 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0227
     * @tc.name      testPhotosDateSameDayExt0227
     * @tc.desc      Compares extended same-day sample 76. case 227
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0227 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 22, 0, 0, 0).getTime(), new Date(2023, 3, 22, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0227 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0228
     * @tc.name      testPhotosDateSameDayExt0228
     * @tc.desc      Compares extended same-day sample 76. case 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0228 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 22, 0, 0, 0).getTime(), new Date(2023, 3, 23, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0228 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0229
     * @tc.name      testPhotosDateSameDayExt0229
     * @tc.desc      Compares extended same-day sample 77. case 229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0229 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 23, 0, 0, 0).getTime(), new Date(2024, 4, 23, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0229 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0230
     * @tc.name      testPhotosDateSameDayExt0230
     * @tc.desc      Compares extended same-day sample 77. case 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0230 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 23, 0, 0, 0).getTime(), new Date(2024, 4, 23, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0230 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0231
     * @tc.name      testPhotosDateSameDayExt0231
     * @tc.desc      Compares extended same-day sample 77. case 231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0231 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 23, 0, 0, 0).getTime(), new Date(2024, 4, 24, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0231 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0232
     * @tc.name      testPhotosDateSameDayExt0232
     * @tc.desc      Compares extended same-day sample 78. case 232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0232 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 24, 0, 0, 0).getTime(), new Date(2023, 5, 24, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0232 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0233
     * @tc.name      testPhotosDateSameDayExt0233
     * @tc.desc      Compares extended same-day sample 78. case 233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0233 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 24, 0, 0, 0).getTime(), new Date(2023, 5, 24, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0233 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0234
     * @tc.name      testPhotosDateSameDayExt0234
     * @tc.desc      Compares extended same-day sample 78. case 234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0234 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 24, 0, 0, 0).getTime(), new Date(2023, 5, 25, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0234 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0235
     * @tc.name      testPhotosDateSameDayExt0235
     * @tc.desc      Compares extended same-day sample 79. case 235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0235 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 25, 0, 0, 0).getTime(), new Date(2024, 6, 25, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0235 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0236
     * @tc.name      testPhotosDateSameDayExt0236
     * @tc.desc      Compares extended same-day sample 79. case 236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0236 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 25, 0, 0, 0).getTime(), new Date(2024, 6, 25, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0236 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0237
     * @tc.name      testPhotosDateSameDayExt0237
     * @tc.desc      Compares extended same-day sample 79. case 237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0237 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 25, 0, 0, 0).getTime(), new Date(2024, 6, 26, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0237 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0238
     * @tc.name      testPhotosDateSameDayExt0238
     * @tc.desc      Compares extended same-day sample 80. case 238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0238 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 26, 0, 0, 0).getTime(), new Date(2023, 7, 26, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0238 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0239
     * @tc.name      testPhotosDateSameDayExt0239
     * @tc.desc      Compares extended same-day sample 80. case 239
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0239 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 26, 0, 0, 0).getTime(), new Date(2023, 7, 26, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0239 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0240
     * @tc.name      testPhotosDateSameDayExt0240
     * @tc.desc      Compares extended same-day sample 80. case 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0240 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 26, 0, 0, 0).getTime(), new Date(2023, 7, 27, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0240 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0241
     * @tc.name      testPhotosDateSameDayExt0241
     * @tc.desc      Compares extended same-day sample 81. case 241
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0241 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 27, 0, 0, 0).getTime(), new Date(2024, 8, 27, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0241 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0242
     * @tc.name      testPhotosDateSameDayExt0242
     * @tc.desc      Compares extended same-day sample 81. case 242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0242 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 27, 0, 0, 0).getTime(), new Date(2024, 8, 27, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0242 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0243
     * @tc.name      testPhotosDateSameDayExt0243
     * @tc.desc      Compares extended same-day sample 81. case 243
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0243 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 27, 0, 0, 0).getTime(), new Date(2024, 8, 28, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0243 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0244
     * @tc.name      testPhotosDateSameDayExt0244
     * @tc.desc      Compares extended same-day sample 82. case 244
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0244 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 1, 0, 0, 0).getTime(), new Date(2023, 9, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0244 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0245
     * @tc.name      testPhotosDateSameDayExt0245
     * @tc.desc      Compares extended same-day sample 82. case 245
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0245 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 1, 0, 0, 0).getTime(), new Date(2023, 9, 1, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0245 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0246
     * @tc.name      testPhotosDateSameDayExt0246
     * @tc.desc      Compares extended same-day sample 82. case 246
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0246 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 1, 0, 0, 0).getTime(), new Date(2023, 9, 2, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0246 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0247
     * @tc.name      testPhotosDateSameDayExt0247
     * @tc.desc      Compares extended same-day sample 83. case 247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0247 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 2, 0, 0, 0).getTime(), new Date(2024, 10, 2, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0247 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0248
     * @tc.name      testPhotosDateSameDayExt0248
     * @tc.desc      Compares extended same-day sample 83. case 248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0248 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 2, 0, 0, 0).getTime(), new Date(2024, 10, 2, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0248 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0249
     * @tc.name      testPhotosDateSameDayExt0249
     * @tc.desc      Compares extended same-day sample 83. case 249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0249 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 2, 0, 0, 0).getTime(), new Date(2024, 10, 3, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0249 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0250
     * @tc.name      testPhotosDateSameDayExt0250
     * @tc.desc      Compares extended same-day sample 84. case 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0250 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 3, 0, 0, 0).getTime(), new Date(2023, 11, 3, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0250 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0251
     * @tc.name      testPhotosDateSameDayExt0251
     * @tc.desc      Compares extended same-day sample 84. case 251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0251 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 3, 0, 0, 0).getTime(), new Date(2023, 11, 3, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0251 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0252
     * @tc.name      testPhotosDateSameDayExt0252
     * @tc.desc      Compares extended same-day sample 84. case 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0252 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 3, 0, 0, 0).getTime(), new Date(2023, 11, 4, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0252 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0253
     * @tc.name      testPhotosDateSameDayExt0253
     * @tc.desc      Compares extended same-day sample 85. case 253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0253 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 4, 0, 0, 0).getTime(), new Date(2024, 0, 4, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0253 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0254
     * @tc.name      testPhotosDateSameDayExt0254
     * @tc.desc      Compares extended same-day sample 85. case 254
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0254 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 4, 0, 0, 0).getTime(), new Date(2024, 0, 4, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0254 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0255
     * @tc.name      testPhotosDateSameDayExt0255
     * @tc.desc      Compares extended same-day sample 85. case 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0255 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 4, 0, 0, 0).getTime(), new Date(2024, 0, 5, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0255 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0256
     * @tc.name      testPhotosDateSameDayExt0256
     * @tc.desc      Compares extended same-day sample 86. case 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0256 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 5, 0, 0, 0).getTime(), new Date(2023, 1, 5, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0256 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0257
     * @tc.name      testPhotosDateSameDayExt0257
     * @tc.desc      Compares extended same-day sample 86. case 257
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0257 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 5, 0, 0, 0).getTime(), new Date(2023, 1, 5, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0257 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0258
     * @tc.name      testPhotosDateSameDayExt0258
     * @tc.desc      Compares extended same-day sample 86. case 258
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0258 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 5, 0, 0, 0).getTime(), new Date(2023, 1, 6, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0258 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0259
     * @tc.name      testPhotosDateSameDayExt0259
     * @tc.desc      Compares extended same-day sample 87. case 259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0259 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 6, 0, 0, 0).getTime(), new Date(2024, 2, 6, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0259 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0260
     * @tc.name      testPhotosDateSameDayExt0260
     * @tc.desc      Compares extended same-day sample 87. case 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0260 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 6, 0, 0, 0).getTime(), new Date(2024, 2, 6, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0260 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0261
     * @tc.name      testPhotosDateSameDayExt0261
     * @tc.desc      Compares extended same-day sample 87. case 261
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0261 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 6, 0, 0, 0).getTime(), new Date(2024, 2, 7, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0261 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0262
     * @tc.name      testPhotosDateSameDayExt0262
     * @tc.desc      Compares extended same-day sample 88. case 262
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0262 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 7, 0, 0, 0).getTime(), new Date(2023, 3, 7, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0262 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0263
     * @tc.name      testPhotosDateSameDayExt0263
     * @tc.desc      Compares extended same-day sample 88. case 263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0263 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 7, 0, 0, 0).getTime(), new Date(2023, 3, 7, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0263 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0264
     * @tc.name      testPhotosDateSameDayExt0264
     * @tc.desc      Compares extended same-day sample 88. case 264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0264 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 7, 0, 0, 0).getTime(), new Date(2023, 3, 8, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0264 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0265
     * @tc.name      testPhotosDateSameDayExt0265
     * @tc.desc      Compares extended same-day sample 89. case 265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0265 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 8, 0, 0, 0).getTime(), new Date(2024, 4, 8, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0265 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0266
     * @tc.name      testPhotosDateSameDayExt0266
     * @tc.desc      Compares extended same-day sample 89. case 266
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0266 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 8, 0, 0, 0).getTime(), new Date(2024, 4, 8, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0266 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0267
     * @tc.name      testPhotosDateSameDayExt0267
     * @tc.desc      Compares extended same-day sample 89. case 267
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0267 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 4, 8, 0, 0, 0).getTime(), new Date(2024, 4, 9, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0267 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0268
     * @tc.name      testPhotosDateSameDayExt0268
     * @tc.desc      Compares extended same-day sample 90. case 268
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0268 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 9, 0, 0, 0).getTime(), new Date(2023, 5, 9, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0268 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0269
     * @tc.name      testPhotosDateSameDayExt0269
     * @tc.desc      Compares extended same-day sample 90. case 269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0269 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 9, 0, 0, 0).getTime(), new Date(2023, 5, 9, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0269 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0270
     * @tc.name      testPhotosDateSameDayExt0270
     * @tc.desc      Compares extended same-day sample 90. case 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0270 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 5, 9, 0, 0, 0).getTime(), new Date(2023, 5, 10, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0270 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0271
     * @tc.name      testPhotosDateSameDayExt0271
     * @tc.desc      Compares extended same-day sample 91. case 271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0271 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 10, 0, 0, 0).getTime(), new Date(2024, 6, 10, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0271 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0272
     * @tc.name      testPhotosDateSameDayExt0272
     * @tc.desc      Compares extended same-day sample 91. case 272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0272 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 10, 0, 0, 0).getTime(), new Date(2024, 6, 10, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0272 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0273
     * @tc.name      testPhotosDateSameDayExt0273
     * @tc.desc      Compares extended same-day sample 91. case 273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0273 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 6, 10, 0, 0, 0).getTime(), new Date(2024, 6, 11, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0273 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0274
     * @tc.name      testPhotosDateSameDayExt0274
     * @tc.desc      Compares extended same-day sample 92. case 274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0274 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 11, 0, 0, 0).getTime(), new Date(2023, 7, 11, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0274 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0275
     * @tc.name      testPhotosDateSameDayExt0275
     * @tc.desc      Compares extended same-day sample 92. case 275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0275 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 11, 0, 0, 0).getTime(), new Date(2023, 7, 11, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0275 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0276
     * @tc.name      testPhotosDateSameDayExt0276
     * @tc.desc      Compares extended same-day sample 92. case 276
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0276 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 7, 11, 0, 0, 0).getTime(), new Date(2023, 7, 12, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0276 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0277
     * @tc.name      testPhotosDateSameDayExt0277
     * @tc.desc      Compares extended same-day sample 93. case 277
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0277 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 12, 0, 0, 0).getTime(), new Date(2024, 8, 12, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0277 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0278
     * @tc.name      testPhotosDateSameDayExt0278
     * @tc.desc      Compares extended same-day sample 93. case 278
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0278 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 12, 0, 0, 0).getTime(), new Date(2024, 8, 12, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0278 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0279
     * @tc.name      testPhotosDateSameDayExt0279
     * @tc.desc      Compares extended same-day sample 93. case 279
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0279 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 8, 12, 0, 0, 0).getTime(), new Date(2024, 8, 13, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0279 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0280
     * @tc.name      testPhotosDateSameDayExt0280
     * @tc.desc      Compares extended same-day sample 94. case 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0280 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 13, 0, 0, 0).getTime(), new Date(2023, 9, 13, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0280 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0281
     * @tc.name      testPhotosDateSameDayExt0281
     * @tc.desc      Compares extended same-day sample 94. case 281
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0281 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 13, 0, 0, 0).getTime(), new Date(2023, 9, 13, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0281 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0282
     * @tc.name      testPhotosDateSameDayExt0282
     * @tc.desc      Compares extended same-day sample 94. case 282
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0282 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 9, 13, 0, 0, 0).getTime(), new Date(2023, 9, 14, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0282 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0283
     * @tc.name      testPhotosDateSameDayExt0283
     * @tc.desc      Compares extended same-day sample 95. case 283
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0283 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 14, 0, 0, 0).getTime(), new Date(2024, 10, 14, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0283 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0284
     * @tc.name      testPhotosDateSameDayExt0284
     * @tc.desc      Compares extended same-day sample 95. case 284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0284 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 14, 0, 0, 0).getTime(), new Date(2024, 10, 14, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0284 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0285
     * @tc.name      testPhotosDateSameDayExt0285
     * @tc.desc      Compares extended same-day sample 95. case 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0285 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 10, 14, 0, 0, 0).getTime(), new Date(2024, 10, 15, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0285 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0286
     * @tc.name      testPhotosDateSameDayExt0286
     * @tc.desc      Compares extended same-day sample 96. case 286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0286 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 15, 0, 0, 0).getTime(), new Date(2023, 11, 15, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0286 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0287
     * @tc.name      testPhotosDateSameDayExt0287
     * @tc.desc      Compares extended same-day sample 96. case 287
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0287 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 15, 0, 0, 0).getTime(), new Date(2023, 11, 15, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0287 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0288
     * @tc.name      testPhotosDateSameDayExt0288
     * @tc.desc      Compares extended same-day sample 96. case 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0288 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 11, 15, 0, 0, 0).getTime(), new Date(2023, 11, 16, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0288 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0289
     * @tc.name      testPhotosDateSameDayExt0289
     * @tc.desc      Compares extended same-day sample 97. case 289
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0289 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 16, 0, 0, 0).getTime(), new Date(2024, 0, 16, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0289 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0290
     * @tc.name      testPhotosDateSameDayExt0290
     * @tc.desc      Compares extended same-day sample 97. case 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0290 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 16, 0, 0, 0).getTime(), new Date(2024, 0, 16, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0290 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0291
     * @tc.name      testPhotosDateSameDayExt0291
     * @tc.desc      Compares extended same-day sample 97. case 291
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0291 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 0, 16, 0, 0, 0).getTime(), new Date(2024, 0, 17, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0291 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0292
     * @tc.name      testPhotosDateSameDayExt0292
     * @tc.desc      Compares extended same-day sample 98. case 292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0292 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 17, 0, 0, 0).getTime(), new Date(2023, 1, 17, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0292 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0293
     * @tc.name      testPhotosDateSameDayExt0293
     * @tc.desc      Compares extended same-day sample 98. case 293
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0293 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 17, 0, 0, 0).getTime(), new Date(2023, 1, 17, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0293 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0294
     * @tc.name      testPhotosDateSameDayExt0294
     * @tc.desc      Compares extended same-day sample 98. case 294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0294 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 1, 17, 0, 0, 0).getTime(), new Date(2023, 1, 18, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0294 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0295
     * @tc.name      testPhotosDateSameDayExt0295
     * @tc.desc      Compares extended same-day sample 99. case 295
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0295 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 18, 0, 0, 0).getTime(), new Date(2024, 2, 18, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0295 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0296
     * @tc.name      testPhotosDateSameDayExt0296
     * @tc.desc      Compares extended same-day sample 99. case 296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0296 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 18, 0, 0, 0).getTime(), new Date(2024, 2, 18, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0296 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0297
     * @tc.name      testPhotosDateSameDayExt0297
     * @tc.desc      Compares extended same-day sample 99. case 297
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0297 begin');
      expect(DateUtil.isTheSameDay(new Date(2024, 2, 18, 0, 0, 0).getTime(), new Date(2024, 2, 19, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0297 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0298
     * @tc.name      testPhotosDateSameDayExt0298
     * @tc.desc      Compares extended same-day sample 100. case 298
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0298 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 19, 0, 0, 0).getTime(), new Date(2023, 3, 19, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0298 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0299
     * @tc.name      testPhotosDateSameDayExt0299
     * @tc.desc      Compares extended same-day sample 100. case 299
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0299 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 19, 0, 0, 0).getTime(), new Date(2023, 3, 19, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0299 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEDAY_EXT_0300
     * @tc.name      testPhotosDateSameDayExt0300
     * @tc.desc      Compares extended same-day sample 100. case 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameDayExt0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0300 begin');
      expect(DateUtil.isTheSameDay(new Date(2023, 3, 19, 0, 0, 0).getTime(), new Date(2023, 3, 20, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameDayExt0300 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0001
     * @tc.name      testPhotosDateSameYearExt0001
     * @tc.desc      Compares extended same-year sample 1970. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0001 begin');
      expect(DateUtil.isTheSameYear(new Date(1970, 0, 1, 0, 0, 0).getTime(), new Date(1970, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0002
     * @tc.name      testPhotosDateSameYearExt0002
     * @tc.desc      Compares extended same-year sample 1970. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0002 begin');
      expect(DateUtil.isTheSameYear(new Date(1970, 0, 1, 0, 0, 0).getTime(), new Date(1970, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0003
     * @tc.name      testPhotosDateSameYearExt0003
     * @tc.desc      Compares extended same-year sample 1970. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0003 begin');
      expect(DateUtil.isTheSameYear(new Date(1970, 11, 31, 23, 59, 59).getTime(), new Date(1971, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0003 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0004
     * @tc.name      testPhotosDateSameYearExt0004
     * @tc.desc      Compares extended same-year sample 1971. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0004 begin');
      expect(DateUtil.isTheSameYear(new Date(1971, 0, 1, 0, 0, 0).getTime(), new Date(1971, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0005
     * @tc.name      testPhotosDateSameYearExt0005
     * @tc.desc      Compares extended same-year sample 1971. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0005 begin');
      expect(DateUtil.isTheSameYear(new Date(1971, 0, 1, 0, 0, 0).getTime(), new Date(1971, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0006
     * @tc.name      testPhotosDateSameYearExt0006
     * @tc.desc      Compares extended same-year sample 1971. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0006 begin');
      expect(DateUtil.isTheSameYear(new Date(1971, 11, 31, 23, 59, 59).getTime(), new Date(1972, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0006 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0007
     * @tc.name      testPhotosDateSameYearExt0007
     * @tc.desc      Compares extended same-year sample 1972. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0007 begin');
      expect(DateUtil.isTheSameYear(new Date(1972, 0, 1, 0, 0, 0).getTime(), new Date(1972, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0008
     * @tc.name      testPhotosDateSameYearExt0008
     * @tc.desc      Compares extended same-year sample 1972. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0008 begin');
      expect(DateUtil.isTheSameYear(new Date(1972, 0, 1, 0, 0, 0).getTime(), new Date(1972, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0009
     * @tc.name      testPhotosDateSameYearExt0009
     * @tc.desc      Compares extended same-year sample 1972. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0009 begin');
      expect(DateUtil.isTheSameYear(new Date(1972, 11, 31, 23, 59, 59).getTime(), new Date(1973, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0009 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0010
     * @tc.name      testPhotosDateSameYearExt0010
     * @tc.desc      Compares extended same-year sample 1973. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0010 begin');
      expect(DateUtil.isTheSameYear(new Date(1973, 0, 1, 0, 0, 0).getTime(), new Date(1973, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0011
     * @tc.name      testPhotosDateSameYearExt0011
     * @tc.desc      Compares extended same-year sample 1973. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0011 begin');
      expect(DateUtil.isTheSameYear(new Date(1973, 0, 1, 0, 0, 0).getTime(), new Date(1973, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0012
     * @tc.name      testPhotosDateSameYearExt0012
     * @tc.desc      Compares extended same-year sample 1973. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0012 begin');
      expect(DateUtil.isTheSameYear(new Date(1973, 11, 31, 23, 59, 59).getTime(), new Date(1974, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0012 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0013
     * @tc.name      testPhotosDateSameYearExt0013
     * @tc.desc      Compares extended same-year sample 1974. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0013 begin');
      expect(DateUtil.isTheSameYear(new Date(1974, 0, 1, 0, 0, 0).getTime(), new Date(1974, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0014
     * @tc.name      testPhotosDateSameYearExt0014
     * @tc.desc      Compares extended same-year sample 1974. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0014 begin');
      expect(DateUtil.isTheSameYear(new Date(1974, 0, 1, 0, 0, 0).getTime(), new Date(1974, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0015
     * @tc.name      testPhotosDateSameYearExt0015
     * @tc.desc      Compares extended same-year sample 1974. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0015 begin');
      expect(DateUtil.isTheSameYear(new Date(1974, 11, 31, 23, 59, 59).getTime(), new Date(1975, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0016
     * @tc.name      testPhotosDateSameYearExt0016
     * @tc.desc      Compares extended same-year sample 1975. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0016 begin');
      expect(DateUtil.isTheSameYear(new Date(1975, 0, 1, 0, 0, 0).getTime(), new Date(1975, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0017
     * @tc.name      testPhotosDateSameYearExt0017
     * @tc.desc      Compares extended same-year sample 1975. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0017 begin');
      expect(DateUtil.isTheSameYear(new Date(1975, 0, 1, 0, 0, 0).getTime(), new Date(1975, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0018
     * @tc.name      testPhotosDateSameYearExt0018
     * @tc.desc      Compares extended same-year sample 1975. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0018 begin');
      expect(DateUtil.isTheSameYear(new Date(1975, 11, 31, 23, 59, 59).getTime(), new Date(1976, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0018 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0019
     * @tc.name      testPhotosDateSameYearExt0019
     * @tc.desc      Compares extended same-year sample 1976. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0019 begin');
      expect(DateUtil.isTheSameYear(new Date(1976, 0, 1, 0, 0, 0).getTime(), new Date(1976, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0020
     * @tc.name      testPhotosDateSameYearExt0020
     * @tc.desc      Compares extended same-year sample 1976. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0020 begin');
      expect(DateUtil.isTheSameYear(new Date(1976, 0, 1, 0, 0, 0).getTime(), new Date(1976, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0021
     * @tc.name      testPhotosDateSameYearExt0021
     * @tc.desc      Compares extended same-year sample 1976. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0021 begin');
      expect(DateUtil.isTheSameYear(new Date(1976, 11, 31, 23, 59, 59).getTime(), new Date(1977, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0021 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0022
     * @tc.name      testPhotosDateSameYearExt0022
     * @tc.desc      Compares extended same-year sample 1977. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0022 begin');
      expect(DateUtil.isTheSameYear(new Date(1977, 0, 1, 0, 0, 0).getTime(), new Date(1977, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0023
     * @tc.name      testPhotosDateSameYearExt0023
     * @tc.desc      Compares extended same-year sample 1977. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0023 begin');
      expect(DateUtil.isTheSameYear(new Date(1977, 0, 1, 0, 0, 0).getTime(), new Date(1977, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0024
     * @tc.name      testPhotosDateSameYearExt0024
     * @tc.desc      Compares extended same-year sample 1977. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0024 begin');
      expect(DateUtil.isTheSameYear(new Date(1977, 11, 31, 23, 59, 59).getTime(), new Date(1978, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0024 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0025
     * @tc.name      testPhotosDateSameYearExt0025
     * @tc.desc      Compares extended same-year sample 1978. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0025 begin');
      expect(DateUtil.isTheSameYear(new Date(1978, 0, 1, 0, 0, 0).getTime(), new Date(1978, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0026
     * @tc.name      testPhotosDateSameYearExt0026
     * @tc.desc      Compares extended same-year sample 1978. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0026 begin');
      expect(DateUtil.isTheSameYear(new Date(1978, 0, 1, 0, 0, 0).getTime(), new Date(1978, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0027
     * @tc.name      testPhotosDateSameYearExt0027
     * @tc.desc      Compares extended same-year sample 1978. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0027 begin');
      expect(DateUtil.isTheSameYear(new Date(1978, 11, 31, 23, 59, 59).getTime(), new Date(1979, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0027 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0028
     * @tc.name      testPhotosDateSameYearExt0028
     * @tc.desc      Compares extended same-year sample 1979. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0028 begin');
      expect(DateUtil.isTheSameYear(new Date(1979, 0, 1, 0, 0, 0).getTime(), new Date(1979, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0029
     * @tc.name      testPhotosDateSameYearExt0029
     * @tc.desc      Compares extended same-year sample 1979. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0029 begin');
      expect(DateUtil.isTheSameYear(new Date(1979, 0, 1, 0, 0, 0).getTime(), new Date(1979, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0030
     * @tc.name      testPhotosDateSameYearExt0030
     * @tc.desc      Compares extended same-year sample 1979. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0030 begin');
      expect(DateUtil.isTheSameYear(new Date(1979, 11, 31, 23, 59, 59).getTime(), new Date(1980, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0031
     * @tc.name      testPhotosDateSameYearExt0031
     * @tc.desc      Compares extended same-year sample 1980. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0031 begin');
      expect(DateUtil.isTheSameYear(new Date(1980, 0, 1, 0, 0, 0).getTime(), new Date(1980, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0032
     * @tc.name      testPhotosDateSameYearExt0032
     * @tc.desc      Compares extended same-year sample 1980. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0032 begin');
      expect(DateUtil.isTheSameYear(new Date(1980, 0, 1, 0, 0, 0).getTime(), new Date(1980, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0033
     * @tc.name      testPhotosDateSameYearExt0033
     * @tc.desc      Compares extended same-year sample 1980. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0033 begin');
      expect(DateUtil.isTheSameYear(new Date(1980, 11, 31, 23, 59, 59).getTime(), new Date(1981, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0033 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0034
     * @tc.name      testPhotosDateSameYearExt0034
     * @tc.desc      Compares extended same-year sample 1981. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0034 begin');
      expect(DateUtil.isTheSameYear(new Date(1981, 0, 1, 0, 0, 0).getTime(), new Date(1981, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0035
     * @tc.name      testPhotosDateSameYearExt0035
     * @tc.desc      Compares extended same-year sample 1981. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0035 begin');
      expect(DateUtil.isTheSameYear(new Date(1981, 0, 1, 0, 0, 0).getTime(), new Date(1981, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0036
     * @tc.name      testPhotosDateSameYearExt0036
     * @tc.desc      Compares extended same-year sample 1981. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0036 begin');
      expect(DateUtil.isTheSameYear(new Date(1981, 11, 31, 23, 59, 59).getTime(), new Date(1982, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0036 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0037
     * @tc.name      testPhotosDateSameYearExt0037
     * @tc.desc      Compares extended same-year sample 1982. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0037 begin');
      expect(DateUtil.isTheSameYear(new Date(1982, 0, 1, 0, 0, 0).getTime(), new Date(1982, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0038
     * @tc.name      testPhotosDateSameYearExt0038
     * @tc.desc      Compares extended same-year sample 1982. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0038 begin');
      expect(DateUtil.isTheSameYear(new Date(1982, 0, 1, 0, 0, 0).getTime(), new Date(1982, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0039
     * @tc.name      testPhotosDateSameYearExt0039
     * @tc.desc      Compares extended same-year sample 1982. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0039 begin');
      expect(DateUtil.isTheSameYear(new Date(1982, 11, 31, 23, 59, 59).getTime(), new Date(1983, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0039 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0040
     * @tc.name      testPhotosDateSameYearExt0040
     * @tc.desc      Compares extended same-year sample 1983. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0040 begin');
      expect(DateUtil.isTheSameYear(new Date(1983, 0, 1, 0, 0, 0).getTime(), new Date(1983, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0041
     * @tc.name      testPhotosDateSameYearExt0041
     * @tc.desc      Compares extended same-year sample 1983. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0041 begin');
      expect(DateUtil.isTheSameYear(new Date(1983, 0, 1, 0, 0, 0).getTime(), new Date(1983, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0042
     * @tc.name      testPhotosDateSameYearExt0042
     * @tc.desc      Compares extended same-year sample 1983. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0042 begin');
      expect(DateUtil.isTheSameYear(new Date(1983, 11, 31, 23, 59, 59).getTime(), new Date(1984, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0042 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0043
     * @tc.name      testPhotosDateSameYearExt0043
     * @tc.desc      Compares extended same-year sample 1984. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0043 begin');
      expect(DateUtil.isTheSameYear(new Date(1984, 0, 1, 0, 0, 0).getTime(), new Date(1984, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0044
     * @tc.name      testPhotosDateSameYearExt0044
     * @tc.desc      Compares extended same-year sample 1984. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0044 begin');
      expect(DateUtil.isTheSameYear(new Date(1984, 0, 1, 0, 0, 0).getTime(), new Date(1984, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0045
     * @tc.name      testPhotosDateSameYearExt0045
     * @tc.desc      Compares extended same-year sample 1984. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0045 begin');
      expect(DateUtil.isTheSameYear(new Date(1984, 11, 31, 23, 59, 59).getTime(), new Date(1985, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0046
     * @tc.name      testPhotosDateSameYearExt0046
     * @tc.desc      Compares extended same-year sample 1985. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0046 begin');
      expect(DateUtil.isTheSameYear(new Date(1985, 0, 1, 0, 0, 0).getTime(), new Date(1985, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0047
     * @tc.name      testPhotosDateSameYearExt0047
     * @tc.desc      Compares extended same-year sample 1985. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0047 begin');
      expect(DateUtil.isTheSameYear(new Date(1985, 0, 1, 0, 0, 0).getTime(), new Date(1985, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0048
     * @tc.name      testPhotosDateSameYearExt0048
     * @tc.desc      Compares extended same-year sample 1985. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0048 begin');
      expect(DateUtil.isTheSameYear(new Date(1985, 11, 31, 23, 59, 59).getTime(), new Date(1986, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0048 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0049
     * @tc.name      testPhotosDateSameYearExt0049
     * @tc.desc      Compares extended same-year sample 1986. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0049 begin');
      expect(DateUtil.isTheSameYear(new Date(1986, 0, 1, 0, 0, 0).getTime(), new Date(1986, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0050
     * @tc.name      testPhotosDateSameYearExt0050
     * @tc.desc      Compares extended same-year sample 1986. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0050 begin');
      expect(DateUtil.isTheSameYear(new Date(1986, 0, 1, 0, 0, 0).getTime(), new Date(1986, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0051
     * @tc.name      testPhotosDateSameYearExt0051
     * @tc.desc      Compares extended same-year sample 1986. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0051 begin');
      expect(DateUtil.isTheSameYear(new Date(1986, 11, 31, 23, 59, 59).getTime(), new Date(1987, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0051 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0052
     * @tc.name      testPhotosDateSameYearExt0052
     * @tc.desc      Compares extended same-year sample 1987. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0052 begin');
      expect(DateUtil.isTheSameYear(new Date(1987, 0, 1, 0, 0, 0).getTime(), new Date(1987, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0053
     * @tc.name      testPhotosDateSameYearExt0053
     * @tc.desc      Compares extended same-year sample 1987. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0053 begin');
      expect(DateUtil.isTheSameYear(new Date(1987, 0, 1, 0, 0, 0).getTime(), new Date(1987, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0054
     * @tc.name      testPhotosDateSameYearExt0054
     * @tc.desc      Compares extended same-year sample 1987. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0054 begin');
      expect(DateUtil.isTheSameYear(new Date(1987, 11, 31, 23, 59, 59).getTime(), new Date(1988, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0054 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0055
     * @tc.name      testPhotosDateSameYearExt0055
     * @tc.desc      Compares extended same-year sample 1988. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0055 begin');
      expect(DateUtil.isTheSameYear(new Date(1988, 0, 1, 0, 0, 0).getTime(), new Date(1988, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0056
     * @tc.name      testPhotosDateSameYearExt0056
     * @tc.desc      Compares extended same-year sample 1988. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0056 begin');
      expect(DateUtil.isTheSameYear(new Date(1988, 0, 1, 0, 0, 0).getTime(), new Date(1988, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0057
     * @tc.name      testPhotosDateSameYearExt0057
     * @tc.desc      Compares extended same-year sample 1988. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0057 begin');
      expect(DateUtil.isTheSameYear(new Date(1988, 11, 31, 23, 59, 59).getTime(), new Date(1989, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0057 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0058
     * @tc.name      testPhotosDateSameYearExt0058
     * @tc.desc      Compares extended same-year sample 1989. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0058 begin');
      expect(DateUtil.isTheSameYear(new Date(1989, 0, 1, 0, 0, 0).getTime(), new Date(1989, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0059
     * @tc.name      testPhotosDateSameYearExt0059
     * @tc.desc      Compares extended same-year sample 1989. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0059 begin');
      expect(DateUtil.isTheSameYear(new Date(1989, 0, 1, 0, 0, 0).getTime(), new Date(1989, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0060
     * @tc.name      testPhotosDateSameYearExt0060
     * @tc.desc      Compares extended same-year sample 1989. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0060 begin');
      expect(DateUtil.isTheSameYear(new Date(1989, 11, 31, 23, 59, 59).getTime(), new Date(1990, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0061
     * @tc.name      testPhotosDateSameYearExt0061
     * @tc.desc      Compares extended same-year sample 1990. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0061 begin');
      expect(DateUtil.isTheSameYear(new Date(1990, 0, 1, 0, 0, 0).getTime(), new Date(1990, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0062
     * @tc.name      testPhotosDateSameYearExt0062
     * @tc.desc      Compares extended same-year sample 1990. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0062 begin');
      expect(DateUtil.isTheSameYear(new Date(1990, 0, 1, 0, 0, 0).getTime(), new Date(1990, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0063
     * @tc.name      testPhotosDateSameYearExt0063
     * @tc.desc      Compares extended same-year sample 1990. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0063 begin');
      expect(DateUtil.isTheSameYear(new Date(1990, 11, 31, 23, 59, 59).getTime(), new Date(1991, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0063 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0064
     * @tc.name      testPhotosDateSameYearExt0064
     * @tc.desc      Compares extended same-year sample 1991. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0064 begin');
      expect(DateUtil.isTheSameYear(new Date(1991, 0, 1, 0, 0, 0).getTime(), new Date(1991, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0065
     * @tc.name      testPhotosDateSameYearExt0065
     * @tc.desc      Compares extended same-year sample 1991. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0065 begin');
      expect(DateUtil.isTheSameYear(new Date(1991, 0, 1, 0, 0, 0).getTime(), new Date(1991, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0066
     * @tc.name      testPhotosDateSameYearExt0066
     * @tc.desc      Compares extended same-year sample 1991. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0066 begin');
      expect(DateUtil.isTheSameYear(new Date(1991, 11, 31, 23, 59, 59).getTime(), new Date(1992, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0066 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0067
     * @tc.name      testPhotosDateSameYearExt0067
     * @tc.desc      Compares extended same-year sample 1992. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0067 begin');
      expect(DateUtil.isTheSameYear(new Date(1992, 0, 1, 0, 0, 0).getTime(), new Date(1992, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0068
     * @tc.name      testPhotosDateSameYearExt0068
     * @tc.desc      Compares extended same-year sample 1992. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0068 begin');
      expect(DateUtil.isTheSameYear(new Date(1992, 0, 1, 0, 0, 0).getTime(), new Date(1992, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0069
     * @tc.name      testPhotosDateSameYearExt0069
     * @tc.desc      Compares extended same-year sample 1992. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0069 begin');
      expect(DateUtil.isTheSameYear(new Date(1992, 11, 31, 23, 59, 59).getTime(), new Date(1993, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0069 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0070
     * @tc.name      testPhotosDateSameYearExt0070
     * @tc.desc      Compares extended same-year sample 1993. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0070 begin');
      expect(DateUtil.isTheSameYear(new Date(1993, 0, 1, 0, 0, 0).getTime(), new Date(1993, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0071
     * @tc.name      testPhotosDateSameYearExt0071
     * @tc.desc      Compares extended same-year sample 1993. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0071 begin');
      expect(DateUtil.isTheSameYear(new Date(1993, 0, 1, 0, 0, 0).getTime(), new Date(1993, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0072
     * @tc.name      testPhotosDateSameYearExt0072
     * @tc.desc      Compares extended same-year sample 1993. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0072 begin');
      expect(DateUtil.isTheSameYear(new Date(1993, 11, 31, 23, 59, 59).getTime(), new Date(1994, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0072 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0073
     * @tc.name      testPhotosDateSameYearExt0073
     * @tc.desc      Compares extended same-year sample 1994. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0073 begin');
      expect(DateUtil.isTheSameYear(new Date(1994, 0, 1, 0, 0, 0).getTime(), new Date(1994, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0074
     * @tc.name      testPhotosDateSameYearExt0074
     * @tc.desc      Compares extended same-year sample 1994. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0074 begin');
      expect(DateUtil.isTheSameYear(new Date(1994, 0, 1, 0, 0, 0).getTime(), new Date(1994, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0075
     * @tc.name      testPhotosDateSameYearExt0075
     * @tc.desc      Compares extended same-year sample 1994. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0075 begin');
      expect(DateUtil.isTheSameYear(new Date(1994, 11, 31, 23, 59, 59).getTime(), new Date(1995, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0075 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0076
     * @tc.name      testPhotosDateSameYearExt0076
     * @tc.desc      Compares extended same-year sample 1995. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0076 begin');
      expect(DateUtil.isTheSameYear(new Date(1995, 0, 1, 0, 0, 0).getTime(), new Date(1995, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0077
     * @tc.name      testPhotosDateSameYearExt0077
     * @tc.desc      Compares extended same-year sample 1995. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0077 begin');
      expect(DateUtil.isTheSameYear(new Date(1995, 0, 1, 0, 0, 0).getTime(), new Date(1995, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0078
     * @tc.name      testPhotosDateSameYearExt0078
     * @tc.desc      Compares extended same-year sample 1995. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0078 begin');
      expect(DateUtil.isTheSameYear(new Date(1995, 11, 31, 23, 59, 59).getTime(), new Date(1996, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0078 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0079
     * @tc.name      testPhotosDateSameYearExt0079
     * @tc.desc      Compares extended same-year sample 1996. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0079 begin');
      expect(DateUtil.isTheSameYear(new Date(1996, 0, 1, 0, 0, 0).getTime(), new Date(1996, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0080
     * @tc.name      testPhotosDateSameYearExt0080
     * @tc.desc      Compares extended same-year sample 1996. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0080 begin');
      expect(DateUtil.isTheSameYear(new Date(1996, 0, 1, 0, 0, 0).getTime(), new Date(1996, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0081
     * @tc.name      testPhotosDateSameYearExt0081
     * @tc.desc      Compares extended same-year sample 1996. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0081 begin');
      expect(DateUtil.isTheSameYear(new Date(1996, 11, 31, 23, 59, 59).getTime(), new Date(1997, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0081 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0082
     * @tc.name      testPhotosDateSameYearExt0082
     * @tc.desc      Compares extended same-year sample 1997. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0082 begin');
      expect(DateUtil.isTheSameYear(new Date(1997, 0, 1, 0, 0, 0).getTime(), new Date(1997, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0083
     * @tc.name      testPhotosDateSameYearExt0083
     * @tc.desc      Compares extended same-year sample 1997. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0083 begin');
      expect(DateUtil.isTheSameYear(new Date(1997, 0, 1, 0, 0, 0).getTime(), new Date(1997, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0084
     * @tc.name      testPhotosDateSameYearExt0084
     * @tc.desc      Compares extended same-year sample 1997. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0084 begin');
      expect(DateUtil.isTheSameYear(new Date(1997, 11, 31, 23, 59, 59).getTime(), new Date(1998, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0084 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0085
     * @tc.name      testPhotosDateSameYearExt0085
     * @tc.desc      Compares extended same-year sample 1998. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0085 begin');
      expect(DateUtil.isTheSameYear(new Date(1998, 0, 1, 0, 0, 0).getTime(), new Date(1998, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0086
     * @tc.name      testPhotosDateSameYearExt0086
     * @tc.desc      Compares extended same-year sample 1998. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0086 begin');
      expect(DateUtil.isTheSameYear(new Date(1998, 0, 1, 0, 0, 0).getTime(), new Date(1998, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0087
     * @tc.name      testPhotosDateSameYearExt0087
     * @tc.desc      Compares extended same-year sample 1998. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0087 begin');
      expect(DateUtil.isTheSameYear(new Date(1998, 11, 31, 23, 59, 59).getTime(), new Date(1999, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0087 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0088
     * @tc.name      testPhotosDateSameYearExt0088
     * @tc.desc      Compares extended same-year sample 1999. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0088 begin');
      expect(DateUtil.isTheSameYear(new Date(1999, 0, 1, 0, 0, 0).getTime(), new Date(1999, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0089
     * @tc.name      testPhotosDateSameYearExt0089
     * @tc.desc      Compares extended same-year sample 1999. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0089 begin');
      expect(DateUtil.isTheSameYear(new Date(1999, 0, 1, 0, 0, 0).getTime(), new Date(1999, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0090
     * @tc.name      testPhotosDateSameYearExt0090
     * @tc.desc      Compares extended same-year sample 1999. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0090 begin');
      expect(DateUtil.isTheSameYear(new Date(1999, 11, 31, 23, 59, 59).getTime(), new Date(2000, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0090 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0091
     * @tc.name      testPhotosDateSameYearExt0091
     * @tc.desc      Compares extended same-year sample 2000. case 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0091 begin');
      expect(DateUtil.isTheSameYear(new Date(2000, 0, 1, 0, 0, 0).getTime(), new Date(2000, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0092
     * @tc.name      testPhotosDateSameYearExt0092
     * @tc.desc      Compares extended same-year sample 2000. case 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0092 begin');
      expect(DateUtil.isTheSameYear(new Date(2000, 0, 1, 0, 0, 0).getTime(), new Date(2000, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0093
     * @tc.name      testPhotosDateSameYearExt0093
     * @tc.desc      Compares extended same-year sample 2000. case 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0093 begin');
      expect(DateUtil.isTheSameYear(new Date(2000, 11, 31, 23, 59, 59).getTime(), new Date(2001, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0093 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0094
     * @tc.name      testPhotosDateSameYearExt0094
     * @tc.desc      Compares extended same-year sample 2001. case 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0094 begin');
      expect(DateUtil.isTheSameYear(new Date(2001, 0, 1, 0, 0, 0).getTime(), new Date(2001, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0095
     * @tc.name      testPhotosDateSameYearExt0095
     * @tc.desc      Compares extended same-year sample 2001. case 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0095 begin');
      expect(DateUtil.isTheSameYear(new Date(2001, 0, 1, 0, 0, 0).getTime(), new Date(2001, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0096
     * @tc.name      testPhotosDateSameYearExt0096
     * @tc.desc      Compares extended same-year sample 2001. case 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0096 begin');
      expect(DateUtil.isTheSameYear(new Date(2001, 11, 31, 23, 59, 59).getTime(), new Date(2002, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0096 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0097
     * @tc.name      testPhotosDateSameYearExt0097
     * @tc.desc      Compares extended same-year sample 2002. case 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0097 begin');
      expect(DateUtil.isTheSameYear(new Date(2002, 0, 1, 0, 0, 0).getTime(), new Date(2002, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0098
     * @tc.name      testPhotosDateSameYearExt0098
     * @tc.desc      Compares extended same-year sample 2002. case 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0098 begin');
      expect(DateUtil.isTheSameYear(new Date(2002, 0, 1, 0, 0, 0).getTime(), new Date(2002, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0099
     * @tc.name      testPhotosDateSameYearExt0099
     * @tc.desc      Compares extended same-year sample 2002. case 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0099 begin');
      expect(DateUtil.isTheSameYear(new Date(2002, 11, 31, 23, 59, 59).getTime(), new Date(2003, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0099 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0100
     * @tc.name      testPhotosDateSameYearExt0100
     * @tc.desc      Compares extended same-year sample 2003. case 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0100 begin');
      expect(DateUtil.isTheSameYear(new Date(2003, 0, 1, 0, 0, 0).getTime(), new Date(2003, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0101
     * @tc.name      testPhotosDateSameYearExt0101
     * @tc.desc      Compares extended same-year sample 2003. case 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0101 begin');
      expect(DateUtil.isTheSameYear(new Date(2003, 0, 1, 0, 0, 0).getTime(), new Date(2003, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0102
     * @tc.name      testPhotosDateSameYearExt0102
     * @tc.desc      Compares extended same-year sample 2003. case 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0102 begin');
      expect(DateUtil.isTheSameYear(new Date(2003, 11, 31, 23, 59, 59).getTime(), new Date(2004, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0102 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0103
     * @tc.name      testPhotosDateSameYearExt0103
     * @tc.desc      Compares extended same-year sample 2004. case 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0103 begin');
      expect(DateUtil.isTheSameYear(new Date(2004, 0, 1, 0, 0, 0).getTime(), new Date(2004, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0104
     * @tc.name      testPhotosDateSameYearExt0104
     * @tc.desc      Compares extended same-year sample 2004. case 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0104 begin');
      expect(DateUtil.isTheSameYear(new Date(2004, 0, 1, 0, 0, 0).getTime(), new Date(2004, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0105
     * @tc.name      testPhotosDateSameYearExt0105
     * @tc.desc      Compares extended same-year sample 2004. case 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0105 begin');
      expect(DateUtil.isTheSameYear(new Date(2004, 11, 31, 23, 59, 59).getTime(), new Date(2005, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0105 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0106
     * @tc.name      testPhotosDateSameYearExt0106
     * @tc.desc      Compares extended same-year sample 2005. case 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0106 begin');
      expect(DateUtil.isTheSameYear(new Date(2005, 0, 1, 0, 0, 0).getTime(), new Date(2005, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0107
     * @tc.name      testPhotosDateSameYearExt0107
     * @tc.desc      Compares extended same-year sample 2005. case 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0107 begin');
      expect(DateUtil.isTheSameYear(new Date(2005, 0, 1, 0, 0, 0).getTime(), new Date(2005, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0108
     * @tc.name      testPhotosDateSameYearExt0108
     * @tc.desc      Compares extended same-year sample 2005. case 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0108 begin');
      expect(DateUtil.isTheSameYear(new Date(2005, 11, 31, 23, 59, 59).getTime(), new Date(2006, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0108 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0109
     * @tc.name      testPhotosDateSameYearExt0109
     * @tc.desc      Compares extended same-year sample 2006. case 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0109 begin');
      expect(DateUtil.isTheSameYear(new Date(2006, 0, 1, 0, 0, 0).getTime(), new Date(2006, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0110
     * @tc.name      testPhotosDateSameYearExt0110
     * @tc.desc      Compares extended same-year sample 2006. case 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0110 begin');
      expect(DateUtil.isTheSameYear(new Date(2006, 0, 1, 0, 0, 0).getTime(), new Date(2006, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0111
     * @tc.name      testPhotosDateSameYearExt0111
     * @tc.desc      Compares extended same-year sample 2006. case 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0111 begin');
      expect(DateUtil.isTheSameYear(new Date(2006, 11, 31, 23, 59, 59).getTime(), new Date(2007, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0111 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0112
     * @tc.name      testPhotosDateSameYearExt0112
     * @tc.desc      Compares extended same-year sample 2007. case 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0112 begin');
      expect(DateUtil.isTheSameYear(new Date(2007, 0, 1, 0, 0, 0).getTime(), new Date(2007, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0113
     * @tc.name      testPhotosDateSameYearExt0113
     * @tc.desc      Compares extended same-year sample 2007. case 113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0113 begin');
      expect(DateUtil.isTheSameYear(new Date(2007, 0, 1, 0, 0, 0).getTime(), new Date(2007, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0114
     * @tc.name      testPhotosDateSameYearExt0114
     * @tc.desc      Compares extended same-year sample 2007. case 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0114 begin');
      expect(DateUtil.isTheSameYear(new Date(2007, 11, 31, 23, 59, 59).getTime(), new Date(2008, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0114 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0115
     * @tc.name      testPhotosDateSameYearExt0115
     * @tc.desc      Compares extended same-year sample 2008. case 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0115 begin');
      expect(DateUtil.isTheSameYear(new Date(2008, 0, 1, 0, 0, 0).getTime(), new Date(2008, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0116
     * @tc.name      testPhotosDateSameYearExt0116
     * @tc.desc      Compares extended same-year sample 2008. case 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0116 begin');
      expect(DateUtil.isTheSameYear(new Date(2008, 0, 1, 0, 0, 0).getTime(), new Date(2008, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0117
     * @tc.name      testPhotosDateSameYearExt0117
     * @tc.desc      Compares extended same-year sample 2008. case 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0117 begin');
      expect(DateUtil.isTheSameYear(new Date(2008, 11, 31, 23, 59, 59).getTime(), new Date(2009, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0117 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0118
     * @tc.name      testPhotosDateSameYearExt0118
     * @tc.desc      Compares extended same-year sample 2009. case 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0118 begin');
      expect(DateUtil.isTheSameYear(new Date(2009, 0, 1, 0, 0, 0).getTime(), new Date(2009, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0119
     * @tc.name      testPhotosDateSameYearExt0119
     * @tc.desc      Compares extended same-year sample 2009. case 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0119 begin');
      expect(DateUtil.isTheSameYear(new Date(2009, 0, 1, 0, 0, 0).getTime(), new Date(2009, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0120
     * @tc.name      testPhotosDateSameYearExt0120
     * @tc.desc      Compares extended same-year sample 2009. case 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0120 begin');
      expect(DateUtil.isTheSameYear(new Date(2009, 11, 31, 23, 59, 59).getTime(), new Date(2010, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0120 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0121
     * @tc.name      testPhotosDateSameYearExt0121
     * @tc.desc      Compares extended same-year sample 2010. case 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0121 begin');
      expect(DateUtil.isTheSameYear(new Date(2010, 0, 1, 0, 0, 0).getTime(), new Date(2010, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0122
     * @tc.name      testPhotosDateSameYearExt0122
     * @tc.desc      Compares extended same-year sample 2010. case 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0122 begin');
      expect(DateUtil.isTheSameYear(new Date(2010, 0, 1, 0, 0, 0).getTime(), new Date(2010, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0123
     * @tc.name      testPhotosDateSameYearExt0123
     * @tc.desc      Compares extended same-year sample 2010. case 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0123 begin');
      expect(DateUtil.isTheSameYear(new Date(2010, 11, 31, 23, 59, 59).getTime(), new Date(2011, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0123 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0124
     * @tc.name      testPhotosDateSameYearExt0124
     * @tc.desc      Compares extended same-year sample 2011. case 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0124 begin');
      expect(DateUtil.isTheSameYear(new Date(2011, 0, 1, 0, 0, 0).getTime(), new Date(2011, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0125
     * @tc.name      testPhotosDateSameYearExt0125
     * @tc.desc      Compares extended same-year sample 2011. case 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0125 begin');
      expect(DateUtil.isTheSameYear(new Date(2011, 0, 1, 0, 0, 0).getTime(), new Date(2011, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0126
     * @tc.name      testPhotosDateSameYearExt0126
     * @tc.desc      Compares extended same-year sample 2011. case 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0126 begin');
      expect(DateUtil.isTheSameYear(new Date(2011, 11, 31, 23, 59, 59).getTime(), new Date(2012, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0126 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0127
     * @tc.name      testPhotosDateSameYearExt0127
     * @tc.desc      Compares extended same-year sample 2012. case 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0127 begin');
      expect(DateUtil.isTheSameYear(new Date(2012, 0, 1, 0, 0, 0).getTime(), new Date(2012, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0128
     * @tc.name      testPhotosDateSameYearExt0128
     * @tc.desc      Compares extended same-year sample 2012. case 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0128 begin');
      expect(DateUtil.isTheSameYear(new Date(2012, 0, 1, 0, 0, 0).getTime(), new Date(2012, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0129
     * @tc.name      testPhotosDateSameYearExt0129
     * @tc.desc      Compares extended same-year sample 2012. case 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0129 begin');
      expect(DateUtil.isTheSameYear(new Date(2012, 11, 31, 23, 59, 59).getTime(), new Date(2013, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0129 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0130
     * @tc.name      testPhotosDateSameYearExt0130
     * @tc.desc      Compares extended same-year sample 2013. case 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0130 begin');
      expect(DateUtil.isTheSameYear(new Date(2013, 0, 1, 0, 0, 0).getTime(), new Date(2013, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0131
     * @tc.name      testPhotosDateSameYearExt0131
     * @tc.desc      Compares extended same-year sample 2013. case 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0131 begin');
      expect(DateUtil.isTheSameYear(new Date(2013, 0, 1, 0, 0, 0).getTime(), new Date(2013, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0132
     * @tc.name      testPhotosDateSameYearExt0132
     * @tc.desc      Compares extended same-year sample 2013. case 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0132 begin');
      expect(DateUtil.isTheSameYear(new Date(2013, 11, 31, 23, 59, 59).getTime(), new Date(2014, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0132 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0133
     * @tc.name      testPhotosDateSameYearExt0133
     * @tc.desc      Compares extended same-year sample 2014. case 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0133 begin');
      expect(DateUtil.isTheSameYear(new Date(2014, 0, 1, 0, 0, 0).getTime(), new Date(2014, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0134
     * @tc.name      testPhotosDateSameYearExt0134
     * @tc.desc      Compares extended same-year sample 2014. case 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0134 begin');
      expect(DateUtil.isTheSameYear(new Date(2014, 0, 1, 0, 0, 0).getTime(), new Date(2014, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0135
     * @tc.name      testPhotosDateSameYearExt0135
     * @tc.desc      Compares extended same-year sample 2014. case 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0135 begin');
      expect(DateUtil.isTheSameYear(new Date(2014, 11, 31, 23, 59, 59).getTime(), new Date(2015, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0135 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0136
     * @tc.name      testPhotosDateSameYearExt0136
     * @tc.desc      Compares extended same-year sample 2015. case 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0136 begin');
      expect(DateUtil.isTheSameYear(new Date(2015, 0, 1, 0, 0, 0).getTime(), new Date(2015, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0137
     * @tc.name      testPhotosDateSameYearExt0137
     * @tc.desc      Compares extended same-year sample 2015. case 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0137 begin');
      expect(DateUtil.isTheSameYear(new Date(2015, 0, 1, 0, 0, 0).getTime(), new Date(2015, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0138
     * @tc.name      testPhotosDateSameYearExt0138
     * @tc.desc      Compares extended same-year sample 2015. case 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0138 begin');
      expect(DateUtil.isTheSameYear(new Date(2015, 11, 31, 23, 59, 59).getTime(), new Date(2016, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0138 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0139
     * @tc.name      testPhotosDateSameYearExt0139
     * @tc.desc      Compares extended same-year sample 2016. case 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0139 begin');
      expect(DateUtil.isTheSameYear(new Date(2016, 0, 1, 0, 0, 0).getTime(), new Date(2016, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0140
     * @tc.name      testPhotosDateSameYearExt0140
     * @tc.desc      Compares extended same-year sample 2016. case 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0140 begin');
      expect(DateUtil.isTheSameYear(new Date(2016, 0, 1, 0, 0, 0).getTime(), new Date(2016, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0140 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0141
     * @tc.name      testPhotosDateSameYearExt0141
     * @tc.desc      Compares extended same-year sample 2016. case 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0141 begin');
      expect(DateUtil.isTheSameYear(new Date(2016, 11, 31, 23, 59, 59).getTime(), new Date(2017, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0141 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0142
     * @tc.name      testPhotosDateSameYearExt0142
     * @tc.desc      Compares extended same-year sample 2017. case 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0142 begin');
      expect(DateUtil.isTheSameYear(new Date(2017, 0, 1, 0, 0, 0).getTime(), new Date(2017, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0143
     * @tc.name      testPhotosDateSameYearExt0143
     * @tc.desc      Compares extended same-year sample 2017. case 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0143 begin');
      expect(DateUtil.isTheSameYear(new Date(2017, 0, 1, 0, 0, 0).getTime(), new Date(2017, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0144
     * @tc.name      testPhotosDateSameYearExt0144
     * @tc.desc      Compares extended same-year sample 2017. case 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0144 begin');
      expect(DateUtil.isTheSameYear(new Date(2017, 11, 31, 23, 59, 59).getTime(), new Date(2018, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0144 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0145
     * @tc.name      testPhotosDateSameYearExt0145
     * @tc.desc      Compares extended same-year sample 2018. case 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0145 begin');
      expect(DateUtil.isTheSameYear(new Date(2018, 0, 1, 0, 0, 0).getTime(), new Date(2018, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0146
     * @tc.name      testPhotosDateSameYearExt0146
     * @tc.desc      Compares extended same-year sample 2018. case 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0146 begin');
      expect(DateUtil.isTheSameYear(new Date(2018, 0, 1, 0, 0, 0).getTime(), new Date(2018, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0147
     * @tc.name      testPhotosDateSameYearExt0147
     * @tc.desc      Compares extended same-year sample 2018. case 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0147 begin');
      expect(DateUtil.isTheSameYear(new Date(2018, 11, 31, 23, 59, 59).getTime(), new Date(2019, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0147 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0148
     * @tc.name      testPhotosDateSameYearExt0148
     * @tc.desc      Compares extended same-year sample 2019. case 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0148 begin');
      expect(DateUtil.isTheSameYear(new Date(2019, 0, 1, 0, 0, 0).getTime(), new Date(2019, 0, 1, 0, 0, 0).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0149
     * @tc.name      testPhotosDateSameYearExt0149
     * @tc.desc      Compares extended same-year sample 2019. case 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0149 begin');
      expect(DateUtil.isTheSameYear(new Date(2019, 0, 1, 0, 0, 0).getTime(), new Date(2019, 11, 31, 23, 59, 59).getTime())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_SAMEYEAR_EXT_0150
     * @tc.name      testPhotosDateSameYearExt0150
     * @tc.desc      Compares extended same-year sample 2019. case 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateSameYearExt0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0150 begin');
      expect(DateUtil.isTheSameYear(new Date(2019, 11, 31, 23, 59, 59).getTime(), new Date(2020, 0, 1, 0, 0, 0).getTime())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateSameYearExt0150 end');
    })

  })
}
