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

const TAG = '[Sample_PhotosDateNameExtTest]';
const DOMAIN = 0xF811;

export default function PhotosDateNameExtTest(): void {
  describe('PhotosDateNameExtTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0001
     * @tc.name      testPhotosDateNameExt0001
     * @tc.desc      Generates edited name for sample photo_1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0001 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_1.jpg');
      expect(result.startsWith('photo_1_edit_')).assertTrue();
      expect(result.length > 'photo_1_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0002
     * @tc.name      testPhotosDateNameExt0002
     * @tc.desc      Generates edited name for sample photo_2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0002 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_2.jpg');
      expect(result.startsWith('photo_2_edit_')).assertTrue();
      expect(result.length > 'photo_2_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0003
     * @tc.name      testPhotosDateNameExt0003
     * @tc.desc      Generates edited name for sample photo_3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0003 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_3.jpg');
      expect(result.startsWith('photo_3_edit_')).assertTrue();
      expect(result.length > 'photo_3_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0004
     * @tc.name      testPhotosDateNameExt0004
     * @tc.desc      Generates edited name for sample photo_4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0004 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_4.jpg');
      expect(result.startsWith('photo_4_edit_')).assertTrue();
      expect(result.length > 'photo_4_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0005
     * @tc.name      testPhotosDateNameExt0005
     * @tc.desc      Generates edited name for sample photo_5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0005 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_5.jpg');
      expect(result.startsWith('photo_5_edit_')).assertTrue();
      expect(result.length > 'photo_5_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0006
     * @tc.name      testPhotosDateNameExt0006
     * @tc.desc      Generates edited name for sample photo_6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0006 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_6.jpg');
      expect(result.startsWith('photo_6_edit_')).assertTrue();
      expect(result.length > 'photo_6_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0007
     * @tc.name      testPhotosDateNameExt0007
     * @tc.desc      Generates edited name for sample photo_7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0007 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_7.jpg');
      expect(result.startsWith('photo_7_edit_')).assertTrue();
      expect(result.length > 'photo_7_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0008
     * @tc.name      testPhotosDateNameExt0008
     * @tc.desc      Generates edited name for sample photo_8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0008 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_8.jpg');
      expect(result.startsWith('photo_8_edit_')).assertTrue();
      expect(result.length > 'photo_8_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0009
     * @tc.name      testPhotosDateNameExt0009
     * @tc.desc      Generates edited name for sample photo_9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0009 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_9.jpg');
      expect(result.startsWith('photo_9_edit_')).assertTrue();
      expect(result.length > 'photo_9_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0010
     * @tc.name      testPhotosDateNameExt0010
     * @tc.desc      Generates edited name for sample photo_10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0010 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_10.jpg');
      expect(result.startsWith('photo_10_edit_')).assertTrue();
      expect(result.length > 'photo_10_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0011
     * @tc.name      testPhotosDateNameExt0011
     * @tc.desc      Generates edited name for sample photo_11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0011 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_11.jpg');
      expect(result.startsWith('photo_11_edit_')).assertTrue();
      expect(result.length > 'photo_11_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0012
     * @tc.name      testPhotosDateNameExt0012
     * @tc.desc      Generates edited name for sample photo_12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0012 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_12.jpg');
      expect(result.startsWith('photo_12_edit_')).assertTrue();
      expect(result.length > 'photo_12_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0013
     * @tc.name      testPhotosDateNameExt0013
     * @tc.desc      Generates edited name for sample photo_13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0013 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_13.jpg');
      expect(result.startsWith('photo_13_edit_')).assertTrue();
      expect(result.length > 'photo_13_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0014
     * @tc.name      testPhotosDateNameExt0014
     * @tc.desc      Generates edited name for sample photo_14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0014 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_14.jpg');
      expect(result.startsWith('photo_14_edit_')).assertTrue();
      expect(result.length > 'photo_14_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0015
     * @tc.name      testPhotosDateNameExt0015
     * @tc.desc      Generates edited name for sample photo_15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0015 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_15.jpg');
      expect(result.startsWith('photo_15_edit_')).assertTrue();
      expect(result.length > 'photo_15_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0016
     * @tc.name      testPhotosDateNameExt0016
     * @tc.desc      Generates edited name for sample photo_16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0016 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_16.jpg');
      expect(result.startsWith('photo_16_edit_')).assertTrue();
      expect(result.length > 'photo_16_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0017
     * @tc.name      testPhotosDateNameExt0017
     * @tc.desc      Generates edited name for sample photo_17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0017 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_17.jpg');
      expect(result.startsWith('photo_17_edit_')).assertTrue();
      expect(result.length > 'photo_17_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0018
     * @tc.name      testPhotosDateNameExt0018
     * @tc.desc      Generates edited name for sample photo_18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0018 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_18.jpg');
      expect(result.startsWith('photo_18_edit_')).assertTrue();
      expect(result.length > 'photo_18_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0019
     * @tc.name      testPhotosDateNameExt0019
     * @tc.desc      Generates edited name for sample photo_19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0019 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_19.jpg');
      expect(result.startsWith('photo_19_edit_')).assertTrue();
      expect(result.length > 'photo_19_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0020
     * @tc.name      testPhotosDateNameExt0020
     * @tc.desc      Generates edited name for sample photo_20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0020 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_20.jpg');
      expect(result.startsWith('photo_20_edit_')).assertTrue();
      expect(result.length > 'photo_20_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0021
     * @tc.name      testPhotosDateNameExt0021
     * @tc.desc      Generates edited name for sample photo_21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0021 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_21.jpg');
      expect(result.startsWith('photo_21_edit_')).assertTrue();
      expect(result.length > 'photo_21_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0022
     * @tc.name      testPhotosDateNameExt0022
     * @tc.desc      Generates edited name for sample photo_22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0022 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_22.jpg');
      expect(result.startsWith('photo_22_edit_')).assertTrue();
      expect(result.length > 'photo_22_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0023
     * @tc.name      testPhotosDateNameExt0023
     * @tc.desc      Generates edited name for sample photo_23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0023 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_23.jpg');
      expect(result.startsWith('photo_23_edit_')).assertTrue();
      expect(result.length > 'photo_23_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0024
     * @tc.name      testPhotosDateNameExt0024
     * @tc.desc      Generates edited name for sample photo_24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0024 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_24.jpg');
      expect(result.startsWith('photo_24_edit_')).assertTrue();
      expect(result.length > 'photo_24_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0025
     * @tc.name      testPhotosDateNameExt0025
     * @tc.desc      Generates edited name for sample photo_25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0025 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_25.jpg');
      expect(result.startsWith('photo_25_edit_')).assertTrue();
      expect(result.length > 'photo_25_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0026
     * @tc.name      testPhotosDateNameExt0026
     * @tc.desc      Generates edited name for sample photo_26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0026 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_26.jpg');
      expect(result.startsWith('photo_26_edit_')).assertTrue();
      expect(result.length > 'photo_26_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0027
     * @tc.name      testPhotosDateNameExt0027
     * @tc.desc      Generates edited name for sample photo_27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0027 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_27.jpg');
      expect(result.startsWith('photo_27_edit_')).assertTrue();
      expect(result.length > 'photo_27_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0028
     * @tc.name      testPhotosDateNameExt0028
     * @tc.desc      Generates edited name for sample photo_28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0028 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_28.jpg');
      expect(result.startsWith('photo_28_edit_')).assertTrue();
      expect(result.length > 'photo_28_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0029
     * @tc.name      testPhotosDateNameExt0029
     * @tc.desc      Generates edited name for sample photo_29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0029 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_29.jpg');
      expect(result.startsWith('photo_29_edit_')).assertTrue();
      expect(result.length > 'photo_29_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0030
     * @tc.name      testPhotosDateNameExt0030
     * @tc.desc      Generates edited name for sample photo_30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0030 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_30.jpg');
      expect(result.startsWith('photo_30_edit_')).assertTrue();
      expect(result.length > 'photo_30_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0031
     * @tc.name      testPhotosDateNameExt0031
     * @tc.desc      Generates edited name for sample photo_31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0031 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_31.jpg');
      expect(result.startsWith('photo_31_edit_')).assertTrue();
      expect(result.length > 'photo_31_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0032
     * @tc.name      testPhotosDateNameExt0032
     * @tc.desc      Generates edited name for sample photo_32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0032 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_32.jpg');
      expect(result.startsWith('photo_32_edit_')).assertTrue();
      expect(result.length > 'photo_32_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0033
     * @tc.name      testPhotosDateNameExt0033
     * @tc.desc      Generates edited name for sample photo_33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0033 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_33.jpg');
      expect(result.startsWith('photo_33_edit_')).assertTrue();
      expect(result.length > 'photo_33_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0034
     * @tc.name      testPhotosDateNameExt0034
     * @tc.desc      Generates edited name for sample photo_34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0034 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_34.jpg');
      expect(result.startsWith('photo_34_edit_')).assertTrue();
      expect(result.length > 'photo_34_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0035
     * @tc.name      testPhotosDateNameExt0035
     * @tc.desc      Generates edited name for sample photo_35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0035 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_35.jpg');
      expect(result.startsWith('photo_35_edit_')).assertTrue();
      expect(result.length > 'photo_35_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0036
     * @tc.name      testPhotosDateNameExt0036
     * @tc.desc      Generates edited name for sample photo_36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0036 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_36.jpg');
      expect(result.startsWith('photo_36_edit_')).assertTrue();
      expect(result.length > 'photo_36_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0037
     * @tc.name      testPhotosDateNameExt0037
     * @tc.desc      Generates edited name for sample photo_37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0037 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_37.jpg');
      expect(result.startsWith('photo_37_edit_')).assertTrue();
      expect(result.length > 'photo_37_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0038
     * @tc.name      testPhotosDateNameExt0038
     * @tc.desc      Generates edited name for sample photo_38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0038 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_38.jpg');
      expect(result.startsWith('photo_38_edit_')).assertTrue();
      expect(result.length > 'photo_38_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0039
     * @tc.name      testPhotosDateNameExt0039
     * @tc.desc      Generates edited name for sample photo_39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0039 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_39.jpg');
      expect(result.startsWith('photo_39_edit_')).assertTrue();
      expect(result.length > 'photo_39_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0040
     * @tc.name      testPhotosDateNameExt0040
     * @tc.desc      Generates edited name for sample photo_40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0040 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_40.jpg');
      expect(result.startsWith('photo_40_edit_')).assertTrue();
      expect(result.length > 'photo_40_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0041
     * @tc.name      testPhotosDateNameExt0041
     * @tc.desc      Keeps edited name prefix for sample photo_edit_1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0041 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_1.jpg');
      expect(result).assertEqual('photo_edit_1');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0042
     * @tc.name      testPhotosDateNameExt0042
     * @tc.desc      Keeps edited name prefix for sample photo_edit_2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0042 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_2.jpg');
      expect(result).assertEqual('photo_edit_2');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0043
     * @tc.name      testPhotosDateNameExt0043
     * @tc.desc      Keeps edited name prefix for sample photo_edit_3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0043 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_3.jpg');
      expect(result).assertEqual('photo_edit_3');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0044
     * @tc.name      testPhotosDateNameExt0044
     * @tc.desc      Keeps edited name prefix for sample photo_edit_4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0044 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_4.jpg');
      expect(result).assertEqual('photo_edit_4');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0045
     * @tc.name      testPhotosDateNameExt0045
     * @tc.desc      Keeps edited name prefix for sample photo_edit_5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0045 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_5.jpg');
      expect(result).assertEqual('photo_edit_5');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0046
     * @tc.name      testPhotosDateNameExt0046
     * @tc.desc      Keeps edited name prefix for sample photo_edit_6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0046 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_6.jpg');
      expect(result).assertEqual('photo_edit_6');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0047
     * @tc.name      testPhotosDateNameExt0047
     * @tc.desc      Keeps edited name prefix for sample photo_edit_7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0047 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_7.jpg');
      expect(result).assertEqual('photo_edit_7');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0048
     * @tc.name      testPhotosDateNameExt0048
     * @tc.desc      Keeps edited name prefix for sample photo_edit_8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0048 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_8.jpg');
      expect(result).assertEqual('photo_edit_8');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0049
     * @tc.name      testPhotosDateNameExt0049
     * @tc.desc      Keeps edited name prefix for sample photo_edit_9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0049 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_9.jpg');
      expect(result).assertEqual('photo_edit_9');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0050
     * @tc.name      testPhotosDateNameExt0050
     * @tc.desc      Keeps edited name prefix for sample photo_edit_10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0050 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_10.jpg');
      expect(result).assertEqual('photo_edit_10');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0051
     * @tc.name      testPhotosDateNameExt0051
     * @tc.desc      Keeps edited name prefix for sample photo_edit_11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0051 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_11.jpg');
      expect(result).assertEqual('photo_edit_11');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0052
     * @tc.name      testPhotosDateNameExt0052
     * @tc.desc      Keeps edited name prefix for sample photo_edit_12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0052 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_12.jpg');
      expect(result).assertEqual('photo_edit_12');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0053
     * @tc.name      testPhotosDateNameExt0053
     * @tc.desc      Keeps edited name prefix for sample photo_edit_13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0053 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_13.jpg');
      expect(result).assertEqual('photo_edit_13');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0054
     * @tc.name      testPhotosDateNameExt0054
     * @tc.desc      Keeps edited name prefix for sample photo_edit_14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0054 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_14.jpg');
      expect(result).assertEqual('photo_edit_14');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0055
     * @tc.name      testPhotosDateNameExt0055
     * @tc.desc      Keeps edited name prefix for sample photo_edit_15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0055 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_15.jpg');
      expect(result).assertEqual('photo_edit_15');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0056
     * @tc.name      testPhotosDateNameExt0056
     * @tc.desc      Keeps edited name prefix for sample photo_edit_16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0056 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_16.jpg');
      expect(result).assertEqual('photo_edit_16');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0057
     * @tc.name      testPhotosDateNameExt0057
     * @tc.desc      Keeps edited name prefix for sample photo_edit_17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0057 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_17.jpg');
      expect(result).assertEqual('photo_edit_17');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0058
     * @tc.name      testPhotosDateNameExt0058
     * @tc.desc      Keeps edited name prefix for sample photo_edit_18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0058 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_18.jpg');
      expect(result).assertEqual('photo_edit_18');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0059
     * @tc.name      testPhotosDateNameExt0059
     * @tc.desc      Keeps edited name prefix for sample photo_edit_19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0059 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_19.jpg');
      expect(result).assertEqual('photo_edit_19');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0060
     * @tc.name      testPhotosDateNameExt0060
     * @tc.desc      Keeps edited name prefix for sample photo_edit_20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0060 begin');
      const result: string = DateUtil.nameByDate(true, 'photo_edit_20.jpg');
      expect(result).assertEqual('photo_edit_20');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0061
     * @tc.name      testPhotosDateNameExt0061
     * @tc.desc      Handles empty edited name and fallback sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0061 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0062
     * @tc.name      testPhotosDateNameExt0062
     * @tc.desc      Handles empty edited name and fallback sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0062 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0063
     * @tc.name      testPhotosDateNameExt0063
     * @tc.desc      Handles empty edited name and fallback sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0063 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0064
     * @tc.name      testPhotosDateNameExt0064
     * @tc.desc      Handles empty edited name and fallback sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0064 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0065
     * @tc.name      testPhotosDateNameExt0065
     * @tc.desc      Handles empty edited name and fallback sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0065 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0066
     * @tc.name      testPhotosDateNameExt0066
     * @tc.desc      Handles empty edited name and fallback sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0066 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0067
     * @tc.name      testPhotosDateNameExt0067
     * @tc.desc      Handles empty edited name and fallback sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0067 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0068
     * @tc.name      testPhotosDateNameExt0068
     * @tc.desc      Handles empty edited name and fallback sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0068 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0069
     * @tc.name      testPhotosDateNameExt0069
     * @tc.desc      Handles empty edited name and fallback sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0069 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0070
     * @tc.name      testPhotosDateNameExt0070
     * @tc.desc      Handles empty edited name and fallback sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0070 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0071
     * @tc.name      testPhotosDateNameExt0071
     * @tc.desc      Handles empty edited name and fallback sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0071 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0072
     * @tc.name      testPhotosDateNameExt0072
     * @tc.desc      Handles empty edited name and fallback sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0072 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0073
     * @tc.name      testPhotosDateNameExt0073
     * @tc.desc      Handles empty edited name and fallback sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0073 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0074
     * @tc.name      testPhotosDateNameExt0074
     * @tc.desc      Handles empty edited name and fallback sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0074 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0075
     * @tc.name      testPhotosDateNameExt0075
     * @tc.desc      Handles empty edited name and fallback sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0075 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0076
     * @tc.name      testPhotosDateNameExt0076
     * @tc.desc      Handles empty edited name and fallback sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0076 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0077
     * @tc.name      testPhotosDateNameExt0077
     * @tc.desc      Handles empty edited name and fallback sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0077 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0078
     * @tc.name      testPhotosDateNameExt0078
     * @tc.desc      Handles empty edited name and fallback sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0078 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0079
     * @tc.name      testPhotosDateNameExt0079
     * @tc.desc      Handles empty edited name and fallback sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0079 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0080
     * @tc.name      testPhotosDateNameExt0080
     * @tc.desc      Handles empty edited name and fallback sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0080 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0081
     * @tc.name      testPhotosDateNameExt0081
     * @tc.desc      Generates timestamp image name sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0081 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0082
     * @tc.name      testPhotosDateNameExt0082
     * @tc.desc      Generates timestamp image name sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0082 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0083
     * @tc.name      testPhotosDateNameExt0083
     * @tc.desc      Generates timestamp image name sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0083 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0084
     * @tc.name      testPhotosDateNameExt0084
     * @tc.desc      Generates timestamp image name sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0084 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0085
     * @tc.name      testPhotosDateNameExt0085
     * @tc.desc      Generates timestamp image name sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0085 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0086
     * @tc.name      testPhotosDateNameExt0086
     * @tc.desc      Generates timestamp image name sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0086 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0087
     * @tc.name      testPhotosDateNameExt0087
     * @tc.desc      Generates timestamp image name sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0087 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0088
     * @tc.name      testPhotosDateNameExt0088
     * @tc.desc      Generates timestamp image name sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0088 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0089
     * @tc.name      testPhotosDateNameExt0089
     * @tc.desc      Generates timestamp image name sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0089 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0090
     * @tc.name      testPhotosDateNameExt0090
     * @tc.desc      Generates timestamp image name sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0090 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0091
     * @tc.name      testPhotosDateNameExt0091
     * @tc.desc      Generates timestamp image name sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0091 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0092
     * @tc.name      testPhotosDateNameExt0092
     * @tc.desc      Generates timestamp image name sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0092 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0093
     * @tc.name      testPhotosDateNameExt0093
     * @tc.desc      Generates timestamp image name sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0093 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0094
     * @tc.name      testPhotosDateNameExt0094
     * @tc.desc      Generates timestamp image name sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0094 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0095
     * @tc.name      testPhotosDateNameExt0095
     * @tc.desc      Generates timestamp image name sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0095 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0096
     * @tc.name      testPhotosDateNameExt0096
     * @tc.desc      Generates timestamp image name sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0096 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0097
     * @tc.name      testPhotosDateNameExt0097
     * @tc.desc      Generates timestamp image name sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0097 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0098
     * @tc.name      testPhotosDateNameExt0098
     * @tc.desc      Generates timestamp image name sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0098 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0099
     * @tc.name      testPhotosDateNameExt0099
     * @tc.desc      Generates timestamp image name sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0099 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_EXT_0100
     * @tc.name      testPhotosDateNameExt0100
     * @tc.desc      Generates timestamp image name sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameExt0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0100 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameExt0100 end');
    })
  })
}
