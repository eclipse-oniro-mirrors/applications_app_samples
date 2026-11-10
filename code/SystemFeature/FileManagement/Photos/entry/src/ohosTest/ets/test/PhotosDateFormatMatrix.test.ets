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

const TAG = '[Sample_PhotosDateFormatMatrixTest]';
const DOMAIN = 0xF811;

export default function PhotosDateFormatMatrixTest(): void {
  describe('PhotosDateFormatMatrixTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0001
     * @tc.name      testPhotosDateFormatMatrix0001
     * @tc.desc      Formats fixed date matrix sample 1 with pattern MM/dd HH:mm:ss. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0001 begin');
      expect(DateUtil.format(new Date(2024, 0, 1, 0, 0, 0), 'MM/dd HH:mm:ss')).assertEqual('01/01 00:00:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0002
     * @tc.name      testPhotosDateFormatMatrix0002
     * @tc.desc      Formats fixed date matrix sample 1 with pattern MM/dd HH:mm:ss. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0002 begin');
      expect(DateUtil.format(new Date(2024, 3, 1, 5, 0, 0), 'MM/dd HH:mm:ss')).assertEqual('04/01 05:00:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0003
     * @tc.name      testPhotosDateFormatMatrix0003
     * @tc.desc      Formats fixed date matrix sample 1 with pattern MM/dd HH:mm:ss. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0003 begin');
      expect(DateUtil.format(new Date(2024, 7, 1, 9, 0, 0), 'MM/dd HH:mm:ss')).assertEqual('08/01 09:00:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0003 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0004
     * @tc.name      testPhotosDateFormatMatrix0004
     * @tc.desc      Formats fixed date matrix sample 2 with pattern MM-dd HH:mm. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0004 begin');
      expect(DateUtil.format(new Date(2024, 1, 2, 1, 7, 13), 'MM-dd HH:mm')).assertEqual('02-02 01:07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0005
     * @tc.name      testPhotosDateFormatMatrix0005
     * @tc.desc      Formats fixed date matrix sample 2 with pattern MM-dd HH:mm. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0005 begin');
      expect(DateUtil.format(new Date(2024, 4, 6, 6, 11, 17), 'MM-dd HH:mm')).assertEqual('05-06 06:11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0006
     * @tc.name      testPhotosDateFormatMatrix0006
     * @tc.desc      Formats fixed date matrix sample 2 with pattern MM-dd HH:mm. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0006 begin');
      expect(DateUtil.format(new Date(2024, 8, 10, 10, 19, 23), 'MM-dd HH:mm')).assertEqual('09-10 10:19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0006 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0007
     * @tc.name      testPhotosDateFormatMatrix0007
     * @tc.desc      Formats fixed date matrix sample 3 with pattern HH:mm:ss. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0007 begin');
      expect(DateUtil.format(new Date(2024, 2, 3, 2, 14, 26), 'HH:mm:ss')).assertEqual('02:14:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0008
     * @tc.name      testPhotosDateFormatMatrix0008
     * @tc.desc      Formats fixed date matrix sample 3 with pattern HH:mm:ss. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0008 begin');
      expect(DateUtil.format(new Date(2024, 5, 11, 7, 22, 34), 'HH:mm:ss')).assertEqual('07:22:34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0009
     * @tc.name      testPhotosDateFormatMatrix0009
     * @tc.desc      Formats fixed date matrix sample 3 with pattern HH:mm:ss. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0009 begin');
      expect(DateUtil.format(new Date(2024, 9, 19, 11, 38, 46), 'HH:mm:ss')).assertEqual('11:38:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0009 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0010
     * @tc.name      testPhotosDateFormatMatrix0010
     * @tc.desc      Formats fixed date matrix sample 4 with pattern MM/dd. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0010 begin');
      expect(DateUtil.format(new Date(2024, 3, 4, 3, 21, 39), 'MM/dd')).assertEqual('04/04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0011
     * @tc.name      testPhotosDateFormatMatrix0011
     * @tc.desc      Formats fixed date matrix sample 4 with pattern MM/dd. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0011 begin');
      expect(DateUtil.format(new Date(2024, 6, 16, 8, 33, 51), 'MM/dd')).assertEqual('07/16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0012
     * @tc.name      testPhotosDateFormatMatrix0012
     * @tc.desc      Formats fixed date matrix sample 4 with pattern MM/dd. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0012 begin');
      expect(DateUtil.format(new Date(2024, 10, 28, 12, 57, 9), 'MM/dd')).assertEqual('11/28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0012 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0013
     * @tc.name      testPhotosDateFormatMatrix0013
     * @tc.desc      Formats fixed date matrix sample 5 with pattern HH:mm. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0013 begin');
      expect(DateUtil.format(new Date(2024, 4, 5, 4, 28, 52), 'HH:mm')).assertEqual('04:28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0014
     * @tc.name      testPhotosDateFormatMatrix0014
     * @tc.desc      Formats fixed date matrix sample 5 with pattern HH:mm. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0014 begin');
      expect(DateUtil.format(new Date(2024, 7, 21, 9, 44, 8), 'HH:mm')).assertEqual('09:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0015
     * @tc.name      testPhotosDateFormatMatrix0015
     * @tc.desc      Formats fixed date matrix sample 5 with pattern HH:mm. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0015 begin');
      expect(DateUtil.format(new Date(2024, 11, 9, 13, 16, 32), 'HH:mm')).assertEqual('13:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0016
     * @tc.name      testPhotosDateFormatMatrix0016
     * @tc.desc      Formats fixed date matrix sample 6 with pattern MM/dd HH:mm:ss. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0016 begin');
      expect(DateUtil.format(new Date(2024, 5, 6, 5, 35, 5), 'MM/dd HH:mm:ss')).assertEqual('06/06 05:35:05');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0017
     * @tc.name      testPhotosDateFormatMatrix0017
     * @tc.desc      Formats fixed date matrix sample 6 with pattern MM/dd HH:mm:ss. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0017 begin');
      expect(DateUtil.format(new Date(2024, 8, 26, 10, 55, 25), 'MM/dd HH:mm:ss')).assertEqual('09/26 10:55:25');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0018
     * @tc.name      testPhotosDateFormatMatrix0018
     * @tc.desc      Formats fixed date matrix sample 6 with pattern MM/dd HH:mm:ss. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0018 begin');
      expect(DateUtil.format(new Date(2024, 0, 18, 14, 35, 55), 'MM/dd HH:mm:ss')).assertEqual('01/18 14:35:55');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0018 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0019
     * @tc.name      testPhotosDateFormatMatrix0019
     * @tc.desc      Formats fixed date matrix sample 7 with pattern MM-dd HH:mm. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0019 begin');
      expect(DateUtil.format(new Date(2024, 6, 7, 6, 42, 18), 'MM-dd HH:mm')).assertEqual('07-07 06:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0020
     * @tc.name      testPhotosDateFormatMatrix0020
     * @tc.desc      Formats fixed date matrix sample 7 with pattern MM-dd HH:mm. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0020 begin');
      expect(DateUtil.format(new Date(2024, 9, 3, 11, 6, 42), 'MM-dd HH:mm')).assertEqual('10-03 11:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0021
     * @tc.name      testPhotosDateFormatMatrix0021
     * @tc.desc      Formats fixed date matrix sample 7 with pattern MM-dd HH:mm. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0021 begin');
      expect(DateUtil.format(new Date(2024, 1, 27, 15, 54, 18), 'MM-dd HH:mm')).assertEqual('02-27 15:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0021 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0022
     * @tc.name      testPhotosDateFormatMatrix0022
     * @tc.desc      Formats fixed date matrix sample 8 with pattern HH:mm:ss. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0022 begin');
      expect(DateUtil.format(new Date(2024, 7, 8, 7, 49, 31), 'HH:mm:ss')).assertEqual('07:49:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0023
     * @tc.name      testPhotosDateFormatMatrix0023
     * @tc.desc      Formats fixed date matrix sample 8 with pattern HH:mm:ss. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0023 begin');
      expect(DateUtil.format(new Date(2024, 10, 8, 12, 17, 59), 'HH:mm:ss')).assertEqual('12:17:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0024
     * @tc.name      testPhotosDateFormatMatrix0024
     * @tc.desc      Formats fixed date matrix sample 8 with pattern HH:mm:ss. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0024 begin');
      expect(DateUtil.format(new Date(2024, 2, 8, 16, 13, 41), 'HH:mm:ss')).assertEqual('16:13:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0024 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0025
     * @tc.name      testPhotosDateFormatMatrix0025
     * @tc.desc      Formats fixed date matrix sample 9 with pattern MM/dd. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0025 begin');
      expect(DateUtil.format(new Date(2024, 8, 9, 8, 56, 44), 'MM/dd')).assertEqual('09/09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0026
     * @tc.name      testPhotosDateFormatMatrix0026
     * @tc.desc      Formats fixed date matrix sample 9 with pattern MM/dd. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0026 begin');
      expect(DateUtil.format(new Date(2024, 11, 13, 13, 28, 16), 'MM/dd')).assertEqual('12/13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0027
     * @tc.name      testPhotosDateFormatMatrix0027
     * @tc.desc      Formats fixed date matrix sample 9 with pattern MM/dd. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0027 begin');
      expect(DateUtil.format(new Date(2024, 3, 17, 17, 32, 4), 'MM/dd')).assertEqual('04/17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0027 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0028
     * @tc.name      testPhotosDateFormatMatrix0028
     * @tc.desc      Formats fixed date matrix sample 10 with pattern HH:mm. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0028 begin');
      expect(DateUtil.format(new Date(2024, 9, 10, 9, 3, 57), 'HH:mm')).assertEqual('09:03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0029
     * @tc.name      testPhotosDateFormatMatrix0029
     * @tc.desc      Formats fixed date matrix sample 10 with pattern HH:mm. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0029 begin');
      expect(DateUtil.format(new Date(2024, 0, 18, 14, 39, 33), 'HH:mm')).assertEqual('14:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0030
     * @tc.name      testPhotosDateFormatMatrix0030
     * @tc.desc      Formats fixed date matrix sample 10 with pattern HH:mm. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0030 begin');
      expect(DateUtil.format(new Date(2024, 4, 26, 18, 51, 27), 'HH:mm')).assertEqual('18:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0031
     * @tc.name      testPhotosDateFormatMatrix0031
     * @tc.desc      Formats fixed date matrix sample 11 with pattern MM/dd HH:mm:ss. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0031 begin');
      expect(DateUtil.format(new Date(2024, 10, 11, 10, 10, 10), 'MM/dd HH:mm:ss')).assertEqual('11/11 10:10:10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0032
     * @tc.name      testPhotosDateFormatMatrix0032
     * @tc.desc      Formats fixed date matrix sample 11 with pattern MM/dd HH:mm:ss. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0032 begin');
      expect(DateUtil.format(new Date(2024, 1, 23, 15, 50, 50), 'MM/dd HH:mm:ss')).assertEqual('02/23 15:50:50');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0033
     * @tc.name      testPhotosDateFormatMatrix0033
     * @tc.desc      Formats fixed date matrix sample 11 with pattern MM/dd HH:mm:ss. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0033 begin');
      expect(DateUtil.format(new Date(2024, 5, 7, 19, 10, 50), 'MM/dd HH:mm:ss')).assertEqual('06/07 19:10:50');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0033 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0034
     * @tc.name      testPhotosDateFormatMatrix0034
     * @tc.desc      Formats fixed date matrix sample 12 with pattern MM-dd HH:mm. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0034 begin');
      expect(DateUtil.format(new Date(2024, 11, 12, 11, 17, 23), 'MM-dd HH:mm')).assertEqual('12-12 11:17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0035
     * @tc.name      testPhotosDateFormatMatrix0035
     * @tc.desc      Formats fixed date matrix sample 12 with pattern MM-dd HH:mm. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0035 begin');
      expect(DateUtil.format(new Date(2024, 2, 28, 16, 1, 7), 'MM-dd HH:mm')).assertEqual('03-28 16:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0036
     * @tc.name      testPhotosDateFormatMatrix0036
     * @tc.desc      Formats fixed date matrix sample 12 with pattern MM-dd HH:mm. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0036 begin');
      expect(DateUtil.format(new Date(2024, 6, 16, 20, 29, 13), 'MM-dd HH:mm')).assertEqual('07-16 20:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0036 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0037
     * @tc.name      testPhotosDateFormatMatrix0037
     * @tc.desc      Formats fixed date matrix sample 13 with pattern HH:mm:ss. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0037 begin');
      expect(DateUtil.format(new Date(2024, 0, 13, 12, 24, 36), 'HH:mm:ss')).assertEqual('12:24:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0038
     * @tc.name      testPhotosDateFormatMatrix0038
     * @tc.desc      Formats fixed date matrix sample 13 with pattern HH:mm:ss. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0038 begin');
      expect(DateUtil.format(new Date(2024, 3, 5, 17, 12, 24), 'HH:mm:ss')).assertEqual('17:12:24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0039
     * @tc.name      testPhotosDateFormatMatrix0039
     * @tc.desc      Formats fixed date matrix sample 13 with pattern HH:mm:ss. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0039 begin');
      expect(DateUtil.format(new Date(2024, 7, 25, 21, 48, 36), 'HH:mm:ss')).assertEqual('21:48:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0039 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0040
     * @tc.name      testPhotosDateFormatMatrix0040
     * @tc.desc      Formats fixed date matrix sample 14 with pattern MM/dd. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0040 begin');
      expect(DateUtil.format(new Date(2024, 1, 14, 13, 31, 49), 'MM/dd')).assertEqual('02/14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0041
     * @tc.name      testPhotosDateFormatMatrix0041
     * @tc.desc      Formats fixed date matrix sample 14 with pattern MM/dd. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0041 begin');
      expect(DateUtil.format(new Date(2024, 4, 10, 18, 23, 41), 'MM/dd')).assertEqual('05/10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0042
     * @tc.name      testPhotosDateFormatMatrix0042
     * @tc.desc      Formats fixed date matrix sample 14 with pattern MM/dd. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0042 begin');
      expect(DateUtil.format(new Date(2024, 8, 6, 22, 7, 59), 'MM/dd')).assertEqual('09/06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0042 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0043
     * @tc.name      testPhotosDateFormatMatrix0043
     * @tc.desc      Formats fixed date matrix sample 15 with pattern HH:mm. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0043 begin');
      expect(DateUtil.format(new Date(2024, 2, 15, 14, 38, 2), 'HH:mm')).assertEqual('14:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0044
     * @tc.name      testPhotosDateFormatMatrix0044
     * @tc.desc      Formats fixed date matrix sample 15 with pattern HH:mm. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0044 begin');
      expect(DateUtil.format(new Date(2024, 5, 15, 19, 34, 58), 'HH:mm')).assertEqual('19:34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0045
     * @tc.name      testPhotosDateFormatMatrix0045
     * @tc.desc      Formats fixed date matrix sample 15 with pattern HH:mm. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0045 begin');
      expect(DateUtil.format(new Date(2024, 9, 15, 23, 26, 22), 'HH:mm')).assertEqual('23:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0046
     * @tc.name      testPhotosDateFormatMatrix0046
     * @tc.desc      Formats fixed date matrix sample 16 with pattern MM/dd HH:mm:ss. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0046 begin');
      expect(DateUtil.format(new Date(2024, 3, 16, 15, 45, 15), 'MM/dd HH:mm:ss')).assertEqual('04/16 15:45:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0047
     * @tc.name      testPhotosDateFormatMatrix0047
     * @tc.desc      Formats fixed date matrix sample 16 with pattern MM/dd HH:mm:ss. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0047 begin');
      expect(DateUtil.format(new Date(2024, 6, 20, 20, 45, 15), 'MM/dd HH:mm:ss')).assertEqual('07/20 20:45:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0048
     * @tc.name      testPhotosDateFormatMatrix0048
     * @tc.desc      Formats fixed date matrix sample 16 with pattern MM/dd HH:mm:ss. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0048 begin');
      expect(DateUtil.format(new Date(2024, 10, 24, 0, 45, 45), 'MM/dd HH:mm:ss')).assertEqual('11/24 00:45:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0048 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0049
     * @tc.name      testPhotosDateFormatMatrix0049
     * @tc.desc      Formats fixed date matrix sample 17 with pattern MM-dd HH:mm. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0049 begin');
      expect(DateUtil.format(new Date(2024, 4, 17, 16, 52, 28), 'MM-dd HH:mm')).assertEqual('05-17 16:52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0050
     * @tc.name      testPhotosDateFormatMatrix0050
     * @tc.desc      Formats fixed date matrix sample 17 with pattern MM-dd HH:mm. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0050 begin');
      expect(DateUtil.format(new Date(2024, 7, 25, 21, 56, 32), 'MM-dd HH:mm')).assertEqual('08-25 21:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0051
     * @tc.name      testPhotosDateFormatMatrix0051
     * @tc.desc      Formats fixed date matrix sample 17 with pattern MM-dd HH:mm. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0051 begin');
      expect(DateUtil.format(new Date(2024, 11, 5, 1, 4, 8), 'MM-dd HH:mm')).assertEqual('12-05 01:04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0051 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0052
     * @tc.name      testPhotosDateFormatMatrix0052
     * @tc.desc      Formats fixed date matrix sample 18 with pattern HH:mm:ss. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0052 begin');
      expect(DateUtil.format(new Date(2024, 5, 18, 17, 59, 41), 'HH:mm:ss')).assertEqual('17:59:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0053
     * @tc.name      testPhotosDateFormatMatrix0053
     * @tc.desc      Formats fixed date matrix sample 18 with pattern HH:mm:ss. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0053 begin');
      expect(DateUtil.format(new Date(2024, 8, 2, 22, 7, 49), 'HH:mm:ss')).assertEqual('22:07:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0054
     * @tc.name      testPhotosDateFormatMatrix0054
     * @tc.desc      Formats fixed date matrix sample 18 with pattern HH:mm:ss. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0054 begin');
      expect(DateUtil.format(new Date(2024, 0, 14, 2, 23, 31), 'HH:mm:ss')).assertEqual('02:23:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0054 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0055
     * @tc.name      testPhotosDateFormatMatrix0055
     * @tc.desc      Formats fixed date matrix sample 19 with pattern MM/dd. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0055 begin');
      expect(DateUtil.format(new Date(2024, 6, 19, 18, 6, 54), 'MM/dd')).assertEqual('07/19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0056
     * @tc.name      testPhotosDateFormatMatrix0056
     * @tc.desc      Formats fixed date matrix sample 19 with pattern MM/dd. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0056 begin');
      expect(DateUtil.format(new Date(2024, 9, 7, 23, 18, 6), 'MM/dd')).assertEqual('10/07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0057
     * @tc.name      testPhotosDateFormatMatrix0057
     * @tc.desc      Formats fixed date matrix sample 19 with pattern MM/dd. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0057 begin');
      expect(DateUtil.format(new Date(2024, 1, 23, 3, 42, 54), 'MM/dd')).assertEqual('02/23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0057 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0058
     * @tc.name      testPhotosDateFormatMatrix0058
     * @tc.desc      Formats fixed date matrix sample 20 with pattern HH:mm. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0058 begin');
      expect(DateUtil.format(new Date(2024, 7, 20, 19, 13, 7), 'HH:mm')).assertEqual('19:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0059
     * @tc.name      testPhotosDateFormatMatrix0059
     * @tc.desc      Formats fixed date matrix sample 20 with pattern HH:mm. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0059 begin');
      expect(DateUtil.format(new Date(2024, 10, 12, 0, 29, 23), 'HH:mm')).assertEqual('00:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0060
     * @tc.name      testPhotosDateFormatMatrix0060
     * @tc.desc      Formats fixed date matrix sample 20 with pattern HH:mm. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0060 begin');
      expect(DateUtil.format(new Date(2024, 2, 4, 4, 1, 17), 'HH:mm')).assertEqual('04:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0061
     * @tc.name      testPhotosDateFormatMatrix0061
     * @tc.desc      Formats fixed date matrix sample 21 with pattern MM/dd HH:mm:ss. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0061 begin');
      expect(DateUtil.format(new Date(2024, 8, 21, 20, 20, 20), 'MM/dd HH:mm:ss')).assertEqual('09/21 20:20:20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0062
     * @tc.name      testPhotosDateFormatMatrix0062
     * @tc.desc      Formats fixed date matrix sample 21 with pattern MM/dd HH:mm:ss. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0062 begin');
      expect(DateUtil.format(new Date(2024, 11, 17, 1, 40, 40), 'MM/dd HH:mm:ss')).assertEqual('12/17 01:40:40');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0063
     * @tc.name      testPhotosDateFormatMatrix0063
     * @tc.desc      Formats fixed date matrix sample 21 with pattern MM/dd HH:mm:ss. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0063 begin');
      expect(DateUtil.format(new Date(2024, 3, 13, 5, 20, 40), 'MM/dd HH:mm:ss')).assertEqual('04/13 05:20:40');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0063 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0064
     * @tc.name      testPhotosDateFormatMatrix0064
     * @tc.desc      Formats fixed date matrix sample 22 with pattern MM-dd HH:mm. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0064 begin');
      expect(DateUtil.format(new Date(2024, 9, 22, 21, 27, 33), 'MM-dd HH:mm')).assertEqual('10-22 21:27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0065
     * @tc.name      testPhotosDateFormatMatrix0065
     * @tc.desc      Formats fixed date matrix sample 22 with pattern MM-dd HH:mm. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0065 begin');
      expect(DateUtil.format(new Date(2024, 0, 22, 2, 51, 57), 'MM-dd HH:mm')).assertEqual('01-22 02:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0066
     * @tc.name      testPhotosDateFormatMatrix0066
     * @tc.desc      Formats fixed date matrix sample 22 with pattern MM-dd HH:mm. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0066 begin');
      expect(DateUtil.format(new Date(2024, 4, 22, 6, 39, 3), 'MM-dd HH:mm')).assertEqual('05-22 06:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0066 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0067
     * @tc.name      testPhotosDateFormatMatrix0067
     * @tc.desc      Formats fixed date matrix sample 23 with pattern HH:mm:ss. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0067 begin');
      expect(DateUtil.format(new Date(2024, 10, 23, 22, 34, 46), 'HH:mm:ss')).assertEqual('22:34:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0068
     * @tc.name      testPhotosDateFormatMatrix0068
     * @tc.desc      Formats fixed date matrix sample 23 with pattern HH:mm:ss. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0068 begin');
      expect(DateUtil.format(new Date(2024, 1, 27, 3, 2, 14), 'HH:mm:ss')).assertEqual('03:02:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0069
     * @tc.name      testPhotosDateFormatMatrix0069
     * @tc.desc      Formats fixed date matrix sample 23 with pattern HH:mm:ss. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0069 begin');
      expect(DateUtil.format(new Date(2024, 5, 3, 7, 58, 26), 'HH:mm:ss')).assertEqual('07:58:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0069 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0070
     * @tc.name      testPhotosDateFormatMatrix0070
     * @tc.desc      Formats fixed date matrix sample 24 with pattern MM/dd. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0070 begin');
      expect(DateUtil.format(new Date(2024, 11, 24, 23, 41, 59), 'MM/dd')).assertEqual('12/24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0071
     * @tc.name      testPhotosDateFormatMatrix0071
     * @tc.desc      Formats fixed date matrix sample 24 with pattern MM/dd. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0071 begin');
      expect(DateUtil.format(new Date(2024, 2, 4, 4, 13, 31), 'MM/dd')).assertEqual('03/04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0072
     * @tc.name      testPhotosDateFormatMatrix0072
     * @tc.desc      Formats fixed date matrix sample 24 with pattern MM/dd. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0072 begin');
      expect(DateUtil.format(new Date(2024, 6, 12, 8, 17, 49), 'MM/dd')).assertEqual('07/12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0072 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0073
     * @tc.name      testPhotosDateFormatMatrix0073
     * @tc.desc      Formats fixed date matrix sample 25 with pattern HH:mm. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateFormatMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0073 begin');
      expect(DateUtil.format(new Date(2024, 0, 25, 0, 48, 12), 'HH:mm')).assertEqual('00:48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateFormatMatrix0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_FORMAT_0074
     * @tc.name      testPhotosDateFormatMatrix0074
     * @tc.desc      Formats fixed date matrix sample 25 with pattern HH:mm. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
