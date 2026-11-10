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

