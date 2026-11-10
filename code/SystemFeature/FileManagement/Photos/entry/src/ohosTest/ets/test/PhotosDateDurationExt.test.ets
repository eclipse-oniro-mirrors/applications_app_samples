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

const TAG = '[Sample_PhotosDateDurationExtTest]';
const DOMAIN = 0xF811;

export default function PhotosDateDurationExtTest(): void {
  describe('PhotosDateDurationExtTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0001
     * @tc.name      testPhotosDateDurationExt0001
     * @tc.desc      Formats extended duration sample 1. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0001 begin');
      expect(DateUtil.getFormattedDuration(3599999)).assertEqual('59:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0002
     * @tc.name      testPhotosDateDurationExt0002
     * @tc.desc      Formats extended duration sample 1. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0002 begin');
      expect(DateUtil.getFormattedDuration(3600000)).assertEqual('1:00:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0003
     * @tc.name      testPhotosDateDurationExt0003
     * @tc.desc      Formats extended duration sample 1. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0003 begin');
      expect(DateUtil.getFormattedDuration(3600999)).assertEqual('1:00:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0004
     * @tc.name      testPhotosDateDurationExt0004
     * @tc.desc      Formats extended duration sample 1. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0004 begin');
      expect(DateUtil.getFormattedDuration(3661000)).assertEqual('1:01:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0004 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0005
     * @tc.name      testPhotosDateDurationExt0005
     * @tc.desc      Formats extended duration sample 2. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0005 begin');
      expect(DateUtil.getFormattedDuration(3696999)).assertEqual('1:01:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0006
     * @tc.name      testPhotosDateDurationExt0006
     * @tc.desc      Formats extended duration sample 2. case 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0006 begin');
      expect(DateUtil.getFormattedDuration(3697000)).assertEqual('1:01:37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0007
     * @tc.name      testPhotosDateDurationExt0007
     * @tc.desc      Formats extended duration sample 2. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0007 begin');
      expect(DateUtil.getFormattedDuration(3697999)).assertEqual('1:01:37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0008
     * @tc.name      testPhotosDateDurationExt0008
     * @tc.desc      Formats extended duration sample 2. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0008 begin');
      expect(DateUtil.getFormattedDuration(3758000)).assertEqual('1:02:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0008 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0009
     * @tc.name      testPhotosDateDurationExt0009
     * @tc.desc      Formats extended duration sample 3. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0009 begin');
      expect(DateUtil.getFormattedDuration(3793999)).assertEqual('1:03:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0010
     * @tc.name      testPhotosDateDurationExt0010
     * @tc.desc      Formats extended duration sample 3. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0010 begin');
      expect(DateUtil.getFormattedDuration(3794000)).assertEqual('1:03:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0011
     * @tc.name      testPhotosDateDurationExt0011
     * @tc.desc      Formats extended duration sample 3. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0011 begin');
      expect(DateUtil.getFormattedDuration(3794999)).assertEqual('1:03:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0012
     * @tc.name      testPhotosDateDurationExt0012
     * @tc.desc      Formats extended duration sample 3. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0012 begin');
      expect(DateUtil.getFormattedDuration(3855000)).assertEqual('1:04:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0012 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0013
     * @tc.name      testPhotosDateDurationExt0013
     * @tc.desc      Formats extended duration sample 4. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0013 begin');
      expect(DateUtil.getFormattedDuration(3890999)).assertEqual('1:04:50');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0014
     * @tc.name      testPhotosDateDurationExt0014
     * @tc.desc      Formats extended duration sample 4. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0014 begin');
      expect(DateUtil.getFormattedDuration(3891000)).assertEqual('1:04:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0015
     * @tc.name      testPhotosDateDurationExt0015
     * @tc.desc      Formats extended duration sample 4. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0015 begin');
      expect(DateUtil.getFormattedDuration(3891999)).assertEqual('1:04:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0016
     * @tc.name      testPhotosDateDurationExt0016
     * @tc.desc      Formats extended duration sample 4. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0016 begin');
      expect(DateUtil.getFormattedDuration(3952000)).assertEqual('1:05:52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0016 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0017
     * @tc.name      testPhotosDateDurationExt0017
     * @tc.desc      Formats extended duration sample 5. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0017 begin');
      expect(DateUtil.getFormattedDuration(3987999)).assertEqual('1:06:27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0018
     * @tc.name      testPhotosDateDurationExt0018
     * @tc.desc      Formats extended duration sample 5. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0018 begin');
      expect(DateUtil.getFormattedDuration(3988000)).assertEqual('1:06:28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0019
     * @tc.name      testPhotosDateDurationExt0019
     * @tc.desc      Formats extended duration sample 5. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0019 begin');
      expect(DateUtil.getFormattedDuration(3988999)).assertEqual('1:06:28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0020
     * @tc.name      testPhotosDateDurationExt0020
     * @tc.desc      Formats extended duration sample 5. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0020 begin');
      expect(DateUtil.getFormattedDuration(4049000)).assertEqual('1:07:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0020 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0021
     * @tc.name      testPhotosDateDurationExt0021
     * @tc.desc      Formats extended duration sample 6. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0021 begin');
      expect(DateUtil.getFormattedDuration(4084999)).assertEqual('1:08:04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0022
     * @tc.name      testPhotosDateDurationExt0022
     * @tc.desc      Formats extended duration sample 6. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0022 begin');
      expect(DateUtil.getFormattedDuration(4085000)).assertEqual('1:08:05');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0023
     * @tc.name      testPhotosDateDurationExt0023
     * @tc.desc      Formats extended duration sample 6. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0023 begin');
      expect(DateUtil.getFormattedDuration(4085999)).assertEqual('1:08:05');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0024
     * @tc.name      testPhotosDateDurationExt0024
     * @tc.desc      Formats extended duration sample 6. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0024 begin');
      expect(DateUtil.getFormattedDuration(4146000)).assertEqual('1:09:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0024 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0025
     * @tc.name      testPhotosDateDurationExt0025
     * @tc.desc      Formats extended duration sample 7. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0025 begin');
      expect(DateUtil.getFormattedDuration(4181999)).assertEqual('1:09:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0026
     * @tc.name      testPhotosDateDurationExt0026
     * @tc.desc      Formats extended duration sample 7. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0026 begin');
      expect(DateUtil.getFormattedDuration(4182000)).assertEqual('1:09:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0027
     * @tc.name      testPhotosDateDurationExt0027
     * @tc.desc      Formats extended duration sample 7. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0027 begin');
      expect(DateUtil.getFormattedDuration(4182999)).assertEqual('1:09:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0028
     * @tc.name      testPhotosDateDurationExt0028
     * @tc.desc      Formats extended duration sample 7. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0028 begin');
      expect(DateUtil.getFormattedDuration(4243000)).assertEqual('1:10:43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0028 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0029
     * @tc.name      testPhotosDateDurationExt0029
     * @tc.desc      Formats extended duration sample 8. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0029 begin');
      expect(DateUtil.getFormattedDuration(4278999)).assertEqual('1:11:18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0030
     * @tc.name      testPhotosDateDurationExt0030
     * @tc.desc      Formats extended duration sample 8. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0030 begin');
      expect(DateUtil.getFormattedDuration(4279000)).assertEqual('1:11:19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0031
     * @tc.name      testPhotosDateDurationExt0031
     * @tc.desc      Formats extended duration sample 8. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0031 begin');
      expect(DateUtil.getFormattedDuration(4279999)).assertEqual('1:11:19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0032
     * @tc.name      testPhotosDateDurationExt0032
     * @tc.desc      Formats extended duration sample 8. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0032 begin');
      expect(DateUtil.getFormattedDuration(4340000)).assertEqual('1:12:20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0032 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0033
     * @tc.name      testPhotosDateDurationExt0033
     * @tc.desc      Formats extended duration sample 9. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0033 begin');
      expect(DateUtil.getFormattedDuration(4375999)).assertEqual('1:12:55');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0034
     * @tc.name      testPhotosDateDurationExt0034
     * @tc.desc      Formats extended duration sample 9. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0034 begin');
      expect(DateUtil.getFormattedDuration(4376000)).assertEqual('1:12:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0035
     * @tc.name      testPhotosDateDurationExt0035
     * @tc.desc      Formats extended duration sample 9. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0035 begin');
      expect(DateUtil.getFormattedDuration(4376999)).assertEqual('1:12:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0036
     * @tc.name      testPhotosDateDurationExt0036
     * @tc.desc      Formats extended duration sample 9. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0036 begin');
      expect(DateUtil.getFormattedDuration(4437000)).assertEqual('1:13:57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0036 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0037
     * @tc.name      testPhotosDateDurationExt0037
     * @tc.desc      Formats extended duration sample 10. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0037 begin');
      expect(DateUtil.getFormattedDuration(4472999)).assertEqual('1:14:32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0038
     * @tc.name      testPhotosDateDurationExt0038
     * @tc.desc      Formats extended duration sample 10. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0038 begin');
      expect(DateUtil.getFormattedDuration(4473000)).assertEqual('1:14:33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0039
     * @tc.name      testPhotosDateDurationExt0039
     * @tc.desc      Formats extended duration sample 10. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0039 begin');
      expect(DateUtil.getFormattedDuration(4473999)).assertEqual('1:14:33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0040
     * @tc.name      testPhotosDateDurationExt0040
     * @tc.desc      Formats extended duration sample 10. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0040 begin');
      expect(DateUtil.getFormattedDuration(4534000)).assertEqual('1:15:34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0040 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0041
     * @tc.name      testPhotosDateDurationExt0041
     * @tc.desc      Formats extended duration sample 11. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0041 begin');
      expect(DateUtil.getFormattedDuration(4569999)).assertEqual('1:16:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0042
     * @tc.name      testPhotosDateDurationExt0042
     * @tc.desc      Formats extended duration sample 11. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0042 begin');
      expect(DateUtil.getFormattedDuration(4570000)).assertEqual('1:16:10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0043
     * @tc.name      testPhotosDateDurationExt0043
     * @tc.desc      Formats extended duration sample 11. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0043 begin');
      expect(DateUtil.getFormattedDuration(4570999)).assertEqual('1:16:10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0044
     * @tc.name      testPhotosDateDurationExt0044
     * @tc.desc      Formats extended duration sample 11. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0044 begin');
      expect(DateUtil.getFormattedDuration(4631000)).assertEqual('1:17:11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0044 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0045
     * @tc.name      testPhotosDateDurationExt0045
     * @tc.desc      Formats extended duration sample 12. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0045 begin');
      expect(DateUtil.getFormattedDuration(4666999)).assertEqual('1:17:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0046
     * @tc.name      testPhotosDateDurationExt0046
     * @tc.desc      Formats extended duration sample 12. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0046 begin');
      expect(DateUtil.getFormattedDuration(4667000)).assertEqual('1:17:47');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0047
     * @tc.name      testPhotosDateDurationExt0047
     * @tc.desc      Formats extended duration sample 12. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0047 begin');
      expect(DateUtil.getFormattedDuration(4667999)).assertEqual('1:17:47');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0048
     * @tc.name      testPhotosDateDurationExt0048
     * @tc.desc      Formats extended duration sample 12. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0048 begin');
      expect(DateUtil.getFormattedDuration(4728000)).assertEqual('1:18:48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0048 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0049
     * @tc.name      testPhotosDateDurationExt0049
     * @tc.desc      Formats extended duration sample 13. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0049 begin');
      expect(DateUtil.getFormattedDuration(4763999)).assertEqual('1:19:23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0050
     * @tc.name      testPhotosDateDurationExt0050
     * @tc.desc      Formats extended duration sample 13. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0050 begin');
      expect(DateUtil.getFormattedDuration(4764000)).assertEqual('1:19:24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0051
     * @tc.name      testPhotosDateDurationExt0051
     * @tc.desc      Formats extended duration sample 13. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0051 begin');
      expect(DateUtil.getFormattedDuration(4764999)).assertEqual('1:19:24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0052
     * @tc.name      testPhotosDateDurationExt0052
     * @tc.desc      Formats extended duration sample 13. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0052 begin');
      expect(DateUtil.getFormattedDuration(4825000)).assertEqual('1:20:25');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0052 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0053
     * @tc.name      testPhotosDateDurationExt0053
     * @tc.desc      Formats extended duration sample 14. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0053 begin');
      expect(DateUtil.getFormattedDuration(4860999)).assertEqual('1:21:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0054
     * @tc.name      testPhotosDateDurationExt0054
     * @tc.desc      Formats extended duration sample 14. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0054 begin');
      expect(DateUtil.getFormattedDuration(4861000)).assertEqual('1:21:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0055
     * @tc.name      testPhotosDateDurationExt0055
     * @tc.desc      Formats extended duration sample 14. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0055 begin');
      expect(DateUtil.getFormattedDuration(4861999)).assertEqual('1:21:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0056
     * @tc.name      testPhotosDateDurationExt0056
     * @tc.desc      Formats extended duration sample 14. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0056 begin');
      expect(DateUtil.getFormattedDuration(4922000)).assertEqual('1:22:02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0056 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0057
     * @tc.name      testPhotosDateDurationExt0057
     * @tc.desc      Formats extended duration sample 15. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0057 begin');
      expect(DateUtil.getFormattedDuration(4957999)).assertEqual('1:22:37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0058
     * @tc.name      testPhotosDateDurationExt0058
     * @tc.desc      Formats extended duration sample 15. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0058 begin');
      expect(DateUtil.getFormattedDuration(4958000)).assertEqual('1:22:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0059
     * @tc.name      testPhotosDateDurationExt0059
     * @tc.desc      Formats extended duration sample 15. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0059 begin');
      expect(DateUtil.getFormattedDuration(4958999)).assertEqual('1:22:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0060
     * @tc.name      testPhotosDateDurationExt0060
     * @tc.desc      Formats extended duration sample 15. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0060 begin');
      expect(DateUtil.getFormattedDuration(5019000)).assertEqual('1:23:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0061
     * @tc.name      testPhotosDateDurationExt0061
     * @tc.desc      Formats extended duration sample 16. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0061 begin');
      expect(DateUtil.getFormattedDuration(5054999)).assertEqual('1:24:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0062
     * @tc.name      testPhotosDateDurationExt0062
     * @tc.desc      Formats extended duration sample 16. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0062 begin');
      expect(DateUtil.getFormattedDuration(5055000)).assertEqual('1:24:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0063
     * @tc.name      testPhotosDateDurationExt0063
     * @tc.desc      Formats extended duration sample 16. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0063 begin');
      expect(DateUtil.getFormattedDuration(5055999)).assertEqual('1:24:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0064
     * @tc.name      testPhotosDateDurationExt0064
     * @tc.desc      Formats extended duration sample 16. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0064 begin');
      expect(DateUtil.getFormattedDuration(5116000)).assertEqual('1:25:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0064 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0065
     * @tc.name      testPhotosDateDurationExt0065
     * @tc.desc      Formats extended duration sample 17. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0065 begin');
      expect(DateUtil.getFormattedDuration(5151999)).assertEqual('1:25:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0066
     * @tc.name      testPhotosDateDurationExt0066
     * @tc.desc      Formats extended duration sample 17. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0066 begin');
      expect(DateUtil.getFormattedDuration(5152000)).assertEqual('1:25:52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0067
     * @tc.name      testPhotosDateDurationExt0067
     * @tc.desc      Formats extended duration sample 17. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0067 begin');
      expect(DateUtil.getFormattedDuration(5152999)).assertEqual('1:25:52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0068
     * @tc.name      testPhotosDateDurationExt0068
     * @tc.desc      Formats extended duration sample 17. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0068 begin');
      expect(DateUtil.getFormattedDuration(5213000)).assertEqual('1:26:53');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0068 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0069
     * @tc.name      testPhotosDateDurationExt0069
     * @tc.desc      Formats extended duration sample 18. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0069 begin');
      expect(DateUtil.getFormattedDuration(5248999)).assertEqual('1:27:28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0070
     * @tc.name      testPhotosDateDurationExt0070
     * @tc.desc      Formats extended duration sample 18. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0070 begin');
      expect(DateUtil.getFormattedDuration(5249000)).assertEqual('1:27:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0071
     * @tc.name      testPhotosDateDurationExt0071
     * @tc.desc      Formats extended duration sample 18. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0071 begin');
      expect(DateUtil.getFormattedDuration(5249999)).assertEqual('1:27:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0072
     * @tc.name      testPhotosDateDurationExt0072
     * @tc.desc      Formats extended duration sample 18. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0072 begin');
      expect(DateUtil.getFormattedDuration(5310000)).assertEqual('1:28:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0072 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0073
     * @tc.name      testPhotosDateDurationExt0073
     * @tc.desc      Formats extended duration sample 19. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0073 begin');
      expect(DateUtil.getFormattedDuration(5345999)).assertEqual('1:29:05');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0074
     * @tc.name      testPhotosDateDurationExt0074
     * @tc.desc      Formats extended duration sample 19. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0074 begin');
      expect(DateUtil.getFormattedDuration(5346000)).assertEqual('1:29:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0075
     * @tc.name      testPhotosDateDurationExt0075
     * @tc.desc      Formats extended duration sample 19. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0075 begin');
      expect(DateUtil.getFormattedDuration(5346999)).assertEqual('1:29:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0076
     * @tc.name      testPhotosDateDurationExt0076
     * @tc.desc      Formats extended duration sample 19. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0076 begin');
      expect(DateUtil.getFormattedDuration(5407000)).assertEqual('1:30:07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0076 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0077
     * @tc.name      testPhotosDateDurationExt0077
     * @tc.desc      Formats extended duration sample 20. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0077 begin');
      expect(DateUtil.getFormattedDuration(5442999)).assertEqual('1:30:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0078
     * @tc.name      testPhotosDateDurationExt0078
     * @tc.desc      Formats extended duration sample 20. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0078 begin');
      expect(DateUtil.getFormattedDuration(5443000)).assertEqual('1:30:43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0079
     * @tc.name      testPhotosDateDurationExt0079
     * @tc.desc      Formats extended duration sample 20. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0079 begin');
      expect(DateUtil.getFormattedDuration(5443999)).assertEqual('1:30:43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0080
     * @tc.name      testPhotosDateDurationExt0080
     * @tc.desc      Formats extended duration sample 20. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0080 begin');
      expect(DateUtil.getFormattedDuration(5504000)).assertEqual('1:31:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0080 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0081
     * @tc.name      testPhotosDateDurationExt0081
     * @tc.desc      Formats extended duration sample 21. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0081 begin');
      expect(DateUtil.getFormattedDuration(5539999)).assertEqual('1:32:19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0082
     * @tc.name      testPhotosDateDurationExt0082
     * @tc.desc      Formats extended duration sample 21. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0082 begin');
      expect(DateUtil.getFormattedDuration(5540000)).assertEqual('1:32:20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0083
     * @tc.name      testPhotosDateDurationExt0083
     * @tc.desc      Formats extended duration sample 21. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0083 begin');
      expect(DateUtil.getFormattedDuration(5540999)).assertEqual('1:32:20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0084
     * @tc.name      testPhotosDateDurationExt0084
     * @tc.desc      Formats extended duration sample 21. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0084 begin');
      expect(DateUtil.getFormattedDuration(5601000)).assertEqual('1:33:21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0084 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0085
     * @tc.name      testPhotosDateDurationExt0085
     * @tc.desc      Formats extended duration sample 22. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0085 begin');
      expect(DateUtil.getFormattedDuration(5636999)).assertEqual('1:33:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0086
     * @tc.name      testPhotosDateDurationExt0086
     * @tc.desc      Formats extended duration sample 22. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0086 begin');
      expect(DateUtil.getFormattedDuration(5637000)).assertEqual('1:33:57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0087
     * @tc.name      testPhotosDateDurationExt0087
     * @tc.desc      Formats extended duration sample 22. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0087 begin');
      expect(DateUtil.getFormattedDuration(5637999)).assertEqual('1:33:57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0088
     * @tc.name      testPhotosDateDurationExt0088
     * @tc.desc      Formats extended duration sample 22. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0088 begin');
      expect(DateUtil.getFormattedDuration(5698000)).assertEqual('1:34:58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0088 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0089
     * @tc.name      testPhotosDateDurationExt0089
     * @tc.desc      Formats extended duration sample 23. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0089 begin');
      expect(DateUtil.getFormattedDuration(5733999)).assertEqual('1:35:33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0090
     * @tc.name      testPhotosDateDurationExt0090
     * @tc.desc      Formats extended duration sample 23. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0090 begin');
      expect(DateUtil.getFormattedDuration(5734000)).assertEqual('1:35:34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0091
     * @tc.name      testPhotosDateDurationExt0091
     * @tc.desc      Formats extended duration sample 23. case 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0091 begin');
      expect(DateUtil.getFormattedDuration(5734999)).assertEqual('1:35:34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0092
     * @tc.name      testPhotosDateDurationExt0092
     * @tc.desc      Formats extended duration sample 23. case 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0092 begin');
      expect(DateUtil.getFormattedDuration(5795000)).assertEqual('1:36:35');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0092 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0093
     * @tc.name      testPhotosDateDurationExt0093
     * @tc.desc      Formats extended duration sample 24. case 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0093 begin');
      expect(DateUtil.getFormattedDuration(5830999)).assertEqual('1:37:10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0094
     * @tc.name      testPhotosDateDurationExt0094
     * @tc.desc      Formats extended duration sample 24. case 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0094 begin');
      expect(DateUtil.getFormattedDuration(5831000)).assertEqual('1:37:11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0095
     * @tc.name      testPhotosDateDurationExt0095
     * @tc.desc      Formats extended duration sample 24. case 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0095 begin');
      expect(DateUtil.getFormattedDuration(5831999)).assertEqual('1:37:11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0096
     * @tc.name      testPhotosDateDurationExt0096
     * @tc.desc      Formats extended duration sample 24. case 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0096 begin');
      expect(DateUtil.getFormattedDuration(5892000)).assertEqual('1:38:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0096 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0097
     * @tc.name      testPhotosDateDurationExt0097
     * @tc.desc      Formats extended duration sample 25. case 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0097 begin');
      expect(DateUtil.getFormattedDuration(5927999)).assertEqual('1:38:47');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0098
     * @tc.name      testPhotosDateDurationExt0098
     * @tc.desc      Formats extended duration sample 25. case 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0098 begin');
      expect(DateUtil.getFormattedDuration(5928000)).assertEqual('1:38:48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0099
     * @tc.name      testPhotosDateDurationExt0099
     * @tc.desc      Formats extended duration sample 25. case 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0099 begin');
      expect(DateUtil.getFormattedDuration(5928999)).assertEqual('1:38:48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0100
     * @tc.name      testPhotosDateDurationExt0100
     * @tc.desc      Formats extended duration sample 25. case 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0100 begin');
      expect(DateUtil.getFormattedDuration(5989000)).assertEqual('1:39:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0100 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0101
     * @tc.name      testPhotosDateDurationExt0101
     * @tc.desc      Formats extended duration sample 26. case 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0101 begin');
      expect(DateUtil.getFormattedDuration(6024999)).assertEqual('1:40:24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0102
     * @tc.name      testPhotosDateDurationExt0102
     * @tc.desc      Formats extended duration sample 26. case 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0102 begin');
      expect(DateUtil.getFormattedDuration(6025000)).assertEqual('1:40:25');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0102 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0103
     * @tc.name      testPhotosDateDurationExt0103
     * @tc.desc      Formats extended duration sample 26. case 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0103 begin');
      expect(DateUtil.getFormattedDuration(6025999)).assertEqual('1:40:25');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0104
     * @tc.name      testPhotosDateDurationExt0104
     * @tc.desc      Formats extended duration sample 26. case 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0104 begin');
      expect(DateUtil.getFormattedDuration(6086000)).assertEqual('1:41:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0104 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0105
     * @tc.name      testPhotosDateDurationExt0105
     * @tc.desc      Formats extended duration sample 27. case 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0105 begin');
      expect(DateUtil.getFormattedDuration(6121999)).assertEqual('1:42:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0105 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0106
     * @tc.name      testPhotosDateDurationExt0106
     * @tc.desc      Formats extended duration sample 27. case 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0106 begin');
      expect(DateUtil.getFormattedDuration(6122000)).assertEqual('1:42:02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0107
     * @tc.name      testPhotosDateDurationExt0107
     * @tc.desc      Formats extended duration sample 27. case 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0107 begin');
      expect(DateUtil.getFormattedDuration(6122999)).assertEqual('1:42:02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0108
     * @tc.name      testPhotosDateDurationExt0108
     * @tc.desc      Formats extended duration sample 27. case 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0108 begin');
      expect(DateUtil.getFormattedDuration(6183000)).assertEqual('1:43:03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0108 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0109
     * @tc.name      testPhotosDateDurationExt0109
     * @tc.desc      Formats extended duration sample 28. case 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0109 begin');
      expect(DateUtil.getFormattedDuration(6218999)).assertEqual('1:43:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0110
     * @tc.name      testPhotosDateDurationExt0110
     * @tc.desc      Formats extended duration sample 28. case 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0110 begin');
      expect(DateUtil.getFormattedDuration(6219000)).assertEqual('1:43:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0111
     * @tc.name      testPhotosDateDurationExt0111
     * @tc.desc      Formats extended duration sample 28. case 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0111 begin');
      expect(DateUtil.getFormattedDuration(6219999)).assertEqual('1:43:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0111 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0112
     * @tc.name      testPhotosDateDurationExt0112
     * @tc.desc      Formats extended duration sample 28. case 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0112 begin');
      expect(DateUtil.getFormattedDuration(6280000)).assertEqual('1:44:40');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0112 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0113
     * @tc.name      testPhotosDateDurationExt0113
     * @tc.desc      Formats extended duration sample 29. case 113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0113 begin');
      expect(DateUtil.getFormattedDuration(6315999)).assertEqual('1:45:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0114
     * @tc.name      testPhotosDateDurationExt0114
     * @tc.desc      Formats extended duration sample 29. case 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0114 begin');
      expect(DateUtil.getFormattedDuration(6316000)).assertEqual('1:45:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0114 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0115
     * @tc.name      testPhotosDateDurationExt0115
     * @tc.desc      Formats extended duration sample 29. case 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0115 begin');
      expect(DateUtil.getFormattedDuration(6316999)).assertEqual('1:45:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0116
     * @tc.name      testPhotosDateDurationExt0116
     * @tc.desc      Formats extended duration sample 29. case 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0116 begin');
      expect(DateUtil.getFormattedDuration(6377000)).assertEqual('1:46:17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0116 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0117
     * @tc.name      testPhotosDateDurationExt0117
     * @tc.desc      Formats extended duration sample 30. case 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0117 begin');
      expect(DateUtil.getFormattedDuration(6412999)).assertEqual('1:46:52');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0117 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0118
     * @tc.name      testPhotosDateDurationExt0118
     * @tc.desc      Formats extended duration sample 30. case 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0118 begin');
      expect(DateUtil.getFormattedDuration(6413000)).assertEqual('1:46:53');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0119
     * @tc.name      testPhotosDateDurationExt0119
     * @tc.desc      Formats extended duration sample 30. case 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0119 begin');
      expect(DateUtil.getFormattedDuration(6413999)).assertEqual('1:46:53');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0120
     * @tc.name      testPhotosDateDurationExt0120
     * @tc.desc      Formats extended duration sample 30. case 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
