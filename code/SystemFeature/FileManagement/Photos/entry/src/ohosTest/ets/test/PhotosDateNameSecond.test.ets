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

const TAG = '[Sample_PhotosDateNameSecondTest]';
const DOMAIN = 0xF811;

export default function PhotosDateNameSecondTest(): void {
  describe('PhotosDateNameSecondTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0001
     * @tc.name      testPhotosDateNameSecond0001
     * @tc.desc      Generates second edited name sample albumPhoto_1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0001 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_1.png');
      expect(result.startsWith('albumPhoto_1_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_1_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0002
     * @tc.name      testPhotosDateNameSecond0002
     * @tc.desc      Generates second edited name sample albumPhoto_2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0002 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_2.png');
      expect(result.startsWith('albumPhoto_2_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_2_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0003
     * @tc.name      testPhotosDateNameSecond0003
     * @tc.desc      Generates second edited name sample albumPhoto_3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0003 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_3.png');
      expect(result.startsWith('albumPhoto_3_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_3_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0004
     * @tc.name      testPhotosDateNameSecond0004
     * @tc.desc      Generates second edited name sample albumPhoto_4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0004 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_4.png');
      expect(result.startsWith('albumPhoto_4_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_4_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0005
     * @tc.name      testPhotosDateNameSecond0005
     * @tc.desc      Generates second edited name sample albumPhoto_5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0005 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_5.png');
      expect(result.startsWith('albumPhoto_5_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_5_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0006
     * @tc.name      testPhotosDateNameSecond0006
     * @tc.desc      Generates second edited name sample albumPhoto_6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0006 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_6.png');
      expect(result.startsWith('albumPhoto_6_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_6_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0007
     * @tc.name      testPhotosDateNameSecond0007
     * @tc.desc      Generates second edited name sample albumPhoto_7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0007 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_7.png');
      expect(result.startsWith('albumPhoto_7_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_7_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0008
     * @tc.name      testPhotosDateNameSecond0008
     * @tc.desc      Generates second edited name sample albumPhoto_8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0008 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_8.png');
      expect(result.startsWith('albumPhoto_8_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_8_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0009
     * @tc.name      testPhotosDateNameSecond0009
     * @tc.desc      Generates second edited name sample albumPhoto_9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0009 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_9.png');
      expect(result.startsWith('albumPhoto_9_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_9_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0010
     * @tc.name      testPhotosDateNameSecond0010
     * @tc.desc      Generates second edited name sample albumPhoto_10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0010 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_10.png');
      expect(result.startsWith('albumPhoto_10_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_10_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0011
     * @tc.name      testPhotosDateNameSecond0011
     * @tc.desc      Generates second edited name sample albumPhoto_11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0011 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_11.png');
      expect(result.startsWith('albumPhoto_11_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_11_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0012
     * @tc.name      testPhotosDateNameSecond0012
     * @tc.desc      Generates second edited name sample albumPhoto_12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0012 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_12.png');
      expect(result.startsWith('albumPhoto_12_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_12_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0013
     * @tc.name      testPhotosDateNameSecond0013
     * @tc.desc      Generates second edited name sample albumPhoto_13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0013 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_13.png');
      expect(result.startsWith('albumPhoto_13_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_13_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0014
     * @tc.name      testPhotosDateNameSecond0014
     * @tc.desc      Generates second edited name sample albumPhoto_14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0014 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_14.png');
      expect(result.startsWith('albumPhoto_14_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_14_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0015
     * @tc.name      testPhotosDateNameSecond0015
     * @tc.desc      Generates second edited name sample albumPhoto_15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0015 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_15.png');
      expect(result.startsWith('albumPhoto_15_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_15_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0016
     * @tc.name      testPhotosDateNameSecond0016
     * @tc.desc      Generates second edited name sample albumPhoto_16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0016 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_16.png');
      expect(result.startsWith('albumPhoto_16_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_16_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0017
     * @tc.name      testPhotosDateNameSecond0017
     * @tc.desc      Generates second edited name sample albumPhoto_17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0017 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_17.png');
      expect(result.startsWith('albumPhoto_17_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_17_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0018
     * @tc.name      testPhotosDateNameSecond0018
     * @tc.desc      Generates second edited name sample albumPhoto_18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0018 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_18.png');
      expect(result.startsWith('albumPhoto_18_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_18_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0019
     * @tc.name      testPhotosDateNameSecond0019
     * @tc.desc      Generates second edited name sample albumPhoto_19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0019 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_19.png');
      expect(result.startsWith('albumPhoto_19_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_19_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0020
     * @tc.name      testPhotosDateNameSecond0020
     * @tc.desc      Generates second edited name sample albumPhoto_20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0020 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_20.png');
      expect(result.startsWith('albumPhoto_20_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_20_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0021
     * @tc.name      testPhotosDateNameSecond0021
     * @tc.desc      Generates second edited name sample albumPhoto_21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0021 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_21.png');
      expect(result.startsWith('albumPhoto_21_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_21_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0022
     * @tc.name      testPhotosDateNameSecond0022
     * @tc.desc      Generates second edited name sample albumPhoto_22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0022 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_22.png');
      expect(result.startsWith('albumPhoto_22_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_22_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0023
     * @tc.name      testPhotosDateNameSecond0023
     * @tc.desc      Generates second edited name sample albumPhoto_23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0023 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_23.png');
      expect(result.startsWith('albumPhoto_23_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_23_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0024
     * @tc.name      testPhotosDateNameSecond0024
     * @tc.desc      Generates second edited name sample albumPhoto_24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0024 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_24.png');
      expect(result.startsWith('albumPhoto_24_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_24_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0025
     * @tc.name      testPhotosDateNameSecond0025
     * @tc.desc      Generates second edited name sample albumPhoto_25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0025 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_25.png');
      expect(result.startsWith('albumPhoto_25_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_25_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0026
     * @tc.name      testPhotosDateNameSecond0026
     * @tc.desc      Generates second edited name sample albumPhoto_26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0026 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_26.png');
      expect(result.startsWith('albumPhoto_26_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_26_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0027
     * @tc.name      testPhotosDateNameSecond0027
     * @tc.desc      Generates second edited name sample albumPhoto_27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0027 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_27.png');
      expect(result.startsWith('albumPhoto_27_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_27_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0028
     * @tc.name      testPhotosDateNameSecond0028
     * @tc.desc      Generates second edited name sample albumPhoto_28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0028 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_28.png');
      expect(result.startsWith('albumPhoto_28_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_28_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0029
     * @tc.name      testPhotosDateNameSecond0029
     * @tc.desc      Generates second edited name sample albumPhoto_29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0029 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_29.png');
      expect(result.startsWith('albumPhoto_29_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_29_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0030
     * @tc.name      testPhotosDateNameSecond0030
     * @tc.desc      Generates second edited name sample albumPhoto_30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0030 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_30.png');
      expect(result.startsWith('albumPhoto_30_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_30_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0031
     * @tc.name      testPhotosDateNameSecond0031
     * @tc.desc      Generates second edited name sample albumPhoto_31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0031 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_31.png');
      expect(result.startsWith('albumPhoto_31_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_31_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0032
     * @tc.name      testPhotosDateNameSecond0032
     * @tc.desc      Generates second edited name sample albumPhoto_32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0032 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_32.png');
      expect(result.startsWith('albumPhoto_32_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_32_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0033
     * @tc.name      testPhotosDateNameSecond0033
     * @tc.desc      Generates second edited name sample albumPhoto_33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0033 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_33.png');
      expect(result.startsWith('albumPhoto_33_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_33_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0034
     * @tc.name      testPhotosDateNameSecond0034
     * @tc.desc      Generates second edited name sample albumPhoto_34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0034 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_34.png');
      expect(result.startsWith('albumPhoto_34_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_34_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0035
     * @tc.name      testPhotosDateNameSecond0035
     * @tc.desc      Generates second edited name sample albumPhoto_35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0035 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_35.png');
      expect(result.startsWith('albumPhoto_35_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_35_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0036
     * @tc.name      testPhotosDateNameSecond0036
     * @tc.desc      Generates second edited name sample albumPhoto_36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0036 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_36.png');
      expect(result.startsWith('albumPhoto_36_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_36_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0037
     * @tc.name      testPhotosDateNameSecond0037
     * @tc.desc      Generates second edited name sample albumPhoto_37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0037 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_37.png');
      expect(result.startsWith('albumPhoto_37_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_37_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0038
     * @tc.name      testPhotosDateNameSecond0038
     * @tc.desc      Generates second edited name sample albumPhoto_38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0038 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_38.png');
      expect(result.startsWith('albumPhoto_38_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_38_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0039
     * @tc.name      testPhotosDateNameSecond0039
     * @tc.desc      Generates second edited name sample albumPhoto_39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0039 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_39.png');
      expect(result.startsWith('albumPhoto_39_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_39_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0040
     * @tc.name      testPhotosDateNameSecond0040
     * @tc.desc      Generates second edited name sample albumPhoto_40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0040 begin');
      const result: string = DateUtil.nameByDate(true, 'albumPhoto_40.png');
      expect(result.startsWith('albumPhoto_40_edit_')).assertTrue();
      expect(result.length > 'albumPhoto_40_edit_'.length).assertTrue();
      expect(result.indexOf('.png') === -1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0041
     * @tc.name      testPhotosDateNameSecond0041
     * @tc.desc      Keeps second edited prefix sample album_edit_1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0041 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_1.png');
      expect(result).assertEqual('album_edit_1');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0042
     * @tc.name      testPhotosDateNameSecond0042
     * @tc.desc      Keeps second edited prefix sample album_edit_2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0042 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_2.png');
      expect(result).assertEqual('album_edit_2');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0043
     * @tc.name      testPhotosDateNameSecond0043
     * @tc.desc      Keeps second edited prefix sample album_edit_3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0043 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_3.png');
      expect(result).assertEqual('album_edit_3');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0044
     * @tc.name      testPhotosDateNameSecond0044
     * @tc.desc      Keeps second edited prefix sample album_edit_4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0044 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_4.png');
      expect(result).assertEqual('album_edit_4');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0045
     * @tc.name      testPhotosDateNameSecond0045
     * @tc.desc      Keeps second edited prefix sample album_edit_5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0045 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_5.png');
      expect(result).assertEqual('album_edit_5');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0046
     * @tc.name      testPhotosDateNameSecond0046
     * @tc.desc      Keeps second edited prefix sample album_edit_6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0046 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_6.png');
      expect(result).assertEqual('album_edit_6');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0047
     * @tc.name      testPhotosDateNameSecond0047
     * @tc.desc      Keeps second edited prefix sample album_edit_7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0047 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_7.png');
      expect(result).assertEqual('album_edit_7');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0048
     * @tc.name      testPhotosDateNameSecond0048
     * @tc.desc      Keeps second edited prefix sample album_edit_8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0048 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_8.png');
      expect(result).assertEqual('album_edit_8');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0049
     * @tc.name      testPhotosDateNameSecond0049
     * @tc.desc      Keeps second edited prefix sample album_edit_9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0049 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_9.png');
      expect(result).assertEqual('album_edit_9');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0050
     * @tc.name      testPhotosDateNameSecond0050
     * @tc.desc      Keeps second edited prefix sample album_edit_10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0050 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_10.png');
      expect(result).assertEqual('album_edit_10');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0051
     * @tc.name      testPhotosDateNameSecond0051
     * @tc.desc      Keeps second edited prefix sample album_edit_11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0051 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_11.png');
      expect(result).assertEqual('album_edit_11');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0052
     * @tc.name      testPhotosDateNameSecond0052
     * @tc.desc      Keeps second edited prefix sample album_edit_12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0052 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_12.png');
      expect(result).assertEqual('album_edit_12');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0053
     * @tc.name      testPhotosDateNameSecond0053
     * @tc.desc      Keeps second edited prefix sample album_edit_13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0053 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_13.png');
      expect(result).assertEqual('album_edit_13');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0054
     * @tc.name      testPhotosDateNameSecond0054
     * @tc.desc      Keeps second edited prefix sample album_edit_14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0054 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_14.png');
      expect(result).assertEqual('album_edit_14');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0055
     * @tc.name      testPhotosDateNameSecond0055
     * @tc.desc      Keeps second edited prefix sample album_edit_15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0055 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_15.png');
      expect(result).assertEqual('album_edit_15');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0056
     * @tc.name      testPhotosDateNameSecond0056
     * @tc.desc      Keeps second edited prefix sample album_edit_16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0056 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_16.png');
      expect(result).assertEqual('album_edit_16');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0057
     * @tc.name      testPhotosDateNameSecond0057
     * @tc.desc      Keeps second edited prefix sample album_edit_17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0057 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_17.png');
      expect(result).assertEqual('album_edit_17');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0058
     * @tc.name      testPhotosDateNameSecond0058
     * @tc.desc      Keeps second edited prefix sample album_edit_18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0058 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_18.png');
      expect(result).assertEqual('album_edit_18');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0059
     * @tc.name      testPhotosDateNameSecond0059
     * @tc.desc      Keeps second edited prefix sample album_edit_19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0059 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_19.png');
      expect(result).assertEqual('album_edit_19');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0060
     * @tc.name      testPhotosDateNameSecond0060
     * @tc.desc      Keeps second edited prefix sample album_edit_20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0060 begin');
      const result: string = DateUtil.nameByDate(true, 'album_edit_20.png');
      expect(result).assertEqual('album_edit_20');
      expect(result.indexOf('.png') === -1).assertTrue();
      expect(result.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0061
     * @tc.name      testPhotosDateNameSecond0061
     * @tc.desc      Handles second empty naming sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0061 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0062
     * @tc.name      testPhotosDateNameSecond0062
     * @tc.desc      Handles second empty naming sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0062 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0063
     * @tc.name      testPhotosDateNameSecond0063
     * @tc.desc      Handles second empty naming sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0063 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0064
     * @tc.name      testPhotosDateNameSecond0064
     * @tc.desc      Handles second empty naming sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0064 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0065
     * @tc.name      testPhotosDateNameSecond0065
     * @tc.desc      Handles second empty naming sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0065 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0066
     * @tc.name      testPhotosDateNameSecond0066
     * @tc.desc      Handles second empty naming sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0066 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0067
     * @tc.name      testPhotosDateNameSecond0067
     * @tc.desc      Handles second empty naming sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0067 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0068
     * @tc.name      testPhotosDateNameSecond0068
     * @tc.desc      Handles second empty naming sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0068 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0069
     * @tc.name      testPhotosDateNameSecond0069
     * @tc.desc      Handles second empty naming sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0069 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0070
     * @tc.name      testPhotosDateNameSecond0070
     * @tc.desc      Handles second empty naming sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0070 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0071
     * @tc.name      testPhotosDateNameSecond0071
     * @tc.desc      Handles second empty naming sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0071 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0072
     * @tc.name      testPhotosDateNameSecond0072
     * @tc.desc      Handles second empty naming sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0072 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0073
     * @tc.name      testPhotosDateNameSecond0073
     * @tc.desc      Handles second empty naming sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0073 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0074
     * @tc.name      testPhotosDateNameSecond0074
     * @tc.desc      Handles second empty naming sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0074 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0075
     * @tc.name      testPhotosDateNameSecond0075
     * @tc.desc      Handles second empty naming sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0075 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0076
     * @tc.name      testPhotosDateNameSecond0076
     * @tc.desc      Handles second empty naming sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0076 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0077
     * @tc.name      testPhotosDateNameSecond0077
     * @tc.desc      Handles second empty naming sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0077 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0078
     * @tc.name      testPhotosDateNameSecond0078
     * @tc.desc      Handles second empty naming sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0078 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0079
     * @tc.name      testPhotosDateNameSecond0079
     * @tc.desc      Handles second empty naming sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0079 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0080
     * @tc.name      testPhotosDateNameSecond0080
     * @tc.desc      Handles second empty naming sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0080 begin');
      expect(DateUtil.nameByDate(true, '') === null).assertTrue();
      expect(DateUtil.nameByDate(true) === null).assertTrue();
      const fallback: string = DateUtil.nameByDate(false, 'ignored');
      expect(fallback.startsWith('IMG_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0081
     * @tc.name      testPhotosDateNameSecond0081
     * @tc.desc      Generates second timestamp name sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0081 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0082
     * @tc.name      testPhotosDateNameSecond0082
     * @tc.desc      Generates second timestamp name sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0082 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0083
     * @tc.name      testPhotosDateNameSecond0083
     * @tc.desc      Generates second timestamp name sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0083 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0084
     * @tc.name      testPhotosDateNameSecond0084
     * @tc.desc      Generates second timestamp name sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0084 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0085
     * @tc.name      testPhotosDateNameSecond0085
     * @tc.desc      Generates second timestamp name sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0085 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0086
     * @tc.name      testPhotosDateNameSecond0086
     * @tc.desc      Generates second timestamp name sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0086 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0087
     * @tc.name      testPhotosDateNameSecond0087
     * @tc.desc      Generates second timestamp name sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0087 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0088
     * @tc.name      testPhotosDateNameSecond0088
     * @tc.desc      Generates second timestamp name sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0088 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0089
     * @tc.name      testPhotosDateNameSecond0089
     * @tc.desc      Generates second timestamp name sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0089 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0090
     * @tc.name      testPhotosDateNameSecond0090
     * @tc.desc      Generates second timestamp name sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0090 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0091
     * @tc.name      testPhotosDateNameSecond0091
     * @tc.desc      Generates second timestamp name sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0091 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0092
     * @tc.name      testPhotosDateNameSecond0092
     * @tc.desc      Generates second timestamp name sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0092 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0093
     * @tc.name      testPhotosDateNameSecond0093
     * @tc.desc      Generates second timestamp name sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0093 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0094
     * @tc.name      testPhotosDateNameSecond0094
     * @tc.desc      Generates second timestamp name sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0094 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0095
     * @tc.name      testPhotosDateNameSecond0095
     * @tc.desc      Generates second timestamp name sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0095 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0096
     * @tc.name      testPhotosDateNameSecond0096
     * @tc.desc      Generates second timestamp name sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0096 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0097
     * @tc.name      testPhotosDateNameSecond0097
     * @tc.desc      Generates second timestamp name sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0097 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0098
     * @tc.name      testPhotosDateNameSecond0098
     * @tc.desc      Generates second timestamp name sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0098 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0099
     * @tc.name      testPhotosDateNameSecond0099
     * @tc.desc      Generates second timestamp name sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0099 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_NAME_SECOND_0100
     * @tc.name      testPhotosDateNameSecond0100
     * @tc.desc      Generates second timestamp name sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateNameSecond0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0100 begin');
      const result: string = DateUtil.nameByDate(false, 'ignored');
      expect(result.startsWith('IMG_')).assertTrue();
      expect(result.length).assertEqual(19);
      expect(result.charAt(12)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateNameSecond0100 end');
    })
  })
}
