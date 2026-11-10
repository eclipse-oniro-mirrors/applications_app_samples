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

const TAG = '[Sample_PhotosDateNameBoundaryTest]';
const DOMAIN = 0xF811;

export default function PhotosDateNameBoundaryTest(): void {
  describe('PhotosDateNameBoundaryTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0001
     * @tc.name      testPhotosDateNameBoundary0001
     * @tc.desc      Generates boundary name sample shot_boundary_1.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0001 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_1.jpg');
      expect(result.startsWith('shot_boundary_1_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_1_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0002
     * @tc.name      testPhotosDateNameBoundary0002
     * @tc.desc      Generates boundary name sample shot_boundary_2.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0002 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_2.png');
      expect(result.startsWith('shot_boundary_2_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_2_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0003
     * @tc.name      testPhotosDateNameBoundary0003
     * @tc.desc      Generates boundary name sample shot_boundary_3.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0003 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_3.jpeg');
      expect(result.startsWith('shot_boundary_3_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_3_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0004
     * @tc.name      testPhotosDateNameBoundary0004
     * @tc.desc      Generates boundary name sample shot_boundary_4.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0004 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_4.webp');
      expect(result.startsWith('shot_boundary_4_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_4_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0005
     * @tc.name      testPhotosDateNameBoundary0005
     * @tc.desc      Generates boundary name sample shot_boundary_5.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0005 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_5.heic');
      expect(result.startsWith('shot_boundary_5_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_5_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0006
     * @tc.name      testPhotosDateNameBoundary0006
     * @tc.desc      Generates boundary name sample shot_boundary_6.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0006 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_6.jpg');
      expect(result.startsWith('shot_boundary_6_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_6_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0007
     * @tc.name      testPhotosDateNameBoundary0007
     * @tc.desc      Generates boundary name sample shot_boundary_7.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0007 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_7.png');
      expect(result.startsWith('shot_boundary_7_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_7_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0008
     * @tc.name      testPhotosDateNameBoundary0008
     * @tc.desc      Generates boundary name sample shot_boundary_8.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0008 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_8.jpeg');
      expect(result.startsWith('shot_boundary_8_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_8_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0009
     * @tc.name      testPhotosDateNameBoundary0009
     * @tc.desc      Generates boundary name sample shot_boundary_9.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0009 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_9.webp');
      expect(result.startsWith('shot_boundary_9_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_9_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0010
     * @tc.name      testPhotosDateNameBoundary0010
     * @tc.desc      Generates boundary name sample shot_boundary_10.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0010 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_10.heic');
      expect(result.startsWith('shot_boundary_10_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_10_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0011
     * @tc.name      testPhotosDateNameBoundary0011
     * @tc.desc      Generates boundary name sample shot_boundary_11.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0011 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_11.jpg');
      expect(result.startsWith('shot_boundary_11_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_11_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0012
     * @tc.name      testPhotosDateNameBoundary0012
     * @tc.desc      Generates boundary name sample shot_boundary_12.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0012 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_12.png');
      expect(result.startsWith('shot_boundary_12_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_12_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0013
     * @tc.name      testPhotosDateNameBoundary0013
     * @tc.desc      Generates boundary name sample shot_boundary_13.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0013 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_13.jpeg');
      expect(result.startsWith('shot_boundary_13_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_13_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0014
     * @tc.name      testPhotosDateNameBoundary0014
     * @tc.desc      Generates boundary name sample shot_boundary_14.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0014 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_14.webp');
      expect(result.startsWith('shot_boundary_14_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_14_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0015
     * @tc.name      testPhotosDateNameBoundary0015
     * @tc.desc      Generates boundary name sample shot_boundary_15.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0015 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_15.heic');
      expect(result.startsWith('shot_boundary_15_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_15_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0016
     * @tc.name      testPhotosDateNameBoundary0016
     * @tc.desc      Generates boundary name sample shot_boundary_16.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0016 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_16.jpg');
      expect(result.startsWith('shot_boundary_16_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_16_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0017
     * @tc.name      testPhotosDateNameBoundary0017
     * @tc.desc      Generates boundary name sample shot_boundary_17.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0017 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_17.png');
      expect(result.startsWith('shot_boundary_17_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_17_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0018
     * @tc.name      testPhotosDateNameBoundary0018
     * @tc.desc      Generates boundary name sample shot_boundary_18.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0018 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_18.jpeg');
      expect(result.startsWith('shot_boundary_18_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_18_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0019
     * @tc.name      testPhotosDateNameBoundary0019
     * @tc.desc      Generates boundary name sample shot_boundary_19.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0019 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_19.webp');
      expect(result.startsWith('shot_boundary_19_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_19_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0020
     * @tc.name      testPhotosDateNameBoundary0020
     * @tc.desc      Generates boundary name sample shot_boundary_20.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0020 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_20.heic');
      expect(result.startsWith('shot_boundary_20_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_20_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0021
     * @tc.name      testPhotosDateNameBoundary0021
     * @tc.desc      Generates boundary name sample shot_boundary_21.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0021 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_21.jpg');
      expect(result.startsWith('shot_boundary_21_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_21_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0022
     * @tc.name      testPhotosDateNameBoundary0022
     * @tc.desc      Generates boundary name sample shot_boundary_22.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0022 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_22.png');
      expect(result.startsWith('shot_boundary_22_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_22_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0023
     * @tc.name      testPhotosDateNameBoundary0023
     * @tc.desc      Generates boundary name sample shot_boundary_23.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0023 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_23.jpeg');
      expect(result.startsWith('shot_boundary_23_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_23_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0024
     * @tc.name      testPhotosDateNameBoundary0024
     * @tc.desc      Generates boundary name sample shot_boundary_24.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0024 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_24.webp');
      expect(result.startsWith('shot_boundary_24_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_24_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0025
     * @tc.name      testPhotosDateNameBoundary0025
     * @tc.desc      Generates boundary name sample shot_boundary_25.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0025 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_25.heic');
      expect(result.startsWith('shot_boundary_25_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_25_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0026
     * @tc.name      testPhotosDateNameBoundary0026
     * @tc.desc      Generates boundary name sample shot_boundary_26.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0026 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_26.jpg');
      expect(result.startsWith('shot_boundary_26_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_26_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0027
     * @tc.name      testPhotosDateNameBoundary0027
     * @tc.desc      Generates boundary name sample shot_boundary_27.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0027 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_27.png');
      expect(result.startsWith('shot_boundary_27_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_27_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0028
     * @tc.name      testPhotosDateNameBoundary0028
     * @tc.desc      Generates boundary name sample shot_boundary_28.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0028 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_28.jpeg');
      expect(result.startsWith('shot_boundary_28_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_28_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0029
     * @tc.name      testPhotosDateNameBoundary0029
     * @tc.desc      Generates boundary name sample shot_boundary_29.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0029 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_29.webp');
      expect(result.startsWith('shot_boundary_29_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_29_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0030
     * @tc.name      testPhotosDateNameBoundary0030
     * @tc.desc      Generates boundary name sample shot_boundary_30.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0030 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_30.heic');
      expect(result.startsWith('shot_boundary_30_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_30_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0031
     * @tc.name      testPhotosDateNameBoundary0031
     * @tc.desc      Generates boundary name sample shot_boundary_31.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0031 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_31.jpg');
      expect(result.startsWith('shot_boundary_31_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_31_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0032
     * @tc.name      testPhotosDateNameBoundary0032
     * @tc.desc      Generates boundary name sample shot_boundary_32.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0032 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_32.png');
      expect(result.startsWith('shot_boundary_32_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_32_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0033
     * @tc.name      testPhotosDateNameBoundary0033
     * @tc.desc      Generates boundary name sample shot_boundary_33.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0033 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_33.jpeg');
      expect(result.startsWith('shot_boundary_33_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_33_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0034
     * @tc.name      testPhotosDateNameBoundary0034
     * @tc.desc      Generates boundary name sample shot_boundary_34.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0034 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_34.webp');
      expect(result.startsWith('shot_boundary_34_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_34_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0035
     * @tc.name      testPhotosDateNameBoundary0035
     * @tc.desc      Generates boundary name sample shot_boundary_35.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0035 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_35.heic');
      expect(result.startsWith('shot_boundary_35_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_35_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0036
     * @tc.name      testPhotosDateNameBoundary0036
     * @tc.desc      Generates boundary name sample shot_boundary_36.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0036 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_36.jpg');
      expect(result.startsWith('shot_boundary_36_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_36_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0037
     * @tc.name      testPhotosDateNameBoundary0037
     * @tc.desc      Generates boundary name sample shot_boundary_37.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0037 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_37.png');
      expect(result.startsWith('shot_boundary_37_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_37_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0038
     * @tc.name      testPhotosDateNameBoundary0038
     * @tc.desc      Generates boundary name sample shot_boundary_38.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0038 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_38.jpeg');
      expect(result.startsWith('shot_boundary_38_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_38_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0039
     * @tc.name      testPhotosDateNameBoundary0039
     * @tc.desc      Generates boundary name sample shot_boundary_39.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0039 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_39.webp');
      expect(result.startsWith('shot_boundary_39_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_39_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0040
     * @tc.name      testPhotosDateNameBoundary0040
     * @tc.desc      Generates boundary name sample shot_boundary_40.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0040 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_40.heic');
      expect(result.startsWith('shot_boundary_40_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_40_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0041
     * @tc.name      testPhotosDateNameBoundary0041
     * @tc.desc      Generates boundary name sample shot_boundary_41.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0041 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_41.jpg');
      expect(result.startsWith('shot_boundary_41_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_41_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0042
     * @tc.name      testPhotosDateNameBoundary0042
     * @tc.desc      Generates boundary name sample shot_boundary_42.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0042 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_42.png');
      expect(result.startsWith('shot_boundary_42_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_42_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0043
     * @tc.name      testPhotosDateNameBoundary0043
     * @tc.desc      Generates boundary name sample shot_boundary_43.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0043 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_43.jpeg');
      expect(result.startsWith('shot_boundary_43_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_43_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0044
     * @tc.name      testPhotosDateNameBoundary0044
     * @tc.desc      Generates boundary name sample shot_boundary_44.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0044 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_44.webp');
      expect(result.startsWith('shot_boundary_44_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_44_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0045
     * @tc.name      testPhotosDateNameBoundary0045
     * @tc.desc      Generates boundary name sample shot_boundary_45.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0045 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_45.heic');
      expect(result.startsWith('shot_boundary_45_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_45_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0046
     * @tc.name      testPhotosDateNameBoundary0046
     * @tc.desc      Generates boundary name sample shot_boundary_46.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0046 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_46.jpg');
      expect(result.startsWith('shot_boundary_46_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_46_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0047
     * @tc.name      testPhotosDateNameBoundary0047
     * @tc.desc      Generates boundary name sample shot_boundary_47.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0047 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_47.png');
      expect(result.startsWith('shot_boundary_47_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_47_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0048
     * @tc.name      testPhotosDateNameBoundary0048
     * @tc.desc      Generates boundary name sample shot_boundary_48.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0048 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_48.jpeg');
      expect(result.startsWith('shot_boundary_48_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_48_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0049
     * @tc.name      testPhotosDateNameBoundary0049
     * @tc.desc      Generates boundary name sample shot_boundary_49.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0049 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_49.webp');
      expect(result.startsWith('shot_boundary_49_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_49_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0050
     * @tc.name      testPhotosDateNameBoundary0050
     * @tc.desc      Generates boundary name sample shot_boundary_50.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0050 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_50.heic');
      expect(result.startsWith('shot_boundary_50_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_50_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0051
     * @tc.name      testPhotosDateNameBoundary0051
     * @tc.desc      Generates boundary name sample shot_boundary_51.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0051 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_51.jpg');
      expect(result.startsWith('shot_boundary_51_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_51_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0052
     * @tc.name      testPhotosDateNameBoundary0052
     * @tc.desc      Generates boundary name sample shot_boundary_52.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0052 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_52.png');
      expect(result.startsWith('shot_boundary_52_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_52_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0053
     * @tc.name      testPhotosDateNameBoundary0053
     * @tc.desc      Generates boundary name sample shot_boundary_53.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0053 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_53.jpeg');
      expect(result.startsWith('shot_boundary_53_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_53_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0054
     * @tc.name      testPhotosDateNameBoundary0054
     * @tc.desc      Generates boundary name sample shot_boundary_54.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0054 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_54.webp');
      expect(result.startsWith('shot_boundary_54_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_54_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0055
     * @tc.name      testPhotosDateNameBoundary0055
     * @tc.desc      Generates boundary name sample shot_boundary_55.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0055 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_55.heic');
      expect(result.startsWith('shot_boundary_55_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_55_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0056
     * @tc.name      testPhotosDateNameBoundary0056
     * @tc.desc      Generates boundary name sample shot_boundary_56.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0056 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_56.jpg');
      expect(result.startsWith('shot_boundary_56_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_56_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0057
     * @tc.name      testPhotosDateNameBoundary0057
     * @tc.desc      Generates boundary name sample shot_boundary_57.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0057 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_57.png');
      expect(result.startsWith('shot_boundary_57_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_57_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0058
     * @tc.name      testPhotosDateNameBoundary0058
     * @tc.desc      Generates boundary name sample shot_boundary_58.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0058 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_58.jpeg');
      expect(result.startsWith('shot_boundary_58_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_58_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0059
     * @tc.name      testPhotosDateNameBoundary0059
     * @tc.desc      Generates boundary name sample shot_boundary_59.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0059 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_59.webp');
      expect(result.startsWith('shot_boundary_59_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_59_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0060
     * @tc.name      testPhotosDateNameBoundary0060
     * @tc.desc      Generates boundary name sample shot_boundary_60.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0060 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_60.heic');
      expect(result.startsWith('shot_boundary_60_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_60_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0061
     * @tc.name      testPhotosDateNameBoundary0061
     * @tc.desc      Generates boundary name sample shot_boundary_61.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0061 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_61.jpg');
      expect(result.startsWith('shot_boundary_61_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_61_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0062
     * @tc.name      testPhotosDateNameBoundary0062
     * @tc.desc      Generates boundary name sample shot_boundary_62.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0062 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_62.png');
      expect(result.startsWith('shot_boundary_62_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_62_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0063
     * @tc.name      testPhotosDateNameBoundary0063
     * @tc.desc      Generates boundary name sample shot_boundary_63.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0063 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_63.jpeg');
      expect(result.startsWith('shot_boundary_63_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_63_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0064
     * @tc.name      testPhotosDateNameBoundary0064
     * @tc.desc      Generates boundary name sample shot_boundary_64.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0064 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_64.webp');
      expect(result.startsWith('shot_boundary_64_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_64_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0065
     * @tc.name      testPhotosDateNameBoundary0065
     * @tc.desc      Generates boundary name sample shot_boundary_65.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0065 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_65.heic');
      expect(result.startsWith('shot_boundary_65_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_65_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0066
     * @tc.name      testPhotosDateNameBoundary0066
     * @tc.desc      Generates boundary name sample shot_boundary_66.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0066 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_66.jpg');
      expect(result.startsWith('shot_boundary_66_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_66_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0067
     * @tc.name      testPhotosDateNameBoundary0067
     * @tc.desc      Generates boundary name sample shot_boundary_67.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0067 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_67.png');
      expect(result.startsWith('shot_boundary_67_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_67_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0068
     * @tc.name      testPhotosDateNameBoundary0068
     * @tc.desc      Generates boundary name sample shot_boundary_68.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0068 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_68.jpeg');
      expect(result.startsWith('shot_boundary_68_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_68_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0069
     * @tc.name      testPhotosDateNameBoundary0069
     * @tc.desc      Generates boundary name sample shot_boundary_69.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0069 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_69.webp');
      expect(result.startsWith('shot_boundary_69_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_69_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0070
     * @tc.name      testPhotosDateNameBoundary0070
     * @tc.desc      Generates boundary name sample shot_boundary_70.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0070 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_70.heic');
      expect(result.startsWith('shot_boundary_70_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_70_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0071
     * @tc.name      testPhotosDateNameBoundary0071
     * @tc.desc      Generates boundary name sample shot_boundary_71.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0071 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_71.jpg');
      expect(result.startsWith('shot_boundary_71_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_71_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0072
     * @tc.name      testPhotosDateNameBoundary0072
     * @tc.desc      Generates boundary name sample shot_boundary_72.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0072 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_72.png');
      expect(result.startsWith('shot_boundary_72_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_72_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0073
     * @tc.name      testPhotosDateNameBoundary0073
     * @tc.desc      Generates boundary name sample shot_boundary_73.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0073 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_73.jpeg');
      expect(result.startsWith('shot_boundary_73_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_73_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0074
     * @tc.name      testPhotosDateNameBoundary0074
     * @tc.desc      Generates boundary name sample shot_boundary_74.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0074 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_74.webp');
      expect(result.startsWith('shot_boundary_74_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_74_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0075
     * @tc.name      testPhotosDateNameBoundary0075
     * @tc.desc      Generates boundary name sample shot_boundary_75.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0075 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_75.heic');
      expect(result.startsWith('shot_boundary_75_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_75_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0076
     * @tc.name      testPhotosDateNameBoundary0076
     * @tc.desc      Generates boundary name sample shot_boundary_76.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0076 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_76.jpg');
      expect(result.startsWith('shot_boundary_76_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_76_edit_'.length).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0077
     * @tc.name      testPhotosDateNameBoundary0077
     * @tc.desc      Generates boundary name sample shot_boundary_77.png.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0077 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_77.png');
      expect(result.startsWith('shot_boundary_77_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_77_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0078
     * @tc.name      testPhotosDateNameBoundary0078
     * @tc.desc      Generates boundary name sample shot_boundary_78.jpeg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0078 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_78.jpeg');
      expect(result.startsWith('shot_boundary_78_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_78_edit_'.length).assertTrue();
      expect(result.indexOf('.jpeg') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0079
     * @tc.name      testPhotosDateNameBoundary0079
     * @tc.desc      Generates boundary name sample shot_boundary_79.webp.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0079 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_79.webp');
      expect(result.startsWith('shot_boundary_79_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_79_edit_'.length).assertTrue();
      expect(result.indexOf('.webp') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0080
     * @tc.name      testPhotosDateNameBoundary0080
     * @tc.desc      Generates boundary name sample shot_boundary_80.heic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0080 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_boundary_80.heic');
      expect(result.startsWith('shot_boundary_80_edit_')).assertTrue();
      expect(result.length > 'shot_boundary_80_edit_'.length).assertTrue();
      expect(result.indexOf('.heic') === -1).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0081
     * @tc.name      testPhotosDateNameBoundary0081
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0081 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_1.jpg');
      expect(result).assertEqual('shot_edit_boundary_1');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0082
     * @tc.name      testPhotosDateNameBoundary0082
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0082 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_2.jpg');
      expect(result).assertEqual('shot_edit_boundary_2');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0083
     * @tc.name      testPhotosDateNameBoundary0083
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0083 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_3.jpg');
      expect(result).assertEqual('shot_edit_boundary_3');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0084
     * @tc.name      testPhotosDateNameBoundary0084
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0084 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_4.jpg');
      expect(result).assertEqual('shot_edit_boundary_4');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0085
     * @tc.name      testPhotosDateNameBoundary0085
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0085 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_5.jpg');
      expect(result).assertEqual('shot_edit_boundary_5');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0086
     * @tc.name      testPhotosDateNameBoundary0086
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0086 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_6.jpg');
      expect(result).assertEqual('shot_edit_boundary_6');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0087
     * @tc.name      testPhotosDateNameBoundary0087
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0087 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_7.jpg');
      expect(result).assertEqual('shot_edit_boundary_7');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0088
     * @tc.name      testPhotosDateNameBoundary0088
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0088 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_8.jpg');
      expect(result).assertEqual('shot_edit_boundary_8');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0089
     * @tc.name      testPhotosDateNameBoundary0089
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0089 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_9.jpg');
      expect(result).assertEqual('shot_edit_boundary_9');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(20);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0090
     * @tc.name      testPhotosDateNameBoundary0090
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0090 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_10.jpg');
      expect(result).assertEqual('shot_edit_boundary_10');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0091
     * @tc.name      testPhotosDateNameBoundary0091
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0091 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_11.jpg');
      expect(result).assertEqual('shot_edit_boundary_11');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0092
     * @tc.name      testPhotosDateNameBoundary0092
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0092 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_12.jpg');
      expect(result).assertEqual('shot_edit_boundary_12');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0093
     * @tc.name      testPhotosDateNameBoundary0093
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0093 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_13.jpg');
      expect(result).assertEqual('shot_edit_boundary_13');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0094
     * @tc.name      testPhotosDateNameBoundary0094
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0094 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_14.jpg');
      expect(result).assertEqual('shot_edit_boundary_14');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0095
     * @tc.name      testPhotosDateNameBoundary0095
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0095 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_15.jpg');
      expect(result).assertEqual('shot_edit_boundary_15');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0096
     * @tc.name      testPhotosDateNameBoundary0096
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0096 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_16.jpg');
      expect(result).assertEqual('shot_edit_boundary_16');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0097
     * @tc.name      testPhotosDateNameBoundary0097
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0097 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_17.jpg');
      expect(result).assertEqual('shot_edit_boundary_17');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0098
     * @tc.name      testPhotosDateNameBoundary0098
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0098 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_18.jpg');
      expect(result).assertEqual('shot_edit_boundary_18');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0099
     * @tc.name      testPhotosDateNameBoundary0099
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0099 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_19.jpg');
      expect(result).assertEqual('shot_edit_boundary_19');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0100
     * @tc.name      testPhotosDateNameBoundary0100
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0100 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_20.jpg');
      expect(result).assertEqual('shot_edit_boundary_20');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0101
     * @tc.name      testPhotosDateNameBoundary0101
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0101 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_21.jpg');
      expect(result).assertEqual('shot_edit_boundary_21');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0102
     * @tc.name      testPhotosDateNameBoundary0102
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0102 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_22.jpg');
      expect(result).assertEqual('shot_edit_boundary_22');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0102 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0103
     * @tc.name      testPhotosDateNameBoundary0103
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0103 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_23.jpg');
      expect(result).assertEqual('shot_edit_boundary_23');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0104
     * @tc.name      testPhotosDateNameBoundary0104
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0104 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_24.jpg');
      expect(result).assertEqual('shot_edit_boundary_24');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0105
     * @tc.name      testPhotosDateNameBoundary0105
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0105 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_25.jpg');
      expect(result).assertEqual('shot_edit_boundary_25');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0105 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0106
     * @tc.name      testPhotosDateNameBoundary0106
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0106 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_26.jpg');
      expect(result).assertEqual('shot_edit_boundary_26');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0107
     * @tc.name      testPhotosDateNameBoundary0107
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0107 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_27.jpg');
      expect(result).assertEqual('shot_edit_boundary_27');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0108
     * @tc.name      testPhotosDateNameBoundary0108
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0108 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_28.jpg');
      expect(result).assertEqual('shot_edit_boundary_28');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0108 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0109
     * @tc.name      testPhotosDateNameBoundary0109
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0109 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_29.jpg');
      expect(result).assertEqual('shot_edit_boundary_29');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0110
     * @tc.name      testPhotosDateNameBoundary0110
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0110 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_30.jpg');
      expect(result).assertEqual('shot_edit_boundary_30');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0111
     * @tc.name      testPhotosDateNameBoundary0111
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0111 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_31.jpg');
      expect(result).assertEqual('shot_edit_boundary_31');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0111 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0112
     * @tc.name      testPhotosDateNameBoundary0112
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0112 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_32.jpg');
      expect(result).assertEqual('shot_edit_boundary_32');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0113
     * @tc.name      testPhotosDateNameBoundary0113
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0113 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_33.jpg');
      expect(result).assertEqual('shot_edit_boundary_33');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0114
     * @tc.name      testPhotosDateNameBoundary0114
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0114 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_34.jpg');
      expect(result).assertEqual('shot_edit_boundary_34');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0114 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0115
     * @tc.name      testPhotosDateNameBoundary0115
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0115 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_35.jpg');
      expect(result).assertEqual('shot_edit_boundary_35');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0116
     * @tc.name      testPhotosDateNameBoundary0116
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0116 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_36.jpg');
      expect(result).assertEqual('shot_edit_boundary_36');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0117
     * @tc.name      testPhotosDateNameBoundary0117
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0117 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_37.jpg');
      expect(result).assertEqual('shot_edit_boundary_37');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0117 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0118
     * @tc.name      testPhotosDateNameBoundary0118
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0118 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_38.jpg');
      expect(result).assertEqual('shot_edit_boundary_38');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0119
     * @tc.name      testPhotosDateNameBoundary0119
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0119 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_39.jpg');
      expect(result).assertEqual('shot_edit_boundary_39');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0120
     * @tc.name      testPhotosDateNameBoundary0120
     * @tc.desc      Keeps boundary edited name shot_edit_boundary_40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0120 begin');
      const result: string = DateUtil.nameByDate(true, 'shot_edit_boundary_40.jpg');
      expect(result).assertEqual('shot_edit_boundary_40');
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length).assertEqual(21);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0120 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0121
     * @tc.name      testPhotosDateNameBoundary0121
     * @tc.desc      Handles multi-dot name sample group.1.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0121 begin');
      const result: string = DateUtil.nameByDate(true, 'group.1.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0122
     * @tc.name      testPhotosDateNameBoundary0122
     * @tc.desc      Handles multi-dot name sample group.2.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0122 begin');
      const result: string = DateUtil.nameByDate(true, 'group.2.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0123
     * @tc.name      testPhotosDateNameBoundary0123
     * @tc.desc      Handles multi-dot name sample group.3.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0123 begin');
      const result: string = DateUtil.nameByDate(true, 'group.3.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0123 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0124
     * @tc.name      testPhotosDateNameBoundary0124
     * @tc.desc      Handles multi-dot name sample group.4.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0124 begin');
      const result: string = DateUtil.nameByDate(true, 'group.4.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0125
     * @tc.name      testPhotosDateNameBoundary0125
     * @tc.desc      Handles multi-dot name sample group.5.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0125 begin');
      const result: string = DateUtil.nameByDate(true, 'group.5.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0126
     * @tc.name      testPhotosDateNameBoundary0126
     * @tc.desc      Handles multi-dot name sample group.6.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0126 begin');
      const result: string = DateUtil.nameByDate(true, 'group.6.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0126 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0127
     * @tc.name      testPhotosDateNameBoundary0127
     * @tc.desc      Handles multi-dot name sample group.7.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0127 begin');
      const result: string = DateUtil.nameByDate(true, 'group.7.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0128
     * @tc.name      testPhotosDateNameBoundary0128
     * @tc.desc      Handles multi-dot name sample group.8.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0128 begin');
      const result: string = DateUtil.nameByDate(true, 'group.8.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0129
     * @tc.name      testPhotosDateNameBoundary0129
     * @tc.desc      Handles multi-dot name sample group.9.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0129 begin');
      const result: string = DateUtil.nameByDate(true, 'group.9.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0129 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0130
     * @tc.name      testPhotosDateNameBoundary0130
     * @tc.desc      Handles multi-dot name sample group.10.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0130 begin');
      const result: string = DateUtil.nameByDate(true, 'group.10.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0131
     * @tc.name      testPhotosDateNameBoundary0131
     * @tc.desc      Handles multi-dot name sample group.11.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0131 begin');
      const result: string = DateUtil.nameByDate(true, 'group.11.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0132
     * @tc.name      testPhotosDateNameBoundary0132
     * @tc.desc      Handles multi-dot name sample group.12.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0132 begin');
      const result: string = DateUtil.nameByDate(true, 'group.12.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0132 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0133
     * @tc.name      testPhotosDateNameBoundary0133
     * @tc.desc      Handles multi-dot name sample group.13.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0133 begin');
      const result: string = DateUtil.nameByDate(true, 'group.13.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0134
     * @tc.name      testPhotosDateNameBoundary0134
     * @tc.desc      Handles multi-dot name sample group.14.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0134 begin');
      const result: string = DateUtil.nameByDate(true, 'group.14.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0135
     * @tc.name      testPhotosDateNameBoundary0135
     * @tc.desc      Handles multi-dot name sample group.15.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0135 begin');
      const result: string = DateUtil.nameByDate(true, 'group.15.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0135 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0136
     * @tc.name      testPhotosDateNameBoundary0136
     * @tc.desc      Handles multi-dot name sample group.16.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0136 begin');
      const result: string = DateUtil.nameByDate(true, 'group.16.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0137
     * @tc.name      testPhotosDateNameBoundary0137
     * @tc.desc      Handles multi-dot name sample group.17.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0137 begin');
      const result: string = DateUtil.nameByDate(true, 'group.17.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0138
     * @tc.name      testPhotosDateNameBoundary0138
     * @tc.desc      Handles multi-dot name sample group.18.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0138 begin');
      const result: string = DateUtil.nameByDate(true, 'group.18.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0138 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0139
     * @tc.name      testPhotosDateNameBoundary0139
     * @tc.desc      Handles multi-dot name sample group.19.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0139 begin');
      const result: string = DateUtil.nameByDate(true, 'group.19.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0140
     * @tc.name      testPhotosDateNameBoundary0140
     * @tc.desc      Handles multi-dot name sample group.20.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0140 begin');
      const result: string = DateUtil.nameByDate(true, 'group.20.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0140 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0141
     * @tc.name      testPhotosDateNameBoundary0141
     * @tc.desc      Handles multi-dot name sample group.21.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0141 begin');
      const result: string = DateUtil.nameByDate(true, 'group.21.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0141 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0142
     * @tc.name      testPhotosDateNameBoundary0142
     * @tc.desc      Handles multi-dot name sample group.22.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0142 begin');
      const result: string = DateUtil.nameByDate(true, 'group.22.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0143
     * @tc.name      testPhotosDateNameBoundary0143
     * @tc.desc      Handles multi-dot name sample group.23.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0143 begin');
      const result: string = DateUtil.nameByDate(true, 'group.23.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0144
     * @tc.name      testPhotosDateNameBoundary0144
     * @tc.desc      Handles multi-dot name sample group.24.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0144 begin');
      const result: string = DateUtil.nameByDate(true, 'group.24.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0144 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0145
     * @tc.name      testPhotosDateNameBoundary0145
     * @tc.desc      Handles multi-dot name sample group.25.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0145 begin');
      const result: string = DateUtil.nameByDate(true, 'group.25.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0146
     * @tc.name      testPhotosDateNameBoundary0146
     * @tc.desc      Handles multi-dot name sample group.26.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0146 begin');
      const result: string = DateUtil.nameByDate(true, 'group.26.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0147
     * @tc.name      testPhotosDateNameBoundary0147
     * @tc.desc      Handles multi-dot name sample group.27.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0147 begin');
      const result: string = DateUtil.nameByDate(true, 'group.27.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0147 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0148
     * @tc.name      testPhotosDateNameBoundary0148
     * @tc.desc      Handles multi-dot name sample group.28.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0148 begin');
      const result: string = DateUtil.nameByDate(true, 'group.28.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0149
     * @tc.name      testPhotosDateNameBoundary0149
     * @tc.desc      Handles multi-dot name sample group.29.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0149 begin');
      const result: string = DateUtil.nameByDate(true, 'group.29.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0150
     * @tc.name      testPhotosDateNameBoundary0150
     * @tc.desc      Handles multi-dot name sample group.30.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0150 begin');
      const result: string = DateUtil.nameByDate(true, 'group.30.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0150 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0151
     * @tc.name      testPhotosDateNameBoundary0151
     * @tc.desc      Handles multi-dot name sample group.31.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0151 begin');
      const result: string = DateUtil.nameByDate(true, 'group.31.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0152
     * @tc.name      testPhotosDateNameBoundary0152
     * @tc.desc      Handles multi-dot name sample group.32.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0152 begin');
      const result: string = DateUtil.nameByDate(true, 'group.32.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0153
     * @tc.name      testPhotosDateNameBoundary0153
     * @tc.desc      Handles multi-dot name sample group.33.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0153 begin');
      const result: string = DateUtil.nameByDate(true, 'group.33.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0153 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0154
     * @tc.name      testPhotosDateNameBoundary0154
     * @tc.desc      Handles multi-dot name sample group.34.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0154 begin');
      const result: string = DateUtil.nameByDate(true, 'group.34.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0155
     * @tc.name      testPhotosDateNameBoundary0155
     * @tc.desc      Handles multi-dot name sample group.35.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0155 begin');
      const result: string = DateUtil.nameByDate(true, 'group.35.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0155 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0156
     * @tc.name      testPhotosDateNameBoundary0156
     * @tc.desc      Handles multi-dot name sample group.36.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0156 begin');
      const result: string = DateUtil.nameByDate(true, 'group.36.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0156 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0157
     * @tc.name      testPhotosDateNameBoundary0157
     * @tc.desc      Handles multi-dot name sample group.37.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0157 begin');
      const result: string = DateUtil.nameByDate(true, 'group.37.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0158
     * @tc.name      testPhotosDateNameBoundary0158
     * @tc.desc      Handles multi-dot name sample group.38.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0158 begin');
      const result: string = DateUtil.nameByDate(true, 'group.38.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0159
     * @tc.name      testPhotosDateNameBoundary0159
     * @tc.desc      Handles multi-dot name sample group.39.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0159 begin');
      const result: string = DateUtil.nameByDate(true, 'group.39.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0159 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0160
     * @tc.name      testPhotosDateNameBoundary0160
     * @tc.desc      Handles multi-dot name sample group.40.shot.jpg.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0160 begin');
      const result: string = DateUtil.nameByDate(true, 'group.40.shot.jpg');
      expect(result.startsWith('group_edit_')).assertTrue();
      expect(result.indexOf('.jpg') === -1).assertTrue();
      expect(result.length > 'group_edit_'.length).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0160 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0161
     * @tc.name      testPhotosDateNameBoundary0161
     * @tc.desc      Handles boundary empty naming sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0161 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0162
     * @tc.name      testPhotosDateNameBoundary0162
     * @tc.desc      Handles boundary empty naming sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0162 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0162 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0163
     * @tc.name      testPhotosDateNameBoundary0163
     * @tc.desc      Handles boundary empty naming sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0163 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0164
     * @tc.name      testPhotosDateNameBoundary0164
     * @tc.desc      Handles boundary empty naming sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0164 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0165
     * @tc.name      testPhotosDateNameBoundary0165
     * @tc.desc      Handles boundary empty naming sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0165 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0165 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0166
     * @tc.name      testPhotosDateNameBoundary0166
     * @tc.desc      Handles boundary empty naming sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0166 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0167
     * @tc.name      testPhotosDateNameBoundary0167
     * @tc.desc      Handles boundary empty naming sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0167 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0168
     * @tc.name      testPhotosDateNameBoundary0168
     * @tc.desc      Handles boundary empty naming sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0168 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0168 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0169
     * @tc.name      testPhotosDateNameBoundary0169
     * @tc.desc      Handles boundary empty naming sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0169 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0170
     * @tc.name      testPhotosDateNameBoundary0170
     * @tc.desc      Handles boundary empty naming sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0170 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0170 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0171
     * @tc.name      testPhotosDateNameBoundary0171
     * @tc.desc      Handles boundary empty naming sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0171 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0171 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0172
     * @tc.name      testPhotosDateNameBoundary0172
     * @tc.desc      Handles boundary empty naming sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0172 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0173
     * @tc.name      testPhotosDateNameBoundary0173
     * @tc.desc      Handles boundary empty naming sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0173 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0174
     * @tc.name      testPhotosDateNameBoundary0174
     * @tc.desc      Handles boundary empty naming sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0174 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0174 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0175
     * @tc.name      testPhotosDateNameBoundary0175
     * @tc.desc      Handles boundary empty naming sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0175 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0175 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0176
     * @tc.name      testPhotosDateNameBoundary0176
     * @tc.desc      Handles boundary empty naming sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0176 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0177
     * @tc.name      testPhotosDateNameBoundary0177
     * @tc.desc      Handles boundary empty naming sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameBoundary0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0177 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameBoundary0177 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_BOUNDARY_0178
     * @tc.name      testPhotosDateNameBoundary0178
     * @tc.desc      Handles boundary empty naming sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
