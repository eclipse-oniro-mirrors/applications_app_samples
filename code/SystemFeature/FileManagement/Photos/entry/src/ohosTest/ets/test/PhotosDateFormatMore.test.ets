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

const TAG = '[Sample_PhotosDateFormatMoreTest]';
const DOMAIN = 0xF811;

export default function PhotosDateFormatMoreTest(): void {
  describe('PhotosDateFormatMoreTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0001
     * @tc.name      testPhotosDateFormatMore0001
     * @tc.desc      Formats additional pattern MM/dd HH:mm sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0001 begin');
      expect(DateUtil.format(new Date(2024, 0, 1, 0, 0, 0), 'MM/dd HH:mm')).assertEqual('01/01 00:00');
      expect(DateUtil.format(new Date(2024, 4, 1, 6, 0, 0), 'MM/dd HH:mm')).assertEqual('05/01 06:00');
      expect(DateUtil.format(new Date(2024, 8, 1, 10, 0, 0), 'MM/dd HH:mm')).assertEqual('09/01 10:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0002
     * @tc.name      testPhotosDateFormatMore0002
     * @tc.desc      Formats additional pattern dd-MM HH:mm sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0002 begin');
      expect(DateUtil.format(new Date(2024, 1, 2, 1, 7, 13), 'dd-MM HH:mm')).assertEqual('02-02 01:07');
      expect(DateUtil.format(new Date(2024, 5, 4, 7, 9, 15), 'dd-MM HH:mm')).assertEqual('04-06 07:09');
      expect(DateUtil.format(new Date(2024, 9, 6, 11, 17, 21), 'dd-MM HH:mm')).assertEqual('06-10 11:17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0003
     * @tc.name      testPhotosDateFormatMore0003
     * @tc.desc      Formats additional pattern HH:mm:ss sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0003 begin');
      expect(DateUtil.format(new Date(2024, 2, 3, 2, 14, 26), 'HH:mm:ss')).assertEqual('02:14:26');
      expect(DateUtil.format(new Date(2024, 6, 7, 8, 18, 30), 'HH:mm:ss')).assertEqual('08:18:30');
      expect(DateUtil.format(new Date(2024, 10, 11, 12, 34, 42), 'HH:mm:ss')).assertEqual('12:34:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0004
     * @tc.name      testPhotosDateFormatMore0004
     * @tc.desc      Formats additional pattern MM.dd sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0004 begin');
      expect(DateUtil.format(new Date(2024, 3, 4, 3, 21, 39), 'MM.dd')).assertEqual('04.04');
      expect(DateUtil.format(new Date(2024, 7, 10, 9, 27, 45), 'MM.dd')).assertEqual('08.10');
      expect(DateUtil.format(new Date(2024, 11, 16, 13, 51, 3), 'MM.dd')).assertEqual('12.16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0005
     * @tc.name      testPhotosDateFormatMore0005
     * @tc.desc      Formats additional pattern dd/MM sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0005 begin');
      expect(DateUtil.format(new Date(2024, 4, 5, 4, 28, 52), 'dd/MM')).assertEqual('05/05');
      expect(DateUtil.format(new Date(2024, 8, 13, 10, 36, 0), 'dd/MM')).assertEqual('13/09');
      expect(DateUtil.format(new Date(2024, 0, 21, 14, 8, 24), 'dd/MM')).assertEqual('21/01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0006
     * @tc.name      testPhotosDateFormatMore0006
     * @tc.desc      Formats additional pattern MM-dd-HH-mm-ss sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0006 begin');
      expect(DateUtil.format(new Date(2024, 5, 6, 5, 35, 5), 'MM-dd-HH-mm-ss')).assertEqual('06-06-05-35-05');
      expect(DateUtil.format(new Date(2024, 9, 16, 11, 45, 15), 'MM-dd-HH-mm-ss')).assertEqual('10-16-11-45-15');
      expect(DateUtil.format(new Date(2024, 1, 26, 15, 25, 45), 'MM-dd-HH-mm-ss')).assertEqual('02-26-15-25-45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0007
     * @tc.name      testPhotosDateFormatMore0007
     * @tc.desc      Formats additional pattern HH-mm-ss sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0007 begin');
      expect(DateUtil.format(new Date(2024, 6, 7, 6, 42, 18), 'HH-mm-ss')).assertEqual('06-42-18');
      expect(DateUtil.format(new Date(2024, 10, 19, 12, 54, 30), 'HH-mm-ss')).assertEqual('12-54-30');
      expect(DateUtil.format(new Date(2024, 2, 3, 16, 42, 6), 'HH-mm-ss')).assertEqual('16-42-06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0008
     * @tc.name      testPhotosDateFormatMore0008
     * @tc.desc      Formats additional pattern MM/dd sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0008 begin');
      expect(DateUtil.format(new Date(2024, 7, 8, 7, 49, 31), 'MM/dd')).assertEqual('08/08');
      expect(DateUtil.format(new Date(2024, 11, 22, 13, 3, 45), 'MM/dd')).assertEqual('12/22');
      expect(DateUtil.format(new Date(2024, 3, 8, 17, 59, 27), 'MM/dd')).assertEqual('04/08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0009
     * @tc.name      testPhotosDateFormatMore0009
     * @tc.desc      Formats additional pattern HH:mm sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0009 begin');
      expect(DateUtil.format(new Date(2024, 8, 9, 8, 56, 44), 'HH:mm')).assertEqual('08:56');
      expect(DateUtil.format(new Date(2024, 0, 25, 14, 12, 0), 'HH:mm')).assertEqual('14:12');
      expect(DateUtil.format(new Date(2024, 4, 13, 18, 16, 48), 'HH:mm')).assertEqual('18:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0010
     * @tc.name      testPhotosDateFormatMore0010
     * @tc.desc      Formats additional pattern dd.MM HH:mm:ss sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0010 begin');
      expect(DateUtil.format(new Date(2024, 9, 10, 9, 3, 57), 'dd.MM HH:mm:ss')).assertEqual('10.10 09:03:57');
      expect(DateUtil.format(new Date(2024, 1, 28, 15, 21, 15), 'dd.MM HH:mm:ss')).assertEqual('28.02 15:21:15');
      expect(DateUtil.format(new Date(2024, 5, 18, 19, 33, 9), 'dd.MM HH:mm:ss')).assertEqual('18.06 19:33:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0011
     * @tc.name      testPhotosDateFormatMore0011
     * @tc.desc      Formats additional pattern MM/dd HH:mm sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0011 begin');
      expect(DateUtil.format(new Date(2024, 10, 11, 10, 10, 10), 'MM/dd HH:mm')).assertEqual('11/11 10:10');
      expect(DateUtil.format(new Date(2024, 2, 3, 16, 30, 30), 'MM/dd HH:mm')).assertEqual('03/03 16:30');
      expect(DateUtil.format(new Date(2024, 6, 23, 20, 50, 30), 'MM/dd HH:mm')).assertEqual('07/23 20:50');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0012
     * @tc.name      testPhotosDateFormatMore0012
     * @tc.desc      Formats additional pattern dd-MM HH:mm sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0012 begin');
      expect(DateUtil.format(new Date(2024, 11, 12, 11, 17, 23), 'dd-MM HH:mm')).assertEqual('12-12 11:17');
      expect(DateUtil.format(new Date(2024, 3, 6, 17, 39, 45), 'dd-MM HH:mm')).assertEqual('06-04 17:39');
      expect(DateUtil.format(new Date(2024, 7, 28, 21, 7, 51), 'dd-MM HH:mm')).assertEqual('28-08 21:07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0013
     * @tc.name      testPhotosDateFormatMore0013
     * @tc.desc      Formats additional pattern HH:mm:ss sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0013 begin');
      expect(DateUtil.format(new Date(2024, 0, 13, 12, 24, 36), 'HH:mm:ss')).assertEqual('12:24:36');
      expect(DateUtil.format(new Date(2024, 4, 9, 18, 48, 0), 'HH:mm:ss')).assertEqual('18:48:00');
      expect(DateUtil.format(new Date(2024, 8, 5, 22, 24, 12), 'HH:mm:ss')).assertEqual('22:24:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0014
     * @tc.name      testPhotosDateFormatMore0014
     * @tc.desc      Formats additional pattern MM.dd sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0014 begin');
      expect(DateUtil.format(new Date(2024, 1, 14, 13, 31, 49), 'MM.dd')).assertEqual('02.14');
      expect(DateUtil.format(new Date(2024, 5, 12, 19, 57, 15), 'MM.dd')).assertEqual('06.12');
      expect(DateUtil.format(new Date(2024, 9, 10, 23, 41, 33), 'MM.dd')).assertEqual('10.10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0015
     * @tc.name      testPhotosDateFormatMore0015
     * @tc.desc      Formats additional pattern dd/MM sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0015 begin');
      expect(DateUtil.format(new Date(2024, 2, 15, 14, 38, 2), 'dd/MM')).assertEqual('15/03');
      expect(DateUtil.format(new Date(2024, 6, 15, 20, 6, 30), 'dd/MM')).assertEqual('15/07');
      expect(DateUtil.format(new Date(2024, 10, 15, 0, 58, 54), 'dd/MM')).assertEqual('15/11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0016
     * @tc.name      testPhotosDateFormatMore0016
     * @tc.desc      Formats additional pattern MM-dd-HH-mm-ss sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0016 begin');
      expect(DateUtil.format(new Date(2024, 3, 16, 15, 45, 15), 'MM-dd-HH-mm-ss')).assertEqual('04-16-15-45-15');
      expect(DateUtil.format(new Date(2024, 7, 18, 21, 15, 45), 'MM-dd-HH-mm-ss')).assertEqual('08-18-21-15-45');
      expect(DateUtil.format(new Date(2024, 11, 20, 1, 15, 15), 'MM-dd-HH-mm-ss')).assertEqual('12-20-01-15-15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0017
     * @tc.name      testPhotosDateFormatMore0017
     * @tc.desc      Formats additional pattern HH-mm-ss sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0017 begin');
      expect(DateUtil.format(new Date(2024, 4, 17, 16, 52, 28), 'HH-mm-ss')).assertEqual('16-52-28');
      expect(DateUtil.format(new Date(2024, 8, 21, 22, 24, 0), 'HH-mm-ss')).assertEqual('22-24-00');
      expect(DateUtil.format(new Date(2024, 0, 25, 2, 32, 36), 'HH-mm-ss')).assertEqual('02-32-36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0018
     * @tc.name      testPhotosDateFormatMore0018
     * @tc.desc      Formats additional pattern MM/dd sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0018 begin');
      expect(DateUtil.format(new Date(2024, 5, 18, 17, 59, 41), 'MM/dd')).assertEqual('06/18');
      expect(DateUtil.format(new Date(2024, 9, 24, 23, 33, 15), 'MM/dd')).assertEqual('10/24');
      expect(DateUtil.format(new Date(2024, 1, 2, 3, 49, 57), 'MM/dd')).assertEqual('02/02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0019
     * @tc.name      testPhotosDateFormatMore0019
     * @tc.desc      Formats additional pattern HH:mm sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0019 begin');
      expect(DateUtil.format(new Date(2024, 6, 19, 18, 6, 54), 'HH:mm')).assertEqual('18:06');
      expect(DateUtil.format(new Date(2024, 10, 27, 0, 42, 30), 'HH:mm')).assertEqual('00:42');
      expect(DateUtil.format(new Date(2024, 2, 7, 4, 6, 18), 'HH:mm')).assertEqual('04:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0020
     * @tc.name      testPhotosDateFormatMore0020
     * @tc.desc      Formats additional pattern dd.MM HH:mm:ss sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0020 begin');
      expect(DateUtil.format(new Date(2024, 7, 20, 19, 13, 7), 'dd.MM HH:mm:ss')).assertEqual('20.08 19:13:07');
      expect(DateUtil.format(new Date(2024, 11, 2, 1, 51, 45), 'dd.MM HH:mm:ss')).assertEqual('02.12 01:51:45');
      expect(DateUtil.format(new Date(2024, 3, 12, 5, 23, 39), 'dd.MM HH:mm:ss')).assertEqual('12.04 05:23:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0021
     * @tc.name      testPhotosDateFormatMore0021
     * @tc.desc      Formats additional pattern MM/dd HH:mm sample 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0021 begin');
      expect(DateUtil.format(new Date(2024, 8, 21, 20, 20, 20), 'MM/dd HH:mm')).assertEqual('09/21 20:20');
      expect(DateUtil.format(new Date(2024, 0, 5, 2, 0, 0), 'MM/dd HH:mm')).assertEqual('01/05 02:00');
      expect(DateUtil.format(new Date(2024, 4, 17, 6, 40, 0), 'MM/dd HH:mm')).assertEqual('05/17 06:40');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0022
     * @tc.name      testPhotosDateFormatMore0022
     * @tc.desc      Formats additional pattern dd-MM HH:mm sample 22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0022 begin');
      expect(DateUtil.format(new Date(2024, 9, 22, 21, 27, 33), 'dd-MM HH:mm')).assertEqual('22-10 21:27');
      expect(DateUtil.format(new Date(2024, 1, 8, 3, 9, 15), 'dd-MM HH:mm')).assertEqual('08-02 03:09');
      expect(DateUtil.format(new Date(2024, 5, 22, 7, 57, 21), 'dd-MM HH:mm')).assertEqual('22-06 07:57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0023
     * @tc.name      testPhotosDateFormatMore0023
     * @tc.desc      Formats additional pattern HH:mm:ss sample 23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0023 begin');
      expect(DateUtil.format(new Date(2024, 10, 23, 22, 34, 46), 'HH:mm:ss')).assertEqual('22:34:46');
      expect(DateUtil.format(new Date(2024, 2, 11, 4, 18, 30), 'HH:mm:ss')).assertEqual('04:18:30');
      expect(DateUtil.format(new Date(2024, 6, 27, 8, 14, 42), 'HH:mm:ss')).assertEqual('08:14:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0024
     * @tc.name      testPhotosDateFormatMore0024
     * @tc.desc      Formats additional pattern MM.dd sample 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0024 begin');
      expect(DateUtil.format(new Date(2024, 11, 24, 23, 41, 59), 'MM.dd')).assertEqual('12.24');
      expect(DateUtil.format(new Date(2024, 3, 14, 5, 27, 45), 'MM.dd')).assertEqual('04.14');
      expect(DateUtil.format(new Date(2024, 7, 4, 9, 31, 3), 'MM.dd')).assertEqual('08.04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0025
     * @tc.name      testPhotosDateFormatMore0025
     * @tc.desc      Formats additional pattern dd/MM sample 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0025 begin');
      expect(DateUtil.format(new Date(2024, 0, 25, 0, 48, 12), 'dd/MM')).assertEqual('25/01');
      expect(DateUtil.format(new Date(2024, 4, 17, 6, 36, 0), 'dd/MM')).assertEqual('17/05');
      expect(DateUtil.format(new Date(2024, 8, 9, 10, 48, 24), 'dd/MM')).assertEqual('09/09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0026
     * @tc.name      testPhotosDateFormatMore0026
     * @tc.desc      Formats additional pattern MM-dd-HH-mm-ss sample 26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0026 begin');
      expect(DateUtil.format(new Date(2024, 1, 26, 1, 55, 25), 'MM-dd-HH-mm-ss')).assertEqual('02-26-01-55-25');
      expect(DateUtil.format(new Date(2024, 5, 20, 7, 45, 15), 'MM-dd-HH-mm-ss')).assertEqual('06-20-07-45-15');
      expect(DateUtil.format(new Date(2024, 9, 14, 11, 5, 45), 'MM-dd-HH-mm-ss')).assertEqual('10-14-11-05-45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0027
     * @tc.name      testPhotosDateFormatMore0027
     * @tc.desc      Formats additional pattern HH-mm-ss sample 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0027 begin');
      expect(DateUtil.format(new Date(2024, 2, 27, 2, 2, 38), 'HH-mm-ss')).assertEqual('02-02-38');
      expect(DateUtil.format(new Date(2024, 6, 23, 8, 54, 30), 'HH-mm-ss')).assertEqual('08-54-30');
      expect(DateUtil.format(new Date(2024, 10, 19, 12, 22, 6), 'HH-mm-ss')).assertEqual('12-22-06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0028
     * @tc.name      testPhotosDateFormatMore0028
     * @tc.desc      Formats additional pattern MM/dd sample 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0028 begin');
      expect(DateUtil.format(new Date(2024, 3, 28, 3, 9, 51), 'MM/dd')).assertEqual('04/28');
      expect(DateUtil.format(new Date(2024, 7, 26, 9, 3, 45), 'MM/dd')).assertEqual('08/26');
      expect(DateUtil.format(new Date(2024, 11, 24, 13, 39, 27), 'MM/dd')).assertEqual('12/24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0029
     * @tc.name      testPhotosDateFormatMore0029
     * @tc.desc      Formats additional pattern HH:mm sample 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0029 begin');
      expect(DateUtil.format(new Date(2024, 4, 1, 4, 16, 4), 'HH:mm')).assertEqual('04:16');
      expect(DateUtil.format(new Date(2024, 8, 1, 10, 12, 0), 'HH:mm')).assertEqual('10:12');
      expect(DateUtil.format(new Date(2024, 0, 1, 14, 56, 48), 'HH:mm')).assertEqual('14:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0030
     * @tc.name      testPhotosDateFormatMore0030
     * @tc.desc      Formats additional pattern dd.MM HH:mm:ss sample 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0030 begin');
      expect(DateUtil.format(new Date(2024, 5, 2, 5, 23, 17), 'dd.MM HH:mm:ss')).assertEqual('02.06 05:23:17');
      expect(DateUtil.format(new Date(2024, 9, 4, 11, 21, 15), 'dd.MM HH:mm:ss')).assertEqual('04.10 11:21:15');
      expect(DateUtil.format(new Date(2024, 1, 6, 15, 13, 9), 'dd.MM HH:mm:ss')).assertEqual('06.02 15:13:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0031
     * @tc.name      testPhotosDateFormatMore0031
     * @tc.desc      Formats additional pattern MM/dd HH:mm sample 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0031 begin');
      expect(DateUtil.format(new Date(2024, 6, 3, 6, 30, 30), 'MM/dd HH:mm')).assertEqual('07/03 06:30');
      expect(DateUtil.format(new Date(2024, 10, 7, 12, 30, 30), 'MM/dd HH:mm')).assertEqual('11/07 12:30');
      expect(DateUtil.format(new Date(2024, 2, 11, 16, 30, 30), 'MM/dd HH:mm')).assertEqual('03/11 16:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0032
     * @tc.name      testPhotosDateFormatMore0032
     * @tc.desc      Formats additional pattern dd-MM HH:mm sample 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0032 begin');
      expect(DateUtil.format(new Date(2024, 7, 4, 7, 37, 43), 'dd-MM HH:mm')).assertEqual('04-08 07:37');
      expect(DateUtil.format(new Date(2024, 11, 10, 13, 39, 45), 'dd-MM HH:mm')).assertEqual('10-12 13:39');
      expect(DateUtil.format(new Date(2024, 3, 16, 17, 47, 51), 'dd-MM HH:mm')).assertEqual('16-04 17:47');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0033
     * @tc.name      testPhotosDateFormatMore0033
     * @tc.desc      Formats additional pattern HH:mm:ss sample 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0033 begin');
      expect(DateUtil.format(new Date(2024, 8, 5, 8, 44, 56), 'HH:mm:ss')).assertEqual('08:44:56');
      expect(DateUtil.format(new Date(2024, 0, 13, 14, 48, 0), 'HH:mm:ss')).assertEqual('14:48:00');
      expect(DateUtil.format(new Date(2024, 4, 21, 18, 4, 12), 'HH:mm:ss')).assertEqual('18:04:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0034
     * @tc.name      testPhotosDateFormatMore0034
     * @tc.desc      Formats additional pattern MM.dd sample 34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0034 begin');
      expect(DateUtil.format(new Date(2024, 9, 6, 9, 51, 9), 'MM.dd')).assertEqual('10.06');
      expect(DateUtil.format(new Date(2024, 1, 16, 15, 57, 15), 'MM.dd')).assertEqual('02.16');
      expect(DateUtil.format(new Date(2024, 5, 26, 19, 21, 33), 'MM.dd')).assertEqual('06.26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0035
     * @tc.name      testPhotosDateFormatMore0035
     * @tc.desc      Formats additional pattern dd/MM sample 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0035 begin');
      expect(DateUtil.format(new Date(2024, 10, 7, 10, 58, 22), 'dd/MM')).assertEqual('07/11');
      expect(DateUtil.format(new Date(2024, 2, 19, 16, 6, 30), 'dd/MM')).assertEqual('19/03');
      expect(DateUtil.format(new Date(2024, 6, 3, 20, 38, 54), 'dd/MM')).assertEqual('03/07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0036
     * @tc.name      testPhotosDateFormatMore0036
     * @tc.desc      Formats additional pattern MM-dd-HH-mm-ss sample 36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0036 begin');
      expect(DateUtil.format(new Date(2024, 11, 8, 11, 5, 35), 'MM-dd-HH-mm-ss')).assertEqual('12-08-11-05-35');
      expect(DateUtil.format(new Date(2024, 3, 22, 17, 15, 45), 'MM-dd-HH-mm-ss')).assertEqual('04-22-17-15-45');
      expect(DateUtil.format(new Date(2024, 7, 8, 21, 55, 15), 'MM-dd-HH-mm-ss')).assertEqual('08-08-21-55-15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0037
     * @tc.name      testPhotosDateFormatMore0037
     * @tc.desc      Formats additional pattern HH-mm-ss sample 37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0037 begin');
      expect(DateUtil.format(new Date(2024, 0, 9, 12, 12, 48), 'HH-mm-ss')).assertEqual('12-12-48');
      expect(DateUtil.format(new Date(2024, 4, 25, 18, 24, 0), 'HH-mm-ss')).assertEqual('18-24-00');
      expect(DateUtil.format(new Date(2024, 8, 13, 22, 12, 36), 'HH-mm-ss')).assertEqual('22-12-36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0038
     * @tc.name      testPhotosDateFormatMore0038
     * @tc.desc      Formats additional pattern MM/dd sample 38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0038 begin');
      expect(DateUtil.format(new Date(2024, 1, 10, 13, 19, 1), 'MM/dd')).assertEqual('02/10');
      expect(DateUtil.format(new Date(2024, 5, 28, 19, 33, 15), 'MM/dd')).assertEqual('06/28');
      expect(DateUtil.format(new Date(2024, 9, 18, 23, 29, 57), 'MM/dd')).assertEqual('10/18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0039
     * @tc.name      testPhotosDateFormatMore0039
     * @tc.desc      Formats additional pattern HH:mm sample 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0039 begin');
      expect(DateUtil.format(new Date(2024, 2, 11, 14, 26, 14), 'HH:mm')).assertEqual('14:26');
      expect(DateUtil.format(new Date(2024, 6, 3, 20, 42, 30), 'HH:mm')).assertEqual('20:42');
      expect(DateUtil.format(new Date(2024, 10, 23, 0, 46, 18), 'HH:mm')).assertEqual('00:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0040
     * @tc.name      testPhotosDateFormatMore0040
     * @tc.desc      Formats additional pattern dd.MM HH:mm:ss sample 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0040 begin');
      expect(DateUtil.format(new Date(2024, 3, 12, 15, 33, 27), 'dd.MM HH:mm:ss')).assertEqual('12.04 15:33:27');
      expect(DateUtil.format(new Date(2024, 7, 6, 21, 51, 45), 'dd.MM HH:mm:ss')).assertEqual('06.08 21:51:45');
      expect(DateUtil.format(new Date(2024, 11, 28, 1, 3, 39), 'dd.MM HH:mm:ss')).assertEqual('28.12 01:03:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0041
     * @tc.name      testPhotosDateFormatMore0041
     * @tc.desc      Formats additional pattern MM/dd HH:mm sample 41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0041 begin');
      expect(DateUtil.format(new Date(2024, 4, 13, 16, 40, 40), 'MM/dd HH:mm')).assertEqual('05/13 16:40');
      expect(DateUtil.format(new Date(2024, 8, 9, 22, 0, 0), 'MM/dd HH:mm')).assertEqual('09/09 22:00');
      expect(DateUtil.format(new Date(2024, 0, 5, 2, 20, 0), 'MM/dd HH:mm')).assertEqual('01/05 02:20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0042
     * @tc.name      testPhotosDateFormatMore0042
     * @tc.desc      Formats additional pattern dd-MM HH:mm sample 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0042 begin');
      expect(DateUtil.format(new Date(2024, 5, 14, 17, 47, 53), 'dd-MM HH:mm')).assertEqual('14-06 17:47');
      expect(DateUtil.format(new Date(2024, 9, 12, 23, 9, 15), 'dd-MM HH:mm')).assertEqual('12-10 23:09');
      expect(DateUtil.format(new Date(2024, 1, 10, 3, 37, 21), 'dd-MM HH:mm')).assertEqual('10-02 03:37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0043
     * @tc.name      testPhotosDateFormatMore0043
     * @tc.desc      Formats additional pattern HH:mm:ss sample 43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0043 begin');
      expect(DateUtil.format(new Date(2024, 6, 15, 18, 54, 6), 'HH:mm:ss')).assertEqual('18:54:06');
      expect(DateUtil.format(new Date(2024, 10, 15, 0, 18, 30), 'HH:mm:ss')).assertEqual('00:18:30');
      expect(DateUtil.format(new Date(2024, 2, 15, 4, 54, 42), 'HH:mm:ss')).assertEqual('04:54:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0044
     * @tc.name      testPhotosDateFormatMore0044
     * @tc.desc      Formats additional pattern MM.dd sample 44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0044 begin');
      expect(DateUtil.format(new Date(2024, 7, 16, 19, 1, 19), 'MM.dd')).assertEqual('08.16');
      expect(DateUtil.format(new Date(2024, 11, 18, 1, 27, 45), 'MM.dd')).assertEqual('12.18');
      expect(DateUtil.format(new Date(2024, 3, 20, 5, 11, 3), 'MM.dd')).assertEqual('04.20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0045
     * @tc.name      testPhotosDateFormatMore0045
     * @tc.desc      Formats additional pattern dd/MM sample 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0045 begin');
      expect(DateUtil.format(new Date(2024, 8, 17, 20, 8, 32), 'dd/MM')).assertEqual('17/09');
      expect(DateUtil.format(new Date(2024, 0, 21, 2, 36, 0), 'dd/MM')).assertEqual('21/01');
      expect(DateUtil.format(new Date(2024, 4, 25, 6, 28, 24), 'dd/MM')).assertEqual('25/05');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0046
     * @tc.name      testPhotosDateFormatMore0046
     * @tc.desc      Formats additional pattern MM-dd-HH-mm-ss sample 46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0046 begin');
      expect(DateUtil.format(new Date(2024, 9, 18, 21, 15, 45), 'MM-dd-HH-mm-ss')).assertEqual('10-18-21-15-45');
      expect(DateUtil.format(new Date(2024, 1, 24, 3, 45, 15), 'MM-dd-HH-mm-ss')).assertEqual('02-24-03-45-15');
      expect(DateUtil.format(new Date(2024, 5, 2, 7, 45, 45), 'MM-dd-HH-mm-ss')).assertEqual('06-02-07-45-45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0047
     * @tc.name      testPhotosDateFormatMore0047
     * @tc.desc      Formats additional pattern HH-mm-ss sample 47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0047 begin');
      expect(DateUtil.format(new Date(2024, 10, 19, 22, 22, 58), 'HH-mm-ss')).assertEqual('22-22-58');
      expect(DateUtil.format(new Date(2024, 2, 27, 4, 54, 30), 'HH-mm-ss')).assertEqual('04-54-30');
      expect(DateUtil.format(new Date(2024, 6, 7, 8, 2, 6), 'HH-mm-ss')).assertEqual('08-02-06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0048
     * @tc.name      testPhotosDateFormatMore0048
     * @tc.desc      Formats additional pattern MM/dd sample 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0048 begin');
      expect(DateUtil.format(new Date(2024, 11, 20, 23, 29, 11), 'MM/dd')).assertEqual('12/20');
      expect(DateUtil.format(new Date(2024, 3, 2, 5, 3, 45), 'MM/dd')).assertEqual('04/02');
      expect(DateUtil.format(new Date(2024, 7, 12, 9, 19, 27), 'MM/dd')).assertEqual('08/12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0049
     * @tc.name      testPhotosDateFormatMore0049
     * @tc.desc      Formats additional pattern HH:mm sample 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0049 begin');
      expect(DateUtil.format(new Date(2024, 0, 21, 0, 36, 24), 'HH:mm')).assertEqual('00:36');
      expect(DateUtil.format(new Date(2024, 4, 5, 6, 12, 0), 'HH:mm')).assertEqual('06:12');
      expect(DateUtil.format(new Date(2024, 8, 17, 10, 36, 48), 'HH:mm')).assertEqual('10:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0050
     * @tc.name      testPhotosDateFormatMore0050
     * @tc.desc      Formats additional pattern dd.MM HH:mm:ss sample 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0050 begin');
      expect(DateUtil.format(new Date(2024, 1, 22, 1, 43, 37), 'dd.MM HH:mm:ss')).assertEqual('22.02 01:43:37');
      expect(DateUtil.format(new Date(2024, 5, 8, 7, 21, 15), 'dd.MM HH:mm:ss')).assertEqual('08.06 07:21:15');
      expect(DateUtil.format(new Date(2024, 9, 22, 11, 53, 9), 'dd.MM HH:mm:ss')).assertEqual('22.10 11:53:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0051
     * @tc.name      testPhotosDateFormatMore0051
     * @tc.desc      Formats additional pattern MM/dd HH:mm sample 51.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0051 begin');
      expect(DateUtil.format(new Date(2024, 2, 23, 2, 50, 50), 'MM/dd HH:mm')).assertEqual('03/23 02:50');
      expect(DateUtil.format(new Date(2024, 6, 11, 8, 30, 30), 'MM/dd HH:mm')).assertEqual('07/11 08:30');
      expect(DateUtil.format(new Date(2024, 10, 27, 12, 10, 30), 'MM/dd HH:mm')).assertEqual('11/27 12:10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0052
     * @tc.name      testPhotosDateFormatMore0052
     * @tc.desc      Formats additional pattern dd-MM HH:mm sample 52.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0052 begin');
      expect(DateUtil.format(new Date(2024, 3, 24, 3, 57, 3), 'dd-MM HH:mm')).assertEqual('24-04 03:57');
      expect(DateUtil.format(new Date(2024, 7, 14, 9, 39, 45), 'dd-MM HH:mm')).assertEqual('14-08 09:39');
      expect(DateUtil.format(new Date(2024, 11, 4, 13, 27, 51), 'dd-MM HH:mm')).assertEqual('04-12 13:27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0053
     * @tc.name      testPhotosDateFormatMore0053
     * @tc.desc      Formats additional pattern HH:mm:ss sample 53.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0053 begin');
      expect(DateUtil.format(new Date(2024, 4, 25, 4, 4, 16), 'HH:mm:ss')).assertEqual('04:04:16');
      expect(DateUtil.format(new Date(2024, 8, 17, 10, 48, 0), 'HH:mm:ss')).assertEqual('10:48:00');
      expect(DateUtil.format(new Date(2024, 0, 9, 14, 44, 12), 'HH:mm:ss')).assertEqual('14:44:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0054
     * @tc.name      testPhotosDateFormatMore0054
     * @tc.desc      Formats additional pattern MM.dd sample 54.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0054 begin');
      expect(DateUtil.format(new Date(2024, 5, 26, 5, 11, 29), 'MM.dd')).assertEqual('06.26');
      expect(DateUtil.format(new Date(2024, 9, 20, 11, 57, 15), 'MM.dd')).assertEqual('10.20');
      expect(DateUtil.format(new Date(2024, 1, 14, 15, 1, 33), 'MM.dd')).assertEqual('02.14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0055
     * @tc.name      testPhotosDateFormatMore0055
     * @tc.desc      Formats additional pattern dd/MM sample 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0055 begin');
      expect(DateUtil.format(new Date(2024, 6, 27, 6, 18, 42), 'dd/MM')).assertEqual('27/07');
      expect(DateUtil.format(new Date(2024, 10, 23, 12, 6, 30), 'dd/MM')).assertEqual('23/11');
      expect(DateUtil.format(new Date(2024, 2, 19, 16, 18, 54), 'dd/MM')).assertEqual('19/03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0056
     * @tc.name      testPhotosDateFormatMore0056
     * @tc.desc      Formats additional pattern MM-dd-HH-mm-ss sample 56.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0056 begin');
      expect(DateUtil.format(new Date(2024, 7, 28, 7, 25, 55), 'MM-dd-HH-mm-ss')).assertEqual('08-28-07-25-55');
      expect(DateUtil.format(new Date(2024, 11, 26, 13, 15, 45), 'MM-dd-HH-mm-ss')).assertEqual('12-26-13-15-45');
      expect(DateUtil.format(new Date(2024, 3, 24, 17, 35, 15), 'MM-dd-HH-mm-ss')).assertEqual('04-24-17-35-15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0057
     * @tc.name      testPhotosDateFormatMore0057
     * @tc.desc      Formats additional pattern HH-mm-ss sample 57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0057 begin');
      expect(DateUtil.format(new Date(2024, 8, 1, 8, 32, 8), 'HH-mm-ss')).assertEqual('08-32-08');
      expect(DateUtil.format(new Date(2024, 0, 1, 14, 24, 0), 'HH-mm-ss')).assertEqual('14-24-00');
      expect(DateUtil.format(new Date(2024, 4, 1, 18, 52, 36), 'HH-mm-ss')).assertEqual('18-52-36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0058
     * @tc.name      testPhotosDateFormatMore0058
     * @tc.desc      Formats additional pattern MM/dd sample 58.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0058 begin');
      expect(DateUtil.format(new Date(2024, 9, 2, 9, 39, 21), 'MM/dd')).assertEqual('10/02');
      expect(DateUtil.format(new Date(2024, 1, 4, 15, 33, 15), 'MM/dd')).assertEqual('02/04');
      expect(DateUtil.format(new Date(2024, 5, 6, 19, 9, 57), 'MM/dd')).assertEqual('06/06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0059
     * @tc.name      testPhotosDateFormatMore0059
     * @tc.desc      Formats additional pattern HH:mm sample 59.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0059 begin');
      expect(DateUtil.format(new Date(2024, 10, 3, 10, 46, 34), 'HH:mm')).assertEqual('10:46');
      expect(DateUtil.format(new Date(2024, 2, 7, 16, 42, 30), 'HH:mm')).assertEqual('16:42');
      expect(DateUtil.format(new Date(2024, 6, 11, 20, 26, 18), 'HH:mm')).assertEqual('20:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0060
     * @tc.name      testPhotosDateFormatMore0060
     * @tc.desc      Formats additional pattern dd.MM HH:mm:ss sample 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0060 begin');
      expect(DateUtil.format(new Date(2024, 11, 4, 11, 53, 47), 'dd.MM HH:mm:ss')).assertEqual('04.12 11:53:47');
      expect(DateUtil.format(new Date(2024, 3, 10, 17, 51, 45), 'dd.MM HH:mm:ss')).assertEqual('10.04 17:51:45');
      expect(DateUtil.format(new Date(2024, 7, 16, 21, 43, 39), 'dd.MM HH:mm:ss')).assertEqual('16.08 21:43:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0061
     * @tc.name      testPhotosDateFormatMore0061
     * @tc.desc      Formats additional pattern MM/dd HH:mm sample 61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0061 begin');
      expect(DateUtil.format(new Date(2024, 0, 5, 12, 0, 0), 'MM/dd HH:mm')).assertEqual('01/05 12:00');
      expect(DateUtil.format(new Date(2024, 4, 13, 18, 0, 0), 'MM/dd HH:mm')).assertEqual('05/13 18:00');
      expect(DateUtil.format(new Date(2024, 8, 21, 22, 0, 0), 'MM/dd HH:mm')).assertEqual('09/21 22:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0062
     * @tc.name      testPhotosDateFormatMore0062
     * @tc.desc      Formats additional pattern dd-MM HH:mm sample 62.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0062 begin');
      expect(DateUtil.format(new Date(2024, 1, 6, 13, 7, 13), 'dd-MM HH:mm')).assertEqual('06-02 13:07');
      expect(DateUtil.format(new Date(2024, 5, 16, 19, 9, 15), 'dd-MM HH:mm')).assertEqual('16-06 19:09');
      expect(DateUtil.format(new Date(2024, 9, 26, 23, 17, 21), 'dd-MM HH:mm')).assertEqual('26-10 23:17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0063
     * @tc.name      testPhotosDateFormatMore0063
     * @tc.desc      Formats additional pattern HH:mm:ss sample 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0063 begin');
      expect(DateUtil.format(new Date(2024, 2, 7, 14, 14, 26), 'HH:mm:ss')).assertEqual('14:14:26');
      expect(DateUtil.format(new Date(2024, 6, 19, 20, 18, 30), 'HH:mm:ss')).assertEqual('20:18:30');
      expect(DateUtil.format(new Date(2024, 10, 3, 0, 34, 42), 'HH:mm:ss')).assertEqual('00:34:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0064
     * @tc.name      testPhotosDateFormatMore0064
     * @tc.desc      Formats additional pattern MM.dd sample 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0064 begin');
      expect(DateUtil.format(new Date(2024, 3, 8, 15, 21, 39), 'MM.dd')).assertEqual('04.08');
      expect(DateUtil.format(new Date(2024, 7, 22, 21, 27, 45), 'MM.dd')).assertEqual('08.22');
      expect(DateUtil.format(new Date(2024, 11, 8, 1, 51, 3), 'MM.dd')).assertEqual('12.08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0065
     * @tc.name      testPhotosDateFormatMore0065
     * @tc.desc      Formats additional pattern dd/MM sample 65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0065 begin');
      expect(DateUtil.format(new Date(2024, 4, 9, 16, 28, 52), 'dd/MM')).assertEqual('09/05');
      expect(DateUtil.format(new Date(2024, 8, 25, 22, 36, 0), 'dd/MM')).assertEqual('25/09');
      expect(DateUtil.format(new Date(2024, 0, 13, 2, 8, 24), 'dd/MM')).assertEqual('13/01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0066
     * @tc.name      testPhotosDateFormatMore0066
     * @tc.desc      Formats additional pattern MM-dd-HH-mm-ss sample 66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0066 begin');
      expect(DateUtil.format(new Date(2024, 5, 10, 17, 35, 5), 'MM-dd-HH-mm-ss')).assertEqual('06-10-17-35-05');
      expect(DateUtil.format(new Date(2024, 9, 28, 23, 45, 15), 'MM-dd-HH-mm-ss')).assertEqual('10-28-23-45-15');
      expect(DateUtil.format(new Date(2024, 1, 18, 3, 25, 45), 'MM-dd-HH-mm-ss')).assertEqual('02-18-03-25-45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0067
     * @tc.name      testPhotosDateFormatMore0067
     * @tc.desc      Formats additional pattern HH-mm-ss sample 67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0067 begin');
      expect(DateUtil.format(new Date(2024, 6, 11, 18, 42, 18), 'HH-mm-ss')).assertEqual('18-42-18');
      expect(DateUtil.format(new Date(2024, 10, 3, 0, 54, 30), 'HH-mm-ss')).assertEqual('00-54-30');
      expect(DateUtil.format(new Date(2024, 2, 23, 4, 42, 6), 'HH-mm-ss')).assertEqual('04-42-06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0068
     * @tc.name      testPhotosDateFormatMore0068
     * @tc.desc      Formats additional pattern MM/dd sample 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0068 begin');
      expect(DateUtil.format(new Date(2024, 7, 12, 19, 49, 31), 'MM/dd')).assertEqual('08/12');
      expect(DateUtil.format(new Date(2024, 11, 6, 1, 3, 45), 'MM/dd')).assertEqual('12/06');
      expect(DateUtil.format(new Date(2024, 3, 28, 5, 59, 27), 'MM/dd')).assertEqual('04/28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0069
     * @tc.name      testPhotosDateFormatMore0069
     * @tc.desc      Formats additional pattern HH:mm sample 69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0069 begin');
      expect(DateUtil.format(new Date(2024, 8, 13, 20, 56, 44), 'HH:mm')).assertEqual('20:56');
      expect(DateUtil.format(new Date(2024, 0, 9, 2, 12, 0), 'HH:mm')).assertEqual('02:12');
      expect(DateUtil.format(new Date(2024, 4, 5, 6, 16, 48), 'HH:mm')).assertEqual('06:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0070
     * @tc.name      testPhotosDateFormatMore0070
     * @tc.desc      Formats additional pattern dd.MM HH:mm:ss sample 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0070 begin');
      expect(DateUtil.format(new Date(2024, 9, 14, 21, 3, 57), 'dd.MM HH:mm:ss')).assertEqual('14.10 21:03:57');
      expect(DateUtil.format(new Date(2024, 1, 12, 3, 21, 15), 'dd.MM HH:mm:ss')).assertEqual('12.02 03:21:15');
      expect(DateUtil.format(new Date(2024, 5, 10, 7, 33, 9), 'dd.MM HH:mm:ss')).assertEqual('10.06 07:33:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0071
     * @tc.name      testPhotosDateFormatMore0071
     * @tc.desc      Formats additional pattern MM/dd HH:mm sample 71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0071 begin');
      expect(DateUtil.format(new Date(2024, 10, 15, 22, 10, 10), 'MM/dd HH:mm')).assertEqual('11/15 22:10');
      expect(DateUtil.format(new Date(2024, 2, 15, 4, 30, 30), 'MM/dd HH:mm')).assertEqual('03/15 04:30');
      expect(DateUtil.format(new Date(2024, 6, 15, 8, 50, 30), 'MM/dd HH:mm')).assertEqual('07/15 08:50');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0072
     * @tc.name      testPhotosDateFormatMore0072
     * @tc.desc      Formats additional pattern dd-MM HH:mm sample 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0072 begin');
      expect(DateUtil.format(new Date(2024, 11, 16, 23, 17, 23), 'dd-MM HH:mm')).assertEqual('16-12 23:17');
      expect(DateUtil.format(new Date(2024, 3, 18, 5, 39, 45), 'dd-MM HH:mm')).assertEqual('18-04 05:39');
      expect(DateUtil.format(new Date(2024, 7, 20, 9, 7, 51), 'dd-MM HH:mm')).assertEqual('20-08 09:07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0073
     * @tc.name      testPhotosDateFormatMore0073
     * @tc.desc      Formats additional pattern HH:mm:ss sample 73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0073 begin');
      expect(DateUtil.format(new Date(2024, 0, 17, 0, 24, 36), 'HH:mm:ss')).assertEqual('00:24:36');
      expect(DateUtil.format(new Date(2024, 4, 21, 6, 48, 0), 'HH:mm:ss')).assertEqual('06:48:00');
      expect(DateUtil.format(new Date(2024, 8, 25, 10, 24, 12), 'HH:mm:ss')).assertEqual('10:24:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0074
     * @tc.name      testPhotosDateFormatMore0074
     * @tc.desc      Formats additional pattern MM.dd sample 74.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0074 begin');
      expect(DateUtil.format(new Date(2024, 1, 18, 1, 31, 49), 'MM.dd')).assertEqual('02.18');
      expect(DateUtil.format(new Date(2024, 5, 24, 7, 57, 15), 'MM.dd')).assertEqual('06.24');
      expect(DateUtil.format(new Date(2024, 9, 2, 11, 41, 33), 'MM.dd')).assertEqual('10.02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0075
     * @tc.name      testPhotosDateFormatMore0075
     * @tc.desc      Formats additional pattern dd/MM sample 75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0075 begin');
      expect(DateUtil.format(new Date(2024, 2, 19, 2, 38, 2), 'dd/MM')).assertEqual('19/03');
      expect(DateUtil.format(new Date(2024, 6, 27, 8, 6, 30), 'dd/MM')).assertEqual('27/07');
      expect(DateUtil.format(new Date(2024, 10, 7, 12, 58, 54), 'dd/MM')).assertEqual('07/11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0076
     * @tc.name      testPhotosDateFormatMore0076
     * @tc.desc      Formats additional pattern MM-dd-HH-mm-ss sample 76.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0076 begin');
      expect(DateUtil.format(new Date(2024, 3, 20, 3, 45, 15), 'MM-dd-HH-mm-ss')).assertEqual('04-20-03-45-15');
      expect(DateUtil.format(new Date(2024, 7, 2, 9, 15, 45), 'MM-dd-HH-mm-ss')).assertEqual('08-02-09-15-45');
      expect(DateUtil.format(new Date(2024, 11, 12, 13, 15, 15), 'MM-dd-HH-mm-ss')).assertEqual('12-12-13-15-15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0077
     * @tc.name      testPhotosDateFormatMore0077
     * @tc.desc      Formats additional pattern HH-mm-ss sample 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0077 begin');
      expect(DateUtil.format(new Date(2024, 4, 21, 4, 52, 28), 'HH-mm-ss')).assertEqual('04-52-28');
      expect(DateUtil.format(new Date(2024, 8, 5, 10, 24, 0), 'HH-mm-ss')).assertEqual('10-24-00');
      expect(DateUtil.format(new Date(2024, 0, 17, 14, 32, 36), 'HH-mm-ss')).assertEqual('14-32-36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_MORE_0078
     * @tc.name      testPhotosDateFormatMore0078
     * @tc.desc      Formats additional pattern MM/dd sample 78.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMore0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0078 begin');
      expect(DateUtil.format(new Date(2024, 5, 22, 5, 59, 41), 'MM/dd')).assertEqual('06/22');
      expect(DateUtil.format(new Date(2024, 9, 8, 11, 33, 15), 'MM/dd')).assertEqual('10/08');
      expect(DateUtil.format(new Date(2024, 1, 22, 15, 49, 57), 'MM/dd')).assertEqual('02/22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMore0078 end');
    })
