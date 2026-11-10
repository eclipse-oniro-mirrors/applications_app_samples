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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0001 begin');
      expect(DateUtil.getFormattedDuration(3599999)).assertEqual('59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0001 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0002 begin');
      expect(DateUtil.getFormattedDuration(3600000)).assertEqual('1:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0002 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0003 begin');
      expect(DateUtil.getFormattedDuration(3600999)).assertEqual('1:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0003 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0004 begin');
      expect(DateUtil.getFormattedDuration(3661000)).assertEqual('1:01:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0004 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0005 begin');
      expect(DateUtil.getFormattedDuration(3696999)).assertEqual('1:01:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0005 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0006 begin');
      expect(DateUtil.getFormattedDuration(3697000)).assertEqual('1:01:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0006 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0007 begin');
      expect(DateUtil.getFormattedDuration(3697999)).assertEqual('1:01:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0007 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0008 begin');
      expect(DateUtil.getFormattedDuration(3758000)).assertEqual('1:02:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0008 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0009 begin');
      expect(DateUtil.getFormattedDuration(3793999)).assertEqual('1:03:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0009 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0010 begin');
      expect(DateUtil.getFormattedDuration(3794000)).assertEqual('1:03:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0010 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0011 begin');
      expect(DateUtil.getFormattedDuration(3794999)).assertEqual('1:03:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0011 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0012 begin');
      expect(DateUtil.getFormattedDuration(3855000)).assertEqual('1:04:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0012 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0013 begin');
      expect(DateUtil.getFormattedDuration(3890999)).assertEqual('1:04:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0013 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0014 begin');
      expect(DateUtil.getFormattedDuration(3891000)).assertEqual('1:04:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0014 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0015 begin');
      expect(DateUtil.getFormattedDuration(3891999)).assertEqual('1:04:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0015 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0016 begin');
      expect(DateUtil.getFormattedDuration(3952000)).assertEqual('1:05:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0016 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0017 begin');
      expect(DateUtil.getFormattedDuration(3987999)).assertEqual('1:06:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0017 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0018 begin');
      expect(DateUtil.getFormattedDuration(3988000)).assertEqual('1:06:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0018 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0019 begin');
      expect(DateUtil.getFormattedDuration(3988999)).assertEqual('1:06:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0019 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0020 begin');
      expect(DateUtil.getFormattedDuration(4049000)).assertEqual('1:07:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0020 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0021 begin');
      expect(DateUtil.getFormattedDuration(4084999)).assertEqual('1:08:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0021 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0022 begin');
      expect(DateUtil.getFormattedDuration(4085000)).assertEqual('1:08:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0022 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0023 begin');
      expect(DateUtil.getFormattedDuration(4085999)).assertEqual('1:08:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0023 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0024 begin');
      expect(DateUtil.getFormattedDuration(4146000)).assertEqual('1:09:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0024 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0025 begin');
      expect(DateUtil.getFormattedDuration(4181999)).assertEqual('1:09:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0025 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0026 begin');
      expect(DateUtil.getFormattedDuration(4182000)).assertEqual('1:09:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0026 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0027 begin');
      expect(DateUtil.getFormattedDuration(4182999)).assertEqual('1:09:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0027 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0028 begin');
      expect(DateUtil.getFormattedDuration(4243000)).assertEqual('1:10:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0028 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0029 begin');
      expect(DateUtil.getFormattedDuration(4278999)).assertEqual('1:11:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0029 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0030 begin');
      expect(DateUtil.getFormattedDuration(4279000)).assertEqual('1:11:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0030 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0031 begin');
      expect(DateUtil.getFormattedDuration(4279999)).assertEqual('1:11:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0031 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0032 begin');
      expect(DateUtil.getFormattedDuration(4340000)).assertEqual('1:12:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0032 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0033 begin');
      expect(DateUtil.getFormattedDuration(4375999)).assertEqual('1:12:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0033 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0034 begin');
      expect(DateUtil.getFormattedDuration(4376000)).assertEqual('1:12:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0034 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0035 begin');
      expect(DateUtil.getFormattedDuration(4376999)).assertEqual('1:12:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0035 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0036 begin');
      expect(DateUtil.getFormattedDuration(4437000)).assertEqual('1:13:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0036 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0037 begin');
      expect(DateUtil.getFormattedDuration(4472999)).assertEqual('1:14:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0037 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0038 begin');
      expect(DateUtil.getFormattedDuration(4473000)).assertEqual('1:14:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0038 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0039 begin');
      expect(DateUtil.getFormattedDuration(4473999)).assertEqual('1:14:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0039 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0040 begin');
      expect(DateUtil.getFormattedDuration(4534000)).assertEqual('1:15:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0040 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0041 begin');
      expect(DateUtil.getFormattedDuration(4569999)).assertEqual('1:16:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0041 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0042 begin');
      expect(DateUtil.getFormattedDuration(4570000)).assertEqual('1:16:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0042 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0043 begin');
      expect(DateUtil.getFormattedDuration(4570999)).assertEqual('1:16:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0043 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0044 begin');
      expect(DateUtil.getFormattedDuration(4631000)).assertEqual('1:17:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0044 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0045 begin');
      expect(DateUtil.getFormattedDuration(4666999)).assertEqual('1:17:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0045 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0046 begin');
      expect(DateUtil.getFormattedDuration(4667000)).assertEqual('1:17:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0046 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0047 begin');
      expect(DateUtil.getFormattedDuration(4667999)).assertEqual('1:17:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0047 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0048 begin');
      expect(DateUtil.getFormattedDuration(4728000)).assertEqual('1:18:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0048 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0049 begin');
      expect(DateUtil.getFormattedDuration(4763999)).assertEqual('1:19:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0049 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0050 begin');
      expect(DateUtil.getFormattedDuration(4764000)).assertEqual('1:19:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0050 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0051 begin');
      expect(DateUtil.getFormattedDuration(4764999)).assertEqual('1:19:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0051 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0052 begin');
      expect(DateUtil.getFormattedDuration(4825000)).assertEqual('1:20:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0052 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0053 begin');
      expect(DateUtil.getFormattedDuration(4860999)).assertEqual('1:21:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0053 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0054 begin');
      expect(DateUtil.getFormattedDuration(4861000)).assertEqual('1:21:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0054 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0055 begin');
      expect(DateUtil.getFormattedDuration(4861999)).assertEqual('1:21:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0055 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0056 begin');
      expect(DateUtil.getFormattedDuration(4922000)).assertEqual('1:22:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0056 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0057 begin');
      expect(DateUtil.getFormattedDuration(4957999)).assertEqual('1:22:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0057 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0058 begin');
      expect(DateUtil.getFormattedDuration(4958000)).assertEqual('1:22:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0058 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0059 begin');
      expect(DateUtil.getFormattedDuration(4958999)).assertEqual('1:22:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0059 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0060 begin');
      expect(DateUtil.getFormattedDuration(5019000)).assertEqual('1:23:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0060 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0061 begin');
      expect(DateUtil.getFormattedDuration(5054999)).assertEqual('1:24:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0061 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0062 begin');
      expect(DateUtil.getFormattedDuration(5055000)).assertEqual('1:24:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0062 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0063 begin');
      expect(DateUtil.getFormattedDuration(5055999)).assertEqual('1:24:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0063 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0064 begin');
      expect(DateUtil.getFormattedDuration(5116000)).assertEqual('1:25:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0064 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0065 begin');
      expect(DateUtil.getFormattedDuration(5151999)).assertEqual('1:25:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0065 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0066 begin');
      expect(DateUtil.getFormattedDuration(5152000)).assertEqual('1:25:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0066 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0067 begin');
      expect(DateUtil.getFormattedDuration(5152999)).assertEqual('1:25:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0067 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0068 begin');
      expect(DateUtil.getFormattedDuration(5213000)).assertEqual('1:26:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0068 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0069 begin');
      expect(DateUtil.getFormattedDuration(5248999)).assertEqual('1:27:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0069 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0070 begin');
      expect(DateUtil.getFormattedDuration(5249000)).assertEqual('1:27:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0070 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0071 begin');
      expect(DateUtil.getFormattedDuration(5249999)).assertEqual('1:27:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0071 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0072 begin');
      expect(DateUtil.getFormattedDuration(5310000)).assertEqual('1:28:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0072 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0073 begin');
      expect(DateUtil.getFormattedDuration(5345999)).assertEqual('1:29:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0073 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0074 begin');
      expect(DateUtil.getFormattedDuration(5346000)).assertEqual('1:29:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0074 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0075 begin');
      expect(DateUtil.getFormattedDuration(5346999)).assertEqual('1:29:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0075 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0076 begin');
      expect(DateUtil.getFormattedDuration(5407000)).assertEqual('1:30:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0076 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0077 begin');
      expect(DateUtil.getFormattedDuration(5442999)).assertEqual('1:30:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0077 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0078 begin');
      expect(DateUtil.getFormattedDuration(5443000)).assertEqual('1:30:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0078 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0079 begin');
      expect(DateUtil.getFormattedDuration(5443999)).assertEqual('1:30:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0079 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0080 begin');
      expect(DateUtil.getFormattedDuration(5504000)).assertEqual('1:31:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0080 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0081 begin');
      expect(DateUtil.getFormattedDuration(5539999)).assertEqual('1:32:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0081 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0082 begin');
      expect(DateUtil.getFormattedDuration(5540000)).assertEqual('1:32:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0082 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0083 begin');
      expect(DateUtil.getFormattedDuration(5540999)).assertEqual('1:32:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0083 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0084 begin');
      expect(DateUtil.getFormattedDuration(5601000)).assertEqual('1:33:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0084 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0085 begin');
      expect(DateUtil.getFormattedDuration(5636999)).assertEqual('1:33:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0085 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0086 begin');
      expect(DateUtil.getFormattedDuration(5637000)).assertEqual('1:33:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0086 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0087 begin');
      expect(DateUtil.getFormattedDuration(5637999)).assertEqual('1:33:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0087 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0088 begin');
      expect(DateUtil.getFormattedDuration(5698000)).assertEqual('1:34:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0088 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0089 begin');
      expect(DateUtil.getFormattedDuration(5733999)).assertEqual('1:35:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0089 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0090 begin');
      expect(DateUtil.getFormattedDuration(5734000)).assertEqual('1:35:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0090 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0091 begin');
      expect(DateUtil.getFormattedDuration(5734999)).assertEqual('1:35:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0091 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0092 begin');
      expect(DateUtil.getFormattedDuration(5795000)).assertEqual('1:36:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0092 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0093 begin');
      expect(DateUtil.getFormattedDuration(5830999)).assertEqual('1:37:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0093 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0094 begin');
      expect(DateUtil.getFormattedDuration(5831000)).assertEqual('1:37:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0094 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0095 begin');
      expect(DateUtil.getFormattedDuration(5831999)).assertEqual('1:37:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0095 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0096 begin');
      expect(DateUtil.getFormattedDuration(5892000)).assertEqual('1:38:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0096 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0097 begin');
      expect(DateUtil.getFormattedDuration(5927999)).assertEqual('1:38:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0097 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0098 begin');
      expect(DateUtil.getFormattedDuration(5928000)).assertEqual('1:38:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0098 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0099 begin');
      expect(DateUtil.getFormattedDuration(5928999)).assertEqual('1:38:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0099 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0100 begin');
      expect(DateUtil.getFormattedDuration(5989000)).assertEqual('1:39:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0100 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0101 begin');
      expect(DateUtil.getFormattedDuration(6024999)).assertEqual('1:40:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0101 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0102 begin');
      expect(DateUtil.getFormattedDuration(6025000)).assertEqual('1:40:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0102 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0103 begin');
      expect(DateUtil.getFormattedDuration(6025999)).assertEqual('1:40:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0103 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0104 begin');
      expect(DateUtil.getFormattedDuration(6086000)).assertEqual('1:41:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0104 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0105 begin');
      expect(DateUtil.getFormattedDuration(6121999)).assertEqual('1:42:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0105 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0106 begin');
      expect(DateUtil.getFormattedDuration(6122000)).assertEqual('1:42:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0106 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0107 begin');
      expect(DateUtil.getFormattedDuration(6122999)).assertEqual('1:42:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0107 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0108 begin');
      expect(DateUtil.getFormattedDuration(6183000)).assertEqual('1:43:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0108 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0109 begin');
      expect(DateUtil.getFormattedDuration(6218999)).assertEqual('1:43:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0109 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0110 begin');
      expect(DateUtil.getFormattedDuration(6219000)).assertEqual('1:43:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0110 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0111 begin');
      expect(DateUtil.getFormattedDuration(6219999)).assertEqual('1:43:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0111 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0112 begin');
      expect(DateUtil.getFormattedDuration(6280000)).assertEqual('1:44:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0112 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0113 begin');
      expect(DateUtil.getFormattedDuration(6315999)).assertEqual('1:45:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0113 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0114 begin');
      expect(DateUtil.getFormattedDuration(6316000)).assertEqual('1:45:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0114 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0115 begin');
      expect(DateUtil.getFormattedDuration(6316999)).assertEqual('1:45:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0115 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0116 begin');
      expect(DateUtil.getFormattedDuration(6377000)).assertEqual('1:46:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0116 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0117 begin');
      expect(DateUtil.getFormattedDuration(6412999)).assertEqual('1:46:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0117 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0118 begin');
      expect(DateUtil.getFormattedDuration(6413000)).assertEqual('1:46:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0118 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0119 begin');
      expect(DateUtil.getFormattedDuration(6413999)).assertEqual('1:46:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0119 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0120 begin');
      expect(DateUtil.getFormattedDuration(6474000)).assertEqual('1:47:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0120 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0121 begin');
      expect(DateUtil.getFormattedDuration(6509999)).assertEqual('1:48:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0121 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0122 begin');
      expect(DateUtil.getFormattedDuration(6510000)).assertEqual('1:48:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0122 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0123 begin');
      expect(DateUtil.getFormattedDuration(6510999)).assertEqual('1:48:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0123 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0124 begin');
      expect(DateUtil.getFormattedDuration(6571000)).assertEqual('1:49:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0124 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0125 begin');
      expect(DateUtil.getFormattedDuration(6606999)).assertEqual('1:50:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0125 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0126 begin');
      expect(DateUtil.getFormattedDuration(6607000)).assertEqual('1:50:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0126 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0127 begin');
      expect(DateUtil.getFormattedDuration(6607999)).assertEqual('1:50:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0127 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0128 begin');
      expect(DateUtil.getFormattedDuration(6668000)).assertEqual('1:51:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0128 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0129 begin');
      expect(DateUtil.getFormattedDuration(6703999)).assertEqual('1:51:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0129 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0130 begin');
      expect(DateUtil.getFormattedDuration(6704000)).assertEqual('1:51:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0130 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0131 begin');
      expect(DateUtil.getFormattedDuration(6704999)).assertEqual('1:51:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0131 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0132 begin');
      expect(DateUtil.getFormattedDuration(6765000)).assertEqual('1:52:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0132 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0133 begin');
      expect(DateUtil.getFormattedDuration(6800999)).assertEqual('1:53:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0133 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0134 begin');
      expect(DateUtil.getFormattedDuration(6801000)).assertEqual('1:53:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0134 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0135 begin');
      expect(DateUtil.getFormattedDuration(6801999)).assertEqual('1:53:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0135 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0136 begin');
      expect(DateUtil.getFormattedDuration(6862000)).assertEqual('1:54:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0136 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0137 begin');
      expect(DateUtil.getFormattedDuration(6897999)).assertEqual('1:54:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0137 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0138 begin');
      expect(DateUtil.getFormattedDuration(6898000)).assertEqual('1:54:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0138 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0139 begin');
      expect(DateUtil.getFormattedDuration(6898999)).assertEqual('1:54:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0139 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0140 begin');
      expect(DateUtil.getFormattedDuration(6959000)).assertEqual('1:55:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0140 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0141 begin');
      expect(DateUtil.getFormattedDuration(6994999)).assertEqual('1:56:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0141 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0142 begin');
      expect(DateUtil.getFormattedDuration(6995000)).assertEqual('1:56:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0142 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0143 begin');
      expect(DateUtil.getFormattedDuration(6995999)).assertEqual('1:56:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0143 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0144 begin');
      expect(DateUtil.getFormattedDuration(7056000)).assertEqual('1:57:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0144 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0145 begin');
      expect(DateUtil.getFormattedDuration(7091999)).assertEqual('1:58:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0145 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0146 begin');
      expect(DateUtil.getFormattedDuration(7092000)).assertEqual('1:58:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0146 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0147 begin');
      expect(DateUtil.getFormattedDuration(7092999)).assertEqual('1:58:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0147 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0148 begin');
      expect(DateUtil.getFormattedDuration(7153000)).assertEqual('1:59:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0148 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0149 begin');
      expect(DateUtil.getFormattedDuration(7188999)).assertEqual('1:59:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0149 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0150 begin');
      expect(DateUtil.getFormattedDuration(7189000)).assertEqual('1:59:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0150 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0151 begin');
      expect(DateUtil.getFormattedDuration(7189999)).assertEqual('1:59:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0151 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0152 begin');
      expect(DateUtil.getFormattedDuration(7250000)).assertEqual('2:00:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0152 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0153 begin');
      expect(DateUtil.getFormattedDuration(7285999)).assertEqual('2:01:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0153 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0154 begin');
      expect(DateUtil.getFormattedDuration(7286000)).assertEqual('2:01:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0154 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0155 begin');
      expect(DateUtil.getFormattedDuration(7286999)).assertEqual('2:01:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0155 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0156 begin');
      expect(DateUtil.getFormattedDuration(7347000)).assertEqual('2:02:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0156 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0157 begin');
      expect(DateUtil.getFormattedDuration(7382999)).assertEqual('2:03:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0157 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0158 begin');
      expect(DateUtil.getFormattedDuration(7383000)).assertEqual('2:03:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0158 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0159 begin');
      expect(DateUtil.getFormattedDuration(7383999)).assertEqual('2:03:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0159 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0160 begin');
      expect(DateUtil.getFormattedDuration(7444000)).assertEqual('2:04:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0160 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0161 begin');
      expect(DateUtil.getFormattedDuration(7479999)).assertEqual('2:04:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0161 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0162 begin');
      expect(DateUtil.getFormattedDuration(7480000)).assertEqual('2:04:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0162 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0163 begin');
      expect(DateUtil.getFormattedDuration(7480999)).assertEqual('2:04:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0163 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0164 begin');
      expect(DateUtil.getFormattedDuration(7541000)).assertEqual('2:05:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0164 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0165 begin');
      expect(DateUtil.getFormattedDuration(7576999)).assertEqual('2:06:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0165 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0166 begin');
      expect(DateUtil.getFormattedDuration(7577000)).assertEqual('2:06:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0166 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0167 begin');
      expect(DateUtil.getFormattedDuration(7577999)).assertEqual('2:06:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0167 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0168 begin');
      expect(DateUtil.getFormattedDuration(7638000)).assertEqual('2:07:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0168 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0169 begin');
      expect(DateUtil.getFormattedDuration(7673999)).assertEqual('2:07:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0169 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0170 begin');
      expect(DateUtil.getFormattedDuration(7674000)).assertEqual('2:07:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0170 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0171 begin');
      expect(DateUtil.getFormattedDuration(7674999)).assertEqual('2:07:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0171 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0172 begin');
      expect(DateUtil.getFormattedDuration(7735000)).assertEqual('2:08:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0172 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0173 begin');
      expect(DateUtil.getFormattedDuration(7770999)).assertEqual('2:09:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0173 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0174 begin');
      expect(DateUtil.getFormattedDuration(7771000)).assertEqual('2:09:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0174 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0175 begin');
      expect(DateUtil.getFormattedDuration(7771999)).assertEqual('2:09:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0175 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0176 begin');
      expect(DateUtil.getFormattedDuration(7832000)).assertEqual('2:10:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0176 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0177 begin');
      expect(DateUtil.getFormattedDuration(7867999)).assertEqual('2:11:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0177 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0178 begin');
      expect(DateUtil.getFormattedDuration(7868000)).assertEqual('2:11:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0178 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0179 begin');
      expect(DateUtil.getFormattedDuration(7868999)).assertEqual('2:11:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0179 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0180 begin');
      expect(DateUtil.getFormattedDuration(7929000)).assertEqual('2:12:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0180 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0181 begin');
      expect(DateUtil.getFormattedDuration(7964999)).assertEqual('2:12:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0181 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0182 begin');
      expect(DateUtil.getFormattedDuration(7965000)).assertEqual('2:12:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0182 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0183 begin');
      expect(DateUtil.getFormattedDuration(7965999)).assertEqual('2:12:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0183 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0184 begin');
      expect(DateUtil.getFormattedDuration(8026000)).assertEqual('2:13:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0184 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0185 begin');
      expect(DateUtil.getFormattedDuration(8061999)).assertEqual('2:14:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0185 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0186 begin');
      expect(DateUtil.getFormattedDuration(8062000)).assertEqual('2:14:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0186 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0187 begin');
      expect(DateUtil.getFormattedDuration(8062999)).assertEqual('2:14:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0187 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0188 begin');
      expect(DateUtil.getFormattedDuration(8123000)).assertEqual('2:15:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0188 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0189 begin');
      expect(DateUtil.getFormattedDuration(8158999)).assertEqual('2:15:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0189 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0190 begin');
      expect(DateUtil.getFormattedDuration(8159000)).assertEqual('2:15:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0190 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0191 begin');
      expect(DateUtil.getFormattedDuration(8159999)).assertEqual('2:15:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0191 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0192 begin');
      expect(DateUtil.getFormattedDuration(8220000)).assertEqual('2:17:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0192 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0193 begin');
      expect(DateUtil.getFormattedDuration(8255999)).assertEqual('2:17:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0193 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0194 begin');
      expect(DateUtil.getFormattedDuration(8256000)).assertEqual('2:17:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0194 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0195 begin');
      expect(DateUtil.getFormattedDuration(8256999)).assertEqual('2:17:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0195 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0196 begin');
      expect(DateUtil.getFormattedDuration(8317000)).assertEqual('2:18:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0196 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0197 begin');
      expect(DateUtil.getFormattedDuration(8352999)).assertEqual('2:19:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0197 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0198 begin');
      expect(DateUtil.getFormattedDuration(8353000)).assertEqual('2:19:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0198 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0199 begin');
      expect(DateUtil.getFormattedDuration(8353999)).assertEqual('2:19:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0199 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0200 begin');
      expect(DateUtil.getFormattedDuration(8414000)).assertEqual('2:20:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0200 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0201 begin');
      expect(DateUtil.getFormattedDuration(8449999)).assertEqual('2:20:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0201 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0202 begin');
      expect(DateUtil.getFormattedDuration(8450000)).assertEqual('2:20:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0202 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0203 begin');
      expect(DateUtil.getFormattedDuration(8450999)).assertEqual('2:20:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0203 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0204 begin');
      expect(DateUtil.getFormattedDuration(8511000)).assertEqual('2:21:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0204 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0205 begin');
      expect(DateUtil.getFormattedDuration(8546999)).assertEqual('2:22:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0205 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0206 begin');
      expect(DateUtil.getFormattedDuration(8547000)).assertEqual('2:22:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0206 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0207 begin');
      expect(DateUtil.getFormattedDuration(8547999)).assertEqual('2:22:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0207 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0208 begin');
      expect(DateUtil.getFormattedDuration(8608000)).assertEqual('2:23:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0208 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0209 begin');
      expect(DateUtil.getFormattedDuration(8643999)).assertEqual('2:24:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0209 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0210 begin');
      expect(DateUtil.getFormattedDuration(8644000)).assertEqual('2:24:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0210 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0211 begin');
      expect(DateUtil.getFormattedDuration(8644999)).assertEqual('2:24:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0211 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0212 begin');
      expect(DateUtil.getFormattedDuration(8705000)).assertEqual('2:25:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0212 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0213 begin');
      expect(DateUtil.getFormattedDuration(8740999)).assertEqual('2:25:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0213 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0214 begin');
      expect(DateUtil.getFormattedDuration(8741000)).assertEqual('2:25:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0214 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0215 begin');
      expect(DateUtil.getFormattedDuration(8741999)).assertEqual('2:25:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0215 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0216 begin');
      expect(DateUtil.getFormattedDuration(8802000)).assertEqual('2:26:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0216 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0217 begin');
      expect(DateUtil.getFormattedDuration(8837999)).assertEqual('2:27:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0217 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0218 begin');
      expect(DateUtil.getFormattedDuration(8838000)).assertEqual('2:27:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0218 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0219 begin');
      expect(DateUtil.getFormattedDuration(8838999)).assertEqual('2:27:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0219 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0220 begin');
      expect(DateUtil.getFormattedDuration(8899000)).assertEqual('2:28:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0220 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0221 begin');
      expect(DateUtil.getFormattedDuration(8934999)).assertEqual('2:28:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0221 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0222 begin');
      expect(DateUtil.getFormattedDuration(8935000)).assertEqual('2:28:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0222 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0223 begin');
      expect(DateUtil.getFormattedDuration(8935999)).assertEqual('2:28:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0223 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0224 begin');
      expect(DateUtil.getFormattedDuration(8996000)).assertEqual('2:29:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0224 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0225 begin');
      expect(DateUtil.getFormattedDuration(9031999)).assertEqual('2:30:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0225 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0226 begin');
      expect(DateUtil.getFormattedDuration(9032000)).assertEqual('2:30:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0226 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0227 begin');
      expect(DateUtil.getFormattedDuration(9032999)).assertEqual('2:30:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0227 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0228 begin');
      expect(DateUtil.getFormattedDuration(9093000)).assertEqual('2:31:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0228 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0229 begin');
      expect(DateUtil.getFormattedDuration(9128999)).assertEqual('2:32:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0229 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0230 begin');
      expect(DateUtil.getFormattedDuration(9129000)).assertEqual('2:32:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0230 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0231 begin');
      expect(DateUtil.getFormattedDuration(9129999)).assertEqual('2:32:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0231 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0232 begin');
      expect(DateUtil.getFormattedDuration(9190000)).assertEqual('2:33:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0232 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0233 begin');
      expect(DateUtil.getFormattedDuration(9225999)).assertEqual('2:33:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0233 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0234 begin');
      expect(DateUtil.getFormattedDuration(9226000)).assertEqual('2:33:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0234 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0235 begin');
      expect(DateUtil.getFormattedDuration(9226999)).assertEqual('2:33:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0235 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0236 begin');
      expect(DateUtil.getFormattedDuration(9287000)).assertEqual('2:34:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0236 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0237 begin');
      expect(DateUtil.getFormattedDuration(9322999)).assertEqual('2:35:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0237 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0238 begin');
      expect(DateUtil.getFormattedDuration(9323000)).assertEqual('2:35:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0238 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0239 begin');
      expect(DateUtil.getFormattedDuration(9323999)).assertEqual('2:35:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0239 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0240 begin');
      expect(DateUtil.getFormattedDuration(9384000)).assertEqual('2:36:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0240 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0241 begin');
      expect(DateUtil.getFormattedDuration(9419999)).assertEqual('2:36:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0241 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0242 begin');
      expect(DateUtil.getFormattedDuration(9420000)).assertEqual('2:37:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0242 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0243 begin');
      expect(DateUtil.getFormattedDuration(9420999)).assertEqual('2:37:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0243 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0244 begin');
      expect(DateUtil.getFormattedDuration(9481000)).assertEqual('2:38:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0244 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0245 begin');
      expect(DateUtil.getFormattedDuration(9516999)).assertEqual('2:38:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0245 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0246 begin');
      expect(DateUtil.getFormattedDuration(9517000)).assertEqual('2:38:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0246 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0247 begin');
      expect(DateUtil.getFormattedDuration(9517999)).assertEqual('2:38:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0247 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0248 begin');
      expect(DateUtil.getFormattedDuration(9578000)).assertEqual('2:39:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0248 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0249 begin');
      expect(DateUtil.getFormattedDuration(9613999)).assertEqual('2:40:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0249 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0250 begin');
      expect(DateUtil.getFormattedDuration(9614000)).assertEqual('2:40:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0250 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0251 begin');
      expect(DateUtil.getFormattedDuration(9614999)).assertEqual('2:40:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0251 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0252 begin');
      expect(DateUtil.getFormattedDuration(9675000)).assertEqual('2:41:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0252 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0253 begin');
      expect(DateUtil.getFormattedDuration(9710999)).assertEqual('2:41:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0253 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0254 begin');
      expect(DateUtil.getFormattedDuration(9711000)).assertEqual('2:41:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0254 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0255 begin');
      expect(DateUtil.getFormattedDuration(9711999)).assertEqual('2:41:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0255 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0256
     * @tc.name      testPhotosDateDurationExt0256
     * @tc.desc      Formats extended duration sample 64. case 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0256 begin');
      expect(DateUtil.getFormattedDuration(9772000)).assertEqual('2:42:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0256 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0257
     * @tc.name      testPhotosDateDurationExt0257
     * @tc.desc      Formats extended duration sample 65. case 257
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0257 begin');
      expect(DateUtil.getFormattedDuration(9807999)).assertEqual('2:43:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0257 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0258
     * @tc.name      testPhotosDateDurationExt0258
     * @tc.desc      Formats extended duration sample 65. case 258
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0258 begin');
      expect(DateUtil.getFormattedDuration(9808000)).assertEqual('2:43:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0258 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0259
     * @tc.name      testPhotosDateDurationExt0259
     * @tc.desc      Formats extended duration sample 65. case 259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0259 begin');
      expect(DateUtil.getFormattedDuration(9808999)).assertEqual('2:43:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0259 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0260
     * @tc.name      testPhotosDateDurationExt0260
     * @tc.desc      Formats extended duration sample 65. case 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0260 begin');
      expect(DateUtil.getFormattedDuration(9869000)).assertEqual('2:44:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0260 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0261
     * @tc.name      testPhotosDateDurationExt0261
     * @tc.desc      Formats extended duration sample 66. case 261
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0261 begin');
      expect(DateUtil.getFormattedDuration(9904999)).assertEqual('2:45:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0261 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0262
     * @tc.name      testPhotosDateDurationExt0262
     * @tc.desc      Formats extended duration sample 66. case 262
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0262 begin');
      expect(DateUtil.getFormattedDuration(9905000)).assertEqual('2:45:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0262 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0263
     * @tc.name      testPhotosDateDurationExt0263
     * @tc.desc      Formats extended duration sample 66. case 263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0263 begin');
      expect(DateUtil.getFormattedDuration(9905999)).assertEqual('2:45:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0263 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0264
     * @tc.name      testPhotosDateDurationExt0264
     * @tc.desc      Formats extended duration sample 66. case 264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0264 begin');
      expect(DateUtil.getFormattedDuration(9966000)).assertEqual('2:46:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0264 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0265
     * @tc.name      testPhotosDateDurationExt0265
     * @tc.desc      Formats extended duration sample 67. case 265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0265 begin');
      expect(DateUtil.getFormattedDuration(10001999)).assertEqual('2:46:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0265 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0266
     * @tc.name      testPhotosDateDurationExt0266
     * @tc.desc      Formats extended duration sample 67. case 266
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0266 begin');
      expect(DateUtil.getFormattedDuration(10002000)).assertEqual('2:46:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0266 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0267
     * @tc.name      testPhotosDateDurationExt0267
     * @tc.desc      Formats extended duration sample 67. case 267
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0267 begin');
      expect(DateUtil.getFormattedDuration(10002999)).assertEqual('2:46:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0267 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0268
     * @tc.name      testPhotosDateDurationExt0268
     * @tc.desc      Formats extended duration sample 67. case 268
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0268 begin');
      expect(DateUtil.getFormattedDuration(10063000)).assertEqual('2:47:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0268 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0269
     * @tc.name      testPhotosDateDurationExt0269
     * @tc.desc      Formats extended duration sample 68. case 269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0269 begin');
      expect(DateUtil.getFormattedDuration(10098999)).assertEqual('2:48:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0269 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0270
     * @tc.name      testPhotosDateDurationExt0270
     * @tc.desc      Formats extended duration sample 68. case 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0270 begin');
      expect(DateUtil.getFormattedDuration(10099000)).assertEqual('2:48:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0270 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0271
     * @tc.name      testPhotosDateDurationExt0271
     * @tc.desc      Formats extended duration sample 68. case 271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0271 begin');
      expect(DateUtil.getFormattedDuration(10099999)).assertEqual('2:48:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0271 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0272
     * @tc.name      testPhotosDateDurationExt0272
     * @tc.desc      Formats extended duration sample 68. case 272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0272 begin');
      expect(DateUtil.getFormattedDuration(10160000)).assertEqual('2:49:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0272 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0273
     * @tc.name      testPhotosDateDurationExt0273
     * @tc.desc      Formats extended duration sample 69. case 273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0273 begin');
      expect(DateUtil.getFormattedDuration(10195999)).assertEqual('2:49:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0273 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0274
     * @tc.name      testPhotosDateDurationExt0274
     * @tc.desc      Formats extended duration sample 69. case 274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0274 begin');
      expect(DateUtil.getFormattedDuration(10196000)).assertEqual('2:49:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0274 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0275
     * @tc.name      testPhotosDateDurationExt0275
     * @tc.desc      Formats extended duration sample 69. case 275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0275 begin');
      expect(DateUtil.getFormattedDuration(10196999)).assertEqual('2:49:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0275 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0276
     * @tc.name      testPhotosDateDurationExt0276
     * @tc.desc      Formats extended duration sample 69. case 276
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0276 begin');
      expect(DateUtil.getFormattedDuration(10257000)).assertEqual('2:50:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0276 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0277
     * @tc.name      testPhotosDateDurationExt0277
     * @tc.desc      Formats extended duration sample 70. case 277
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0277 begin');
      expect(DateUtil.getFormattedDuration(10292999)).assertEqual('2:51:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0277 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0278
     * @tc.name      testPhotosDateDurationExt0278
     * @tc.desc      Formats extended duration sample 70. case 278
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0278 begin');
      expect(DateUtil.getFormattedDuration(10293000)).assertEqual('2:51:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0278 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0279
     * @tc.name      testPhotosDateDurationExt0279
     * @tc.desc      Formats extended duration sample 70. case 279
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0279 begin');
      expect(DateUtil.getFormattedDuration(10293999)).assertEqual('2:51:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0279 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0280
     * @tc.name      testPhotosDateDurationExt0280
     * @tc.desc      Formats extended duration sample 70. case 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0280 begin');
      expect(DateUtil.getFormattedDuration(10354000)).assertEqual('2:52:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0280 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0281
     * @tc.name      testPhotosDateDurationExt0281
     * @tc.desc      Formats extended duration sample 71. case 281
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0281 begin');
      expect(DateUtil.getFormattedDuration(10389999)).assertEqual('2:53:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0281 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0282
     * @tc.name      testPhotosDateDurationExt0282
     * @tc.desc      Formats extended duration sample 71. case 282
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0282 begin');
      expect(DateUtil.getFormattedDuration(10390000)).assertEqual('2:53:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0282 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0283
     * @tc.name      testPhotosDateDurationExt0283
     * @tc.desc      Formats extended duration sample 71. case 283
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0283 begin');
      expect(DateUtil.getFormattedDuration(10390999)).assertEqual('2:53:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0283 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0284
     * @tc.name      testPhotosDateDurationExt0284
     * @tc.desc      Formats extended duration sample 71. case 284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0284 begin');
      expect(DateUtil.getFormattedDuration(10451000)).assertEqual('2:54:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0284 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0285
     * @tc.name      testPhotosDateDurationExt0285
     * @tc.desc      Formats extended duration sample 72. case 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0285 begin');
      expect(DateUtil.getFormattedDuration(10486999)).assertEqual('2:54:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0285 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0286
     * @tc.name      testPhotosDateDurationExt0286
     * @tc.desc      Formats extended duration sample 72. case 286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0286 begin');
      expect(DateUtil.getFormattedDuration(10487000)).assertEqual('2:54:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0286 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0287
     * @tc.name      testPhotosDateDurationExt0287
     * @tc.desc      Formats extended duration sample 72. case 287
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0287 begin');
      expect(DateUtil.getFormattedDuration(10487999)).assertEqual('2:54:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0287 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0288
     * @tc.name      testPhotosDateDurationExt0288
     * @tc.desc      Formats extended duration sample 72. case 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0288 begin');
      expect(DateUtil.getFormattedDuration(10548000)).assertEqual('2:55:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0288 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0289
     * @tc.name      testPhotosDateDurationExt0289
     * @tc.desc      Formats extended duration sample 73. case 289
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0289 begin');
      expect(DateUtil.getFormattedDuration(10583999)).assertEqual('2:56:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0289 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0290
     * @tc.name      testPhotosDateDurationExt0290
     * @tc.desc      Formats extended duration sample 73. case 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0290 begin');
      expect(DateUtil.getFormattedDuration(10584000)).assertEqual('2:56:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0290 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0291
     * @tc.name      testPhotosDateDurationExt0291
     * @tc.desc      Formats extended duration sample 73. case 291
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0291 begin');
      expect(DateUtil.getFormattedDuration(10584999)).assertEqual('2:56:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0291 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0292
     * @tc.name      testPhotosDateDurationExt0292
     * @tc.desc      Formats extended duration sample 73. case 292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0292 begin');
      expect(DateUtil.getFormattedDuration(10645000)).assertEqual('2:57:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0292 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0293
     * @tc.name      testPhotosDateDurationExt0293
     * @tc.desc      Formats extended duration sample 74. case 293
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0293 begin');
      expect(DateUtil.getFormattedDuration(10680999)).assertEqual('2:58:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0293 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0294
     * @tc.name      testPhotosDateDurationExt0294
     * @tc.desc      Formats extended duration sample 74. case 294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0294 begin');
      expect(DateUtil.getFormattedDuration(10681000)).assertEqual('2:58:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0294 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0295
     * @tc.name      testPhotosDateDurationExt0295
     * @tc.desc      Formats extended duration sample 74. case 295
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0295 begin');
      expect(DateUtil.getFormattedDuration(10681999)).assertEqual('2:58:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0295 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0296
     * @tc.name      testPhotosDateDurationExt0296
     * @tc.desc      Formats extended duration sample 74. case 296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0296 begin');
      expect(DateUtil.getFormattedDuration(10742000)).assertEqual('2:59:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0296 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0297
     * @tc.name      testPhotosDateDurationExt0297
     * @tc.desc      Formats extended duration sample 75. case 297
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0297 begin');
      expect(DateUtil.getFormattedDuration(10777999)).assertEqual('2:59:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0297 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0298
     * @tc.name      testPhotosDateDurationExt0298
     * @tc.desc      Formats extended duration sample 75. case 298
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0298 begin');
      expect(DateUtil.getFormattedDuration(10778000)).assertEqual('2:59:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0298 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0299
     * @tc.name      testPhotosDateDurationExt0299
     * @tc.desc      Formats extended duration sample 75. case 299
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0299 begin');
      expect(DateUtil.getFormattedDuration(10778999)).assertEqual('2:59:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0299 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0300
     * @tc.name      testPhotosDateDurationExt0300
     * @tc.desc      Formats extended duration sample 75. case 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0300 begin');
      expect(DateUtil.getFormattedDuration(10839000)).assertEqual('3:00:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0300 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0301
     * @tc.name      testPhotosDateDurationExt0301
     * @tc.desc      Formats extended duration sample 76. case 301
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0301 begin');
      expect(DateUtil.getFormattedDuration(10874999)).assertEqual('3:01:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0301 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0302
     * @tc.name      testPhotosDateDurationExt0302
     * @tc.desc      Formats extended duration sample 76. case 302
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0302 begin');
      expect(DateUtil.getFormattedDuration(10875000)).assertEqual('3:01:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0302 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0303
     * @tc.name      testPhotosDateDurationExt0303
     * @tc.desc      Formats extended duration sample 76. case 303
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0303 begin');
      expect(DateUtil.getFormattedDuration(10875999)).assertEqual('3:01:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0303 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0304
     * @tc.name      testPhotosDateDurationExt0304
     * @tc.desc      Formats extended duration sample 76. case 304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0304 begin');
      expect(DateUtil.getFormattedDuration(10936000)).assertEqual('3:02:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0304 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0305
     * @tc.name      testPhotosDateDurationExt0305
     * @tc.desc      Formats extended duration sample 77. case 305
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0305 begin');
      expect(DateUtil.getFormattedDuration(10971999)).assertEqual('3:02:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0305 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0306
     * @tc.name      testPhotosDateDurationExt0306
     * @tc.desc      Formats extended duration sample 77. case 306
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0306 begin');
      expect(DateUtil.getFormattedDuration(10972000)).assertEqual('3:02:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0306 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0307
     * @tc.name      testPhotosDateDurationExt0307
     * @tc.desc      Formats extended duration sample 77. case 307
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0307 begin');
      expect(DateUtil.getFormattedDuration(10972999)).assertEqual('3:02:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0307 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0308
     * @tc.name      testPhotosDateDurationExt0308
     * @tc.desc      Formats extended duration sample 77. case 308
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0308 begin');
      expect(DateUtil.getFormattedDuration(11033000)).assertEqual('3:03:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0308 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0309
     * @tc.name      testPhotosDateDurationExt0309
     * @tc.desc      Formats extended duration sample 78. case 309
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0309 begin');
      expect(DateUtil.getFormattedDuration(11068999)).assertEqual('3:04:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0309 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0310
     * @tc.name      testPhotosDateDurationExt0310
     * @tc.desc      Formats extended duration sample 78. case 310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0310 begin');
      expect(DateUtil.getFormattedDuration(11069000)).assertEqual('3:04:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0310 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0311
     * @tc.name      testPhotosDateDurationExt0311
     * @tc.desc      Formats extended duration sample 78. case 311
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0311 begin');
      expect(DateUtil.getFormattedDuration(11069999)).assertEqual('3:04:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0311 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0312
     * @tc.name      testPhotosDateDurationExt0312
     * @tc.desc      Formats extended duration sample 78. case 312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0312 begin');
      expect(DateUtil.getFormattedDuration(11130000)).assertEqual('3:05:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0312 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0313
     * @tc.name      testPhotosDateDurationExt0313
     * @tc.desc      Formats extended duration sample 79. case 313
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0313 begin');
      expect(DateUtil.getFormattedDuration(11165999)).assertEqual('3:06:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0313 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0314
     * @tc.name      testPhotosDateDurationExt0314
     * @tc.desc      Formats extended duration sample 79. case 314
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0314 begin');
      expect(DateUtil.getFormattedDuration(11166000)).assertEqual('3:06:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0314 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0315
     * @tc.name      testPhotosDateDurationExt0315
     * @tc.desc      Formats extended duration sample 79. case 315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0315 begin');
      expect(DateUtil.getFormattedDuration(11166999)).assertEqual('3:06:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0315 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0316
     * @tc.name      testPhotosDateDurationExt0316
     * @tc.desc      Formats extended duration sample 79. case 316
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0316 begin');
      expect(DateUtil.getFormattedDuration(11227000)).assertEqual('3:07:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0316 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0317
     * @tc.name      testPhotosDateDurationExt0317
     * @tc.desc      Formats extended duration sample 80. case 317
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0317 begin');
      expect(DateUtil.getFormattedDuration(11262999)).assertEqual('3:07:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0317 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0318
     * @tc.name      testPhotosDateDurationExt0318
     * @tc.desc      Formats extended duration sample 80. case 318
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0318 begin');
      expect(DateUtil.getFormattedDuration(11263000)).assertEqual('3:07:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0318 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0319
     * @tc.name      testPhotosDateDurationExt0319
     * @tc.desc      Formats extended duration sample 80. case 319
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0319 begin');
      expect(DateUtil.getFormattedDuration(11263999)).assertEqual('3:07:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0319 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0320
     * @tc.name      testPhotosDateDurationExt0320
     * @tc.desc      Formats extended duration sample 80. case 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0320 begin');
      expect(DateUtil.getFormattedDuration(11324000)).assertEqual('3:08:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0320 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0321
     * @tc.name      testPhotosDateDurationExt0321
     * @tc.desc      Formats extended duration sample 81. case 321
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0321 begin');
      expect(DateUtil.getFormattedDuration(11359999)).assertEqual('3:09:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0321 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0322
     * @tc.name      testPhotosDateDurationExt0322
     * @tc.desc      Formats extended duration sample 81. case 322
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0322 begin');
      expect(DateUtil.getFormattedDuration(11360000)).assertEqual('3:09:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0322 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0323
     * @tc.name      testPhotosDateDurationExt0323
     * @tc.desc      Formats extended duration sample 81. case 323
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0323 begin');
      expect(DateUtil.getFormattedDuration(11360999)).assertEqual('3:09:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0323 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0324
     * @tc.name      testPhotosDateDurationExt0324
     * @tc.desc      Formats extended duration sample 81. case 324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0324 begin');
      expect(DateUtil.getFormattedDuration(11421000)).assertEqual('3:10:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0324 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0325
     * @tc.name      testPhotosDateDurationExt0325
     * @tc.desc      Formats extended duration sample 82. case 325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0325 begin');
      expect(DateUtil.getFormattedDuration(11456999)).assertEqual('3:10:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0325 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0326
     * @tc.name      testPhotosDateDurationExt0326
     * @tc.desc      Formats extended duration sample 82. case 326
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0326 begin');
      expect(DateUtil.getFormattedDuration(11457000)).assertEqual('3:10:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0326 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0327
     * @tc.name      testPhotosDateDurationExt0327
     * @tc.desc      Formats extended duration sample 82. case 327
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0327 begin');
      expect(DateUtil.getFormattedDuration(11457999)).assertEqual('3:10:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0327 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0328
     * @tc.name      testPhotosDateDurationExt0328
     * @tc.desc      Formats extended duration sample 82. case 328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0328 begin');
      expect(DateUtil.getFormattedDuration(11518000)).assertEqual('3:11:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0328 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0329
     * @tc.name      testPhotosDateDurationExt0329
     * @tc.desc      Formats extended duration sample 83. case 329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0329 begin');
      expect(DateUtil.getFormattedDuration(11553999)).assertEqual('3:12:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0329 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0330
     * @tc.name      testPhotosDateDurationExt0330
     * @tc.desc      Formats extended duration sample 83. case 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0330 begin');
      expect(DateUtil.getFormattedDuration(11554000)).assertEqual('3:12:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0330 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0331
     * @tc.name      testPhotosDateDurationExt0331
     * @tc.desc      Formats extended duration sample 83. case 331
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0331 begin');
      expect(DateUtil.getFormattedDuration(11554999)).assertEqual('3:12:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0331 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0332
     * @tc.name      testPhotosDateDurationExt0332
     * @tc.desc      Formats extended duration sample 83. case 332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0332 begin');
      expect(DateUtil.getFormattedDuration(11615000)).assertEqual('3:13:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0332 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0333
     * @tc.name      testPhotosDateDurationExt0333
     * @tc.desc      Formats extended duration sample 84. case 333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0333 begin');
      expect(DateUtil.getFormattedDuration(11650999)).assertEqual('3:14:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0333 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0334
     * @tc.name      testPhotosDateDurationExt0334
     * @tc.desc      Formats extended duration sample 84. case 334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0334 begin');
      expect(DateUtil.getFormattedDuration(11651000)).assertEqual('3:14:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0334 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0335
     * @tc.name      testPhotosDateDurationExt0335
     * @tc.desc      Formats extended duration sample 84. case 335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0335 begin');
      expect(DateUtil.getFormattedDuration(11651999)).assertEqual('3:14:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0335 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0336
     * @tc.name      testPhotosDateDurationExt0336
     * @tc.desc      Formats extended duration sample 84. case 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0336 begin');
      expect(DateUtil.getFormattedDuration(11712000)).assertEqual('3:15:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0336 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0337
     * @tc.name      testPhotosDateDurationExt0337
     * @tc.desc      Formats extended duration sample 85. case 337
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0337 begin');
      expect(DateUtil.getFormattedDuration(11747999)).assertEqual('3:15:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0337 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0338
     * @tc.name      testPhotosDateDurationExt0338
     * @tc.desc      Formats extended duration sample 85. case 338
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0338 begin');
      expect(DateUtil.getFormattedDuration(11748000)).assertEqual('3:15:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0338 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0339
     * @tc.name      testPhotosDateDurationExt0339
     * @tc.desc      Formats extended duration sample 85. case 339
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0339 begin');
      expect(DateUtil.getFormattedDuration(11748999)).assertEqual('3:15:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0339 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0340
     * @tc.name      testPhotosDateDurationExt0340
     * @tc.desc      Formats extended duration sample 85. case 340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0340 begin');
      expect(DateUtil.getFormattedDuration(11809000)).assertEqual('3:16:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0340 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0341
     * @tc.name      testPhotosDateDurationExt0341
     * @tc.desc      Formats extended duration sample 86. case 341
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0341 begin');
      expect(DateUtil.getFormattedDuration(11844999)).assertEqual('3:17:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0341 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0342
     * @tc.name      testPhotosDateDurationExt0342
     * @tc.desc      Formats extended duration sample 86. case 342
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0342 begin');
      expect(DateUtil.getFormattedDuration(11845000)).assertEqual('3:17:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0342 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0343
     * @tc.name      testPhotosDateDurationExt0343
     * @tc.desc      Formats extended duration sample 86. case 343
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0343 begin');
      expect(DateUtil.getFormattedDuration(11845999)).assertEqual('3:17:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0343 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0344
     * @tc.name      testPhotosDateDurationExt0344
     * @tc.desc      Formats extended duration sample 86. case 344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0344 begin');
      expect(DateUtil.getFormattedDuration(11906000)).assertEqual('3:18:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0344 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0345
     * @tc.name      testPhotosDateDurationExt0345
     * @tc.desc      Formats extended duration sample 87. case 345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0345 begin');
      expect(DateUtil.getFormattedDuration(11941999)).assertEqual('3:19:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0345 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0346
     * @tc.name      testPhotosDateDurationExt0346
     * @tc.desc      Formats extended duration sample 87. case 346
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0346 begin');
      expect(DateUtil.getFormattedDuration(11942000)).assertEqual('3:19:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0346 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0347
     * @tc.name      testPhotosDateDurationExt0347
     * @tc.desc      Formats extended duration sample 87. case 347
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0347 begin');
      expect(DateUtil.getFormattedDuration(11942999)).assertEqual('3:19:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0347 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0348
     * @tc.name      testPhotosDateDurationExt0348
     * @tc.desc      Formats extended duration sample 87. case 348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0348 begin');
      expect(DateUtil.getFormattedDuration(12003000)).assertEqual('3:20:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0348 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0349
     * @tc.name      testPhotosDateDurationExt0349
     * @tc.desc      Formats extended duration sample 88. case 349
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0349 begin');
      expect(DateUtil.getFormattedDuration(12038999)).assertEqual('3:20:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0349 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0350
     * @tc.name      testPhotosDateDurationExt0350
     * @tc.desc      Formats extended duration sample 88. case 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0350 begin');
      expect(DateUtil.getFormattedDuration(12039000)).assertEqual('3:20:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0350 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0351
     * @tc.name      testPhotosDateDurationExt0351
     * @tc.desc      Formats extended duration sample 88. case 351
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0351 begin');
      expect(DateUtil.getFormattedDuration(12039999)).assertEqual('3:20:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0351 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0352
     * @tc.name      testPhotosDateDurationExt0352
     * @tc.desc      Formats extended duration sample 88. case 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0352 begin');
      expect(DateUtil.getFormattedDuration(12100000)).assertEqual('3:21:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0352 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0353
     * @tc.name      testPhotosDateDurationExt0353
     * @tc.desc      Formats extended duration sample 89. case 353
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0353 begin');
      expect(DateUtil.getFormattedDuration(12135999)).assertEqual('3:22:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0353 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0354
     * @tc.name      testPhotosDateDurationExt0354
     * @tc.desc      Formats extended duration sample 89. case 354
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0354 begin');
      expect(DateUtil.getFormattedDuration(12136000)).assertEqual('3:22:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0354 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0355
     * @tc.name      testPhotosDateDurationExt0355
     * @tc.desc      Formats extended duration sample 89. case 355
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0355 begin');
      expect(DateUtil.getFormattedDuration(12136999)).assertEqual('3:22:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0355 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0356
     * @tc.name      testPhotosDateDurationExt0356
     * @tc.desc      Formats extended duration sample 89. case 356
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0356 begin');
      expect(DateUtil.getFormattedDuration(12197000)).assertEqual('3:23:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0356 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0357
     * @tc.name      testPhotosDateDurationExt0357
     * @tc.desc      Formats extended duration sample 90. case 357
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0357 begin');
      expect(DateUtil.getFormattedDuration(12232999)).assertEqual('3:23:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0357 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0358
     * @tc.name      testPhotosDateDurationExt0358
     * @tc.desc      Formats extended duration sample 90. case 358
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0358 begin');
      expect(DateUtil.getFormattedDuration(12233000)).assertEqual('3:23:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0358 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0359
     * @tc.name      testPhotosDateDurationExt0359
     * @tc.desc      Formats extended duration sample 90. case 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0359 begin');
      expect(DateUtil.getFormattedDuration(12233999)).assertEqual('3:23:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0359 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0360
     * @tc.name      testPhotosDateDurationExt0360
     * @tc.desc      Formats extended duration sample 90. case 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0360 begin');
      expect(DateUtil.getFormattedDuration(12294000)).assertEqual('3:24:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0360 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0361
     * @tc.name      testPhotosDateDurationExt0361
     * @tc.desc      Formats extended duration sample 91. case 361
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0361 begin');
      expect(DateUtil.getFormattedDuration(12329999)).assertEqual('3:25:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0361 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0362
     * @tc.name      testPhotosDateDurationExt0362
     * @tc.desc      Formats extended duration sample 91. case 362
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0362 begin');
      expect(DateUtil.getFormattedDuration(12330000)).assertEqual('3:25:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0362 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0363
     * @tc.name      testPhotosDateDurationExt0363
     * @tc.desc      Formats extended duration sample 91. case 363
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0363 begin');
      expect(DateUtil.getFormattedDuration(12330999)).assertEqual('3:25:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0363 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0364
     * @tc.name      testPhotosDateDurationExt0364
     * @tc.desc      Formats extended duration sample 91. case 364
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0364 begin');
      expect(DateUtil.getFormattedDuration(12391000)).assertEqual('3:26:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0364 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0365
     * @tc.name      testPhotosDateDurationExt0365
     * @tc.desc      Formats extended duration sample 92. case 365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0365 begin');
      expect(DateUtil.getFormattedDuration(12426999)).assertEqual('3:27:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0365 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0366
     * @tc.name      testPhotosDateDurationExt0366
     * @tc.desc      Formats extended duration sample 92. case 366
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0366 begin');
      expect(DateUtil.getFormattedDuration(12427000)).assertEqual('3:27:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0366 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0367
     * @tc.name      testPhotosDateDurationExt0367
     * @tc.desc      Formats extended duration sample 92. case 367
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0367 begin');
      expect(DateUtil.getFormattedDuration(12427999)).assertEqual('3:27:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0367 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0368
     * @tc.name      testPhotosDateDurationExt0368
     * @tc.desc      Formats extended duration sample 92. case 368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0368 begin');
      expect(DateUtil.getFormattedDuration(12488000)).assertEqual('3:28:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0368 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0369
     * @tc.name      testPhotosDateDurationExt0369
     * @tc.desc      Formats extended duration sample 93. case 369
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0369 begin');
      expect(DateUtil.getFormattedDuration(12523999)).assertEqual('3:28:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0369 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0370
     * @tc.name      testPhotosDateDurationExt0370
     * @tc.desc      Formats extended duration sample 93. case 370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0370 begin');
      expect(DateUtil.getFormattedDuration(12524000)).assertEqual('3:28:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0370 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0371
     * @tc.name      testPhotosDateDurationExt0371
     * @tc.desc      Formats extended duration sample 93. case 371
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0371 begin');
      expect(DateUtil.getFormattedDuration(12524999)).assertEqual('3:28:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0371 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0372
     * @tc.name      testPhotosDateDurationExt0372
     * @tc.desc      Formats extended duration sample 93. case 372
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0372 begin');
      expect(DateUtil.getFormattedDuration(12585000)).assertEqual('3:29:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0372 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0373
     * @tc.name      testPhotosDateDurationExt0373
     * @tc.desc      Formats extended duration sample 94. case 373
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0373 begin');
      expect(DateUtil.getFormattedDuration(12620999)).assertEqual('3:30:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0373 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0374
     * @tc.name      testPhotosDateDurationExt0374
     * @tc.desc      Formats extended duration sample 94. case 374
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0374 begin');
      expect(DateUtil.getFormattedDuration(12621000)).assertEqual('3:30:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0374 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0375
     * @tc.name      testPhotosDateDurationExt0375
     * @tc.desc      Formats extended duration sample 94. case 375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0375 begin');
      expect(DateUtil.getFormattedDuration(12621999)).assertEqual('3:30:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0375 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0376
     * @tc.name      testPhotosDateDurationExt0376
     * @tc.desc      Formats extended duration sample 94. case 376
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0376 begin');
      expect(DateUtil.getFormattedDuration(12682000)).assertEqual('3:31:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0376 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0377
     * @tc.name      testPhotosDateDurationExt0377
     * @tc.desc      Formats extended duration sample 95. case 377
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0377 begin');
      expect(DateUtil.getFormattedDuration(12717999)).assertEqual('3:31:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0377 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0378
     * @tc.name      testPhotosDateDurationExt0378
     * @tc.desc      Formats extended duration sample 95. case 378
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0378 begin');
      expect(DateUtil.getFormattedDuration(12718000)).assertEqual('3:31:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0378 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0379
     * @tc.name      testPhotosDateDurationExt0379
     * @tc.desc      Formats extended duration sample 95. case 379
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0379 begin');
      expect(DateUtil.getFormattedDuration(12718999)).assertEqual('3:31:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0379 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0380
     * @tc.name      testPhotosDateDurationExt0380
     * @tc.desc      Formats extended duration sample 95. case 380
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0380 begin');
      expect(DateUtil.getFormattedDuration(12779000)).assertEqual('3:32:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0380 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0381
     * @tc.name      testPhotosDateDurationExt0381
     * @tc.desc      Formats extended duration sample 96. case 381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0381 begin');
      expect(DateUtil.getFormattedDuration(12814999)).assertEqual('3:33:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0381 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0382
     * @tc.name      testPhotosDateDurationExt0382
     * @tc.desc      Formats extended duration sample 96. case 382
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0382 begin');
      expect(DateUtil.getFormattedDuration(12815000)).assertEqual('3:33:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0382 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0383
     * @tc.name      testPhotosDateDurationExt0383
     * @tc.desc      Formats extended duration sample 96. case 383
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0383 begin');
      expect(DateUtil.getFormattedDuration(12815999)).assertEqual('3:33:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0383 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0384
     * @tc.name      testPhotosDateDurationExt0384
     * @tc.desc      Formats extended duration sample 96. case 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0384 begin');
      expect(DateUtil.getFormattedDuration(12876000)).assertEqual('3:34:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0384 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0385
     * @tc.name      testPhotosDateDurationExt0385
     * @tc.desc      Formats extended duration sample 97. case 385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0385 begin');
      expect(DateUtil.getFormattedDuration(12911999)).assertEqual('3:35:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0385 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0386
     * @tc.name      testPhotosDateDurationExt0386
     * @tc.desc      Formats extended duration sample 97. case 386
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0386 begin');
      expect(DateUtil.getFormattedDuration(12912000)).assertEqual('3:35:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0386 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0387
     * @tc.name      testPhotosDateDurationExt0387
     * @tc.desc      Formats extended duration sample 97. case 387
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0387 begin');
      expect(DateUtil.getFormattedDuration(12912999)).assertEqual('3:35:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0387 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0388
     * @tc.name      testPhotosDateDurationExt0388
     * @tc.desc      Formats extended duration sample 97. case 388
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0388 begin');
      expect(DateUtil.getFormattedDuration(12973000)).assertEqual('3:36:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0388 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0389
     * @tc.name      testPhotosDateDurationExt0389
     * @tc.desc      Formats extended duration sample 98. case 389
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0389 begin');
      expect(DateUtil.getFormattedDuration(13008999)).assertEqual('3:36:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0389 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0390
     * @tc.name      testPhotosDateDurationExt0390
     * @tc.desc      Formats extended duration sample 98. case 390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0390 begin');
      expect(DateUtil.getFormattedDuration(13009000)).assertEqual('3:36:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0390 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0391
     * @tc.name      testPhotosDateDurationExt0391
     * @tc.desc      Formats extended duration sample 98. case 391
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0391 begin');
      expect(DateUtil.getFormattedDuration(13009999)).assertEqual('3:36:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0391 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0392
     * @tc.name      testPhotosDateDurationExt0392
     * @tc.desc      Formats extended duration sample 98. case 392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0392 begin');
      expect(DateUtil.getFormattedDuration(13070000)).assertEqual('3:37:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0392 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0393
     * @tc.name      testPhotosDateDurationExt0393
     * @tc.desc      Formats extended duration sample 99. case 393
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0393 begin');
      expect(DateUtil.getFormattedDuration(13105999)).assertEqual('3:38:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0393 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0394
     * @tc.name      testPhotosDateDurationExt0394
     * @tc.desc      Formats extended duration sample 99. case 394
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0394 begin');
      expect(DateUtil.getFormattedDuration(13106000)).assertEqual('3:38:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0394 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0395
     * @tc.name      testPhotosDateDurationExt0395
     * @tc.desc      Formats extended duration sample 99. case 395
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0395 begin');
      expect(DateUtil.getFormattedDuration(13106999)).assertEqual('3:38:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0395 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0396
     * @tc.name      testPhotosDateDurationExt0396
     * @tc.desc      Formats extended duration sample 99. case 396
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0396 begin');
      expect(DateUtil.getFormattedDuration(13167000)).assertEqual('3:39:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0396 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0397
     * @tc.name      testPhotosDateDurationExt0397
     * @tc.desc      Formats extended duration sample 100. case 397
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0397 begin');
      expect(DateUtil.getFormattedDuration(13202999)).assertEqual('3:40:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0397 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0398
     * @tc.name      testPhotosDateDurationExt0398
     * @tc.desc      Formats extended duration sample 100. case 398
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0398 begin');
      expect(DateUtil.getFormattedDuration(13203000)).assertEqual('3:40:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0398 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0399
     * @tc.name      testPhotosDateDurationExt0399
     * @tc.desc      Formats extended duration sample 100. case 399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0399 begin');
      expect(DateUtil.getFormattedDuration(13203999)).assertEqual('3:40:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0399 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0400
     * @tc.name      testPhotosDateDurationExt0400
     * @tc.desc      Formats extended duration sample 100. case 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0400 begin');
      expect(DateUtil.getFormattedDuration(13264000)).assertEqual('3:41:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0400 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0401
     * @tc.name      testPhotosDateDurationExt0401
     * @tc.desc      Formats extended duration sample 101. case 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0401 begin');
      expect(DateUtil.getFormattedDuration(13299999)).assertEqual('3:41:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0401 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0402
     * @tc.name      testPhotosDateDurationExt0402
     * @tc.desc      Formats extended duration sample 101. case 402
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0402 begin');
      expect(DateUtil.getFormattedDuration(13300000)).assertEqual('3:41:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0402 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0403
     * @tc.name      testPhotosDateDurationExt0403
     * @tc.desc      Formats extended duration sample 101. case 403
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0403 begin');
      expect(DateUtil.getFormattedDuration(13300999)).assertEqual('3:41:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0403 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0404
     * @tc.name      testPhotosDateDurationExt0404
     * @tc.desc      Formats extended duration sample 101. case 404
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0404 begin');
      expect(DateUtil.getFormattedDuration(13361000)).assertEqual('3:42:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0404 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0405
     * @tc.name      testPhotosDateDurationExt0405
     * @tc.desc      Formats extended duration sample 102. case 405
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0405 begin');
      expect(DateUtil.getFormattedDuration(13396999)).assertEqual('3:43:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0405 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0406
     * @tc.name      testPhotosDateDurationExt0406
     * @tc.desc      Formats extended duration sample 102. case 406
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0406 begin');
      expect(DateUtil.getFormattedDuration(13397000)).assertEqual('3:43:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0406 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0407
     * @tc.name      testPhotosDateDurationExt0407
     * @tc.desc      Formats extended duration sample 102. case 407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0407 begin');
      expect(DateUtil.getFormattedDuration(13397999)).assertEqual('3:43:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0407 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0408
     * @tc.name      testPhotosDateDurationExt0408
     * @tc.desc      Formats extended duration sample 102. case 408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0408 begin');
      expect(DateUtil.getFormattedDuration(13458000)).assertEqual('3:44:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0408 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0409
     * @tc.name      testPhotosDateDurationExt0409
     * @tc.desc      Formats extended duration sample 103. case 409
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0409 begin');
      expect(DateUtil.getFormattedDuration(13493999)).assertEqual('3:44:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0409 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0410
     * @tc.name      testPhotosDateDurationExt0410
     * @tc.desc      Formats extended duration sample 103. case 410
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0410 begin');
      expect(DateUtil.getFormattedDuration(13494000)).assertEqual('3:44:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0410 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0411
     * @tc.name      testPhotosDateDurationExt0411
     * @tc.desc      Formats extended duration sample 103. case 411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0411 begin');
      expect(DateUtil.getFormattedDuration(13494999)).assertEqual('3:44:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0411 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0412
     * @tc.name      testPhotosDateDurationExt0412
     * @tc.desc      Formats extended duration sample 103. case 412
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0412 begin');
      expect(DateUtil.getFormattedDuration(13555000)).assertEqual('3:45:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0412 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0413
     * @tc.name      testPhotosDateDurationExt0413
     * @tc.desc      Formats extended duration sample 104. case 413
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0413 begin');
      expect(DateUtil.getFormattedDuration(13590999)).assertEqual('3:46:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0413 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0414
     * @tc.name      testPhotosDateDurationExt0414
     * @tc.desc      Formats extended duration sample 104. case 414
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0414 begin');
      expect(DateUtil.getFormattedDuration(13591000)).assertEqual('3:46:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0414 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0415
     * @tc.name      testPhotosDateDurationExt0415
     * @tc.desc      Formats extended duration sample 104. case 415
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0415 begin');
      expect(DateUtil.getFormattedDuration(13591999)).assertEqual('3:46:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0415 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0416
     * @tc.name      testPhotosDateDurationExt0416
     * @tc.desc      Formats extended duration sample 104. case 416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0416 begin');
      expect(DateUtil.getFormattedDuration(13652000)).assertEqual('3:47:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0416 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0417
     * @tc.name      testPhotosDateDurationExt0417
     * @tc.desc      Formats extended duration sample 105. case 417
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0417 begin');
      expect(DateUtil.getFormattedDuration(13687999)).assertEqual('3:48:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0417 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0418
     * @tc.name      testPhotosDateDurationExt0418
     * @tc.desc      Formats extended duration sample 105. case 418
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0418 begin');
      expect(DateUtil.getFormattedDuration(13688000)).assertEqual('3:48:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0418 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0419
     * @tc.name      testPhotosDateDurationExt0419
     * @tc.desc      Formats extended duration sample 105. case 419
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0419 begin');
      expect(DateUtil.getFormattedDuration(13688999)).assertEqual('3:48:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0419 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0420
     * @tc.name      testPhotosDateDurationExt0420
     * @tc.desc      Formats extended duration sample 105. case 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0420 begin');
      expect(DateUtil.getFormattedDuration(13749000)).assertEqual('3:49:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0420 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0421
     * @tc.name      testPhotosDateDurationExt0421
     * @tc.desc      Formats extended duration sample 106. case 421
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0421 begin');
      expect(DateUtil.getFormattedDuration(13784999)).assertEqual('3:49:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0421 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0422
     * @tc.name      testPhotosDateDurationExt0422
     * @tc.desc      Formats extended duration sample 106. case 422
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0422 begin');
      expect(DateUtil.getFormattedDuration(13785000)).assertEqual('3:49:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0422 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0423
     * @tc.name      testPhotosDateDurationExt0423
     * @tc.desc      Formats extended duration sample 106. case 423
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0423 begin');
      expect(DateUtil.getFormattedDuration(13785999)).assertEqual('3:49:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0423 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0424
     * @tc.name      testPhotosDateDurationExt0424
     * @tc.desc      Formats extended duration sample 106. case 424
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0424 begin');
      expect(DateUtil.getFormattedDuration(13846000)).assertEqual('3:50:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0424 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0425
     * @tc.name      testPhotosDateDurationExt0425
     * @tc.desc      Formats extended duration sample 107. case 425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0425 begin');
      expect(DateUtil.getFormattedDuration(13881999)).assertEqual('3:51:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0425 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0426
     * @tc.name      testPhotosDateDurationExt0426
     * @tc.desc      Formats extended duration sample 107. case 426
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0426 begin');
      expect(DateUtil.getFormattedDuration(13882000)).assertEqual('3:51:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0426 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0427
     * @tc.name      testPhotosDateDurationExt0427
     * @tc.desc      Formats extended duration sample 107. case 427
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0427 begin');
      expect(DateUtil.getFormattedDuration(13882999)).assertEqual('3:51:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0427 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0428
     * @tc.name      testPhotosDateDurationExt0428
     * @tc.desc      Formats extended duration sample 107. case 428
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0428 begin');
      expect(DateUtil.getFormattedDuration(13943000)).assertEqual('3:52:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0428 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0429
     * @tc.name      testPhotosDateDurationExt0429
     * @tc.desc      Formats extended duration sample 108. case 429
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0429 begin');
      expect(DateUtil.getFormattedDuration(13978999)).assertEqual('3:52:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0429 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0430
     * @tc.name      testPhotosDateDurationExt0430
     * @tc.desc      Formats extended duration sample 108. case 430
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0430 begin');
      expect(DateUtil.getFormattedDuration(13979000)).assertEqual('3:52:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0430 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0431
     * @tc.name      testPhotosDateDurationExt0431
     * @tc.desc      Formats extended duration sample 108. case 431
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0431 begin');
      expect(DateUtil.getFormattedDuration(13979999)).assertEqual('3:52:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0431 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0432
     * @tc.name      testPhotosDateDurationExt0432
     * @tc.desc      Formats extended duration sample 108. case 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0432 begin');
      expect(DateUtil.getFormattedDuration(14040000)).assertEqual('3:54:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0432 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0433
     * @tc.name      testPhotosDateDurationExt0433
     * @tc.desc      Formats extended duration sample 109. case 433
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0433 begin');
      expect(DateUtil.getFormattedDuration(14075999)).assertEqual('3:54:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0433 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0434
     * @tc.name      testPhotosDateDurationExt0434
     * @tc.desc      Formats extended duration sample 109. case 434
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0434 begin');
      expect(DateUtil.getFormattedDuration(14076000)).assertEqual('3:54:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0434 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0435
     * @tc.name      testPhotosDateDurationExt0435
     * @tc.desc      Formats extended duration sample 109. case 435
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0435 begin');
      expect(DateUtil.getFormattedDuration(14076999)).assertEqual('3:54:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0435 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0436
     * @tc.name      testPhotosDateDurationExt0436
     * @tc.desc      Formats extended duration sample 109. case 436
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0436 begin');
      expect(DateUtil.getFormattedDuration(14137000)).assertEqual('3:55:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0436 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0437
     * @tc.name      testPhotosDateDurationExt0437
     * @tc.desc      Formats extended duration sample 110. case 437
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0437 begin');
      expect(DateUtil.getFormattedDuration(14172999)).assertEqual('3:56:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0437 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0438
     * @tc.name      testPhotosDateDurationExt0438
     * @tc.desc      Formats extended duration sample 110. case 438
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0438 begin');
      expect(DateUtil.getFormattedDuration(14173000)).assertEqual('3:56:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0438 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0439
     * @tc.name      testPhotosDateDurationExt0439
     * @tc.desc      Formats extended duration sample 110. case 439
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0439 begin');
      expect(DateUtil.getFormattedDuration(14173999)).assertEqual('3:56:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0439 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0440
     * @tc.name      testPhotosDateDurationExt0440
     * @tc.desc      Formats extended duration sample 110. case 440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0440 begin');
      expect(DateUtil.getFormattedDuration(14234000)).assertEqual('3:57:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0440 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0441
     * @tc.name      testPhotosDateDurationExt0441
     * @tc.desc      Formats extended duration sample 111. case 441
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0441 begin');
      expect(DateUtil.getFormattedDuration(14269999)).assertEqual('3:57:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0441 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0442
     * @tc.name      testPhotosDateDurationExt0442
     * @tc.desc      Formats extended duration sample 111. case 442
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0442 begin');
      expect(DateUtil.getFormattedDuration(14270000)).assertEqual('3:57:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0442 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0443
     * @tc.name      testPhotosDateDurationExt0443
     * @tc.desc      Formats extended duration sample 111. case 443
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0443 begin');
      expect(DateUtil.getFormattedDuration(14270999)).assertEqual('3:57:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0443 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0444
     * @tc.name      testPhotosDateDurationExt0444
     * @tc.desc      Formats extended duration sample 111. case 444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0444 begin');
      expect(DateUtil.getFormattedDuration(14331000)).assertEqual('3:58:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0444 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0445
     * @tc.name      testPhotosDateDurationExt0445
     * @tc.desc      Formats extended duration sample 112. case 445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0445 begin');
      expect(DateUtil.getFormattedDuration(14366999)).assertEqual('3:59:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0445 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0446
     * @tc.name      testPhotosDateDurationExt0446
     * @tc.desc      Formats extended duration sample 112. case 446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0446 begin');
      expect(DateUtil.getFormattedDuration(14367000)).assertEqual('3:59:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0446 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0447
     * @tc.name      testPhotosDateDurationExt0447
     * @tc.desc      Formats extended duration sample 112. case 447
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0447 begin');
      expect(DateUtil.getFormattedDuration(14367999)).assertEqual('3:59:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0447 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0448
     * @tc.name      testPhotosDateDurationExt0448
     * @tc.desc      Formats extended duration sample 112. case 448
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0448 begin');
      expect(DateUtil.getFormattedDuration(14428000)).assertEqual('4:00:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0448 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0449
     * @tc.name      testPhotosDateDurationExt0449
     * @tc.desc      Formats extended duration sample 113. case 449
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0449 begin');
      expect(DateUtil.getFormattedDuration(14463999)).assertEqual('4:01:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0449 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0450
     * @tc.name      testPhotosDateDurationExt0450
     * @tc.desc      Formats extended duration sample 113. case 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0450 begin');
      expect(DateUtil.getFormattedDuration(14464000)).assertEqual('4:01:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0450 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0451
     * @tc.name      testPhotosDateDurationExt0451
     * @tc.desc      Formats extended duration sample 113. case 451
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0451 begin');
      expect(DateUtil.getFormattedDuration(14464999)).assertEqual('4:01:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0451 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0452
     * @tc.name      testPhotosDateDurationExt0452
     * @tc.desc      Formats extended duration sample 113. case 452
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0452 begin');
      expect(DateUtil.getFormattedDuration(14525000)).assertEqual('4:02:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0452 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0453
     * @tc.name      testPhotosDateDurationExt0453
     * @tc.desc      Formats extended duration sample 114. case 453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0453 begin');
      expect(DateUtil.getFormattedDuration(14560999)).assertEqual('4:02:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0453 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0454
     * @tc.name      testPhotosDateDurationExt0454
     * @tc.desc      Formats extended duration sample 114. case 454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0454 begin');
      expect(DateUtil.getFormattedDuration(14561000)).assertEqual('4:02:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0454 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0455
     * @tc.name      testPhotosDateDurationExt0455
     * @tc.desc      Formats extended duration sample 114. case 455
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0455 begin');
      expect(DateUtil.getFormattedDuration(14561999)).assertEqual('4:02:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0455 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0456
     * @tc.name      testPhotosDateDurationExt0456
     * @tc.desc      Formats extended duration sample 114. case 456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0456 begin');
      expect(DateUtil.getFormattedDuration(14622000)).assertEqual('4:03:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0456 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0457
     * @tc.name      testPhotosDateDurationExt0457
     * @tc.desc      Formats extended duration sample 115. case 457
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0457 begin');
      expect(DateUtil.getFormattedDuration(14657999)).assertEqual('4:04:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0457 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0458
     * @tc.name      testPhotosDateDurationExt0458
     * @tc.desc      Formats extended duration sample 115. case 458
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0458 begin');
      expect(DateUtil.getFormattedDuration(14658000)).assertEqual('4:04:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0458 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0459
     * @tc.name      testPhotosDateDurationExt0459
     * @tc.desc      Formats extended duration sample 115. case 459
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0459 begin');
      expect(DateUtil.getFormattedDuration(14658999)).assertEqual('4:04:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0459 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0460
     * @tc.name      testPhotosDateDurationExt0460
     * @tc.desc      Formats extended duration sample 115. case 460
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0460 begin');
      expect(DateUtil.getFormattedDuration(14719000)).assertEqual('4:05:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0460 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0461
     * @tc.name      testPhotosDateDurationExt0461
     * @tc.desc      Formats extended duration sample 116. case 461
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0461 begin');
      expect(DateUtil.getFormattedDuration(14754999)).assertEqual('4:05:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0461 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0462
     * @tc.name      testPhotosDateDurationExt0462
     * @tc.desc      Formats extended duration sample 116. case 462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0462 begin');
      expect(DateUtil.getFormattedDuration(14755000)).assertEqual('4:05:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0462 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0463
     * @tc.name      testPhotosDateDurationExt0463
     * @tc.desc      Formats extended duration sample 116. case 463
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0463 begin');
      expect(DateUtil.getFormattedDuration(14755999)).assertEqual('4:05:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0463 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0464
     * @tc.name      testPhotosDateDurationExt0464
     * @tc.desc      Formats extended duration sample 116. case 464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0464 begin');
      expect(DateUtil.getFormattedDuration(14816000)).assertEqual('4:06:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0464 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0465
     * @tc.name      testPhotosDateDurationExt0465
     * @tc.desc      Formats extended duration sample 117. case 465
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0465 begin');
      expect(DateUtil.getFormattedDuration(14851999)).assertEqual('4:07:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0465 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0466
     * @tc.name      testPhotosDateDurationExt0466
     * @tc.desc      Formats extended duration sample 117. case 466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0466 begin');
      expect(DateUtil.getFormattedDuration(14852000)).assertEqual('4:07:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0466 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0467
     * @tc.name      testPhotosDateDurationExt0467
     * @tc.desc      Formats extended duration sample 117. case 467
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0467 begin');
      expect(DateUtil.getFormattedDuration(14852999)).assertEqual('4:07:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0467 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0468
     * @tc.name      testPhotosDateDurationExt0468
     * @tc.desc      Formats extended duration sample 117. case 468
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0468 begin');
      expect(DateUtil.getFormattedDuration(14913000)).assertEqual('4:08:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0468 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0469
     * @tc.name      testPhotosDateDurationExt0469
     * @tc.desc      Formats extended duration sample 118. case 469
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0469 begin');
      expect(DateUtil.getFormattedDuration(14948999)).assertEqual('4:09:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0469 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0470
     * @tc.name      testPhotosDateDurationExt0470
     * @tc.desc      Formats extended duration sample 118. case 470
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0470 begin');
      expect(DateUtil.getFormattedDuration(14949000)).assertEqual('4:09:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0470 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0471
     * @tc.name      testPhotosDateDurationExt0471
     * @tc.desc      Formats extended duration sample 118. case 471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0471 begin');
      expect(DateUtil.getFormattedDuration(14949999)).assertEqual('4:09:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0471 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0472
     * @tc.name      testPhotosDateDurationExt0472
     * @tc.desc      Formats extended duration sample 118. case 472
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0472 begin');
      expect(DateUtil.getFormattedDuration(15010000)).assertEqual('4:10:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0472 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0473
     * @tc.name      testPhotosDateDurationExt0473
     * @tc.desc      Formats extended duration sample 119. case 473
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0473 begin');
      expect(DateUtil.getFormattedDuration(15045999)).assertEqual('4:10:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0473 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0474
     * @tc.name      testPhotosDateDurationExt0474
     * @tc.desc      Formats extended duration sample 119. case 474
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0474 begin');
      expect(DateUtil.getFormattedDuration(15046000)).assertEqual('4:10:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0474 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0475
     * @tc.name      testPhotosDateDurationExt0475
     * @tc.desc      Formats extended duration sample 119. case 475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0475 begin');
      expect(DateUtil.getFormattedDuration(15046999)).assertEqual('4:10:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0475 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0476
     * @tc.name      testPhotosDateDurationExt0476
     * @tc.desc      Formats extended duration sample 119. case 476
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0476 begin');
      expect(DateUtil.getFormattedDuration(15107000)).assertEqual('4:11:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0476 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0477
     * @tc.name      testPhotosDateDurationExt0477
     * @tc.desc      Formats extended duration sample 120. case 477
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0477 begin');
      expect(DateUtil.getFormattedDuration(15142999)).assertEqual('4:12:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0477 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0478
     * @tc.name      testPhotosDateDurationExt0478
     * @tc.desc      Formats extended duration sample 120. case 478
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0478 begin');
      expect(DateUtil.getFormattedDuration(15143000)).assertEqual('4:12:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0478 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0479
     * @tc.name      testPhotosDateDurationExt0479
     * @tc.desc      Formats extended duration sample 120. case 479
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0479 begin');
      expect(DateUtil.getFormattedDuration(15143999)).assertEqual('4:12:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0479 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0480
     * @tc.name      testPhotosDateDurationExt0480
     * @tc.desc      Formats extended duration sample 120. case 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0480 begin');
      expect(DateUtil.getFormattedDuration(15204000)).assertEqual('4:13:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0480 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0481
     * @tc.name      testPhotosDateDurationExt0481
     * @tc.desc      Formats extended duration sample 121. case 481
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0481 begin');
      expect(DateUtil.getFormattedDuration(15239999)).assertEqual('4:13:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0481 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0482
     * @tc.name      testPhotosDateDurationExt0482
     * @tc.desc      Formats extended duration sample 121. case 482
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0482 begin');
      expect(DateUtil.getFormattedDuration(15240000)).assertEqual('4:14:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0482 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0483
     * @tc.name      testPhotosDateDurationExt0483
     * @tc.desc      Formats extended duration sample 121. case 483
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0483 begin');
      expect(DateUtil.getFormattedDuration(15240999)).assertEqual('4:14:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0483 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0484
     * @tc.name      testPhotosDateDurationExt0484
     * @tc.desc      Formats extended duration sample 121. case 484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0484 begin');
      expect(DateUtil.getFormattedDuration(15301000)).assertEqual('4:15:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0484 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0485
     * @tc.name      testPhotosDateDurationExt0485
     * @tc.desc      Formats extended duration sample 122. case 485
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0485 begin');
      expect(DateUtil.getFormattedDuration(15336999)).assertEqual('4:15:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0485 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0486
     * @tc.name      testPhotosDateDurationExt0486
     * @tc.desc      Formats extended duration sample 122. case 486
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0486 begin');
      expect(DateUtil.getFormattedDuration(15337000)).assertEqual('4:15:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0486 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0487
     * @tc.name      testPhotosDateDurationExt0487
     * @tc.desc      Formats extended duration sample 122. case 487
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0487 begin');
      expect(DateUtil.getFormattedDuration(15337999)).assertEqual('4:15:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0487 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0488
     * @tc.name      testPhotosDateDurationExt0488
     * @tc.desc      Formats extended duration sample 122. case 488
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0488 begin');
      expect(DateUtil.getFormattedDuration(15398000)).assertEqual('4:16:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0488 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0489
     * @tc.name      testPhotosDateDurationExt0489
     * @tc.desc      Formats extended duration sample 123. case 489
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0489 begin');
      expect(DateUtil.getFormattedDuration(15433999)).assertEqual('4:17:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0489 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0490
     * @tc.name      testPhotosDateDurationExt0490
     * @tc.desc      Formats extended duration sample 123. case 490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0490 begin');
      expect(DateUtil.getFormattedDuration(15434000)).assertEqual('4:17:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0490 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0491
     * @tc.name      testPhotosDateDurationExt0491
     * @tc.desc      Formats extended duration sample 123. case 491
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0491 begin');
      expect(DateUtil.getFormattedDuration(15434999)).assertEqual('4:17:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0491 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0492
     * @tc.name      testPhotosDateDurationExt0492
     * @tc.desc      Formats extended duration sample 123. case 492
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0492 begin');
      expect(DateUtil.getFormattedDuration(15495000)).assertEqual('4:18:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0492 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0493
     * @tc.name      testPhotosDateDurationExt0493
     * @tc.desc      Formats extended duration sample 124. case 493
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0493 begin');
      expect(DateUtil.getFormattedDuration(15530999)).assertEqual('4:18:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0493 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0494
     * @tc.name      testPhotosDateDurationExt0494
     * @tc.desc      Formats extended duration sample 124. case 494
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0494 begin');
      expect(DateUtil.getFormattedDuration(15531000)).assertEqual('4:18:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0494 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0495
     * @tc.name      testPhotosDateDurationExt0495
     * @tc.desc      Formats extended duration sample 124. case 495
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0495 begin');
      expect(DateUtil.getFormattedDuration(15531999)).assertEqual('4:18:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0495 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0496
     * @tc.name      testPhotosDateDurationExt0496
     * @tc.desc      Formats extended duration sample 124. case 496
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0496 begin');
      expect(DateUtil.getFormattedDuration(15592000)).assertEqual('4:19:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0496 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0497
     * @tc.name      testPhotosDateDurationExt0497
     * @tc.desc      Formats extended duration sample 125. case 497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0497 begin');
      expect(DateUtil.getFormattedDuration(15627999)).assertEqual('4:20:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0497 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0498
     * @tc.name      testPhotosDateDurationExt0498
     * @tc.desc      Formats extended duration sample 125. case 498
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0498 begin');
      expect(DateUtil.getFormattedDuration(15628000)).assertEqual('4:20:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0498 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0499
     * @tc.name      testPhotosDateDurationExt0499
     * @tc.desc      Formats extended duration sample 125. case 499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0499 begin');
      expect(DateUtil.getFormattedDuration(15628999)).assertEqual('4:20:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0499 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0500
     * @tc.name      testPhotosDateDurationExt0500
     * @tc.desc      Formats extended duration sample 125. case 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0500 begin');
      expect(DateUtil.getFormattedDuration(15689000)).assertEqual('4:21:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0500 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0501
     * @tc.name      testPhotosDateDurationExt0501
     * @tc.desc      Formats extended duration sample 126. case 501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0501 begin');
      expect(DateUtil.getFormattedDuration(15724999)).assertEqual('4:22:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0501 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0502
     * @tc.name      testPhotosDateDurationExt0502
     * @tc.desc      Formats extended duration sample 126. case 502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0502 begin');
      expect(DateUtil.getFormattedDuration(15725000)).assertEqual('4:22:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0502 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0503
     * @tc.name      testPhotosDateDurationExt0503
     * @tc.desc      Formats extended duration sample 126. case 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0503 begin');
      expect(DateUtil.getFormattedDuration(15725999)).assertEqual('4:22:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0503 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0504
     * @tc.name      testPhotosDateDurationExt0504
     * @tc.desc      Formats extended duration sample 126. case 504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0504 begin');
      expect(DateUtil.getFormattedDuration(15786000)).assertEqual('4:23:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0504 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0505
     * @tc.name      testPhotosDateDurationExt0505
     * @tc.desc      Formats extended duration sample 127. case 505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0505 begin');
      expect(DateUtil.getFormattedDuration(15821999)).assertEqual('4:23:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0505 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0506
     * @tc.name      testPhotosDateDurationExt0506
     * @tc.desc      Formats extended duration sample 127. case 506
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0506 begin');
      expect(DateUtil.getFormattedDuration(15822000)).assertEqual('4:23:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0506 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0507
     * @tc.name      testPhotosDateDurationExt0507
     * @tc.desc      Formats extended duration sample 127. case 507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0507 begin');
      expect(DateUtil.getFormattedDuration(15822999)).assertEqual('4:23:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0507 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0508
     * @tc.name      testPhotosDateDurationExt0508
     * @tc.desc      Formats extended duration sample 127. case 508
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0508 begin');
      expect(DateUtil.getFormattedDuration(15883000)).assertEqual('4:24:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0508 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0509
     * @tc.name      testPhotosDateDurationExt0509
     * @tc.desc      Formats extended duration sample 128. case 509
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0509 begin');
      expect(DateUtil.getFormattedDuration(15918999)).assertEqual('4:25:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0509 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0510
     * @tc.name      testPhotosDateDurationExt0510
     * @tc.desc      Formats extended duration sample 128. case 510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0510 begin');
      expect(DateUtil.getFormattedDuration(15919000)).assertEqual('4:25:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0510 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0511
     * @tc.name      testPhotosDateDurationExt0511
     * @tc.desc      Formats extended duration sample 128. case 511
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0511 begin');
      expect(DateUtil.getFormattedDuration(15919999)).assertEqual('4:25:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0511 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0512
     * @tc.name      testPhotosDateDurationExt0512
     * @tc.desc      Formats extended duration sample 128. case 512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0512 begin');
      expect(DateUtil.getFormattedDuration(15980000)).assertEqual('4:26:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0512 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0513
     * @tc.name      testPhotosDateDurationExt0513
     * @tc.desc      Formats extended duration sample 129. case 513
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0513 begin');
      expect(DateUtil.getFormattedDuration(16015999)).assertEqual('4:26:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0513 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0514
     * @tc.name      testPhotosDateDurationExt0514
     * @tc.desc      Formats extended duration sample 129. case 514
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0514 begin');
      expect(DateUtil.getFormattedDuration(16016000)).assertEqual('4:26:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0514 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0515
     * @tc.name      testPhotosDateDurationExt0515
     * @tc.desc      Formats extended duration sample 129. case 515
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0515 begin');
      expect(DateUtil.getFormattedDuration(16016999)).assertEqual('4:26:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0515 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0516
     * @tc.name      testPhotosDateDurationExt0516
     * @tc.desc      Formats extended duration sample 129. case 516
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0516 begin');
      expect(DateUtil.getFormattedDuration(16077000)).assertEqual('4:27:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0516 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0517
     * @tc.name      testPhotosDateDurationExt0517
     * @tc.desc      Formats extended duration sample 130. case 517
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0517 begin');
      expect(DateUtil.getFormattedDuration(16112999)).assertEqual('4:28:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0517 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0518
     * @tc.name      testPhotosDateDurationExt0518
     * @tc.desc      Formats extended duration sample 130. case 518
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0518 begin');
      expect(DateUtil.getFormattedDuration(16113000)).assertEqual('4:28:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0518 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0519
     * @tc.name      testPhotosDateDurationExt0519
     * @tc.desc      Formats extended duration sample 130. case 519
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0519 begin');
      expect(DateUtil.getFormattedDuration(16113999)).assertEqual('4:28:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0519 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0520
     * @tc.name      testPhotosDateDurationExt0520
     * @tc.desc      Formats extended duration sample 130. case 520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0520 begin');
      expect(DateUtil.getFormattedDuration(16174000)).assertEqual('4:29:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0520 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0521
     * @tc.name      testPhotosDateDurationExt0521
     * @tc.desc      Formats extended duration sample 131. case 521
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0521 begin');
      expect(DateUtil.getFormattedDuration(16209999)).assertEqual('4:30:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0521 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0522
     * @tc.name      testPhotosDateDurationExt0522
     * @tc.desc      Formats extended duration sample 131. case 522
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0522 begin');
      expect(DateUtil.getFormattedDuration(16210000)).assertEqual('4:30:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0522 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0523
     * @tc.name      testPhotosDateDurationExt0523
     * @tc.desc      Formats extended duration sample 131. case 523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0523 begin');
      expect(DateUtil.getFormattedDuration(16210999)).assertEqual('4:30:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0523 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0524
     * @tc.name      testPhotosDateDurationExt0524
     * @tc.desc      Formats extended duration sample 131. case 524
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0524 begin');
      expect(DateUtil.getFormattedDuration(16271000)).assertEqual('4:31:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0524 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0525
     * @tc.name      testPhotosDateDurationExt0525
     * @tc.desc      Formats extended duration sample 132. case 525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0525 begin');
      expect(DateUtil.getFormattedDuration(16306999)).assertEqual('4:31:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0525 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0526
     * @tc.name      testPhotosDateDurationExt0526
     * @tc.desc      Formats extended duration sample 132. case 526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0526 begin');
      expect(DateUtil.getFormattedDuration(16307000)).assertEqual('4:31:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0526 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0527
     * @tc.name      testPhotosDateDurationExt0527
     * @tc.desc      Formats extended duration sample 132. case 527
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0527 begin');
      expect(DateUtil.getFormattedDuration(16307999)).assertEqual('4:31:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0527 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0528
     * @tc.name      testPhotosDateDurationExt0528
     * @tc.desc      Formats extended duration sample 132. case 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0528 begin');
      expect(DateUtil.getFormattedDuration(16368000)).assertEqual('4:32:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0528 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0529
     * @tc.name      testPhotosDateDurationExt0529
     * @tc.desc      Formats extended duration sample 133. case 529
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0529 begin');
      expect(DateUtil.getFormattedDuration(16403999)).assertEqual('4:33:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0529 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0530
     * @tc.name      testPhotosDateDurationExt0530
     * @tc.desc      Formats extended duration sample 133. case 530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0530 begin');
      expect(DateUtil.getFormattedDuration(16404000)).assertEqual('4:33:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0530 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0531
     * @tc.name      testPhotosDateDurationExt0531
     * @tc.desc      Formats extended duration sample 133. case 531
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0531 begin');
      expect(DateUtil.getFormattedDuration(16404999)).assertEqual('4:33:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0531 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0532
     * @tc.name      testPhotosDateDurationExt0532
     * @tc.desc      Formats extended duration sample 133. case 532
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0532 begin');
      expect(DateUtil.getFormattedDuration(16465000)).assertEqual('4:34:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0532 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0533
     * @tc.name      testPhotosDateDurationExt0533
     * @tc.desc      Formats extended duration sample 134. case 533
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0533 begin');
      expect(DateUtil.getFormattedDuration(16500999)).assertEqual('4:35:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0533 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0534
     * @tc.name      testPhotosDateDurationExt0534
     * @tc.desc      Formats extended duration sample 134. case 534
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0534 begin');
      expect(DateUtil.getFormattedDuration(16501000)).assertEqual('4:35:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0534 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0535
     * @tc.name      testPhotosDateDurationExt0535
     * @tc.desc      Formats extended duration sample 134. case 535
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0535 begin');
      expect(DateUtil.getFormattedDuration(16501999)).assertEqual('4:35:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0535 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0536
     * @tc.name      testPhotosDateDurationExt0536
     * @tc.desc      Formats extended duration sample 134. case 536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0536 begin');
      expect(DateUtil.getFormattedDuration(16562000)).assertEqual('4:36:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0536 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0537
     * @tc.name      testPhotosDateDurationExt0537
     * @tc.desc      Formats extended duration sample 135. case 537
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0537 begin');
      expect(DateUtil.getFormattedDuration(16597999)).assertEqual('4:36:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0537 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0538
     * @tc.name      testPhotosDateDurationExt0538
     * @tc.desc      Formats extended duration sample 135. case 538
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0538 begin');
      expect(DateUtil.getFormattedDuration(16598000)).assertEqual('4:36:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0538 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0539
     * @tc.name      testPhotosDateDurationExt0539
     * @tc.desc      Formats extended duration sample 135. case 539
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0539 begin');
      expect(DateUtil.getFormattedDuration(16598999)).assertEqual('4:36:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0539 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0540
     * @tc.name      testPhotosDateDurationExt0540
     * @tc.desc      Formats extended duration sample 135. case 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0540 begin');
      expect(DateUtil.getFormattedDuration(16659000)).assertEqual('4:37:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0540 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0541
     * @tc.name      testPhotosDateDurationExt0541
     * @tc.desc      Formats extended duration sample 136. case 541
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0541 begin');
      expect(DateUtil.getFormattedDuration(16694999)).assertEqual('4:38:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0541 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0542
     * @tc.name      testPhotosDateDurationExt0542
     * @tc.desc      Formats extended duration sample 136. case 542
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0542 begin');
      expect(DateUtil.getFormattedDuration(16695000)).assertEqual('4:38:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0542 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0543
     * @tc.name      testPhotosDateDurationExt0543
     * @tc.desc      Formats extended duration sample 136. case 543
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0543 begin');
      expect(DateUtil.getFormattedDuration(16695999)).assertEqual('4:38:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0543 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0544
     * @tc.name      testPhotosDateDurationExt0544
     * @tc.desc      Formats extended duration sample 136. case 544
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0544 begin');
      expect(DateUtil.getFormattedDuration(16756000)).assertEqual('4:39:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0544 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0545
     * @tc.name      testPhotosDateDurationExt0545
     * @tc.desc      Formats extended duration sample 137. case 545
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0545 begin');
      expect(DateUtil.getFormattedDuration(16791999)).assertEqual('4:39:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0545 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0546
     * @tc.name      testPhotosDateDurationExt0546
     * @tc.desc      Formats extended duration sample 137. case 546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0546 begin');
      expect(DateUtil.getFormattedDuration(16792000)).assertEqual('4:39:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0546 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0547
     * @tc.name      testPhotosDateDurationExt0547
     * @tc.desc      Formats extended duration sample 137. case 547
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0547 begin');
      expect(DateUtil.getFormattedDuration(16792999)).assertEqual('4:39:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0547 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0548
     * @tc.name      testPhotosDateDurationExt0548
     * @tc.desc      Formats extended duration sample 137. case 548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0548 begin');
      expect(DateUtil.getFormattedDuration(16853000)).assertEqual('4:40:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0548 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0549
     * @tc.name      testPhotosDateDurationExt0549
     * @tc.desc      Formats extended duration sample 138. case 549
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0549 begin');
      expect(DateUtil.getFormattedDuration(16888999)).assertEqual('4:41:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0549 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0550
     * @tc.name      testPhotosDateDurationExt0550
     * @tc.desc      Formats extended duration sample 138. case 550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0550 begin');
      expect(DateUtil.getFormattedDuration(16889000)).assertEqual('4:41:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0550 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0551
     * @tc.name      testPhotosDateDurationExt0551
     * @tc.desc      Formats extended duration sample 138. case 551
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0551 begin');
      expect(DateUtil.getFormattedDuration(16889999)).assertEqual('4:41:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0551 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0552
     * @tc.name      testPhotosDateDurationExt0552
     * @tc.desc      Formats extended duration sample 138. case 552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0552 begin');
      expect(DateUtil.getFormattedDuration(16950000)).assertEqual('4:42:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0552 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0553
     * @tc.name      testPhotosDateDurationExt0553
     * @tc.desc      Formats extended duration sample 139. case 553
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0553 begin');
      expect(DateUtil.getFormattedDuration(16985999)).assertEqual('4:43:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0553 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0554
     * @tc.name      testPhotosDateDurationExt0554
     * @tc.desc      Formats extended duration sample 139. case 554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0554 begin');
      expect(DateUtil.getFormattedDuration(16986000)).assertEqual('4:43:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0554 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0555
     * @tc.name      testPhotosDateDurationExt0555
     * @tc.desc      Formats extended duration sample 139. case 555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0555 begin');
      expect(DateUtil.getFormattedDuration(16986999)).assertEqual('4:43:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0555 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0556
     * @tc.name      testPhotosDateDurationExt0556
     * @tc.desc      Formats extended duration sample 139. case 556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0556 begin');
      expect(DateUtil.getFormattedDuration(17047000)).assertEqual('4:44:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0556 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0557
     * @tc.name      testPhotosDateDurationExt0557
     * @tc.desc      Formats extended duration sample 140. case 557
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0557 begin');
      expect(DateUtil.getFormattedDuration(17082999)).assertEqual('4:44:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0557 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0558
     * @tc.name      testPhotosDateDurationExt0558
     * @tc.desc      Formats extended duration sample 140. case 558
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0558 begin');
      expect(DateUtil.getFormattedDuration(17083000)).assertEqual('4:44:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0558 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0559
     * @tc.name      testPhotosDateDurationExt0559
     * @tc.desc      Formats extended duration sample 140. case 559
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0559 begin');
      expect(DateUtil.getFormattedDuration(17083999)).assertEqual('4:44:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0559 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0560
     * @tc.name      testPhotosDateDurationExt0560
     * @tc.desc      Formats extended duration sample 140. case 560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0560 begin');
      expect(DateUtil.getFormattedDuration(17144000)).assertEqual('4:45:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0560 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0561
     * @tc.name      testPhotosDateDurationExt0561
     * @tc.desc      Formats extended duration sample 141. case 561
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0561 begin');
      expect(DateUtil.getFormattedDuration(17179999)).assertEqual('4:46:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0561 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0562
     * @tc.name      testPhotosDateDurationExt0562
     * @tc.desc      Formats extended duration sample 141. case 562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0562 begin');
      expect(DateUtil.getFormattedDuration(17180000)).assertEqual('4:46:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0562 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0563
     * @tc.name      testPhotosDateDurationExt0563
     * @tc.desc      Formats extended duration sample 141. case 563
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0563 begin');
      expect(DateUtil.getFormattedDuration(17180999)).assertEqual('4:46:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0563 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0564
     * @tc.name      testPhotosDateDurationExt0564
     * @tc.desc      Formats extended duration sample 141. case 564
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0564 begin');
      expect(DateUtil.getFormattedDuration(17241000)).assertEqual('4:47:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0564 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0565
     * @tc.name      testPhotosDateDurationExt0565
     * @tc.desc      Formats extended duration sample 142. case 565
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0565 begin');
      expect(DateUtil.getFormattedDuration(17276999)).assertEqual('4:47:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0565 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0566
     * @tc.name      testPhotosDateDurationExt0566
     * @tc.desc      Formats extended duration sample 142. case 566
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0566 begin');
      expect(DateUtil.getFormattedDuration(17277000)).assertEqual('4:47:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0566 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0567
     * @tc.name      testPhotosDateDurationExt0567
     * @tc.desc      Formats extended duration sample 142. case 567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0567 begin');
      expect(DateUtil.getFormattedDuration(17277999)).assertEqual('4:47:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0567 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0568
     * @tc.name      testPhotosDateDurationExt0568
     * @tc.desc      Formats extended duration sample 142. case 568
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0568 begin');
      expect(DateUtil.getFormattedDuration(17338000)).assertEqual('4:48:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0568 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0569
     * @tc.name      testPhotosDateDurationExt0569
     * @tc.desc      Formats extended duration sample 143. case 569
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0569 begin');
      expect(DateUtil.getFormattedDuration(17373999)).assertEqual('4:49:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0569 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0570
     * @tc.name      testPhotosDateDurationExt0570
     * @tc.desc      Formats extended duration sample 143. case 570
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0570 begin');
      expect(DateUtil.getFormattedDuration(17374000)).assertEqual('4:49:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0570 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0571
     * @tc.name      testPhotosDateDurationExt0571
     * @tc.desc      Formats extended duration sample 143. case 571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0571 begin');
      expect(DateUtil.getFormattedDuration(17374999)).assertEqual('4:49:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0571 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0572
     * @tc.name      testPhotosDateDurationExt0572
     * @tc.desc      Formats extended duration sample 143. case 572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0572 begin');
      expect(DateUtil.getFormattedDuration(17435000)).assertEqual('4:50:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0572 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0573
     * @tc.name      testPhotosDateDurationExt0573
     * @tc.desc      Formats extended duration sample 144. case 573
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0573 begin');
      expect(DateUtil.getFormattedDuration(17470999)).assertEqual('4:51:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0573 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0574
     * @tc.name      testPhotosDateDurationExt0574
     * @tc.desc      Formats extended duration sample 144. case 574
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0574 begin');
      expect(DateUtil.getFormattedDuration(17471000)).assertEqual('4:51:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0574 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0575
     * @tc.name      testPhotosDateDurationExt0575
     * @tc.desc      Formats extended duration sample 144. case 575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0575 begin');
      expect(DateUtil.getFormattedDuration(17471999)).assertEqual('4:51:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0575 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0576
     * @tc.name      testPhotosDateDurationExt0576
     * @tc.desc      Formats extended duration sample 144. case 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0576 begin');
      expect(DateUtil.getFormattedDuration(17532000)).assertEqual('4:52:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0576 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0577
     * @tc.name      testPhotosDateDurationExt0577
     * @tc.desc      Formats extended duration sample 145. case 577
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0577 begin');
      expect(DateUtil.getFormattedDuration(17567999)).assertEqual('4:52:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0577 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0578
     * @tc.name      testPhotosDateDurationExt0578
     * @tc.desc      Formats extended duration sample 145. case 578
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0578 begin');
      expect(DateUtil.getFormattedDuration(17568000)).assertEqual('4:52:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0578 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0579
     * @tc.name      testPhotosDateDurationExt0579
     * @tc.desc      Formats extended duration sample 145. case 579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0579 begin');
      expect(DateUtil.getFormattedDuration(17568999)).assertEqual('4:52:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0579 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0580
     * @tc.name      testPhotosDateDurationExt0580
     * @tc.desc      Formats extended duration sample 145. case 580
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0580 begin');
      expect(DateUtil.getFormattedDuration(17629000)).assertEqual('4:53:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0580 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0581
     * @tc.name      testPhotosDateDurationExt0581
     * @tc.desc      Formats extended duration sample 146. case 581
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0581 begin');
      expect(DateUtil.getFormattedDuration(17664999)).assertEqual('4:54:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0581 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0582
     * @tc.name      testPhotosDateDurationExt0582
     * @tc.desc      Formats extended duration sample 146. case 582
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0582 begin');
      expect(DateUtil.getFormattedDuration(17665000)).assertEqual('4:54:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0582 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0583
     * @tc.name      testPhotosDateDurationExt0583
     * @tc.desc      Formats extended duration sample 146. case 583
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0583 begin');
      expect(DateUtil.getFormattedDuration(17665999)).assertEqual('4:54:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0583 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0584
     * @tc.name      testPhotosDateDurationExt0584
     * @tc.desc      Formats extended duration sample 146. case 584
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0584 begin');
      expect(DateUtil.getFormattedDuration(17726000)).assertEqual('4:55:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0584 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0585
     * @tc.name      testPhotosDateDurationExt0585
     * @tc.desc      Formats extended duration sample 147. case 585
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0585 begin');
      expect(DateUtil.getFormattedDuration(17761999)).assertEqual('4:56:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0585 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0586
     * @tc.name      testPhotosDateDurationExt0586
     * @tc.desc      Formats extended duration sample 147. case 586
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0586 begin');
      expect(DateUtil.getFormattedDuration(17762000)).assertEqual('4:56:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0586 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0587
     * @tc.name      testPhotosDateDurationExt0587
     * @tc.desc      Formats extended duration sample 147. case 587
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0587 begin');
      expect(DateUtil.getFormattedDuration(17762999)).assertEqual('4:56:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0587 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0588
     * @tc.name      testPhotosDateDurationExt0588
     * @tc.desc      Formats extended duration sample 147. case 588
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0588 begin');
      expect(DateUtil.getFormattedDuration(17823000)).assertEqual('4:57:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0588 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0589
     * @tc.name      testPhotosDateDurationExt0589
     * @tc.desc      Formats extended duration sample 148. case 589
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0589 begin');
      expect(DateUtil.getFormattedDuration(17858999)).assertEqual('4:57:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0589 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0590
     * @tc.name      testPhotosDateDurationExt0590
     * @tc.desc      Formats extended duration sample 148. case 590
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0590 begin');
      expect(DateUtil.getFormattedDuration(17859000)).assertEqual('4:57:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0590 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0591
     * @tc.name      testPhotosDateDurationExt0591
     * @tc.desc      Formats extended duration sample 148. case 591
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0591 begin');
      expect(DateUtil.getFormattedDuration(17859999)).assertEqual('4:57:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0591 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0592
     * @tc.name      testPhotosDateDurationExt0592
     * @tc.desc      Formats extended duration sample 148. case 592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0592 begin');
      expect(DateUtil.getFormattedDuration(17920000)).assertEqual('4:58:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0592 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0593
     * @tc.name      testPhotosDateDurationExt0593
     * @tc.desc      Formats extended duration sample 149. case 593
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0593 begin');
      expect(DateUtil.getFormattedDuration(17955999)).assertEqual('4:59:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0593 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0594
     * @tc.name      testPhotosDateDurationExt0594
     * @tc.desc      Formats extended duration sample 149. case 594
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0594 begin');
      expect(DateUtil.getFormattedDuration(17956000)).assertEqual('4:59:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0594 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0595
     * @tc.name      testPhotosDateDurationExt0595
     * @tc.desc      Formats extended duration sample 149. case 595
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0595 begin');
      expect(DateUtil.getFormattedDuration(17956999)).assertEqual('4:59:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0595 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0596
     * @tc.name      testPhotosDateDurationExt0596
     * @tc.desc      Formats extended duration sample 149. case 596
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0596 begin');
      expect(DateUtil.getFormattedDuration(18017000)).assertEqual('5:00:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0596 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0597
     * @tc.name      testPhotosDateDurationExt0597
     * @tc.desc      Formats extended duration sample 150. case 597
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0597 begin');
      expect(DateUtil.getFormattedDuration(18052999)).assertEqual('5:00:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0597 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0598
     * @tc.name      testPhotosDateDurationExt0598
     * @tc.desc      Formats extended duration sample 150. case 598
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0598 begin');
      expect(DateUtil.getFormattedDuration(18053000)).assertEqual('5:00:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0598 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0599
     * @tc.name      testPhotosDateDurationExt0599
     * @tc.desc      Formats extended duration sample 150. case 599
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0599 begin');
      expect(DateUtil.getFormattedDuration(18053999)).assertEqual('5:00:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0599 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_DURATION_EXT_0600
     * @tc.name      testPhotosDateDurationExt0600
     * @tc.desc      Formats extended duration sample 150. case 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateDurationExt0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0600 begin');
      expect(DateUtil.getFormattedDuration(18114000)).assertEqual('5:01:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateDurationExt0600 end');
    })

  })
}
