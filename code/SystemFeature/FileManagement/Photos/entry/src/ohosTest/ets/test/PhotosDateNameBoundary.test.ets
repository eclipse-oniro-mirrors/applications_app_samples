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
