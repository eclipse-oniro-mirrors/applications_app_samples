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

const TAG = '[Sample_PhotosDateFormatSecondTest]';
const DOMAIN = 0xF811;

export default function PhotosDateFormatSecondTest(): void {
  describe('PhotosDateFormatSecondTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0001
     * @tc.name      testPhotosDateFormatSecond0001
     * @tc.desc      Formats second date sample 1 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0001 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 2, 0, 0), 'MM|dd')).assertEqual('02|01');
      expect(DateUtil.format(new Date(2024, 6, 1, 8, 0, 0), 'MM|dd')).assertEqual('07|01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0002
     * @tc.name      testPhotosDateFormatSecond0002
     * @tc.desc      Formats second date sample 2 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0002 begin');
      expect(DateUtil.format(new Date(2024, 2, 4, 3, 5, 7), 'HH_mm')).assertEqual('03_05');
      expect(DateUtil.format(new Date(2024, 7, 12, 9, 13, 17), 'HH_mm')).assertEqual('09_13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0003
     * @tc.name      testPhotosDateFormatSecond0003
     * @tc.desc      Formats second date sample 3 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0003 begin');
      expect(DateUtil.format(new Date(2024, 3, 7, 4, 10, 14), 'MM.dd HH:mm')).assertEqual('04.07 04:10');
      expect(DateUtil.format(new Date(2024, 8, 23, 10, 26, 34), 'MM.dd HH:mm')).assertEqual('09.23 10:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0004
     * @tc.name      testPhotosDateFormatSecond0004
     * @tc.desc      Formats second date sample 4 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0004 begin');
      expect(DateUtil.format(new Date(2024, 4, 10, 5, 15, 21), 'dd-MM HH:mm:ss')).assertEqual('10-05 05:15:21');
      expect(DateUtil.format(new Date(2024, 9, 7, 11, 39, 51), 'dd-MM HH:mm:ss')).assertEqual('07-10 11:39:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0005
     * @tc.name      testPhotosDateFormatSecond0005
     * @tc.desc      Formats second date sample 5 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0005 begin');
      expect(DateUtil.format(new Date(2024, 5, 13, 6, 20, 28), 'HH:mm:ss')).assertEqual('06:20:28');
      expect(DateUtil.format(new Date(2024, 10, 18, 12, 52, 8), 'HH:mm:ss')).assertEqual('12:52:08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0006
     * @tc.name      testPhotosDateFormatSecond0006
     * @tc.desc      Formats second date sample 6 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0006 begin');
      expect(DateUtil.format(new Date(2024, 6, 16, 7, 25, 35), 'MM|dd')).assertEqual('07|16');
      expect(DateUtil.format(new Date(2024, 11, 2, 13, 5, 25), 'MM|dd')).assertEqual('12|02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0007
     * @tc.name      testPhotosDateFormatSecond0007
     * @tc.desc      Formats second date sample 7 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0007 begin');
      expect(DateUtil.format(new Date(2024, 7, 19, 8, 30, 42), 'HH_mm')).assertEqual('08_30');
      expect(DateUtil.format(new Date(2024, 0, 13, 14, 18, 42), 'HH_mm')).assertEqual('14_18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0008
     * @tc.name      testPhotosDateFormatSecond0008
     * @tc.desc      Formats second date sample 8 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0008 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 9, 35, 49), 'MM.dd HH:mm')).assertEqual('09.22 09:35');
      expect(DateUtil.format(new Date(2024, 1, 24, 15, 31, 59), 'MM.dd HH:mm')).assertEqual('02.24 15:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0009
     * @tc.name      testPhotosDateFormatSecond0009
     * @tc.desc      Formats second date sample 9 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0009 begin');
      expect(DateUtil.format(new Date(2024, 9, 25, 10, 40, 56), 'dd-MM HH:mm:ss')).assertEqual('25-10 10:40:56');
      expect(DateUtil.format(new Date(2024, 2, 8, 16, 44, 16), 'dd-MM HH:mm:ss')).assertEqual('08-03 16:44:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0010
     * @tc.name      testPhotosDateFormatSecond0010
     * @tc.desc      Formats second date sample 10 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0010 begin');
      expect(DateUtil.format(new Date(2024, 10, 1, 11, 45, 3), 'HH:mm:ss')).assertEqual('11:45:03');
      expect(DateUtil.format(new Date(2024, 3, 19, 17, 57, 33), 'HH:mm:ss')).assertEqual('17:57:33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0011
     * @tc.name      testPhotosDateFormatSecond0011
     * @tc.desc      Formats second date sample 11 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0011 begin');
      expect(DateUtil.format(new Date(2024, 11, 4, 12, 50, 10), 'MM|dd')).assertEqual('12|04');
      expect(DateUtil.format(new Date(2024, 4, 3, 18, 10, 50), 'MM|dd')).assertEqual('05|03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0012
     * @tc.name      testPhotosDateFormatSecond0012
     * @tc.desc      Formats second date sample 12 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0012 begin');
      expect(DateUtil.format(new Date(2024, 0, 7, 13, 55, 17), 'HH_mm')).assertEqual('13_55');
      expect(DateUtil.format(new Date(2024, 5, 14, 19, 23, 7), 'HH_mm')).assertEqual('19_23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0013
     * @tc.name      testPhotosDateFormatSecond0013
     * @tc.desc      Formats second date sample 13 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0013 begin');
      expect(DateUtil.format(new Date(2024, 1, 10, 14, 0, 24), 'MM.dd HH:mm')).assertEqual('02.10 14:00');
      expect(DateUtil.format(new Date(2024, 6, 25, 20, 36, 24), 'MM.dd HH:mm')).assertEqual('07.25 20:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0014
     * @tc.name      testPhotosDateFormatSecond0014
     * @tc.desc      Formats second date sample 14 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0014 begin');
      expect(DateUtil.format(new Date(2024, 2, 13, 15, 5, 31), 'dd-MM HH:mm:ss')).assertEqual('13-03 15:05:31');
      expect(DateUtil.format(new Date(2024, 7, 9, 21, 49, 41), 'dd-MM HH:mm:ss')).assertEqual('09-08 21:49:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0015
     * @tc.name      testPhotosDateFormatSecond0015
     * @tc.desc      Formats second date sample 15 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0015 begin');
      expect(DateUtil.format(new Date(2024, 3, 16, 16, 10, 38), 'HH:mm:ss')).assertEqual('16:10:38');
      expect(DateUtil.format(new Date(2024, 8, 20, 22, 2, 58), 'HH:mm:ss')).assertEqual('22:02:58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0016
     * @tc.name      testPhotosDateFormatSecond0016
     * @tc.desc      Formats second date sample 16 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0016 begin');
      expect(DateUtil.format(new Date(2024, 4, 19, 17, 15, 45), 'MM|dd')).assertEqual('05|19');
      expect(DateUtil.format(new Date(2024, 9, 4, 23, 15, 15), 'MM|dd')).assertEqual('10|04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0017
     * @tc.name      testPhotosDateFormatSecond0017
     * @tc.desc      Formats second date sample 17 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0017 begin');
      expect(DateUtil.format(new Date(2024, 5, 22, 18, 20, 52), 'HH_mm')).assertEqual('18_20');
      expect(DateUtil.format(new Date(2024, 10, 15, 0, 28, 32), 'HH_mm')).assertEqual('00_28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0018
     * @tc.name      testPhotosDateFormatSecond0018
     * @tc.desc      Formats second date sample 18 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0018 begin');
      expect(DateUtil.format(new Date(2024, 6, 25, 19, 25, 59), 'MM.dd HH:mm')).assertEqual('07.25 19:25');
      expect(DateUtil.format(new Date(2024, 11, 26, 1, 41, 49), 'MM.dd HH:mm')).assertEqual('12.26 01:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0019
     * @tc.name      testPhotosDateFormatSecond0019
     * @tc.desc      Formats second date sample 19 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0019 begin');
      expect(DateUtil.format(new Date(2024, 7, 1, 20, 30, 6), 'dd-MM HH:mm:ss')).assertEqual('01-08 20:30:06');
      expect(DateUtil.format(new Date(2024, 0, 10, 2, 54, 6), 'dd-MM HH:mm:ss')).assertEqual('10-01 02:54:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0020
     * @tc.name      testPhotosDateFormatSecond0020
     * @tc.desc      Formats second date sample 20 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0020 begin');
      expect(DateUtil.format(new Date(2024, 8, 4, 21, 35, 13), 'HH:mm:ss')).assertEqual('21:35:13');
      expect(DateUtil.format(new Date(2024, 1, 21, 3, 7, 23), 'HH:mm:ss')).assertEqual('03:07:23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0021
     * @tc.name      testPhotosDateFormatSecond0021
     * @tc.desc      Formats second date sample 21 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0021 begin');
      expect(DateUtil.format(new Date(2024, 9, 7, 22, 40, 20), 'MM|dd')).assertEqual('10|07');
      expect(DateUtil.format(new Date(2024, 2, 5, 4, 20, 40), 'MM|dd')).assertEqual('03|05');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0022
     * @tc.name      testPhotosDateFormatSecond0022
     * @tc.desc      Formats second date sample 22 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0022 begin');
      expect(DateUtil.format(new Date(2024, 10, 10, 23, 45, 27), 'HH_mm')).assertEqual('23_45');
      expect(DateUtil.format(new Date(2024, 3, 16, 5, 33, 57), 'HH_mm')).assertEqual('05_33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0023
     * @tc.name      testPhotosDateFormatSecond0023
     * @tc.desc      Formats second date sample 23 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0023 begin');
      expect(DateUtil.format(new Date(2024, 11, 13, 0, 50, 34), 'MM.dd HH:mm')).assertEqual('12.13 00:50');
      expect(DateUtil.format(new Date(2024, 4, 27, 6, 46, 14), 'MM.dd HH:mm')).assertEqual('05.27 06:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0024
     * @tc.name      testPhotosDateFormatSecond0024
     * @tc.desc      Formats second date sample 24 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0024 begin');
      expect(DateUtil.format(new Date(2024, 0, 16, 1, 55, 41), 'dd-MM HH:mm:ss')).assertEqual('16-01 01:55:41');
      expect(DateUtil.format(new Date(2024, 5, 11, 7, 59, 31), 'dd-MM HH:mm:ss')).assertEqual('11-06 07:59:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0025
     * @tc.name      testPhotosDateFormatSecond0025
     * @tc.desc      Formats second date sample 25 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0025 begin');
      expect(DateUtil.format(new Date(2024, 1, 19, 2, 0, 48), 'HH:mm:ss')).assertEqual('02:00:48');
      expect(DateUtil.format(new Date(2024, 6, 22, 8, 12, 48), 'HH:mm:ss')).assertEqual('08:12:48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0026
     * @tc.name      testPhotosDateFormatSecond0026
     * @tc.desc      Formats second date sample 26 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0026 begin');
      expect(DateUtil.format(new Date(2024, 2, 22, 3, 5, 55), 'MM|dd')).assertEqual('03|22');
      expect(DateUtil.format(new Date(2024, 7, 6, 9, 25, 5), 'MM|dd')).assertEqual('08|06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0027
     * @tc.name      testPhotosDateFormatSecond0027
     * @tc.desc      Formats second date sample 27 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0027 begin');
      expect(DateUtil.format(new Date(2024, 3, 25, 4, 10, 2), 'HH_mm')).assertEqual('04_10');
      expect(DateUtil.format(new Date(2024, 8, 17, 10, 38, 22), 'HH_mm')).assertEqual('10_38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0028
     * @tc.name      testPhotosDateFormatSecond0028
     * @tc.desc      Formats second date sample 28 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0028 begin');
      expect(DateUtil.format(new Date(2024, 4, 1, 5, 15, 9), 'MM.dd HH:mm')).assertEqual('05.01 05:15');
      expect(DateUtil.format(new Date(2024, 9, 1, 11, 51, 39), 'MM.dd HH:mm')).assertEqual('10.01 11:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0029
     * @tc.name      testPhotosDateFormatSecond0029
     * @tc.desc      Formats second date sample 29 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0029 begin');
      expect(DateUtil.format(new Date(2024, 5, 4, 6, 20, 16), 'dd-MM HH:mm:ss')).assertEqual('04-06 06:20:16');
      expect(DateUtil.format(new Date(2024, 10, 12, 12, 4, 56), 'dd-MM HH:mm:ss')).assertEqual('12-11 12:04:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0030
     * @tc.name      testPhotosDateFormatSecond0030
     * @tc.desc      Formats second date sample 30 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0030 begin');
      expect(DateUtil.format(new Date(2024, 6, 7, 7, 25, 23), 'HH:mm:ss')).assertEqual('07:25:23');
      expect(DateUtil.format(new Date(2024, 11, 23, 13, 17, 13), 'HH:mm:ss')).assertEqual('13:17:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0031
     * @tc.name      testPhotosDateFormatSecond0031
     * @tc.desc      Formats second date sample 31 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0031 begin');
      expect(DateUtil.format(new Date(2024, 7, 10, 8, 30, 30), 'MM|dd')).assertEqual('08|10');
      expect(DateUtil.format(new Date(2024, 0, 7, 14, 30, 30), 'MM|dd')).assertEqual('01|07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0032
     * @tc.name      testPhotosDateFormatSecond0032
     * @tc.desc      Formats second date sample 32 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0032 begin');
      expect(DateUtil.format(new Date(2024, 8, 13, 9, 35, 37), 'HH_mm')).assertEqual('09_35');
      expect(DateUtil.format(new Date(2024, 1, 18, 15, 43, 47), 'HH_mm')).assertEqual('15_43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0033
     * @tc.name      testPhotosDateFormatSecond0033
     * @tc.desc      Formats second date sample 33 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0033 begin');
      expect(DateUtil.format(new Date(2024, 9, 16, 10, 40, 44), 'MM.dd HH:mm')).assertEqual('10.16 10:40');
      expect(DateUtil.format(new Date(2024, 2, 2, 16, 56, 4), 'MM.dd HH:mm')).assertEqual('03.02 16:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0034
     * @tc.name      testPhotosDateFormatSecond0034
     * @tc.desc      Formats second date sample 34 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0034 begin');
      expect(DateUtil.format(new Date(2024, 10, 19, 11, 45, 51), 'dd-MM HH:mm:ss')).assertEqual('19-11 11:45:51');
      expect(DateUtil.format(new Date(2024, 3, 13, 17, 9, 21), 'dd-MM HH:mm:ss')).assertEqual('13-04 17:09:21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0035
     * @tc.name      testPhotosDateFormatSecond0035
     * @tc.desc      Formats second date sample 35 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0035 begin');
      expect(DateUtil.format(new Date(2024, 11, 22, 12, 50, 58), 'HH:mm:ss')).assertEqual('12:50:58');
      expect(DateUtil.format(new Date(2024, 4, 24, 18, 22, 38), 'HH:mm:ss')).assertEqual('18:22:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0036
     * @tc.name      testPhotosDateFormatSecond0036
     * @tc.desc      Formats second date sample 36 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0036 begin');
      expect(DateUtil.format(new Date(2024, 0, 25, 13, 55, 5), 'MM|dd')).assertEqual('01|25');
      expect(DateUtil.format(new Date(2024, 5, 8, 19, 35, 55), 'MM|dd')).assertEqual('06|08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0037
     * @tc.name      testPhotosDateFormatSecond0037
     * @tc.desc      Formats second date sample 37 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0037 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 14, 0, 12), 'HH_mm')).assertEqual('14_00');
      expect(DateUtil.format(new Date(2024, 6, 19, 20, 48, 12), 'HH_mm')).assertEqual('20_48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0038
     * @tc.name      testPhotosDateFormatSecond0038
     * @tc.desc      Formats second date sample 38 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0038 begin');
      expect(DateUtil.format(new Date(2024, 2, 4, 15, 5, 19), 'MM.dd HH:mm')).assertEqual('03.04 15:05');
      expect(DateUtil.format(new Date(2024, 7, 3, 21, 1, 29), 'MM.dd HH:mm')).assertEqual('08.03 21:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0039
     * @tc.name      testPhotosDateFormatSecond0039
     * @tc.desc      Formats second date sample 39 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0039 begin');
      expect(DateUtil.format(new Date(2024, 3, 7, 16, 10, 26), 'dd-MM HH:mm:ss')).assertEqual('07-04 16:10:26');
      expect(DateUtil.format(new Date(2024, 8, 14, 22, 14, 46), 'dd-MM HH:mm:ss')).assertEqual('14-09 22:14:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0040
     * @tc.name      testPhotosDateFormatSecond0040
     * @tc.desc      Formats second date sample 40 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0040 begin');
      expect(DateUtil.format(new Date(2024, 4, 10, 17, 15, 33), 'HH:mm:ss')).assertEqual('17:15:33');
      expect(DateUtil.format(new Date(2024, 9, 25, 23, 27, 3), 'HH:mm:ss')).assertEqual('23:27:03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0041
     * @tc.name      testPhotosDateFormatSecond0041
     * @tc.desc      Formats second date sample 41 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0041 begin');
      expect(DateUtil.format(new Date(2024, 5, 13, 18, 20, 40), 'MM|dd')).assertEqual('06|13');
      expect(DateUtil.format(new Date(2024, 10, 9, 0, 40, 20), 'MM|dd')).assertEqual('11|09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0042
     * @tc.name      testPhotosDateFormatSecond0042
     * @tc.desc      Formats second date sample 42 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0042 begin');
      expect(DateUtil.format(new Date(2024, 6, 16, 19, 25, 47), 'HH_mm')).assertEqual('19_25');
      expect(DateUtil.format(new Date(2024, 11, 20, 1, 53, 37), 'HH_mm')).assertEqual('01_53');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0043
     * @tc.name      testPhotosDateFormatSecond0043
     * @tc.desc      Formats second date sample 43 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0043 begin');
      expect(DateUtil.format(new Date(2024, 7, 19, 20, 30, 54), 'MM.dd HH:mm')).assertEqual('08.19 20:30');
      expect(DateUtil.format(new Date(2024, 0, 4, 2, 6, 54), 'MM.dd HH:mm')).assertEqual('01.04 02:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0044
     * @tc.name      testPhotosDateFormatSecond0044
     * @tc.desc      Formats second date sample 44 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0044 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 21, 35, 1), 'dd-MM HH:mm:ss')).assertEqual('22-09 21:35:01');
      expect(DateUtil.format(new Date(2024, 1, 15, 3, 19, 11), 'dd-MM HH:mm:ss')).assertEqual('15-02 03:19:11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0045
     * @tc.name      testPhotosDateFormatSecond0045
     * @tc.desc      Formats second date sample 45 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0045 begin');
      expect(DateUtil.format(new Date(2024, 9, 25, 22, 40, 8), 'HH:mm:ss')).assertEqual('22:40:08');
      expect(DateUtil.format(new Date(2024, 2, 26, 4, 32, 28), 'HH:mm:ss')).assertEqual('04:32:28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0046
     * @tc.name      testPhotosDateFormatSecond0046
     * @tc.desc      Formats second date sample 46 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0046 begin');
      expect(DateUtil.format(new Date(2024, 10, 1, 23, 45, 15), 'MM|dd')).assertEqual('11|01');
      expect(DateUtil.format(new Date(2024, 3, 10, 5, 45, 45), 'MM|dd')).assertEqual('04|10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0047
     * @tc.name      testPhotosDateFormatSecond0047
     * @tc.desc      Formats second date sample 47 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0047 begin');
      expect(DateUtil.format(new Date(2024, 11, 4, 0, 50, 22), 'HH_mm')).assertEqual('00_50');
      expect(DateUtil.format(new Date(2024, 4, 21, 6, 58, 2), 'HH_mm')).assertEqual('06_58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0048
     * @tc.name      testPhotosDateFormatSecond0048
     * @tc.desc      Formats second date sample 48 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0048 begin');
      expect(DateUtil.format(new Date(2024, 0, 7, 1, 55, 29), 'MM.dd HH:mm')).assertEqual('01.07 01:55');
      expect(DateUtil.format(new Date(2024, 5, 5, 7, 11, 19), 'MM.dd HH:mm')).assertEqual('06.05 07:11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0049
     * @tc.name      testPhotosDateFormatSecond0049
     * @tc.desc      Formats second date sample 49 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0049 begin');
      expect(DateUtil.format(new Date(2024, 1, 10, 2, 0, 36), 'dd-MM HH:mm:ss')).assertEqual('10-02 02:00:36');
      expect(DateUtil.format(new Date(2024, 6, 16, 8, 24, 36), 'dd-MM HH:mm:ss')).assertEqual('16-07 08:24:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0050
     * @tc.name      testPhotosDateFormatSecond0050
     * @tc.desc      Formats second date sample 50 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0050 begin');
      expect(DateUtil.format(new Date(2024, 2, 13, 3, 5, 43), 'HH:mm:ss')).assertEqual('03:05:43');
      expect(DateUtil.format(new Date(2024, 7, 27, 9, 37, 53), 'HH:mm:ss')).assertEqual('09:37:53');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0051
     * @tc.name      testPhotosDateFormatSecond0051
     * @tc.desc      Formats second date sample 51 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0051 begin');
      expect(DateUtil.format(new Date(2024, 3, 16, 4, 10, 50), 'MM|dd')).assertEqual('04|16');
      expect(DateUtil.format(new Date(2024, 8, 11, 10, 50, 10), 'MM|dd')).assertEqual('09|11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0052
     * @tc.name      testPhotosDateFormatSecond0052
     * @tc.desc      Formats second date sample 52 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0052 begin');
      expect(DateUtil.format(new Date(2024, 4, 19, 5, 15, 57), 'HH_mm')).assertEqual('05_15');
      expect(DateUtil.format(new Date(2024, 9, 22, 11, 3, 27), 'HH_mm')).assertEqual('11_03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0053
     * @tc.name      testPhotosDateFormatSecond0053
     * @tc.desc      Formats second date sample 53 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0053 begin');
      expect(DateUtil.format(new Date(2024, 5, 22, 6, 20, 4), 'MM.dd HH:mm')).assertEqual('06.22 06:20');
      expect(DateUtil.format(new Date(2024, 10, 6, 12, 16, 44), 'MM.dd HH:mm')).assertEqual('11.06 12:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0054
     * @tc.name      testPhotosDateFormatSecond0054
     * @tc.desc      Formats second date sample 54 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0054 begin');
      expect(DateUtil.format(new Date(2024, 6, 25, 7, 25, 11), 'dd-MM HH:mm:ss')).assertEqual('25-07 07:25:11');
      expect(DateUtil.format(new Date(2024, 11, 17, 13, 29, 1), 'dd-MM HH:mm:ss')).assertEqual('17-12 13:29:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0055
     * @tc.name      testPhotosDateFormatSecond0055
     * @tc.desc      Formats second date sample 55 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0055 begin');
      expect(DateUtil.format(new Date(2024, 7, 1, 8, 30, 18), 'HH:mm:ss')).assertEqual('08:30:18');
      expect(DateUtil.format(new Date(2024, 0, 1, 14, 42, 18), 'HH:mm:ss')).assertEqual('14:42:18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0056
     * @tc.name      testPhotosDateFormatSecond0056
     * @tc.desc      Formats second date sample 56 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0056 begin');
      expect(DateUtil.format(new Date(2024, 8, 4, 9, 35, 25), 'MM|dd')).assertEqual('09|04');
      expect(DateUtil.format(new Date(2024, 1, 12, 15, 55, 35), 'MM|dd')).assertEqual('02|12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0057
     * @tc.name      testPhotosDateFormatSecond0057
     * @tc.desc      Formats second date sample 57 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0057 begin');
      expect(DateUtil.format(new Date(2024, 9, 7, 10, 40, 32), 'HH_mm')).assertEqual('10_40');
      expect(DateUtil.format(new Date(2024, 2, 23, 16, 8, 52), 'HH_mm')).assertEqual('16_08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0058
     * @tc.name      testPhotosDateFormatSecond0058
     * @tc.desc      Formats second date sample 58 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0058 begin');
      expect(DateUtil.format(new Date(2024, 10, 10, 11, 45, 39), 'MM.dd HH:mm')).assertEqual('11.10 11:45');
      expect(DateUtil.format(new Date(2024, 3, 7, 17, 21, 9), 'MM.dd HH:mm')).assertEqual('04.07 17:21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0059
     * @tc.name      testPhotosDateFormatSecond0059
     * @tc.desc      Formats second date sample 59 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0059 begin');
      expect(DateUtil.format(new Date(2024, 11, 13, 12, 50, 46), 'dd-MM HH:mm:ss')).assertEqual('13-12 12:50:46');
      expect(DateUtil.format(new Date(2024, 4, 18, 18, 34, 26), 'dd-MM HH:mm:ss')).assertEqual('18-05 18:34:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0060
     * @tc.name      testPhotosDateFormatSecond0060
     * @tc.desc      Formats second date sample 60 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0060 begin');
      expect(DateUtil.format(new Date(2024, 0, 16, 13, 55, 53), 'HH:mm:ss')).assertEqual('13:55:53');
      expect(DateUtil.format(new Date(2024, 5, 2, 19, 47, 43), 'HH:mm:ss')).assertEqual('19:47:43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0061
     * @tc.name      testPhotosDateFormatSecond0061
     * @tc.desc      Formats second date sample 61 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0061 begin');
      expect(DateUtil.format(new Date(2024, 1, 19, 14, 0, 0), 'MM|dd')).assertEqual('02|19');
      expect(DateUtil.format(new Date(2024, 6, 13, 20, 0, 0), 'MM|dd')).assertEqual('07|13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0062
     * @tc.name      testPhotosDateFormatSecond0062
     * @tc.desc      Formats second date sample 62 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0062 begin');
      expect(DateUtil.format(new Date(2024, 2, 22, 15, 5, 7), 'HH_mm')).assertEqual('15_05');
      expect(DateUtil.format(new Date(2024, 7, 24, 21, 13, 17), 'HH_mm')).assertEqual('21_13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0063
     * @tc.name      testPhotosDateFormatSecond0063
     * @tc.desc      Formats second date sample 63 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0063 begin');
      expect(DateUtil.format(new Date(2024, 3, 25, 16, 10, 14), 'MM.dd HH:mm')).assertEqual('04.25 16:10');
      expect(DateUtil.format(new Date(2024, 8, 8, 22, 26, 34), 'MM.dd HH:mm')).assertEqual('09.08 22:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0064
     * @tc.name      testPhotosDateFormatSecond0064
     * @tc.desc      Formats second date sample 64 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0064 begin');
      expect(DateUtil.format(new Date(2024, 4, 1, 17, 15, 21), 'dd-MM HH:mm:ss')).assertEqual('01-05 17:15:21');
      expect(DateUtil.format(new Date(2024, 9, 19, 23, 39, 51), 'dd-MM HH:mm:ss')).assertEqual('19-10 23:39:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0065
     * @tc.name      testPhotosDateFormatSecond0065
     * @tc.desc      Formats second date sample 65 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0065 begin');
      expect(DateUtil.format(new Date(2024, 5, 4, 18, 20, 28), 'HH:mm:ss')).assertEqual('18:20:28');
      expect(DateUtil.format(new Date(2024, 10, 3, 0, 52, 8), 'HH:mm:ss')).assertEqual('00:52:08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0066
     * @tc.name      testPhotosDateFormatSecond0066
     * @tc.desc      Formats second date sample 66 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0066 begin');
      expect(DateUtil.format(new Date(2024, 6, 7, 19, 25, 35), 'MM|dd')).assertEqual('07|07');
      expect(DateUtil.format(new Date(2024, 11, 14, 1, 5, 25), 'MM|dd')).assertEqual('12|14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0067
     * @tc.name      testPhotosDateFormatSecond0067
     * @tc.desc      Formats second date sample 67 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0067 begin');
      expect(DateUtil.format(new Date(2024, 7, 10, 20, 30, 42), 'HH_mm')).assertEqual('20_30');
      expect(DateUtil.format(new Date(2024, 0, 25, 2, 18, 42), 'HH_mm')).assertEqual('02_18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0068
     * @tc.name      testPhotosDateFormatSecond0068
     * @tc.desc      Formats second date sample 68 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0068 begin');
      expect(DateUtil.format(new Date(2024, 8, 13, 21, 35, 49), 'MM.dd HH:mm')).assertEqual('09.13 21:35');
      expect(DateUtil.format(new Date(2024, 1, 9, 3, 31, 59), 'MM.dd HH:mm')).assertEqual('02.09 03:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0069
     * @tc.name      testPhotosDateFormatSecond0069
     * @tc.desc      Formats second date sample 69 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0069 begin');
      expect(DateUtil.format(new Date(2024, 9, 16, 22, 40, 56), 'dd-MM HH:mm:ss')).assertEqual('16-10 22:40:56');
      expect(DateUtil.format(new Date(2024, 2, 20, 4, 44, 16), 'dd-MM HH:mm:ss')).assertEqual('20-03 04:44:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0070
     * @tc.name      testPhotosDateFormatSecond0070
     * @tc.desc      Formats second date sample 70 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0070 begin');
      expect(DateUtil.format(new Date(2024, 10, 19, 23, 45, 3), 'HH:mm:ss')).assertEqual('23:45:03');
      expect(DateUtil.format(new Date(2024, 3, 4, 5, 57, 33), 'HH:mm:ss')).assertEqual('05:57:33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0071
     * @tc.name      testPhotosDateFormatSecond0071
     * @tc.desc      Formats second date sample 71 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0071 begin');
      expect(DateUtil.format(new Date(2024, 11, 22, 0, 50, 10), 'MM|dd')).assertEqual('12|22');
      expect(DateUtil.format(new Date(2024, 4, 15, 6, 10, 50), 'MM|dd')).assertEqual('05|15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0072
     * @tc.name      testPhotosDateFormatSecond0072
     * @tc.desc      Formats second date sample 72 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0072 begin');
      expect(DateUtil.format(new Date(2024, 0, 25, 1, 55, 17), 'HH_mm')).assertEqual('01_55');
      expect(DateUtil.format(new Date(2024, 5, 26, 7, 23, 7), 'HH_mm')).assertEqual('07_23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0073
     * @tc.name      testPhotosDateFormatSecond0073
     * @tc.desc      Formats second date sample 73 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0073 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 2, 0, 24), 'MM.dd HH:mm')).assertEqual('02.01 02:00');
      expect(DateUtil.format(new Date(2024, 6, 10, 8, 36, 24), 'MM.dd HH:mm')).assertEqual('07.10 08:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0074
     * @tc.name      testPhotosDateFormatSecond0074
     * @tc.desc      Formats second date sample 74 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0074 begin');
      expect(DateUtil.format(new Date(2024, 2, 4, 3, 5, 31), 'dd-MM HH:mm:ss')).assertEqual('04-03 03:05:31');
      expect(DateUtil.format(new Date(2024, 7, 21, 9, 49, 41), 'dd-MM HH:mm:ss')).assertEqual('21-08 09:49:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0075
     * @tc.name      testPhotosDateFormatSecond0075
     * @tc.desc      Formats second date sample 75 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0075 begin');
      expect(DateUtil.format(new Date(2024, 3, 7, 4, 10, 38), 'HH:mm:ss')).assertEqual('04:10:38');
      expect(DateUtil.format(new Date(2024, 8, 5, 10, 2, 58), 'HH:mm:ss')).assertEqual('10:02:58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0076
     * @tc.name      testPhotosDateFormatSecond0076
     * @tc.desc      Formats second date sample 76 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0076 begin');
      expect(DateUtil.format(new Date(2024, 4, 10, 5, 15, 45), 'MM|dd')).assertEqual('05|10');
      expect(DateUtil.format(new Date(2024, 9, 16, 11, 15, 15), 'MM|dd')).assertEqual('10|16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0077
     * @tc.name      testPhotosDateFormatSecond0077
     * @tc.desc      Formats second date sample 77 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0077 begin');
      expect(DateUtil.format(new Date(2024, 5, 13, 6, 20, 52), 'HH_mm')).assertEqual('06_20');
      expect(DateUtil.format(new Date(2024, 10, 27, 12, 28, 32), 'HH_mm')).assertEqual('12_28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0078
     * @tc.name      testPhotosDateFormatSecond0078
     * @tc.desc      Formats second date sample 78 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0078 begin');
      expect(DateUtil.format(new Date(2024, 6, 16, 7, 25, 59), 'MM.dd HH:mm')).assertEqual('07.16 07:25');
      expect(DateUtil.format(new Date(2024, 11, 11, 13, 41, 49), 'MM.dd HH:mm')).assertEqual('12.11 13:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0079
     * @tc.name      testPhotosDateFormatSecond0079
     * @tc.desc      Formats second date sample 79 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0079 begin');
      expect(DateUtil.format(new Date(2024, 7, 19, 8, 30, 6), 'dd-MM HH:mm:ss')).assertEqual('19-08 08:30:06');
      expect(DateUtil.format(new Date(2024, 0, 22, 14, 54, 6), 'dd-MM HH:mm:ss')).assertEqual('22-01 14:54:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0080
     * @tc.name      testPhotosDateFormatSecond0080
     * @tc.desc      Formats second date sample 80 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0080 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 9, 35, 13), 'HH:mm:ss')).assertEqual('09:35:13');
      expect(DateUtil.format(new Date(2024, 1, 6, 15, 7, 23), 'HH:mm:ss')).assertEqual('15:07:23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0081
     * @tc.name      testPhotosDateFormatSecond0081
     * @tc.desc      Formats second date sample 81 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0081 begin');
      expect(DateUtil.format(new Date(2024, 9, 25, 10, 40, 20), 'MM|dd')).assertEqual('10|25');
      expect(DateUtil.format(new Date(2024, 2, 17, 16, 20, 40), 'MM|dd')).assertEqual('03|17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0082
     * @tc.name      testPhotosDateFormatSecond0082
     * @tc.desc      Formats second date sample 82 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0082 begin');
      expect(DateUtil.format(new Date(2024, 10, 1, 11, 45, 27), 'HH_mm')).assertEqual('11_45');
      expect(DateUtil.format(new Date(2024, 3, 1, 17, 33, 57), 'HH_mm')).assertEqual('17_33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0083
     * @tc.name      testPhotosDateFormatSecond0083
     * @tc.desc      Formats second date sample 83 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0083 begin');
      expect(DateUtil.format(new Date(2024, 11, 4, 12, 50, 34), 'MM.dd HH:mm')).assertEqual('12.04 12:50');
      expect(DateUtil.format(new Date(2024, 4, 12, 18, 46, 14), 'MM.dd HH:mm')).assertEqual('05.12 18:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0084
     * @tc.name      testPhotosDateFormatSecond0084
     * @tc.desc      Formats second date sample 84 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0084 begin');
      expect(DateUtil.format(new Date(2024, 0, 7, 13, 55, 41), 'dd-MM HH:mm:ss')).assertEqual('07-01 13:55:41');
      expect(DateUtil.format(new Date(2024, 5, 23, 19, 59, 31), 'dd-MM HH:mm:ss')).assertEqual('23-06 19:59:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0085
     * @tc.name      testPhotosDateFormatSecond0085
     * @tc.desc      Formats second date sample 85 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0085 begin');
      expect(DateUtil.format(new Date(2024, 1, 10, 14, 0, 48), 'HH:mm:ss')).assertEqual('14:00:48');
      expect(DateUtil.format(new Date(2024, 6, 7, 20, 12, 48), 'HH:mm:ss')).assertEqual('20:12:48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0086
     * @tc.name      testPhotosDateFormatSecond0086
     * @tc.desc      Formats second date sample 86 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0086 begin');
      expect(DateUtil.format(new Date(2024, 2, 13, 15, 5, 55), 'MM|dd')).assertEqual('03|13');
      expect(DateUtil.format(new Date(2024, 7, 18, 21, 25, 5), 'MM|dd')).assertEqual('08|18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0087
     * @tc.name      testPhotosDateFormatSecond0087
     * @tc.desc      Formats second date sample 87 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0087 begin');
      expect(DateUtil.format(new Date(2024, 3, 16, 16, 10, 2), 'HH_mm')).assertEqual('16_10');
      expect(DateUtil.format(new Date(2024, 8, 2, 22, 38, 22), 'HH_mm')).assertEqual('22_38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0088
     * @tc.name      testPhotosDateFormatSecond0088
     * @tc.desc      Formats second date sample 88 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0088 begin');
      expect(DateUtil.format(new Date(2024, 4, 19, 17, 15, 9), 'MM.dd HH:mm')).assertEqual('05.19 17:15');
      expect(DateUtil.format(new Date(2024, 9, 13, 23, 51, 39), 'MM.dd HH:mm')).assertEqual('10.13 23:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0089
     * @tc.name      testPhotosDateFormatSecond0089
     * @tc.desc      Formats second date sample 89 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0089 begin');
      expect(DateUtil.format(new Date(2024, 5, 22, 18, 20, 16), 'dd-MM HH:mm:ss')).assertEqual('22-06 18:20:16');
      expect(DateUtil.format(new Date(2024, 10, 24, 0, 4, 56), 'dd-MM HH:mm:ss')).assertEqual('24-11 00:04:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0090
     * @tc.name      testPhotosDateFormatSecond0090
     * @tc.desc      Formats second date sample 90 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0090 begin');
      expect(DateUtil.format(new Date(2024, 6, 25, 19, 25, 23), 'HH:mm:ss')).assertEqual('19:25:23');
      expect(DateUtil.format(new Date(2024, 11, 8, 1, 17, 13), 'HH:mm:ss')).assertEqual('01:17:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0091
     * @tc.name      testPhotosDateFormatSecond0091
     * @tc.desc      Formats second date sample 91 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0091 begin');
      expect(DateUtil.format(new Date(2024, 7, 1, 20, 30, 30), 'MM|dd')).assertEqual('08|01');
      expect(DateUtil.format(new Date(2024, 0, 19, 2, 30, 30), 'MM|dd')).assertEqual('01|19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0092
     * @tc.name      testPhotosDateFormatSecond0092
     * @tc.desc      Formats second date sample 92 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0092 begin');
      expect(DateUtil.format(new Date(2024, 8, 4, 21, 35, 37), 'HH_mm')).assertEqual('21_35');
      expect(DateUtil.format(new Date(2024, 1, 3, 3, 43, 47), 'HH_mm')).assertEqual('03_43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0093
     * @tc.name      testPhotosDateFormatSecond0093
     * @tc.desc      Formats second date sample 93 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0093 begin');
      expect(DateUtil.format(new Date(2024, 9, 7, 22, 40, 44), 'MM.dd HH:mm')).assertEqual('10.07 22:40');
      expect(DateUtil.format(new Date(2024, 2, 14, 4, 56, 4), 'MM.dd HH:mm')).assertEqual('03.14 04:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0094
     * @tc.name      testPhotosDateFormatSecond0094
     * @tc.desc      Formats second date sample 94 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0094 begin');
      expect(DateUtil.format(new Date(2024, 10, 10, 23, 45, 51), 'dd-MM HH:mm:ss')).assertEqual('10-11 23:45:51');
      expect(DateUtil.format(new Date(2024, 3, 25, 5, 9, 21), 'dd-MM HH:mm:ss')).assertEqual('25-04 05:09:21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0095
     * @tc.name      testPhotosDateFormatSecond0095
     * @tc.desc      Formats second date sample 95 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0095 begin');
      expect(DateUtil.format(new Date(2024, 11, 13, 0, 50, 58), 'HH:mm:ss')).assertEqual('00:50:58');
      expect(DateUtil.format(new Date(2024, 4, 9, 6, 22, 38), 'HH:mm:ss')).assertEqual('06:22:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0096
     * @tc.name      testPhotosDateFormatSecond0096
     * @tc.desc      Formats second date sample 96 with MM|dd.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0096 begin');
      expect(DateUtil.format(new Date(2024, 0, 16, 1, 55, 5), 'MM|dd')).assertEqual('01|16');
      expect(DateUtil.format(new Date(2024, 5, 20, 7, 35, 55), 'MM|dd')).assertEqual('06|20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0097
     * @tc.name      testPhotosDateFormatSecond0097
     * @tc.desc      Formats second date sample 97 with HH_mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0097 begin');
      expect(DateUtil.format(new Date(2024, 1, 19, 2, 0, 12), 'HH_mm')).assertEqual('02_00');
      expect(DateUtil.format(new Date(2024, 6, 4, 8, 48, 12), 'HH_mm')).assertEqual('08_48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0098
     * @tc.name      testPhotosDateFormatSecond0098
     * @tc.desc      Formats second date sample 98 with MM.dd HH:mm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0098 begin');
      expect(DateUtil.format(new Date(2024, 2, 22, 3, 5, 19), 'MM.dd HH:mm')).assertEqual('03.22 03:05');
      expect(DateUtil.format(new Date(2024, 7, 15, 9, 1, 29), 'MM.dd HH:mm')).assertEqual('08.15 09:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0099
     * @tc.name      testPhotosDateFormatSecond0099
     * @tc.desc      Formats second date sample 99 with dd-MM HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0099 begin');
      expect(DateUtil.format(new Date(2024, 3, 25, 4, 10, 26), 'dd-MM HH:mm:ss')).assertEqual('25-04 04:10:26');
      expect(DateUtil.format(new Date(2024, 8, 26, 10, 14, 46), 'dd-MM HH:mm:ss')).assertEqual('26-09 10:14:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_SECOND_0100
     * @tc.name      testPhotosDateFormatSecond0100
     * @tc.desc      Formats second date sample 100 with HH:mm:ss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatSecond0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0100 begin');
      expect(DateUtil.format(new Date(2024, 4, 1, 5, 15, 33), 'HH:mm:ss')).assertEqual('05:15:33');
      expect(DateUtil.format(new Date(2024, 9, 10, 11, 27, 3), 'HH:mm:ss')).assertEqual('11:27:03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatSecond0100 end');
    })
  })
}
