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
    it('testPhotosDateDurationExt0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0120 begin');
      expect(DateUtil.getFormattedDuration(6474000)).assertEqual('1:47:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0120 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0121
     * @tc.name      testPhotosDateDurationExt0121
     * @tc.desc      Formats extended duration sample 31. case 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0121 begin');
      expect(DateUtil.getFormattedDuration(6509999)).assertEqual('1:48:29');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0122
     * @tc.name      testPhotosDateDurationExt0122
     * @tc.desc      Formats extended duration sample 31. case 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0122 begin');
      expect(DateUtil.getFormattedDuration(6510000)).assertEqual('1:48:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0123
     * @tc.name      testPhotosDateDurationExt0123
     * @tc.desc      Formats extended duration sample 31. case 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0123 begin');
      expect(DateUtil.getFormattedDuration(6510999)).assertEqual('1:48:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0123 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0124
     * @tc.name      testPhotosDateDurationExt0124
     * @tc.desc      Formats extended duration sample 31. case 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0124 begin');
      expect(DateUtil.getFormattedDuration(6571000)).assertEqual('1:49:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0124 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0125
     * @tc.name      testPhotosDateDurationExt0125
     * @tc.desc      Formats extended duration sample 32. case 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0125 begin');
      expect(DateUtil.getFormattedDuration(6606999)).assertEqual('1:50:06');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0126
     * @tc.name      testPhotosDateDurationExt0126
     * @tc.desc      Formats extended duration sample 32. case 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0126 begin');
      expect(DateUtil.getFormattedDuration(6607000)).assertEqual('1:50:07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0126 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0127
     * @tc.name      testPhotosDateDurationExt0127
     * @tc.desc      Formats extended duration sample 32. case 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0127 begin');
      expect(DateUtil.getFormattedDuration(6607999)).assertEqual('1:50:07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0128
     * @tc.name      testPhotosDateDurationExt0128
     * @tc.desc      Formats extended duration sample 32. case 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0128 begin');
      expect(DateUtil.getFormattedDuration(6668000)).assertEqual('1:51:08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0128 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0129
     * @tc.name      testPhotosDateDurationExt0129
     * @tc.desc      Formats extended duration sample 33. case 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0129 begin');
      expect(DateUtil.getFormattedDuration(6703999)).assertEqual('1:51:43');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0129 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0130
     * @tc.name      testPhotosDateDurationExt0130
     * @tc.desc      Formats extended duration sample 33. case 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0130 begin');
      expect(DateUtil.getFormattedDuration(6704000)).assertEqual('1:51:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0131
     * @tc.name      testPhotosDateDurationExt0131
     * @tc.desc      Formats extended duration sample 33. case 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0131 begin');
      expect(DateUtil.getFormattedDuration(6704999)).assertEqual('1:51:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0132
     * @tc.name      testPhotosDateDurationExt0132
     * @tc.desc      Formats extended duration sample 33. case 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0132 begin');
      expect(DateUtil.getFormattedDuration(6765000)).assertEqual('1:52:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0132 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0133
     * @tc.name      testPhotosDateDurationExt0133
     * @tc.desc      Formats extended duration sample 34. case 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0133 begin');
      expect(DateUtil.getFormattedDuration(6800999)).assertEqual('1:53:20');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0134
     * @tc.name      testPhotosDateDurationExt0134
     * @tc.desc      Formats extended duration sample 34. case 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0134 begin');
      expect(DateUtil.getFormattedDuration(6801000)).assertEqual('1:53:21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0135
     * @tc.name      testPhotosDateDurationExt0135
     * @tc.desc      Formats extended duration sample 34. case 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0135 begin');
      expect(DateUtil.getFormattedDuration(6801999)).assertEqual('1:53:21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0135 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0136
     * @tc.name      testPhotosDateDurationExt0136
     * @tc.desc      Formats extended duration sample 34. case 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0136 begin');
      expect(DateUtil.getFormattedDuration(6862000)).assertEqual('1:54:22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0136 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0137
     * @tc.name      testPhotosDateDurationExt0137
     * @tc.desc      Formats extended duration sample 35. case 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0137 begin');
      expect(DateUtil.getFormattedDuration(6897999)).assertEqual('1:54:57');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0138
     * @tc.name      testPhotosDateDurationExt0138
     * @tc.desc      Formats extended duration sample 35. case 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0138 begin');
      expect(DateUtil.getFormattedDuration(6898000)).assertEqual('1:54:58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0138 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0139
     * @tc.name      testPhotosDateDurationExt0139
     * @tc.desc      Formats extended duration sample 35. case 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0139 begin');
      expect(DateUtil.getFormattedDuration(6898999)).assertEqual('1:54:58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0140
     * @tc.name      testPhotosDateDurationExt0140
     * @tc.desc      Formats extended duration sample 35. case 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0140 begin');
      expect(DateUtil.getFormattedDuration(6959000)).assertEqual('1:55:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0140 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0141
     * @tc.name      testPhotosDateDurationExt0141
     * @tc.desc      Formats extended duration sample 36. case 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0141 begin');
      expect(DateUtil.getFormattedDuration(6994999)).assertEqual('1:56:34');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0141 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0142
     * @tc.name      testPhotosDateDurationExt0142
     * @tc.desc      Formats extended duration sample 36. case 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0142 begin');
      expect(DateUtil.getFormattedDuration(6995000)).assertEqual('1:56:35');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0143
     * @tc.name      testPhotosDateDurationExt0143
     * @tc.desc      Formats extended duration sample 36. case 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0143 begin');
      expect(DateUtil.getFormattedDuration(6995999)).assertEqual('1:56:35');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0144
     * @tc.name      testPhotosDateDurationExt0144
     * @tc.desc      Formats extended duration sample 36. case 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0144 begin');
      expect(DateUtil.getFormattedDuration(7056000)).assertEqual('1:57:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0144 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0145
     * @tc.name      testPhotosDateDurationExt0145
     * @tc.desc      Formats extended duration sample 37. case 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0145 begin');
      expect(DateUtil.getFormattedDuration(7091999)).assertEqual('1:58:11');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0146
     * @tc.name      testPhotosDateDurationExt0146
     * @tc.desc      Formats extended duration sample 37. case 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0146 begin');
      expect(DateUtil.getFormattedDuration(7092000)).assertEqual('1:58:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0147
     * @tc.name      testPhotosDateDurationExt0147
     * @tc.desc      Formats extended duration sample 37. case 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0147 begin');
      expect(DateUtil.getFormattedDuration(7092999)).assertEqual('1:58:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0147 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0148
     * @tc.name      testPhotosDateDurationExt0148
     * @tc.desc      Formats extended duration sample 37. case 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0148 begin');
      expect(DateUtil.getFormattedDuration(7153000)).assertEqual('1:59:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0148 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0149
     * @tc.name      testPhotosDateDurationExt0149
     * @tc.desc      Formats extended duration sample 38. case 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0149 begin');
      expect(DateUtil.getFormattedDuration(7188999)).assertEqual('1:59:48');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0150
     * @tc.name      testPhotosDateDurationExt0150
     * @tc.desc      Formats extended duration sample 38. case 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0150 begin');
      expect(DateUtil.getFormattedDuration(7189000)).assertEqual('1:59:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0150 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0151
     * @tc.name      testPhotosDateDurationExt0151
     * @tc.desc      Formats extended duration sample 38. case 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0151 begin');
      expect(DateUtil.getFormattedDuration(7189999)).assertEqual('1:59:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0152
     * @tc.name      testPhotosDateDurationExt0152
     * @tc.desc      Formats extended duration sample 38. case 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0152 begin');
      expect(DateUtil.getFormattedDuration(7250000)).assertEqual('2:00:50');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0152 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0153
     * @tc.name      testPhotosDateDurationExt0153
     * @tc.desc      Formats extended duration sample 39. case 153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0153 begin');
      expect(DateUtil.getFormattedDuration(7285999)).assertEqual('2:01:25');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0153 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0154
     * @tc.name      testPhotosDateDurationExt0154
     * @tc.desc      Formats extended duration sample 39. case 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0154 begin');
      expect(DateUtil.getFormattedDuration(7286000)).assertEqual('2:01:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0155
     * @tc.name      testPhotosDateDurationExt0155
     * @tc.desc      Formats extended duration sample 39. case 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0155 begin');
      expect(DateUtil.getFormattedDuration(7286999)).assertEqual('2:01:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0155 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0156
     * @tc.name      testPhotosDateDurationExt0156
     * @tc.desc      Formats extended duration sample 39. case 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0156 begin');
      expect(DateUtil.getFormattedDuration(7347000)).assertEqual('2:02:27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0156 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0157
     * @tc.name      testPhotosDateDurationExt0157
     * @tc.desc      Formats extended duration sample 40. case 157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0157 begin');
      expect(DateUtil.getFormattedDuration(7382999)).assertEqual('2:03:02');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0158
     * @tc.name      testPhotosDateDurationExt0158
     * @tc.desc      Formats extended duration sample 40. case 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0158 begin');
      expect(DateUtil.getFormattedDuration(7383000)).assertEqual('2:03:03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0159
     * @tc.name      testPhotosDateDurationExt0159
     * @tc.desc      Formats extended duration sample 40. case 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0159 begin');
      expect(DateUtil.getFormattedDuration(7383999)).assertEqual('2:03:03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0159 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0160
     * @tc.name      testPhotosDateDurationExt0160
     * @tc.desc      Formats extended duration sample 40. case 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0160 begin');
      expect(DateUtil.getFormattedDuration(7444000)).assertEqual('2:04:04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0160 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0161
     * @tc.name      testPhotosDateDurationExt0161
     * @tc.desc      Formats extended duration sample 41. case 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0161 begin');
      expect(DateUtil.getFormattedDuration(7479999)).assertEqual('2:04:39');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0162
     * @tc.name      testPhotosDateDurationExt0162
     * @tc.desc      Formats extended duration sample 41. case 162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0162 begin');
      expect(DateUtil.getFormattedDuration(7480000)).assertEqual('2:04:40');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0162 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0163
     * @tc.name      testPhotosDateDurationExt0163
     * @tc.desc      Formats extended duration sample 41. case 163
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0163 begin');
      expect(DateUtil.getFormattedDuration(7480999)).assertEqual('2:04:40');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0164
     * @tc.name      testPhotosDateDurationExt0164
     * @tc.desc      Formats extended duration sample 41. case 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0164 begin');
      expect(DateUtil.getFormattedDuration(7541000)).assertEqual('2:05:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0164 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0165
     * @tc.name      testPhotosDateDurationExt0165
     * @tc.desc      Formats extended duration sample 42. case 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0165 begin');
      expect(DateUtil.getFormattedDuration(7576999)).assertEqual('2:06:16');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0165 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0166
     * @tc.name      testPhotosDateDurationExt0166
     * @tc.desc      Formats extended duration sample 42. case 166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0166 begin');
      expect(DateUtil.getFormattedDuration(7577000)).assertEqual('2:06:17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0167
     * @tc.name      testPhotosDateDurationExt0167
     * @tc.desc      Formats extended duration sample 42. case 167
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0167 begin');
      expect(DateUtil.getFormattedDuration(7577999)).assertEqual('2:06:17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0168
     * @tc.name      testPhotosDateDurationExt0168
     * @tc.desc      Formats extended duration sample 42. case 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0168 begin');
      expect(DateUtil.getFormattedDuration(7638000)).assertEqual('2:07:18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0168 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0169
     * @tc.name      testPhotosDateDurationExt0169
     * @tc.desc      Formats extended duration sample 43. case 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0169 begin');
      expect(DateUtil.getFormattedDuration(7673999)).assertEqual('2:07:53');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0170
     * @tc.name      testPhotosDateDurationExt0170
     * @tc.desc      Formats extended duration sample 43. case 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0170 begin');
      expect(DateUtil.getFormattedDuration(7674000)).assertEqual('2:07:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0170 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0171
     * @tc.name      testPhotosDateDurationExt0171
     * @tc.desc      Formats extended duration sample 43. case 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0171 begin');
      expect(DateUtil.getFormattedDuration(7674999)).assertEqual('2:07:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0171 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0172
     * @tc.name      testPhotosDateDurationExt0172
     * @tc.desc      Formats extended duration sample 43. case 172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0172 begin');
      expect(DateUtil.getFormattedDuration(7735000)).assertEqual('2:08:55');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0172 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0173
     * @tc.name      testPhotosDateDurationExt0173
     * @tc.desc      Formats extended duration sample 44. case 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0173 begin');
      expect(DateUtil.getFormattedDuration(7770999)).assertEqual('2:09:30');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0174
     * @tc.name      testPhotosDateDurationExt0174
     * @tc.desc      Formats extended duration sample 44. case 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0174 begin');
      expect(DateUtil.getFormattedDuration(7771000)).assertEqual('2:09:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0174 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0175
     * @tc.name      testPhotosDateDurationExt0175
     * @tc.desc      Formats extended duration sample 44. case 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0175 begin');
      expect(DateUtil.getFormattedDuration(7771999)).assertEqual('2:09:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0175 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0176
     * @tc.name      testPhotosDateDurationExt0176
     * @tc.desc      Formats extended duration sample 44. case 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0176 begin');
      expect(DateUtil.getFormattedDuration(7832000)).assertEqual('2:10:32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0176 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0177
     * @tc.name      testPhotosDateDurationExt0177
     * @tc.desc      Formats extended duration sample 45. case 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0177 begin');
      expect(DateUtil.getFormattedDuration(7867999)).assertEqual('2:11:07');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0177 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0178
     * @tc.name      testPhotosDateDurationExt0178
     * @tc.desc      Formats extended duration sample 45. case 178
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0178 begin');
      expect(DateUtil.getFormattedDuration(7868000)).assertEqual('2:11:08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0179
     * @tc.name      testPhotosDateDurationExt0179
     * @tc.desc      Formats extended duration sample 45. case 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0179 begin');
      expect(DateUtil.getFormattedDuration(7868999)).assertEqual('2:11:08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0180
     * @tc.name      testPhotosDateDurationExt0180
     * @tc.desc      Formats extended duration sample 45. case 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0180 begin');
      expect(DateUtil.getFormattedDuration(7929000)).assertEqual('2:12:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0180 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0181
     * @tc.name      testPhotosDateDurationExt0181
     * @tc.desc      Formats extended duration sample 46. case 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0181 begin');
      expect(DateUtil.getFormattedDuration(7964999)).assertEqual('2:12:44');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0181 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0182
     * @tc.name      testPhotosDateDurationExt0182
     * @tc.desc      Formats extended duration sample 46. case 182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0182 begin');
      expect(DateUtil.getFormattedDuration(7965000)).assertEqual('2:12:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0182 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0183
     * @tc.name      testPhotosDateDurationExt0183
     * @tc.desc      Formats extended duration sample 46. case 183
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0183 begin');
      expect(DateUtil.getFormattedDuration(7965999)).assertEqual('2:12:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0183 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0184
     * @tc.name      testPhotosDateDurationExt0184
     * @tc.desc      Formats extended duration sample 46. case 184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0184 begin');
      expect(DateUtil.getFormattedDuration(8026000)).assertEqual('2:13:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0184 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0185
     * @tc.name      testPhotosDateDurationExt0185
     * @tc.desc      Formats extended duration sample 47. case 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0185 begin');
      expect(DateUtil.getFormattedDuration(8061999)).assertEqual('2:14:21');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0185 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0186
     * @tc.name      testPhotosDateDurationExt0186
     * @tc.desc      Formats extended duration sample 47. case 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0186 begin');
      expect(DateUtil.getFormattedDuration(8062000)).assertEqual('2:14:22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0186 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0187
     * @tc.name      testPhotosDateDurationExt0187
     * @tc.desc      Formats extended duration sample 47. case 187
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0187 begin');
      expect(DateUtil.getFormattedDuration(8062999)).assertEqual('2:14:22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0187 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0188
     * @tc.name      testPhotosDateDurationExt0188
     * @tc.desc      Formats extended duration sample 47. case 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0188 begin');
      expect(DateUtil.getFormattedDuration(8123000)).assertEqual('2:15:23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0188 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0189
     * @tc.name      testPhotosDateDurationExt0189
     * @tc.desc      Formats extended duration sample 48. case 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0189 begin');
      expect(DateUtil.getFormattedDuration(8158999)).assertEqual('2:15:58');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0189 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0190
     * @tc.name      testPhotosDateDurationExt0190
     * @tc.desc      Formats extended duration sample 48. case 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0190 begin');
      expect(DateUtil.getFormattedDuration(8159000)).assertEqual('2:15:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0190 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0191
     * @tc.name      testPhotosDateDurationExt0191
     * @tc.desc      Formats extended duration sample 48. case 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0191 begin');
      expect(DateUtil.getFormattedDuration(8159999)).assertEqual('2:15:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0191 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0192
     * @tc.name      testPhotosDateDurationExt0192
     * @tc.desc      Formats extended duration sample 48. case 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0192 begin');
      expect(DateUtil.getFormattedDuration(8220000)).assertEqual('2:17:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0192 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0193
     * @tc.name      testPhotosDateDurationExt0193
     * @tc.desc      Formats extended duration sample 49. case 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0193 begin');
      expect(DateUtil.getFormattedDuration(8255999)).assertEqual('2:17:35');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0193 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0194
     * @tc.name      testPhotosDateDurationExt0194
     * @tc.desc      Formats extended duration sample 49. case 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0194 begin');
      expect(DateUtil.getFormattedDuration(8256000)).assertEqual('2:17:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0194 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0195
     * @tc.name      testPhotosDateDurationExt0195
     * @tc.desc      Formats extended duration sample 49. case 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0195 begin');
      expect(DateUtil.getFormattedDuration(8256999)).assertEqual('2:17:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0195 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0196
     * @tc.name      testPhotosDateDurationExt0196
     * @tc.desc      Formats extended duration sample 49. case 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0196 begin');
      expect(DateUtil.getFormattedDuration(8317000)).assertEqual('2:18:37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0196 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0197
     * @tc.name      testPhotosDateDurationExt0197
     * @tc.desc      Formats extended duration sample 50. case 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0197 begin');
      expect(DateUtil.getFormattedDuration(8352999)).assertEqual('2:19:12');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0197 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0198
     * @tc.name      testPhotosDateDurationExt0198
     * @tc.desc      Formats extended duration sample 50. case 198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0198 begin');
      expect(DateUtil.getFormattedDuration(8353000)).assertEqual('2:19:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0198 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0199
     * @tc.name      testPhotosDateDurationExt0199
     * @tc.desc      Formats extended duration sample 50. case 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0199 begin');
      expect(DateUtil.getFormattedDuration(8353999)).assertEqual('2:19:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0199 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0200
     * @tc.name      testPhotosDateDurationExt0200
     * @tc.desc      Formats extended duration sample 50. case 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0200 begin');
      expect(DateUtil.getFormattedDuration(8414000)).assertEqual('2:20:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0200 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0201
     * @tc.name      testPhotosDateDurationExt0201
     * @tc.desc      Formats extended duration sample 51. case 201
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0201 begin');
      expect(DateUtil.getFormattedDuration(8449999)).assertEqual('2:20:49');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0201 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0202
     * @tc.name      testPhotosDateDurationExt0202
     * @tc.desc      Formats extended duration sample 51. case 202
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0202 begin');
      expect(DateUtil.getFormattedDuration(8450000)).assertEqual('2:20:50');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0202 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0203
     * @tc.name      testPhotosDateDurationExt0203
     * @tc.desc      Formats extended duration sample 51. case 203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0203 begin');
      expect(DateUtil.getFormattedDuration(8450999)).assertEqual('2:20:50');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0203 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0204
     * @tc.name      testPhotosDateDurationExt0204
     * @tc.desc      Formats extended duration sample 51. case 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0204 begin');
      expect(DateUtil.getFormattedDuration(8511000)).assertEqual('2:21:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0204 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0205
     * @tc.name      testPhotosDateDurationExt0205
     * @tc.desc      Formats extended duration sample 52. case 205
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0205 begin');
      expect(DateUtil.getFormattedDuration(8546999)).assertEqual('2:22:26');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0205 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0206
     * @tc.name      testPhotosDateDurationExt0206
     * @tc.desc      Formats extended duration sample 52. case 206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0206 begin');
      expect(DateUtil.getFormattedDuration(8547000)).assertEqual('2:22:27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0206 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0207
     * @tc.name      testPhotosDateDurationExt0207
     * @tc.desc      Formats extended duration sample 52. case 207
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0207 begin');
      expect(DateUtil.getFormattedDuration(8547999)).assertEqual('2:22:27');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0207 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0208
     * @tc.name      testPhotosDateDurationExt0208
     * @tc.desc      Formats extended duration sample 52. case 208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0208 begin');
      expect(DateUtil.getFormattedDuration(8608000)).assertEqual('2:23:28');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0208 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0209
     * @tc.name      testPhotosDateDurationExt0209
     * @tc.desc      Formats extended duration sample 53. case 209
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0209 begin');
      expect(DateUtil.getFormattedDuration(8643999)).assertEqual('2:24:03');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0209 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0210
     * @tc.name      testPhotosDateDurationExt0210
     * @tc.desc      Formats extended duration sample 53. case 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0210 begin');
      expect(DateUtil.getFormattedDuration(8644000)).assertEqual('2:24:04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0210 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0211
     * @tc.name      testPhotosDateDurationExt0211
     * @tc.desc      Formats extended duration sample 53. case 211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0211 begin');
      expect(DateUtil.getFormattedDuration(8644999)).assertEqual('2:24:04');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0211 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0212
     * @tc.name      testPhotosDateDurationExt0212
     * @tc.desc      Formats extended duration sample 53. case 212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0212 begin');
      expect(DateUtil.getFormattedDuration(8705000)).assertEqual('2:25:05');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0212 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0213
     * @tc.name      testPhotosDateDurationExt0213
     * @tc.desc      Formats extended duration sample 54. case 213
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0213 begin');
      expect(DateUtil.getFormattedDuration(8740999)).assertEqual('2:25:40');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0213 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0214
     * @tc.name      testPhotosDateDurationExt0214
     * @tc.desc      Formats extended duration sample 54. case 214
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0214 begin');
      expect(DateUtil.getFormattedDuration(8741000)).assertEqual('2:25:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0214 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0215
     * @tc.name      testPhotosDateDurationExt0215
     * @tc.desc      Formats extended duration sample 54. case 215
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0215 begin');
      expect(DateUtil.getFormattedDuration(8741999)).assertEqual('2:25:41');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0215 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0216
     * @tc.name      testPhotosDateDurationExt0216
     * @tc.desc      Formats extended duration sample 54. case 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0216 begin');
      expect(DateUtil.getFormattedDuration(8802000)).assertEqual('2:26:42');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0216 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0217
     * @tc.name      testPhotosDateDurationExt0217
     * @tc.desc      Formats extended duration sample 55. case 217
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0217 begin');
      expect(DateUtil.getFormattedDuration(8837999)).assertEqual('2:27:17');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0217 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0218
     * @tc.name      testPhotosDateDurationExt0218
     * @tc.desc      Formats extended duration sample 55. case 218
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0218 begin');
      expect(DateUtil.getFormattedDuration(8838000)).assertEqual('2:27:18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0218 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0219
     * @tc.name      testPhotosDateDurationExt0219
     * @tc.desc      Formats extended duration sample 55. case 219
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0219 begin');
      expect(DateUtil.getFormattedDuration(8838999)).assertEqual('2:27:18');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0219 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0220
     * @tc.name      testPhotosDateDurationExt0220
     * @tc.desc      Formats extended duration sample 55. case 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0220 begin');
      expect(DateUtil.getFormattedDuration(8899000)).assertEqual('2:28:19');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0220 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0221
     * @tc.name      testPhotosDateDurationExt0221
     * @tc.desc      Formats extended duration sample 56. case 221
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0221 begin');
      expect(DateUtil.getFormattedDuration(8934999)).assertEqual('2:28:54');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0221 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0222
     * @tc.name      testPhotosDateDurationExt0222
     * @tc.desc      Formats extended duration sample 56. case 222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0222 begin');
      expect(DateUtil.getFormattedDuration(8935000)).assertEqual('2:28:55');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0222 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0223
     * @tc.name      testPhotosDateDurationExt0223
     * @tc.desc      Formats extended duration sample 56. case 223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0223 begin');
      expect(DateUtil.getFormattedDuration(8935999)).assertEqual('2:28:55');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0223 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0224
     * @tc.name      testPhotosDateDurationExt0224
     * @tc.desc      Formats extended duration sample 56. case 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0224 begin');
      expect(DateUtil.getFormattedDuration(8996000)).assertEqual('2:29:56');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0224 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0225
     * @tc.name      testPhotosDateDurationExt0225
     * @tc.desc      Formats extended duration sample 57. case 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0225 begin');
      expect(DateUtil.getFormattedDuration(9031999)).assertEqual('2:30:31');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0225 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0226
     * @tc.name      testPhotosDateDurationExt0226
     * @tc.desc      Formats extended duration sample 57. case 226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0226 begin');
      expect(DateUtil.getFormattedDuration(9032000)).assertEqual('2:30:32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0226 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0227
     * @tc.name      testPhotosDateDurationExt0227
     * @tc.desc      Formats extended duration sample 57. case 227
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0227 begin');
      expect(DateUtil.getFormattedDuration(9032999)).assertEqual('2:30:32');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0227 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0228
     * @tc.name      testPhotosDateDurationExt0228
     * @tc.desc      Formats extended duration sample 57. case 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0228 begin');
      expect(DateUtil.getFormattedDuration(9093000)).assertEqual('2:31:33');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0228 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0229
     * @tc.name      testPhotosDateDurationExt0229
     * @tc.desc      Formats extended duration sample 58. case 229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0229 begin');
      expect(DateUtil.getFormattedDuration(9128999)).assertEqual('2:32:08');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0229 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0230
     * @tc.name      testPhotosDateDurationExt0230
     * @tc.desc      Formats extended duration sample 58. case 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0230 begin');
      expect(DateUtil.getFormattedDuration(9129000)).assertEqual('2:32:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0230 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0231
     * @tc.name      testPhotosDateDurationExt0231
     * @tc.desc      Formats extended duration sample 58. case 231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0231 begin');
      expect(DateUtil.getFormattedDuration(9129999)).assertEqual('2:32:09');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0231 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0232
     * @tc.name      testPhotosDateDurationExt0232
     * @tc.desc      Formats extended duration sample 58. case 232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0232 begin');
      expect(DateUtil.getFormattedDuration(9190000)).assertEqual('2:33:10');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0232 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0233
     * @tc.name      testPhotosDateDurationExt0233
     * @tc.desc      Formats extended duration sample 59. case 233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0233 begin');
      expect(DateUtil.getFormattedDuration(9225999)).assertEqual('2:33:45');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0233 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0234
     * @tc.name      testPhotosDateDurationExt0234
     * @tc.desc      Formats extended duration sample 59. case 234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0234 begin');
      expect(DateUtil.getFormattedDuration(9226000)).assertEqual('2:33:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0234 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0235
     * @tc.name      testPhotosDateDurationExt0235
     * @tc.desc      Formats extended duration sample 59. case 235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0235 begin');
      expect(DateUtil.getFormattedDuration(9226999)).assertEqual('2:33:46');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0235 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0236
     * @tc.name      testPhotosDateDurationExt0236
     * @tc.desc      Formats extended duration sample 59. case 236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0236 begin');
      expect(DateUtil.getFormattedDuration(9287000)).assertEqual('2:34:47');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0236 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0237
     * @tc.name      testPhotosDateDurationExt0237
     * @tc.desc      Formats extended duration sample 60. case 237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0237 begin');
      expect(DateUtil.getFormattedDuration(9322999)).assertEqual('2:35:22');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0237 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0238
     * @tc.name      testPhotosDateDurationExt0238
     * @tc.desc      Formats extended duration sample 60. case 238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0238 begin');
      expect(DateUtil.getFormattedDuration(9323000)).assertEqual('2:35:23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0238 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0239
     * @tc.name      testPhotosDateDurationExt0239
     * @tc.desc      Formats extended duration sample 60. case 239
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0239 begin');
      expect(DateUtil.getFormattedDuration(9323999)).assertEqual('2:35:23');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0239 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0240
     * @tc.name      testPhotosDateDurationExt0240
     * @tc.desc      Formats extended duration sample 60. case 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0240 begin');
      expect(DateUtil.getFormattedDuration(9384000)).assertEqual('2:36:24');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0240 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0241
     * @tc.name      testPhotosDateDurationExt0241
     * @tc.desc      Formats extended duration sample 61. case 241
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0241 begin');
      expect(DateUtil.getFormattedDuration(9419999)).assertEqual('2:36:59');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0241 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0242
     * @tc.name      testPhotosDateDurationExt0242
     * @tc.desc      Formats extended duration sample 61. case 242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0242 begin');
      expect(DateUtil.getFormattedDuration(9420000)).assertEqual('2:37:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0242 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0243
     * @tc.name      testPhotosDateDurationExt0243
     * @tc.desc      Formats extended duration sample 61. case 243
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0243 begin');
      expect(DateUtil.getFormattedDuration(9420999)).assertEqual('2:37:00');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0243 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0244
     * @tc.name      testPhotosDateDurationExt0244
     * @tc.desc      Formats extended duration sample 61. case 244
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0244 begin');
      expect(DateUtil.getFormattedDuration(9481000)).assertEqual('2:38:01');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0244 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0245
     * @tc.name      testPhotosDateDurationExt0245
     * @tc.desc      Formats extended duration sample 62. case 245
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0245 begin');
      expect(DateUtil.getFormattedDuration(9516999)).assertEqual('2:38:36');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0245 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0246
     * @tc.name      testPhotosDateDurationExt0246
     * @tc.desc      Formats extended duration sample 62. case 246
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0246 begin');
      expect(DateUtil.getFormattedDuration(9517000)).assertEqual('2:38:37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0246 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0247
     * @tc.name      testPhotosDateDurationExt0247
     * @tc.desc      Formats extended duration sample 62. case 247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0247 begin');
      expect(DateUtil.getFormattedDuration(9517999)).assertEqual('2:38:37');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0247 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0248
     * @tc.name      testPhotosDateDurationExt0248
     * @tc.desc      Formats extended duration sample 62. case 248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0248 begin');
      expect(DateUtil.getFormattedDuration(9578000)).assertEqual('2:39:38');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0248 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0249
     * @tc.name      testPhotosDateDurationExt0249
     * @tc.desc      Formats extended duration sample 63. case 249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0249 begin');
      expect(DateUtil.getFormattedDuration(9613999)).assertEqual('2:40:13');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0249 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0250
     * @tc.name      testPhotosDateDurationExt0250
     * @tc.desc      Formats extended duration sample 63. case 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0250 begin');
      expect(DateUtil.getFormattedDuration(9614000)).assertEqual('2:40:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0250 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0251
     * @tc.name      testPhotosDateDurationExt0251
     * @tc.desc      Formats extended duration sample 63. case 251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0251 begin');
      expect(DateUtil.getFormattedDuration(9614999)).assertEqual('2:40:14');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0251 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0252
     * @tc.name      testPhotosDateDurationExt0252
     * @tc.desc      Formats extended duration sample 63. case 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0252 begin');
      expect(DateUtil.getFormattedDuration(9675000)).assertEqual('2:41:15');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0252 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0253
     * @tc.name      testPhotosDateDurationExt0253
     * @tc.desc      Formats extended duration sample 64. case 253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0253 begin');
      expect(DateUtil.getFormattedDuration(9710999)).assertEqual('2:41:50');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0253 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0254
     * @tc.name      testPhotosDateDurationExt0254
     * @tc.desc      Formats extended duration sample 64. case 254
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0254 begin');
      expect(DateUtil.getFormattedDuration(9711000)).assertEqual('2:41:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0254 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0255
     * @tc.name      testPhotosDateDurationExt0255
     * @tc.desc      Formats extended duration sample 64. case 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0255 begin');
      expect(DateUtil.getFormattedDuration(9711999)).assertEqual('2:41:51');
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0255 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0256
     * @tc.name      testPhotosDateDurationExt0256
     * @tc.desc      Formats extended duration sample 64. case 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
