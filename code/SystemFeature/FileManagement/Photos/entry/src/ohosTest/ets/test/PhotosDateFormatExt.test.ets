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

const TAG = '[Sample_PhotosDateFormatExtTest]';
const DOMAIN = 0xF811;

export default function PhotosDateFormatExtTest(): void {
  describe('PhotosDateFormatExtTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0001
     * @tc.name      testPhotosDateFormatExt0001
     * @tc.desc      Formats extended date sample 1 with pattern MM.dd. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0001 begin');
      expect(DateUtil.format(new Date(2024, 0, 1, 0, 0, 0), 'MM.dd')).assertEqual('01.01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0002
     * @tc.name      testPhotosDateFormatExt0002
     * @tc.desc      Formats extended date sample 1 with pattern MM.dd. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0002 begin');
      expect(DateUtil.format(new Date(2024, 5, 1, 7, 0, 0), 'MM.dd')).assertEqual('06.01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0003
     * @tc.name      testPhotosDateFormatExt0003
     * @tc.desc      Formats extended date sample 1 with pattern MM.dd. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0003 begin');
      expect(DateUtil.format(new Date(2024, 9, 1, 13, 0, 0), 'MM.dd')).assertEqual('10.01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0003 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0004
     * @tc.name      testPhotosDateFormatExt0004
     * @tc.desc      Formats extended date sample 2 with pattern HH-mm. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0004 begin');
      expect(DateUtil.format(new Date(2024, 1, 2, 1, 7, 13), 'HH-mm')).assertEqual('01-07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0005
     * @tc.name      testPhotosDateFormatExt0005
     * @tc.desc      Formats extended date sample 2 with pattern HH-mm. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0005 begin');
      expect(DateUtil.format(new Date(2024, 6, 4, 8, 11, 17), 'HH-mm')).assertEqual('08-11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0006
     * @tc.name      testPhotosDateFormatExt0006
     * @tc.desc      Formats extended date sample 2 with pattern HH-mm. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0006 begin');
      expect(DateUtil.format(new Date(2024, 10, 8, 14, 19, 23), 'HH-mm')).assertEqual('14-19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0006 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0007
     * @tc.name      testPhotosDateFormatExt0007
     * @tc.desc      Formats extended date sample 3 with pattern MM/dd HH:mm. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0007 begin');
      expect(DateUtil.format(new Date(2024, 2, 3, 2, 14, 26), 'MM/dd HH:mm')).assertEqual('03/03 02:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0008
     * @tc.name      testPhotosDateFormatExt0008
     * @tc.desc      Formats extended date sample 3 with pattern MM/dd HH:mm. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0008 begin');
      expect(DateUtil.format(new Date(2024, 7, 7, 9, 22, 34), 'MM/dd HH:mm')).assertEqual('08/07 09:22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0009
     * @tc.name      testPhotosDateFormatExt0009
     * @tc.desc      Formats extended date sample 3 with pattern MM/dd HH:mm. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0009 begin');
      expect(DateUtil.format(new Date(2024, 11, 15, 15, 38, 46), 'MM/dd HH:mm')).assertEqual('12/15 15:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0009 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0010
     * @tc.name      testPhotosDateFormatExt0010
     * @tc.desc      Formats extended date sample 4 with pattern dd/MM HH:mm:ss. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0010 begin');
      expect(DateUtil.format(new Date(2024, 3, 4, 3, 21, 39), 'dd/MM HH:mm:ss')).assertEqual('04/04 03:21:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0011
     * @tc.name      testPhotosDateFormatExt0011
     * @tc.desc      Formats extended date sample 4 with pattern dd/MM HH:mm:ss. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0011 begin');
      expect(DateUtil.format(new Date(2024, 8, 10, 10, 33, 51), 'dd/MM HH:mm:ss')).assertEqual('10/09 10:33:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0012
     * @tc.name      testPhotosDateFormatExt0012
     * @tc.desc      Formats extended date sample 4 with pattern dd/MM HH:mm:ss. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0012 begin');
      expect(DateUtil.format(new Date(2024, 0, 22, 16, 57, 9), 'dd/MM HH:mm:ss')).assertEqual('22/01 16:57:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0012 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0013
     * @tc.name      testPhotosDateFormatExt0013
     * @tc.desc      Formats extended date sample 5 with pattern MM-dd-HH-mm-ss. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0013 begin');
      expect(DateUtil.format(new Date(2024, 4, 5, 4, 28, 52), 'MM-dd-HH-mm-ss')).assertEqual('05-05-04-28-52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0014
     * @tc.name      testPhotosDateFormatExt0014
     * @tc.desc      Formats extended date sample 5 with pattern MM-dd-HH-mm-ss. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0014 begin');
      expect(DateUtil.format(new Date(2024, 9, 13, 11, 44, 8), 'MM-dd-HH-mm-ss')).assertEqual('10-13-11-44-08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0015
     * @tc.name      testPhotosDateFormatExt0015
     * @tc.desc      Formats extended date sample 5 with pattern MM-dd-HH-mm-ss. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0015 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 17, 16, 32), 'MM-dd-HH-mm-ss')).assertEqual('02-01-17-16-32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0016
     * @tc.name      testPhotosDateFormatExt0016
     * @tc.desc      Formats extended date sample 6 with pattern MM.dd. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0016 begin');
      expect(DateUtil.format(new Date(2024, 5, 6, 5, 35, 5), 'MM.dd')).assertEqual('06.06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0017
     * @tc.name      testPhotosDateFormatExt0017
     * @tc.desc      Formats extended date sample 6 with pattern MM.dd. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0017 begin');
      expect(DateUtil.format(new Date(2024, 10, 16, 12, 55, 25), 'MM.dd')).assertEqual('11.16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0018
     * @tc.name      testPhotosDateFormatExt0018
     * @tc.desc      Formats extended date sample 6 with pattern MM.dd. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0018 begin');
      expect(DateUtil.format(new Date(2024, 2, 8, 18, 35, 55), 'MM.dd')).assertEqual('03.08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0018 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0019
     * @tc.name      testPhotosDateFormatExt0019
     * @tc.desc      Formats extended date sample 7 with pattern HH-mm. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0019 begin');
      expect(DateUtil.format(new Date(2024, 6, 7, 6, 42, 18), 'HH-mm')).assertEqual('06-42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0020
     * @tc.name      testPhotosDateFormatExt0020
     * @tc.desc      Formats extended date sample 7 with pattern HH-mm. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0020 begin');
      expect(DateUtil.format(new Date(2024, 11, 19, 13, 6, 42), 'HH-mm')).assertEqual('13-06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0021
     * @tc.name      testPhotosDateFormatExt0021
     * @tc.desc      Formats extended date sample 7 with pattern HH-mm. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0021 begin');
      expect(DateUtil.format(new Date(2024, 3, 15, 19, 54, 18), 'HH-mm')).assertEqual('19-54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0021 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0022
     * @tc.name      testPhotosDateFormatExt0022
     * @tc.desc      Formats extended date sample 8 with pattern MM/dd HH:mm. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0022 begin');
      expect(DateUtil.format(new Date(2024, 7, 8, 7, 49, 31), 'MM/dd HH:mm')).assertEqual('08/08 07:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0023
     * @tc.name      testPhotosDateFormatExt0023
     * @tc.desc      Formats extended date sample 8 with pattern MM/dd HH:mm. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0023 begin');
      expect(DateUtil.format(new Date(2024, 0, 22, 14, 17, 59), 'MM/dd HH:mm')).assertEqual('01/22 14:17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0024
     * @tc.name      testPhotosDateFormatExt0024
     * @tc.desc      Formats extended date sample 8 with pattern MM/dd HH:mm. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0024 begin');
      expect(DateUtil.format(new Date(2024, 4, 22, 20, 13, 41), 'MM/dd HH:mm')).assertEqual('05/22 20:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0024 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0025
     * @tc.name      testPhotosDateFormatExt0025
     * @tc.desc      Formats extended date sample 9 with pattern dd/MM HH:mm:ss. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0025 begin');
      expect(DateUtil.format(new Date(2024, 8, 9, 8, 56, 44), 'dd/MM HH:mm:ss')).assertEqual('09/09 08:56:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0026
     * @tc.name      testPhotosDateFormatExt0026
     * @tc.desc      Formats extended date sample 9 with pattern dd/MM HH:mm:ss. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0026 begin');
      expect(DateUtil.format(new Date(2024, 1, 25, 15, 28, 16), 'dd/MM HH:mm:ss')).assertEqual('25/02 15:28:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0027
     * @tc.name      testPhotosDateFormatExt0027
     * @tc.desc      Formats extended date sample 9 with pattern dd/MM HH:mm:ss. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0027 begin');
      expect(DateUtil.format(new Date(2024, 5, 1, 21, 32, 4), 'dd/MM HH:mm:ss')).assertEqual('01/06 21:32:04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0027 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0028
     * @tc.name      testPhotosDateFormatExt0028
     * @tc.desc      Formats extended date sample 10 with pattern MM-dd-HH-mm-ss. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0028 begin');
      expect(DateUtil.format(new Date(2024, 9, 10, 9, 3, 57), 'MM-dd-HH-mm-ss')).assertEqual('10-10-09-03-57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0029
     * @tc.name      testPhotosDateFormatExt0029
     * @tc.desc      Formats extended date sample 10 with pattern MM-dd-HH-mm-ss. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0029 begin');
      expect(DateUtil.format(new Date(2024, 2, 28, 16, 39, 33), 'MM-dd-HH-mm-ss')).assertEqual('03-28-16-39-33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0030
     * @tc.name      testPhotosDateFormatExt0030
     * @tc.desc      Formats extended date sample 10 with pattern MM-dd-HH-mm-ss. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0030 begin');
      expect(DateUtil.format(new Date(2024, 6, 8, 22, 51, 27), 'MM-dd-HH-mm-ss')).assertEqual('07-08-22-51-27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0031
     * @tc.name      testPhotosDateFormatExt0031
     * @tc.desc      Formats extended date sample 11 with pattern MM.dd. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0031 begin');
      expect(DateUtil.format(new Date(2024, 10, 11, 10, 10, 10), 'MM.dd')).assertEqual('11.11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0032
     * @tc.name      testPhotosDateFormatExt0032
     * @tc.desc      Formats extended date sample 11 with pattern MM.dd. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0032 begin');
      expect(DateUtil.format(new Date(2024, 3, 3, 17, 50, 50), 'MM.dd')).assertEqual('04.03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0033
     * @tc.name      testPhotosDateFormatExt0033
     * @tc.desc      Formats extended date sample 11 with pattern MM.dd. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0033 begin');
      expect(DateUtil.format(new Date(2024, 7, 15, 23, 10, 50), 'MM.dd')).assertEqual('08.15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0033 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0034
     * @tc.name      testPhotosDateFormatExt0034
     * @tc.desc      Formats extended date sample 12 with pattern HH-mm. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0034 begin');
      expect(DateUtil.format(new Date(2024, 11, 12, 11, 17, 23), 'HH-mm')).assertEqual('11-17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0035
     * @tc.name      testPhotosDateFormatExt0035
     * @tc.desc      Formats extended date sample 12 with pattern HH-mm. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0035 begin');
      expect(DateUtil.format(new Date(2024, 4, 6, 18, 1, 7), 'HH-mm')).assertEqual('18-01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0036
     * @tc.name      testPhotosDateFormatExt0036
     * @tc.desc      Formats extended date sample 12 with pattern HH-mm. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0036 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 0, 29, 13), 'HH-mm')).assertEqual('00-29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0036 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0037
     * @tc.name      testPhotosDateFormatExt0037
     * @tc.desc      Formats extended date sample 13 with pattern MM/dd HH:mm. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0037 begin');
      expect(DateUtil.format(new Date(2024, 0, 13, 12, 24, 36), 'MM/dd HH:mm')).assertEqual('01/13 12:24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0038
     * @tc.name      testPhotosDateFormatExt0038
     * @tc.desc      Formats extended date sample 13 with pattern MM/dd HH:mm. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0038 begin');
      expect(DateUtil.format(new Date(2024, 5, 9, 19, 12, 24), 'MM/dd HH:mm')).assertEqual('06/09 19:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0039
     * @tc.name      testPhotosDateFormatExt0039
     * @tc.desc      Formats extended date sample 13 with pattern MM/dd HH:mm. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0039 begin');
      expect(DateUtil.format(new Date(2024, 9, 1, 1, 48, 36), 'MM/dd HH:mm')).assertEqual('10/01 01:48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0039 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0040
     * @tc.name      testPhotosDateFormatExt0040
     * @tc.desc      Formats extended date sample 14 with pattern dd/MM HH:mm:ss. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0040 begin');
      expect(DateUtil.format(new Date(2024, 1, 14, 13, 31, 49), 'dd/MM HH:mm:ss')).assertEqual('14/02 13:31:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0041
     * @tc.name      testPhotosDateFormatExt0041
     * @tc.desc      Formats extended date sample 14 with pattern dd/MM HH:mm:ss. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0041 begin');
      expect(DateUtil.format(new Date(2024, 6, 12, 20, 23, 41), 'dd/MM HH:mm:ss')).assertEqual('12/07 20:23:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0042
     * @tc.name      testPhotosDateFormatExt0042
     * @tc.desc      Formats extended date sample 14 with pattern dd/MM HH:mm:ss. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0042 begin');
      expect(DateUtil.format(new Date(2024, 10, 8, 2, 7, 59), 'dd/MM HH:mm:ss')).assertEqual('08/11 02:07:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0042 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0043
     * @tc.name      testPhotosDateFormatExt0043
     * @tc.desc      Formats extended date sample 15 with pattern MM-dd-HH-mm-ss. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0043 begin');
      expect(DateUtil.format(new Date(2024, 2, 15, 14, 38, 2), 'MM-dd-HH-mm-ss')).assertEqual('03-15-14-38-02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0044
     * @tc.name      testPhotosDateFormatExt0044
     * @tc.desc      Formats extended date sample 15 with pattern MM-dd-HH-mm-ss. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0044 begin');
      expect(DateUtil.format(new Date(2024, 7, 15, 21, 34, 58), 'MM-dd-HH-mm-ss')).assertEqual('08-15-21-34-58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0045
     * @tc.name      testPhotosDateFormatExt0045
     * @tc.desc      Formats extended date sample 15 with pattern MM-dd-HH-mm-ss. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0045 begin');
      expect(DateUtil.format(new Date(2024, 11, 15, 3, 26, 22), 'MM-dd-HH-mm-ss')).assertEqual('12-15-03-26-22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0046
     * @tc.name      testPhotosDateFormatExt0046
     * @tc.desc      Formats extended date sample 16 with pattern MM.dd. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0046 begin');
      expect(DateUtil.format(new Date(2024, 3, 16, 15, 45, 15), 'MM.dd')).assertEqual('04.16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0047
     * @tc.name      testPhotosDateFormatExt0047
     * @tc.desc      Formats extended date sample 16 with pattern MM.dd. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0047 begin');
      expect(DateUtil.format(new Date(2024, 8, 18, 22, 45, 15), 'MM.dd')).assertEqual('09.18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0048
     * @tc.name      testPhotosDateFormatExt0048
     * @tc.desc      Formats extended date sample 16 with pattern MM.dd. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0048 begin');
      expect(DateUtil.format(new Date(2024, 0, 22, 4, 45, 45), 'MM.dd')).assertEqual('01.22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0048 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0049
     * @tc.name      testPhotosDateFormatExt0049
     * @tc.desc      Formats extended date sample 17 with pattern HH-mm. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0049 begin');
      expect(DateUtil.format(new Date(2024, 4, 17, 16, 52, 28), 'HH-mm')).assertEqual('16-52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0050
     * @tc.name      testPhotosDateFormatExt0050
     * @tc.desc      Formats extended date sample 17 with pattern HH-mm. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0050 begin');
      expect(DateUtil.format(new Date(2024, 9, 21, 23, 56, 32), 'HH-mm')).assertEqual('23-56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0051
     * @tc.name      testPhotosDateFormatExt0051
     * @tc.desc      Formats extended date sample 17 with pattern HH-mm. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0051 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 5, 4, 8), 'HH-mm')).assertEqual('05-04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0051 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0052
     * @tc.name      testPhotosDateFormatExt0052
     * @tc.desc      Formats extended date sample 18 with pattern MM/dd HH:mm. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0052 begin');
      expect(DateUtil.format(new Date(2024, 5, 18, 17, 59, 41), 'MM/dd HH:mm')).assertEqual('06/18 17:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0053
     * @tc.name      testPhotosDateFormatExt0053
     * @tc.desc      Formats extended date sample 18 with pattern MM/dd HH:mm. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0053 begin');
      expect(DateUtil.format(new Date(2024, 10, 24, 0, 7, 49), 'MM/dd HH:mm')).assertEqual('11/24 00:07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0054
     * @tc.name      testPhotosDateFormatExt0054
     * @tc.desc      Formats extended date sample 18 with pattern MM/dd HH:mm. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0054 begin');
      expect(DateUtil.format(new Date(2024, 2, 8, 6, 23, 31), 'MM/dd HH:mm')).assertEqual('03/08 06:23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0054 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0055
     * @tc.name      testPhotosDateFormatExt0055
     * @tc.desc      Formats extended date sample 19 with pattern dd/MM HH:mm:ss. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0055 begin');
      expect(DateUtil.format(new Date(2024, 6, 19, 18, 6, 54), 'dd/MM HH:mm:ss')).assertEqual('19/07 18:06:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0056
     * @tc.name      testPhotosDateFormatExt0056
     * @tc.desc      Formats extended date sample 19 with pattern dd/MM HH:mm:ss. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0056 begin');
      expect(DateUtil.format(new Date(2024, 11, 27, 1, 18, 6), 'dd/MM HH:mm:ss')).assertEqual('27/12 01:18:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0057
     * @tc.name      testPhotosDateFormatExt0057
     * @tc.desc      Formats extended date sample 19 with pattern dd/MM HH:mm:ss. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0057 begin');
      expect(DateUtil.format(new Date(2024, 3, 15, 7, 42, 54), 'dd/MM HH:mm:ss')).assertEqual('15/04 07:42:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0057 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0058
     * @tc.name      testPhotosDateFormatExt0058
     * @tc.desc      Formats extended date sample 20 with pattern MM-dd-HH-mm-ss. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0058 begin');
      expect(DateUtil.format(new Date(2024, 7, 20, 19, 13, 7), 'MM-dd-HH-mm-ss')).assertEqual('08-20-19-13-07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0059
     * @tc.name      testPhotosDateFormatExt0059
     * @tc.desc      Formats extended date sample 20 with pattern MM-dd-HH-mm-ss. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0059 begin');
      expect(DateUtil.format(new Date(2024, 0, 2, 2, 29, 23), 'MM-dd-HH-mm-ss')).assertEqual('01-02-02-29-23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0060
     * @tc.name      testPhotosDateFormatExt0060
     * @tc.desc      Formats extended date sample 20 with pattern MM-dd-HH-mm-ss. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0060 begin');
      expect(DateUtil.format(new Date(2024, 4, 22, 8, 1, 17), 'MM-dd-HH-mm-ss')).assertEqual('05-22-08-01-17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0061
     * @tc.name      testPhotosDateFormatExt0061
     * @tc.desc      Formats extended date sample 21 with pattern MM.dd. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0061 begin');
      expect(DateUtil.format(new Date(2024, 8, 21, 20, 20, 20), 'MM.dd')).assertEqual('09.21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0062
     * @tc.name      testPhotosDateFormatExt0062
     * @tc.desc      Formats extended date sample 21 with pattern MM.dd. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0062 begin');
      expect(DateUtil.format(new Date(2024, 1, 5, 3, 40, 40), 'MM.dd')).assertEqual('02.05');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0063
     * @tc.name      testPhotosDateFormatExt0063
     * @tc.desc      Formats extended date sample 21 with pattern MM.dd. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0063 begin');
      expect(DateUtil.format(new Date(2024, 5, 1, 9, 20, 40), 'MM.dd')).assertEqual('06.01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0063 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0064
     * @tc.name      testPhotosDateFormatExt0064
     * @tc.desc      Formats extended date sample 22 with pattern HH-mm. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0064 begin');
      expect(DateUtil.format(new Date(2024, 9, 22, 21, 27, 33), 'HH-mm')).assertEqual('21-27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0065
     * @tc.name      testPhotosDateFormatExt0065
     * @tc.desc      Formats extended date sample 22 with pattern HH-mm. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0065 begin');
      expect(DateUtil.format(new Date(2024, 2, 8, 4, 51, 57), 'HH-mm')).assertEqual('04-51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0066
     * @tc.name      testPhotosDateFormatExt0066
     * @tc.desc      Formats extended date sample 22 with pattern HH-mm. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0066 begin');
      expect(DateUtil.format(new Date(2024, 6, 8, 10, 39, 3), 'HH-mm')).assertEqual('10-39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0066 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0067
     * @tc.name      testPhotosDateFormatExt0067
     * @tc.desc      Formats extended date sample 23 with pattern MM/dd HH:mm. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0067 begin');
      expect(DateUtil.format(new Date(2024, 10, 23, 22, 34, 46), 'MM/dd HH:mm')).assertEqual('11/23 22:34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0068
     * @tc.name      testPhotosDateFormatExt0068
     * @tc.desc      Formats extended date sample 23 with pattern MM/dd HH:mm. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0068 begin');
      expect(DateUtil.format(new Date(2024, 3, 11, 5, 2, 14), 'MM/dd HH:mm')).assertEqual('04/11 05:02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0069
     * @tc.name      testPhotosDateFormatExt0069
     * @tc.desc      Formats extended date sample 23 with pattern MM/dd HH:mm. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0069 begin');
      expect(DateUtil.format(new Date(2024, 7, 15, 11, 58, 26), 'MM/dd HH:mm')).assertEqual('08/15 11:58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0069 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0070
     * @tc.name      testPhotosDateFormatExt0070
     * @tc.desc      Formats extended date sample 24 with pattern dd/MM HH:mm:ss. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0070 begin');
      expect(DateUtil.format(new Date(2024, 11, 24, 23, 41, 59), 'dd/MM HH:mm:ss')).assertEqual('24/12 23:41:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0071
     * @tc.name      testPhotosDateFormatExt0071
     * @tc.desc      Formats extended date sample 24 with pattern dd/MM HH:mm:ss. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0071 begin');
      expect(DateUtil.format(new Date(2024, 4, 14, 6, 13, 31), 'dd/MM HH:mm:ss')).assertEqual('14/05 06:13:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0072
     * @tc.name      testPhotosDateFormatExt0072
     * @tc.desc      Formats extended date sample 24 with pattern dd/MM HH:mm:ss. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0072 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 12, 17, 49), 'dd/MM HH:mm:ss')).assertEqual('22/09 12:17:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0072 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0073
     * @tc.name      testPhotosDateFormatExt0073
     * @tc.desc      Formats extended date sample 25 with pattern MM-dd-HH-mm-ss. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0073 begin');
      expect(DateUtil.format(new Date(2024, 0, 25, 0, 48, 12), 'MM-dd-HH-mm-ss')).assertEqual('01-25-00-48-12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0074
     * @tc.name      testPhotosDateFormatExt0074
     * @tc.desc      Formats extended date sample 25 with pattern MM-dd-HH-mm-ss. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0074 begin');
      expect(DateUtil.format(new Date(2024, 5, 17, 7, 24, 48), 'MM-dd-HH-mm-ss')).assertEqual('06-17-07-24-48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0075
     * @tc.name      testPhotosDateFormatExt0075
     * @tc.desc      Formats extended date sample 25 with pattern MM-dd-HH-mm-ss. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0075 begin');
      expect(DateUtil.format(new Date(2024, 9, 1, 13, 36, 12), 'MM-dd-HH-mm-ss')).assertEqual('10-01-13-36-12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0075 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0076
     * @tc.name      testPhotosDateFormatExt0076
     * @tc.desc      Formats extended date sample 26 with pattern MM.dd. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0076 begin');
      expect(DateUtil.format(new Date(2024, 1, 26, 1, 55, 25), 'MM.dd')).assertEqual('02.26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0077
     * @tc.name      testPhotosDateFormatExt0077
     * @tc.desc      Formats extended date sample 26 with pattern MM.dd. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0077 begin');
      expect(DateUtil.format(new Date(2024, 6, 20, 8, 35, 5), 'MM.dd')).assertEqual('07.20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0078
     * @tc.name      testPhotosDateFormatExt0078
     * @tc.desc      Formats extended date sample 26 with pattern MM.dd. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0078 begin');
      expect(DateUtil.format(new Date(2024, 10, 8, 14, 55, 35), 'MM.dd')).assertEqual('11.08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0078 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0079
     * @tc.name      testPhotosDateFormatExt0079
     * @tc.desc      Formats extended date sample 27 with pattern HH-mm. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0079 begin');
      expect(DateUtil.format(new Date(2024, 2, 27, 2, 2, 38), 'HH-mm')).assertEqual('02-02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0080
     * @tc.name      testPhotosDateFormatExt0080
     * @tc.desc      Formats extended date sample 27 with pattern HH-mm. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0080 begin');
      expect(DateUtil.format(new Date(2024, 7, 23, 9, 46, 22), 'HH-mm')).assertEqual('09-46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0081
     * @tc.name      testPhotosDateFormatExt0081
     * @tc.desc      Formats extended date sample 27 with pattern HH-mm. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0081 begin');
      expect(DateUtil.format(new Date(2024, 11, 15, 15, 14, 58), 'HH-mm')).assertEqual('15-14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0081 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0082
     * @tc.name      testPhotosDateFormatExt0082
     * @tc.desc      Formats extended date sample 28 with pattern MM/dd HH:mm. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0082 begin');
      expect(DateUtil.format(new Date(2024, 3, 28, 3, 9, 51), 'MM/dd HH:mm')).assertEqual('04/28 03:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0083
     * @tc.name      testPhotosDateFormatExt0083
     * @tc.desc      Formats extended date sample 28 with pattern MM/dd HH:mm. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0083 begin');
      expect(DateUtil.format(new Date(2024, 8, 26, 10, 57, 39), 'MM/dd HH:mm')).assertEqual('09/26 10:57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0084
     * @tc.name      testPhotosDateFormatExt0084
     * @tc.desc      Formats extended date sample 28 with pattern MM/dd HH:mm. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0084 begin');
      expect(DateUtil.format(new Date(2024, 0, 22, 16, 33, 21), 'MM/dd HH:mm')).assertEqual('01/22 16:33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0084 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0085
     * @tc.name      testPhotosDateFormatExt0085
     * @tc.desc      Formats extended date sample 29 with pattern dd/MM HH:mm:ss. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0085 begin');
      expect(DateUtil.format(new Date(2024, 4, 1, 4, 16, 4), 'dd/MM HH:mm:ss')).assertEqual('01/05 04:16:04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0086
     * @tc.name      testPhotosDateFormatExt0086
     * @tc.desc      Formats extended date sample 29 with pattern dd/MM HH:mm:ss. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0086 begin');
      expect(DateUtil.format(new Date(2024, 9, 1, 11, 8, 56), 'dd/MM HH:mm:ss')).assertEqual('01/10 11:08:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0087
     * @tc.name      testPhotosDateFormatExt0087
     * @tc.desc      Formats extended date sample 29 with pattern dd/MM HH:mm:ss. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0087 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 17, 52, 44), 'dd/MM HH:mm:ss')).assertEqual('01/02 17:52:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0087 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0088
     * @tc.name      testPhotosDateFormatExt0088
     * @tc.desc      Formats extended date sample 30 with pattern MM-dd-HH-mm-ss. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0088 begin');
      expect(DateUtil.format(new Date(2024, 5, 2, 5, 23, 17), 'MM-dd-HH-mm-ss')).assertEqual('06-02-05-23-17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0089
     * @tc.name      testPhotosDateFormatExt0089
     * @tc.desc      Formats extended date sample 30 with pattern MM-dd-HH-mm-ss. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0089 begin');
      expect(DateUtil.format(new Date(2024, 10, 4, 12, 19, 13), 'MM-dd-HH-mm-ss')).assertEqual('11-04-12-19-13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0090
     * @tc.name      testPhotosDateFormatExt0090
     * @tc.desc      Formats extended date sample 30 with pattern MM-dd-HH-mm-ss. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0090 begin');
      expect(DateUtil.format(new Date(2024, 2, 8, 18, 11, 7), 'MM-dd-HH-mm-ss')).assertEqual('03-08-18-11-07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0090 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0091
     * @tc.name      testPhotosDateFormatExt0091
     * @tc.desc      Formats extended date sample 31 with pattern MM.dd. case 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0091 begin');
      expect(DateUtil.format(new Date(2024, 6, 3, 6, 30, 30), 'MM.dd')).assertEqual('07.03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0092
     * @tc.name      testPhotosDateFormatExt0092
     * @tc.desc      Formats extended date sample 31 with pattern MM.dd. case 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0092 begin');
      expect(DateUtil.format(new Date(2024, 11, 7, 13, 30, 30), 'MM.dd')).assertEqual('12.07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0093
     * @tc.name      testPhotosDateFormatExt0093
     * @tc.desc      Formats extended date sample 31 with pattern MM.dd. case 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0093 begin');
      expect(DateUtil.format(new Date(2024, 3, 15, 19, 30, 30), 'MM.dd')).assertEqual('04.15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0093 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0094
     * @tc.name      testPhotosDateFormatExt0094
     * @tc.desc      Formats extended date sample 32 with pattern HH-mm. case 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0094 begin');
      expect(DateUtil.format(new Date(2024, 7, 4, 7, 37, 43), 'HH-mm')).assertEqual('07-37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0095
     * @tc.name      testPhotosDateFormatExt0095
     * @tc.desc      Formats extended date sample 32 with pattern HH-mm. case 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0095 begin');
      expect(DateUtil.format(new Date(2024, 0, 10, 14, 41, 47), 'HH-mm')).assertEqual('14-41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0096
     * @tc.name      testPhotosDateFormatExt0096
     * @tc.desc      Formats extended date sample 32 with pattern HH-mm. case 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0096 begin');
      expect(DateUtil.format(new Date(2024, 4, 22, 20, 49, 53), 'HH-mm')).assertEqual('20-49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0096 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0097
     * @tc.name      testPhotosDateFormatExt0097
     * @tc.desc      Formats extended date sample 33 with pattern MM/dd HH:mm. case 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0097 begin');
      expect(DateUtil.format(new Date(2024, 8, 5, 8, 44, 56), 'MM/dd HH:mm')).assertEqual('09/05 08:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0098
     * @tc.name      testPhotosDateFormatExt0098
     * @tc.desc      Formats extended date sample 33 with pattern MM/dd HH:mm. case 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0098 begin');
      expect(DateUtil.format(new Date(2024, 1, 13, 15, 52, 4), 'MM/dd HH:mm')).assertEqual('02/13 15:52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0099
     * @tc.name      testPhotosDateFormatExt0099
     * @tc.desc      Formats extended date sample 33 with pattern MM/dd HH:mm. case 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0099 begin');
      expect(DateUtil.format(new Date(2024, 5, 1, 21, 8, 16), 'MM/dd HH:mm')).assertEqual('06/01 21:08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0099 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0100
     * @tc.name      testPhotosDateFormatExt0100
     * @tc.desc      Formats extended date sample 34 with pattern dd/MM HH:mm:ss. case 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0100 begin');
      expect(DateUtil.format(new Date(2024, 9, 6, 9, 51, 9), 'dd/MM HH:mm:ss')).assertEqual('06/10 09:51:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0101
     * @tc.name      testPhotosDateFormatExt0101
     * @tc.desc      Formats extended date sample 34 with pattern dd/MM HH:mm:ss. case 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0101 begin');
      expect(DateUtil.format(new Date(2024, 2, 16, 16, 3, 21), 'dd/MM HH:mm:ss')).assertEqual('16/03 16:03:21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0102
     * @tc.name      testPhotosDateFormatExt0102
     * @tc.desc      Formats extended date sample 34 with pattern dd/MM HH:mm:ss. case 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0102 begin');
      expect(DateUtil.format(new Date(2024, 6, 8, 22, 27, 39), 'dd/MM HH:mm:ss')).assertEqual('08/07 22:27:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0102 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0103
     * @tc.name      testPhotosDateFormatExt0103
     * @tc.desc      Formats extended date sample 35 with pattern MM-dd-HH-mm-ss. case 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0103 begin');
      expect(DateUtil.format(new Date(2024, 10, 7, 10, 58, 22), 'MM-dd-HH-mm-ss')).assertEqual('11-07-10-58-22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0104
     * @tc.name      testPhotosDateFormatExt0104
     * @tc.desc      Formats extended date sample 35 with pattern MM-dd-HH-mm-ss. case 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0104 begin');
      expect(DateUtil.format(new Date(2024, 3, 19, 17, 14, 38), 'MM-dd-HH-mm-ss')).assertEqual('04-19-17-14-38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0105
     * @tc.name      testPhotosDateFormatExt0105
     * @tc.desc      Formats extended date sample 35 with pattern MM-dd-HH-mm-ss. case 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0105 begin');
      expect(DateUtil.format(new Date(2024, 7, 15, 23, 46, 2), 'MM-dd-HH-mm-ss')).assertEqual('08-15-23-46-02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0105 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0106
     * @tc.name      testPhotosDateFormatExt0106
     * @tc.desc      Formats extended date sample 36 with pattern MM.dd. case 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0106 begin');
      expect(DateUtil.format(new Date(2024, 11, 8, 11, 5, 35), 'MM.dd')).assertEqual('12.08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0107
     * @tc.name      testPhotosDateFormatExt0107
     * @tc.desc      Formats extended date sample 36 with pattern MM.dd. case 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0107 begin');
      expect(DateUtil.format(new Date(2024, 4, 22, 18, 25, 55), 'MM.dd')).assertEqual('05.22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0108
     * @tc.name      testPhotosDateFormatExt0108
     * @tc.desc      Formats extended date sample 36 with pattern MM.dd. case 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0108 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 0, 5, 25), 'MM.dd')).assertEqual('09.22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0108 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0109
     * @tc.name      testPhotosDateFormatExt0109
     * @tc.desc      Formats extended date sample 37 with pattern HH-mm. case 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0109 begin');
      expect(DateUtil.format(new Date(2024, 0, 9, 12, 12, 48), 'HH-mm')).assertEqual('12-12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0110
     * @tc.name      testPhotosDateFormatExt0110
     * @tc.desc      Formats extended date sample 37 with pattern HH-mm. case 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0110 begin');
      expect(DateUtil.format(new Date(2024, 5, 25, 19, 36, 12), 'HH-mm')).assertEqual('19-36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0111
     * @tc.name      testPhotosDateFormatExt0111
     * @tc.desc      Formats extended date sample 37 with pattern HH-mm. case 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0111 begin');
      expect(DateUtil.format(new Date(2024, 9, 1, 1, 24, 48), 'HH-mm')).assertEqual('01-24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0111 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0112
     * @tc.name      testPhotosDateFormatExt0112
     * @tc.desc      Formats extended date sample 38 with pattern MM/dd HH:mm. case 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0112 begin');
      expect(DateUtil.format(new Date(2024, 1, 10, 13, 19, 1), 'MM/dd HH:mm')).assertEqual('02/10 13:19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0113
     * @tc.name      testPhotosDateFormatExt0113
     * @tc.desc      Formats extended date sample 38 with pattern MM/dd HH:mm. case 113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0113 begin');
      expect(DateUtil.format(new Date(2024, 6, 28, 20, 47, 29), 'MM/dd HH:mm')).assertEqual('07/28 20:47');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0114
     * @tc.name      testPhotosDateFormatExt0114
     * @tc.desc      Formats extended date sample 38 with pattern MM/dd HH:mm. case 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0114 begin');
      expect(DateUtil.format(new Date(2024, 10, 8, 2, 43, 11), 'MM/dd HH:mm')).assertEqual('11/08 02:43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0114 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0115
     * @tc.name      testPhotosDateFormatExt0115
     * @tc.desc      Formats extended date sample 39 with pattern dd/MM HH:mm:ss. case 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0115 begin');
      expect(DateUtil.format(new Date(2024, 2, 11, 14, 26, 14), 'dd/MM HH:mm:ss')).assertEqual('11/03 14:26:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0116
     * @tc.name      testPhotosDateFormatExt0116
     * @tc.desc      Formats extended date sample 39 with pattern dd/MM HH:mm:ss. case 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0116 begin');
      expect(DateUtil.format(new Date(2024, 7, 3, 21, 58, 46), 'dd/MM HH:mm:ss')).assertEqual('03/08 21:58:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0117
     * @tc.name      testPhotosDateFormatExt0117
     * @tc.desc      Formats extended date sample 39 with pattern dd/MM HH:mm:ss. case 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0117 begin');
      expect(DateUtil.format(new Date(2024, 11, 15, 3, 2, 34), 'dd/MM HH:mm:ss')).assertEqual('15/12 03:02:34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0117 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0118
     * @tc.name      testPhotosDateFormatExt0118
     * @tc.desc      Formats extended date sample 40 with pattern MM-dd-HH-mm-ss. case 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0118 begin');
      expect(DateUtil.format(new Date(2024, 3, 12, 15, 33, 27), 'MM-dd-HH-mm-ss')).assertEqual('04-12-15-33-27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0119
     * @tc.name      testPhotosDateFormatExt0119
     * @tc.desc      Formats extended date sample 40 with pattern MM-dd-HH-mm-ss. case 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0119 begin');
      expect(DateUtil.format(new Date(2024, 8, 6, 22, 9, 3), 'MM-dd-HH-mm-ss')).assertEqual('09-06-22-09-03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0120
     * @tc.name      testPhotosDateFormatExt0120
     * @tc.desc      Formats extended date sample 40 with pattern MM-dd-HH-mm-ss. case 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0120 begin');
      expect(DateUtil.format(new Date(2024, 0, 22, 4, 21, 57), 'MM-dd-HH-mm-ss')).assertEqual('01-22-04-21-57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0120 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0121
     * @tc.name      testPhotosDateFormatExt0121
     * @tc.desc      Formats extended date sample 41 with pattern MM.dd. case 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0121 begin');
      expect(DateUtil.format(new Date(2024, 4, 13, 16, 40, 40), 'MM.dd')).assertEqual('05.13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0122
     * @tc.name      testPhotosDateFormatExt0122
     * @tc.desc      Formats extended date sample 41 with pattern MM.dd. case 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0122 begin');
      expect(DateUtil.format(new Date(2024, 9, 9, 23, 20, 20), 'MM.dd')).assertEqual('10.09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0123
     * @tc.name      testPhotosDateFormatExt0123
     * @tc.desc      Formats extended date sample 41 with pattern MM.dd. case 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0123 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 5, 40, 20), 'MM.dd')).assertEqual('02.01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0123 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0124
     * @tc.name      testPhotosDateFormatExt0124
     * @tc.desc      Formats extended date sample 42 with pattern HH-mm. case 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0124 begin');
      expect(DateUtil.format(new Date(2024, 5, 14, 17, 47, 53), 'HH-mm')).assertEqual('17-47');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0125
     * @tc.name      testPhotosDateFormatExt0125
     * @tc.desc      Formats extended date sample 42 with pattern HH-mm. case 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0125 begin');
      expect(DateUtil.format(new Date(2024, 10, 12, 0, 31, 37), 'HH-mm')).assertEqual('00-31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0126
     * @tc.name      testPhotosDateFormatExt0126
     * @tc.desc      Formats extended date sample 42 with pattern HH-mm. case 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0126 begin');
      expect(DateUtil.format(new Date(2024, 2, 8, 6, 59, 43), 'HH-mm')).assertEqual('06-59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0126 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0127
     * @tc.name      testPhotosDateFormatExt0127
     * @tc.desc      Formats extended date sample 43 with pattern MM/dd HH:mm. case 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0127 begin');
      expect(DateUtil.format(new Date(2024, 6, 15, 18, 54, 6), 'MM/dd HH:mm')).assertEqual('07/15 18:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0128
     * @tc.name      testPhotosDateFormatExt0128
     * @tc.desc      Formats extended date sample 43 with pattern MM/dd HH:mm. case 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0128 begin');
      expect(DateUtil.format(new Date(2024, 11, 15, 1, 42, 54), 'MM/dd HH:mm')).assertEqual('12/15 01:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0129
     * @tc.name      testPhotosDateFormatExt0129
     * @tc.desc      Formats extended date sample 43 with pattern MM/dd HH:mm. case 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0129 begin');
      expect(DateUtil.format(new Date(2024, 3, 15, 7, 18, 6), 'MM/dd HH:mm')).assertEqual('04/15 07:18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0129 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0130
     * @tc.name      testPhotosDateFormatExt0130
     * @tc.desc      Formats extended date sample 44 with pattern dd/MM HH:mm:ss. case 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0130 begin');
      expect(DateUtil.format(new Date(2024, 7, 16, 19, 1, 19), 'dd/MM HH:mm:ss')).assertEqual('16/08 19:01:19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0131
     * @tc.name      testPhotosDateFormatExt0131
     * @tc.desc      Formats extended date sample 44 with pattern dd/MM HH:mm:ss. case 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0131 begin');
      expect(DateUtil.format(new Date(2024, 0, 18, 2, 53, 11), 'dd/MM HH:mm:ss')).assertEqual('18/01 02:53:11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0132
     * @tc.name      testPhotosDateFormatExt0132
     * @tc.desc      Formats extended date sample 44 with pattern dd/MM HH:mm:ss. case 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0132 begin');
      expect(DateUtil.format(new Date(2024, 4, 22, 8, 37, 29), 'dd/MM HH:mm:ss')).assertEqual('22/05 08:37:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0132 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0133
     * @tc.name      testPhotosDateFormatExt0133
     * @tc.desc      Formats extended date sample 45 with pattern MM-dd-HH-mm-ss. case 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0133 begin');
      expect(DateUtil.format(new Date(2024, 8, 17, 20, 8, 32), 'MM-dd-HH-mm-ss')).assertEqual('09-17-20-08-32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0134
     * @tc.name      testPhotosDateFormatExt0134
     * @tc.desc      Formats extended date sample 45 with pattern MM-dd-HH-mm-ss. case 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0134 begin');
      expect(DateUtil.format(new Date(2024, 1, 21, 3, 4, 28), 'MM-dd-HH-mm-ss')).assertEqual('02-21-03-04-28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0135
     * @tc.name      testPhotosDateFormatExt0135
     * @tc.desc      Formats extended date sample 45 with pattern MM-dd-HH-mm-ss. case 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0135 begin');
      expect(DateUtil.format(new Date(2024, 5, 1, 9, 56, 52), 'MM-dd-HH-mm-ss')).assertEqual('06-01-09-56-52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0135 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0136
     * @tc.name      testPhotosDateFormatExt0136
     * @tc.desc      Formats extended date sample 46 with pattern MM.dd. case 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0136 begin');
      expect(DateUtil.format(new Date(2024, 9, 18, 21, 15, 45), 'MM.dd')).assertEqual('10.18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0137
     * @tc.name      testPhotosDateFormatExt0137
     * @tc.desc      Formats extended date sample 46 with pattern MM.dd. case 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0137 begin');
      expect(DateUtil.format(new Date(2024, 2, 24, 4, 15, 45), 'MM.dd')).assertEqual('03.24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0138
     * @tc.name      testPhotosDateFormatExt0138
     * @tc.desc      Formats extended date sample 46 with pattern MM.dd. case 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0138 begin');
      expect(DateUtil.format(new Date(2024, 6, 8, 10, 15, 15), 'MM.dd')).assertEqual('07.08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0138 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0139
     * @tc.name      testPhotosDateFormatExt0139
     * @tc.desc      Formats extended date sample 47 with pattern HH-mm. case 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0139 begin');
      expect(DateUtil.format(new Date(2024, 10, 19, 22, 22, 58), 'HH-mm')).assertEqual('22-22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0140
     * @tc.name      testPhotosDateFormatExt0140
     * @tc.desc      Formats extended date sample 47 with pattern HH-mm. case 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0140 begin');
      expect(DateUtil.format(new Date(2024, 3, 27, 5, 26, 2), 'HH-mm')).assertEqual('05-26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0140 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0141
     * @tc.name      testPhotosDateFormatExt0141
     * @tc.desc      Formats extended date sample 47 with pattern HH-mm. case 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0141 begin');
      expect(DateUtil.format(new Date(2024, 7, 15, 11, 34, 38), 'HH-mm')).assertEqual('11-34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0141 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0142
     * @tc.name      testPhotosDateFormatExt0142
     * @tc.desc      Formats extended date sample 48 with pattern MM/dd HH:mm. case 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0142 begin');
      expect(DateUtil.format(new Date(2024, 11, 20, 23, 29, 11), 'MM/dd HH:mm')).assertEqual('12/20 23:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0143
     * @tc.name      testPhotosDateFormatExt0143
     * @tc.desc      Formats extended date sample 48 with pattern MM/dd HH:mm. case 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0143 begin');
      expect(DateUtil.format(new Date(2024, 4, 2, 6, 37, 19), 'MM/dd HH:mm')).assertEqual('05/02 06:37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0144
     * @tc.name      testPhotosDateFormatExt0144
     * @tc.desc      Formats extended date sample 48 with pattern MM/dd HH:mm. case 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0144 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 12, 53, 1), 'MM/dd HH:mm')).assertEqual('09/22 12:53');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0144 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0145
     * @tc.name      testPhotosDateFormatExt0145
     * @tc.desc      Formats extended date sample 49 with pattern dd/MM HH:mm:ss. case 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0145 begin');
      expect(DateUtil.format(new Date(2024, 0, 21, 0, 36, 24), 'dd/MM HH:mm:ss')).assertEqual('21/01 00:36:24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0146
     * @tc.name      testPhotosDateFormatExt0146
     * @tc.desc      Formats extended date sample 49 with pattern dd/MM HH:mm:ss. case 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0146 begin');
      expect(DateUtil.format(new Date(2024, 5, 5, 7, 48, 36), 'dd/MM HH:mm:ss')).assertEqual('05/06 07:48:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0147
     * @tc.name      testPhotosDateFormatExt0147
     * @tc.desc      Formats extended date sample 49 with pattern dd/MM HH:mm:ss. case 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0147 begin');
      expect(DateUtil.format(new Date(2024, 9, 1, 13, 12, 24), 'dd/MM HH:mm:ss')).assertEqual('01/10 13:12:24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0147 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0148
     * @tc.name      testPhotosDateFormatExt0148
     * @tc.desc      Formats extended date sample 50 with pattern MM-dd-HH-mm-ss. case 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0148 begin');
      expect(DateUtil.format(new Date(2024, 1, 22, 1, 43, 37), 'MM-dd-HH-mm-ss')).assertEqual('02-22-01-43-37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0149
     * @tc.name      testPhotosDateFormatExt0149
     * @tc.desc      Formats extended date sample 50 with pattern MM-dd-HH-mm-ss. case 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0149 begin');
      expect(DateUtil.format(new Date(2024, 6, 8, 8, 59, 53), 'MM-dd-HH-mm-ss')).assertEqual('07-08-08-59-53');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0150
     * @tc.name      testPhotosDateFormatExt0150
     * @tc.desc      Formats extended date sample 50 with pattern MM-dd-HH-mm-ss. case 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0150 begin');
      expect(DateUtil.format(new Date(2024, 10, 8, 14, 31, 47), 'MM-dd-HH-mm-ss')).assertEqual('11-08-14-31-47');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0150 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0151
     * @tc.name      testPhotosDateFormatExt0151
     * @tc.desc      Formats extended date sample 51 with pattern MM.dd. case 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0151 begin');
      expect(DateUtil.format(new Date(2024, 2, 23, 2, 50, 50), 'MM.dd')).assertEqual('03.23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0152
     * @tc.name      testPhotosDateFormatExt0152
     * @tc.desc      Formats extended date sample 51 with pattern MM.dd. case 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0152 begin');
      expect(DateUtil.format(new Date(2024, 7, 11, 9, 10, 10), 'MM.dd')).assertEqual('08.11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0153
     * @tc.name      testPhotosDateFormatExt0153
     * @tc.desc      Formats extended date sample 51 with pattern MM.dd. case 153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0153 begin');
      expect(DateUtil.format(new Date(2024, 11, 15, 15, 50, 10), 'MM.dd')).assertEqual('12.15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0153 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0154
     * @tc.name      testPhotosDateFormatExt0154
     * @tc.desc      Formats extended date sample 52 with pattern HH-mm. case 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0154 begin');
      expect(DateUtil.format(new Date(2024, 3, 24, 3, 57, 3), 'HH-mm')).assertEqual('03-57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0155
     * @tc.name      testPhotosDateFormatExt0155
     * @tc.desc      Formats extended date sample 52 with pattern HH-mm. case 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0155 begin');
      expect(DateUtil.format(new Date(2024, 8, 14, 10, 21, 27), 'HH-mm')).assertEqual('10-21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0155 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0156
     * @tc.name      testPhotosDateFormatExt0156
     * @tc.desc      Formats extended date sample 52 with pattern HH-mm. case 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0156 begin');
      expect(DateUtil.format(new Date(2024, 0, 22, 16, 9, 33), 'HH-mm')).assertEqual('16-09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0156 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0157
     * @tc.name      testPhotosDateFormatExt0157
     * @tc.desc      Formats extended date sample 53 with pattern MM/dd HH:mm. case 157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0157 begin');
      expect(DateUtil.format(new Date(2024, 4, 25, 4, 4, 16), 'MM/dd HH:mm')).assertEqual('05/25 04:04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0158
     * @tc.name      testPhotosDateFormatExt0158
     * @tc.desc      Formats extended date sample 53 with pattern MM/dd HH:mm. case 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0158 begin');
      expect(DateUtil.format(new Date(2024, 9, 17, 11, 32, 44), 'MM/dd HH:mm')).assertEqual('10/17 11:32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0159
     * @tc.name      testPhotosDateFormatExt0159
     * @tc.desc      Formats extended date sample 53 with pattern MM/dd HH:mm. case 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0159 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 17, 28, 56), 'MM/dd HH:mm')).assertEqual('02/01 17:28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0159 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0160
     * @tc.name      testPhotosDateFormatExt0160
     * @tc.desc      Formats extended date sample 54 with pattern dd/MM HH:mm:ss. case 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0160 begin');
      expect(DateUtil.format(new Date(2024, 5, 26, 5, 11, 29), 'dd/MM HH:mm:ss')).assertEqual('26/06 05:11:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0160 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0161
     * @tc.name      testPhotosDateFormatExt0161
     * @tc.desc      Formats extended date sample 54 with pattern dd/MM HH:mm:ss. case 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0161 begin');
      expect(DateUtil.format(new Date(2024, 10, 20, 12, 43, 1), 'dd/MM HH:mm:ss')).assertEqual('20/11 12:43:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0162
     * @tc.name      testPhotosDateFormatExt0162
     * @tc.desc      Formats extended date sample 54 with pattern dd/MM HH:mm:ss. case 162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0162 begin');
      expect(DateUtil.format(new Date(2024, 2, 8, 18, 47, 19), 'dd/MM HH:mm:ss')).assertEqual('08/03 18:47:19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0162 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0163
     * @tc.name      testPhotosDateFormatExt0163
     * @tc.desc      Formats extended date sample 55 with pattern MM-dd-HH-mm-ss. case 163
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0163 begin');
      expect(DateUtil.format(new Date(2024, 6, 27, 6, 18, 42), 'MM-dd-HH-mm-ss')).assertEqual('07-27-06-18-42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0164
     * @tc.name      testPhotosDateFormatExt0164
     * @tc.desc      Formats extended date sample 55 with pattern MM-dd-HH-mm-ss. case 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0164 begin');
      expect(DateUtil.format(new Date(2024, 11, 23, 13, 54, 18), 'MM-dd-HH-mm-ss')).assertEqual('12-23-13-54-18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0165
     * @tc.name      testPhotosDateFormatExt0165
     * @tc.desc      Formats extended date sample 55 with pattern MM-dd-HH-mm-ss. case 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0165 begin');
      expect(DateUtil.format(new Date(2024, 3, 15, 19, 6, 42), 'MM-dd-HH-mm-ss')).assertEqual('04-15-19-06-42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0165 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0166
     * @tc.name      testPhotosDateFormatExt0166
     * @tc.desc      Formats extended date sample 56 with pattern MM.dd. case 166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0166 begin');
      expect(DateUtil.format(new Date(2024, 7, 28, 7, 25, 55), 'MM.dd')).assertEqual('08.28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0167
     * @tc.name      testPhotosDateFormatExt0167
     * @tc.desc      Formats extended date sample 56 with pattern MM.dd. case 167
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0167 begin');
      expect(DateUtil.format(new Date(2024, 0, 26, 14, 5, 35), 'MM.dd')).assertEqual('01.26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0168
     * @tc.name      testPhotosDateFormatExt0168
     * @tc.desc      Formats extended date sample 56 with pattern MM.dd. case 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0168 begin');
      expect(DateUtil.format(new Date(2024, 4, 22, 20, 25, 5), 'MM.dd')).assertEqual('05.22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0168 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0169
     * @tc.name      testPhotosDateFormatExt0169
     * @tc.desc      Formats extended date sample 57 with pattern HH-mm. case 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0169 begin');
      expect(DateUtil.format(new Date(2024, 8, 1, 8, 32, 8), 'HH-mm')).assertEqual('08-32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0170
     * @tc.name      testPhotosDateFormatExt0170
     * @tc.desc      Formats extended date sample 57 with pattern HH-mm. case 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0170 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 15, 16, 52), 'HH-mm')).assertEqual('15-16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0170 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0171
     * @tc.name      testPhotosDateFormatExt0171
     * @tc.desc      Formats extended date sample 57 with pattern HH-mm. case 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0171 begin');
      expect(DateUtil.format(new Date(2024, 5, 1, 21, 44, 28), 'HH-mm')).assertEqual('21-44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0171 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0172
     * @tc.name      testPhotosDateFormatExt0172
     * @tc.desc      Formats extended date sample 58 with pattern MM/dd HH:mm. case 172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0172 begin');
      expect(DateUtil.format(new Date(2024, 9, 2, 9, 39, 21), 'MM/dd HH:mm')).assertEqual('10/02 09:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0173
     * @tc.name      testPhotosDateFormatExt0173
     * @tc.desc      Formats extended date sample 58 with pattern MM/dd HH:mm. case 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0173 begin');
      expect(DateUtil.format(new Date(2024, 2, 4, 16, 27, 9), 'MM/dd HH:mm')).assertEqual('03/04 16:27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0174
     * @tc.name      testPhotosDateFormatExt0174
     * @tc.desc      Formats extended date sample 58 with pattern MM/dd HH:mm. case 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0174 begin');
      expect(DateUtil.format(new Date(2024, 6, 8, 22, 3, 51), 'MM/dd HH:mm')).assertEqual('07/08 22:03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0174 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0175
     * @tc.name      testPhotosDateFormatExt0175
     * @tc.desc      Formats extended date sample 59 with pattern dd/MM HH:mm:ss. case 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0175 begin');
      expect(DateUtil.format(new Date(2024, 10, 3, 10, 46, 34), 'dd/MM HH:mm:ss')).assertEqual('03/11 10:46:34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0175 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0176
     * @tc.name      testPhotosDateFormatExt0176
     * @tc.desc      Formats extended date sample 59 with pattern dd/MM HH:mm:ss. case 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0176 begin');
      expect(DateUtil.format(new Date(2024, 3, 7, 17, 38, 26), 'dd/MM HH:mm:ss')).assertEqual('07/04 17:38:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0177
     * @tc.name      testPhotosDateFormatExt0177
     * @tc.desc      Formats extended date sample 59 with pattern dd/MM HH:mm:ss. case 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0177 begin');
      expect(DateUtil.format(new Date(2024, 7, 15, 23, 22, 14), 'dd/MM HH:mm:ss')).assertEqual('15/08 23:22:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0177 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0178
     * @tc.name      testPhotosDateFormatExt0178
     * @tc.desc      Formats extended date sample 60 with pattern MM-dd-HH-mm-ss. case 178
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0178 begin');
      expect(DateUtil.format(new Date(2024, 11, 4, 11, 53, 47), 'MM-dd-HH-mm-ss')).assertEqual('12-04-11-53-47');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0179
     * @tc.name      testPhotosDateFormatExt0179
     * @tc.desc      Formats extended date sample 60 with pattern MM-dd-HH-mm-ss. case 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0179 begin');
      expect(DateUtil.format(new Date(2024, 4, 10, 18, 49, 43), 'MM-dd-HH-mm-ss')).assertEqual('05-10-18-49-43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0180
     * @tc.name      testPhotosDateFormatExt0180
     * @tc.desc      Formats extended date sample 60 with pattern MM-dd-HH-mm-ss. case 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0180 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 0, 41, 37), 'MM-dd-HH-mm-ss')).assertEqual('09-22-00-41-37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0180 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0181
     * @tc.name      testPhotosDateFormatExt0181
     * @tc.desc      Formats extended date sample 61 with pattern MM.dd. case 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0181 begin');
      expect(DateUtil.format(new Date(2024, 0, 5, 12, 0, 0), 'MM.dd')).assertEqual('01.05');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0181 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0182
     * @tc.name      testPhotosDateFormatExt0182
     * @tc.desc      Formats extended date sample 61 with pattern MM.dd. case 182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0182 begin');
      expect(DateUtil.format(new Date(2024, 5, 13, 19, 0, 0), 'MM.dd')).assertEqual('06.13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0182 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0183
     * @tc.name      testPhotosDateFormatExt0183
     * @tc.desc      Formats extended date sample 61 with pattern MM.dd. case 183
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0183 begin');
      expect(DateUtil.format(new Date(2024, 9, 1, 1, 0, 0), 'MM.dd')).assertEqual('10.01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0183 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0184
     * @tc.name      testPhotosDateFormatExt0184
     * @tc.desc      Formats extended date sample 62 with pattern HH-mm. case 184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0184 begin');
      expect(DateUtil.format(new Date(2024, 1, 6, 13, 7, 13), 'HH-mm')).assertEqual('13-07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0184 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0185
     * @tc.name      testPhotosDateFormatExt0185
     * @tc.desc      Formats extended date sample 62 with pattern HH-mm. case 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0185 begin');
      expect(DateUtil.format(new Date(2024, 6, 16, 20, 11, 17), 'HH-mm')).assertEqual('20-11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0185 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0186
     * @tc.name      testPhotosDateFormatExt0186
     * @tc.desc      Formats extended date sample 62 with pattern HH-mm. case 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0186 begin');
      expect(DateUtil.format(new Date(2024, 10, 8, 2, 19, 23), 'HH-mm')).assertEqual('02-19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0186 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0187
     * @tc.name      testPhotosDateFormatExt0187
     * @tc.desc      Formats extended date sample 63 with pattern MM/dd HH:mm. case 187
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0187 begin');
      expect(DateUtil.format(new Date(2024, 2, 7, 14, 14, 26), 'MM/dd HH:mm')).assertEqual('03/07 14:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0187 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0188
     * @tc.name      testPhotosDateFormatExt0188
     * @tc.desc      Formats extended date sample 63 with pattern MM/dd HH:mm. case 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0188 begin');
      expect(DateUtil.format(new Date(2024, 7, 19, 21, 22, 34), 'MM/dd HH:mm')).assertEqual('08/19 21:22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0188 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0189
     * @tc.name      testPhotosDateFormatExt0189
     * @tc.desc      Formats extended date sample 63 with pattern MM/dd HH:mm. case 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0189 begin');
      expect(DateUtil.format(new Date(2024, 11, 15, 3, 38, 46), 'MM/dd HH:mm')).assertEqual('12/15 03:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0189 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0190
     * @tc.name      testPhotosDateFormatExt0190
     * @tc.desc      Formats extended date sample 64 with pattern dd/MM HH:mm:ss. case 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0190 begin');
      expect(DateUtil.format(new Date(2024, 3, 8, 15, 21, 39), 'dd/MM HH:mm:ss')).assertEqual('08/04 15:21:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0190 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0191
     * @tc.name      testPhotosDateFormatExt0191
     * @tc.desc      Formats extended date sample 64 with pattern dd/MM HH:mm:ss. case 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0191 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 22, 33, 51), 'dd/MM HH:mm:ss')).assertEqual('22/09 22:33:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0191 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0192
     * @tc.name      testPhotosDateFormatExt0192
     * @tc.desc      Formats extended date sample 64 with pattern dd/MM HH:mm:ss. case 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0192 begin');
      expect(DateUtil.format(new Date(2024, 0, 22, 4, 57, 9), 'dd/MM HH:mm:ss')).assertEqual('22/01 04:57:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0192 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0193
     * @tc.name      testPhotosDateFormatExt0193
     * @tc.desc      Formats extended date sample 65 with pattern MM-dd-HH-mm-ss. case 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0193 begin');
      expect(DateUtil.format(new Date(2024, 4, 9, 16, 28, 52), 'MM-dd-HH-mm-ss')).assertEqual('05-09-16-28-52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0193 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0194
     * @tc.name      testPhotosDateFormatExt0194
     * @tc.desc      Formats extended date sample 65 with pattern MM-dd-HH-mm-ss. case 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0194 begin');
      expect(DateUtil.format(new Date(2024, 9, 25, 23, 44, 8), 'MM-dd-HH-mm-ss')).assertEqual('10-25-23-44-08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0194 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0195
     * @tc.name      testPhotosDateFormatExt0195
     * @tc.desc      Formats extended date sample 65 with pattern MM-dd-HH-mm-ss. case 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0195 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 5, 16, 32), 'MM-dd-HH-mm-ss')).assertEqual('02-01-05-16-32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0195 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0196
     * @tc.name      testPhotosDateFormatExt0196
     * @tc.desc      Formats extended date sample 66 with pattern MM.dd. case 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0196 begin');
      expect(DateUtil.format(new Date(2024, 5, 10, 17, 35, 5), 'MM.dd')).assertEqual('06.10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0196 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0197
     * @tc.name      testPhotosDateFormatExt0197
     * @tc.desc      Formats extended date sample 66 with pattern MM.dd. case 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0197 begin');
      expect(DateUtil.format(new Date(2024, 10, 28, 0, 55, 25), 'MM.dd')).assertEqual('11.28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0197 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0198
     * @tc.name      testPhotosDateFormatExt0198
     * @tc.desc      Formats extended date sample 66 with pattern MM.dd. case 198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0198 begin');
      expect(DateUtil.format(new Date(2024, 2, 8, 6, 35, 55), 'MM.dd')).assertEqual('03.08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0198 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0199
     * @tc.name      testPhotosDateFormatExt0199
     * @tc.desc      Formats extended date sample 67 with pattern HH-mm. case 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0199 begin');
      expect(DateUtil.format(new Date(2024, 6, 11, 18, 42, 18), 'HH-mm')).assertEqual('18-42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0199 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0200
     * @tc.name      testPhotosDateFormatExt0200
     * @tc.desc      Formats extended date sample 67 with pattern HH-mm. case 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0200 begin');
      expect(DateUtil.format(new Date(2024, 11, 3, 1, 6, 42), 'HH-mm')).assertEqual('01-06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0200 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0201
     * @tc.name      testPhotosDateFormatExt0201
     * @tc.desc      Formats extended date sample 67 with pattern HH-mm. case 201
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0201 begin');
      expect(DateUtil.format(new Date(2024, 3, 15, 7, 54, 18), 'HH-mm')).assertEqual('07-54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0201 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0202
     * @tc.name      testPhotosDateFormatExt0202
     * @tc.desc      Formats extended date sample 68 with pattern MM/dd HH:mm. case 202
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0202 begin');
      expect(DateUtil.format(new Date(2024, 7, 12, 19, 49, 31), 'MM/dd HH:mm')).assertEqual('08/12 19:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0202 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0203
     * @tc.name      testPhotosDateFormatExt0203
     * @tc.desc      Formats extended date sample 68 with pattern MM/dd HH:mm. case 203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0203 begin');
      expect(DateUtil.format(new Date(2024, 0, 6, 2, 17, 59), 'MM/dd HH:mm')).assertEqual('01/06 02:17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0203 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0204
     * @tc.name      testPhotosDateFormatExt0204
     * @tc.desc      Formats extended date sample 68 with pattern MM/dd HH:mm. case 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0204 begin');
      expect(DateUtil.format(new Date(2024, 4, 22, 8, 13, 41), 'MM/dd HH:mm')).assertEqual('05/22 08:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0204 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0205
     * @tc.name      testPhotosDateFormatExt0205
     * @tc.desc      Formats extended date sample 69 with pattern dd/MM HH:mm:ss. case 205
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0205 begin');
      expect(DateUtil.format(new Date(2024, 8, 13, 20, 56, 44), 'dd/MM HH:mm:ss')).assertEqual('13/09 20:56:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0205 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0206
     * @tc.name      testPhotosDateFormatExt0206
     * @tc.desc      Formats extended date sample 69 with pattern dd/MM HH:mm:ss. case 206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0206 begin');
      expect(DateUtil.format(new Date(2024, 1, 9, 3, 28, 16), 'dd/MM HH:mm:ss')).assertEqual('09/02 03:28:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0206 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0207
     * @tc.name      testPhotosDateFormatExt0207
     * @tc.desc      Formats extended date sample 69 with pattern dd/MM HH:mm:ss. case 207
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0207 begin');
      expect(DateUtil.format(new Date(2024, 5, 1, 9, 32, 4), 'dd/MM HH:mm:ss')).assertEqual('01/06 09:32:04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0207 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0208
     * @tc.name      testPhotosDateFormatExt0208
     * @tc.desc      Formats extended date sample 70 with pattern MM-dd-HH-mm-ss. case 208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0208 begin');
      expect(DateUtil.format(new Date(2024, 9, 14, 21, 3, 57), 'MM-dd-HH-mm-ss')).assertEqual('10-14-21-03-57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0208 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0209
     * @tc.name      testPhotosDateFormatExt0209
     * @tc.desc      Formats extended date sample 70 with pattern MM-dd-HH-mm-ss. case 209
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0209 begin');
      expect(DateUtil.format(new Date(2024, 2, 12, 4, 39, 33), 'MM-dd-HH-mm-ss')).assertEqual('03-12-04-39-33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0209 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0210
     * @tc.name      testPhotosDateFormatExt0210
     * @tc.desc      Formats extended date sample 70 with pattern MM-dd-HH-mm-ss. case 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0210 begin');
      expect(DateUtil.format(new Date(2024, 6, 8, 10, 51, 27), 'MM-dd-HH-mm-ss')).assertEqual('07-08-10-51-27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0210 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0211
     * @tc.name      testPhotosDateFormatExt0211
     * @tc.desc      Formats extended date sample 71 with pattern MM.dd. case 211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0211 begin');
      expect(DateUtil.format(new Date(2024, 10, 15, 22, 10, 10), 'MM.dd')).assertEqual('11.15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0211 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0212
     * @tc.name      testPhotosDateFormatExt0212
     * @tc.desc      Formats extended date sample 71 with pattern MM.dd. case 212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0212 begin');
      expect(DateUtil.format(new Date(2024, 3, 15, 5, 50, 50), 'MM.dd')).assertEqual('04.15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0212 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0213
     * @tc.name      testPhotosDateFormatExt0213
     * @tc.desc      Formats extended date sample 71 with pattern MM.dd. case 213
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0213 begin');
      expect(DateUtil.format(new Date(2024, 7, 15, 11, 10, 50), 'MM.dd')).assertEqual('08.15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0213 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0214
     * @tc.name      testPhotosDateFormatExt0214
     * @tc.desc      Formats extended date sample 72 with pattern HH-mm. case 214
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0214 begin');
      expect(DateUtil.format(new Date(2024, 11, 16, 23, 17, 23), 'HH-mm')).assertEqual('23-17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0214 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0215
     * @tc.name      testPhotosDateFormatExt0215
     * @tc.desc      Formats extended date sample 72 with pattern HH-mm. case 215
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0215 begin');
      expect(DateUtil.format(new Date(2024, 4, 18, 6, 1, 7), 'HH-mm')).assertEqual('06-01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0215 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0216
     * @tc.name      testPhotosDateFormatExt0216
     * @tc.desc      Formats extended date sample 72 with pattern HH-mm. case 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0216 begin');
      expect(DateUtil.format(new Date(2024, 8, 22, 12, 29, 13), 'HH-mm')).assertEqual('12-29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0216 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0217
     * @tc.name      testPhotosDateFormatExt0217
     * @tc.desc      Formats extended date sample 73 with pattern MM/dd HH:mm. case 217
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0217 begin');
      expect(DateUtil.format(new Date(2024, 0, 17, 0, 24, 36), 'MM/dd HH:mm')).assertEqual('01/17 00:24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0217 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0218
     * @tc.name      testPhotosDateFormatExt0218
     * @tc.desc      Formats extended date sample 73 with pattern MM/dd HH:mm. case 218
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0218 begin');
      expect(DateUtil.format(new Date(2024, 5, 21, 7, 12, 24), 'MM/dd HH:mm')).assertEqual('06/21 07:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0218 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0219
     * @tc.name      testPhotosDateFormatExt0219
     * @tc.desc      Formats extended date sample 73 with pattern MM/dd HH:mm. case 219
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0219 begin');
      expect(DateUtil.format(new Date(2024, 9, 1, 13, 48, 36), 'MM/dd HH:mm')).assertEqual('10/01 13:48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0219 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0220
     * @tc.name      testPhotosDateFormatExt0220
     * @tc.desc      Formats extended date sample 74 with pattern dd/MM HH:mm:ss. case 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0220 begin');
      expect(DateUtil.format(new Date(2024, 1, 18, 1, 31, 49), 'dd/MM HH:mm:ss')).assertEqual('18/02 01:31:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0220 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0221
     * @tc.name      testPhotosDateFormatExt0221
     * @tc.desc      Formats extended date sample 74 with pattern dd/MM HH:mm:ss. case 221
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0221 begin');
      expect(DateUtil.format(new Date(2024, 6, 24, 8, 23, 41), 'dd/MM HH:mm:ss')).assertEqual('24/07 08:23:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0221 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0222
     * @tc.name      testPhotosDateFormatExt0222
     * @tc.desc      Formats extended date sample 74 with pattern dd/MM HH:mm:ss. case 222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0222 begin');
      expect(DateUtil.format(new Date(2024, 10, 8, 14, 7, 59), 'dd/MM HH:mm:ss')).assertEqual('08/11 14:07:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0222 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0223
     * @tc.name      testPhotosDateFormatExt0223
     * @tc.desc      Formats extended date sample 75 with pattern MM-dd-HH-mm-ss. case 223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0223 begin');
      expect(DateUtil.format(new Date(2024, 2, 19, 2, 38, 2), 'MM-dd-HH-mm-ss')).assertEqual('03-19-02-38-02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0223 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0224
     * @tc.name      testPhotosDateFormatExt0224
     * @tc.desc      Formats extended date sample 75 with pattern MM-dd-HH-mm-ss. case 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0224 begin');
      expect(DateUtil.format(new Date(2024, 7, 27, 9, 34, 58), 'MM-dd-HH-mm-ss')).assertEqual('08-27-09-34-58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0224 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0225
     * @tc.name      testPhotosDateFormatExt0225
     * @tc.desc      Formats extended date sample 75 with pattern MM-dd-HH-mm-ss. case 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0225 begin');
      expect(DateUtil.format(new Date(2024, 11, 15, 15, 26, 22), 'MM-dd-HH-mm-ss')).assertEqual('12-15-15-26-22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0225 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0226
     * @tc.name      testPhotosDateFormatExt0226
     * @tc.desc      Formats extended date sample 76 with pattern MM.dd. case 226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0226 begin');
      expect(DateUtil.format(new Date(2024, 3, 20, 3, 45, 15), 'MM.dd')).assertEqual('04.20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0226 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0227
     * @tc.name      testPhotosDateFormatExt0227
     * @tc.desc      Formats extended date sample 76 with pattern MM.dd. case 227
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0227 begin');
      expect(DateUtil.format(new Date(2024, 8, 2, 10, 45, 15), 'MM.dd')).assertEqual('09.02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0227 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0228
     * @tc.name      testPhotosDateFormatExt0228
     * @tc.desc      Formats extended date sample 76 with pattern MM.dd. case 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0228 begin');
      expect(DateUtil.format(new Date(2024, 0, 22, 16, 45, 45), 'MM.dd')).assertEqual('01.22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0228 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0229
     * @tc.name      testPhotosDateFormatExt0229
     * @tc.desc      Formats extended date sample 77 with pattern HH-mm. case 229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0229 begin');
      expect(DateUtil.format(new Date(2024, 4, 21, 4, 52, 28), 'HH-mm')).assertEqual('04-52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0229 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0230
     * @tc.name      testPhotosDateFormatExt0230
     * @tc.desc      Formats extended date sample 77 with pattern HH-mm. case 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0230 begin');
      expect(DateUtil.format(new Date(2024, 9, 5, 11, 56, 32), 'HH-mm')).assertEqual('11-56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0230 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0231
     * @tc.name      testPhotosDateFormatExt0231
     * @tc.desc      Formats extended date sample 77 with pattern HH-mm. case 231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0231 begin');
      expect(DateUtil.format(new Date(2024, 1, 1, 17, 4, 8), 'HH-mm')).assertEqual('17-04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0231 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0232
     * @tc.name      testPhotosDateFormatExt0232
     * @tc.desc      Formats extended date sample 78 with pattern MM/dd HH:mm. case 232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0232 begin');
      expect(DateUtil.format(new Date(2024, 5, 22, 5, 59, 41), 'MM/dd HH:mm')).assertEqual('06/22 05:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0232 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0233
     * @tc.name      testPhotosDateFormatExt0233
     * @tc.desc      Formats extended date sample 78 with pattern MM/dd HH:mm. case 233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0233 begin');
      expect(DateUtil.format(new Date(2024, 10, 8, 12, 7, 49), 'MM/dd HH:mm')).assertEqual('11/08 12:07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0233 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0234
     * @tc.name      testPhotosDateFormatExt0234
     * @tc.desc      Formats extended date sample 78 with pattern MM/dd HH:mm. case 234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0234 begin');
      expect(DateUtil.format(new Date(2024, 2, 8, 18, 23, 31), 'MM/dd HH:mm')).assertEqual('03/08 18:23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0234 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0235
     * @tc.name      testPhotosDateFormatExt0235
     * @tc.desc      Formats extended date sample 79 with pattern dd/MM HH:mm:ss. case 235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0235 begin');
      expect(DateUtil.format(new Date(2024, 6, 23, 6, 6, 54), 'dd/MM HH:mm:ss')).assertEqual('23/07 06:06:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0235 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0236
     * @tc.name      testPhotosDateFormatExt0236
     * @tc.desc      Formats extended date sample 79 with pattern dd/MM HH:mm:ss. case 236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0236 begin');
      expect(DateUtil.format(new Date(2024, 11, 11, 13, 18, 6), 'dd/MM HH:mm:ss')).assertEqual('11/12 13:18:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0236 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0237
     * @tc.name      testPhotosDateFormatExt0237
     * @tc.desc      Formats extended date sample 79 with pattern dd/MM HH:mm:ss. case 237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0237 begin');
      expect(DateUtil.format(new Date(2024, 3, 15, 19, 42, 54), 'dd/MM HH:mm:ss')).assertEqual('15/04 19:42:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0237 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0238
     * @tc.name      testPhotosDateFormatExt0238
     * @tc.desc      Formats extended date sample 80 with pattern MM-dd-HH-mm-ss. case 238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0238 begin');
      expect(DateUtil.format(new Date(2024, 7, 24, 7, 13, 7), 'MM-dd-HH-mm-ss')).assertEqual('08-24-07-13-07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0238 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0239
     * @tc.name      testPhotosDateFormatExt0239
     * @tc.desc      Formats extended date sample 80 with pattern MM-dd-HH-mm-ss. case 239
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0239 begin');
      expect(DateUtil.format(new Date(2024, 0, 14, 14, 29, 23), 'MM-dd-HH-mm-ss')).assertEqual('01-14-14-29-23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0239 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_EXT_0240
     * @tc.name      testPhotosDateFormatExt0240
     * @tc.desc      Formats extended date sample 80 with pattern MM-dd-HH-mm-ss. case 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatExt0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0240 begin');
      expect(DateUtil.format(new Date(2024, 4, 22, 20, 1, 17), 'MM-dd-HH-mm-ss')).assertEqual('05-22-20-01-17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatExt0240 end');
    })


    /**
