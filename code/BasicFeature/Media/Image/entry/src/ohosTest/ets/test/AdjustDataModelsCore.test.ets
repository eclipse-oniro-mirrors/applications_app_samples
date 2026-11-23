/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './YieldToEventLoop';
import hilog from '@ohos.hilog';
import {
  Tasks, CropTasks, ScaleTasks, ColorSpaceTasks, TaskData,
  MaterialData, FontColorData, ImageData
} from '../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'AdjustDataModelsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function adjustDataModelsCoreTest(): void {
  describe('AdjustDataModelsCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0001
     * @tc.name      testAdjustDataModels0001
     * @tc.desc      Verify Tasks.SCALE maps to ordinal value 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.SCALE=${Tasks.SCALE}, expected=0`);
      expect(Tasks.SCALE).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.SCALE=${typeof Tasks.SCALE}, expected='number'`);
      expect(typeof Tasks.SCALE).assertEqual('number');
      log('testAdjustDataModels0001 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0002
     * @tc.name      testAdjustDataModels0002
     * @tc.desc      Verify Tasks.CROP maps to ordinal value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.CROP=${Tasks.CROP}, expected=1`);
      expect(Tasks.CROP).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.CROP=${typeof Tasks.CROP}, expected='number'`);
      expect(typeof Tasks.CROP).assertEqual('number');
      log('testAdjustDataModels0002 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0003
     * @tc.name      testAdjustDataModels0003
     * @tc.desc      Verify Tasks.ROTATE maps to ordinal value 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0003 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.ROTATE=${Tasks.ROTATE}, expected=2`);
      expect(Tasks.ROTATE).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.ROTATE=${typeof Tasks.ROTATE}`);
      expect(typeof Tasks.ROTATE).assertEqual('number');
      log('testAdjustDataModels0003 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0004
     * @tc.name      testAdjustDataModels0004
     * @tc.desc      Verify Tasks.TONING maps to ordinal value 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.TONING=${Tasks.TONING}, expected=3`);
      expect(Tasks.TONING).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.TONING=${typeof Tasks.TONING}`);
      expect(typeof Tasks.TONING).assertEqual('number');
      log('testAdjustDataModels0004 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0005
     * @tc.name      testAdjustDataModels0005
     * @tc.desc      Verify Tasks.TEXT maps to ordinal value 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.TEXT=${Tasks.TEXT}, expected=4`);
      expect(Tasks.TEXT).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.TEXT=${typeof Tasks.TEXT}, expected='number'`);
      expect(typeof Tasks.TEXT).assertEqual('number');
      log('testAdjustDataModels0005 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0006
     * @tc.name      testAdjustDataModels0006
     * @tc.desc      Verify Tasks.STICKER maps to ordinal value 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0006 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.STICKER=${Tasks.STICKER}, expected=5`);
      expect(Tasks.STICKER).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.STICKER=${typeof Tasks.STICKER}`);
      expect(typeof Tasks.STICKER).assertEqual('number');
      log('testAdjustDataModels0006 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0007
     * @tc.name      testAdjustDataModels0007
     * @tc.desc      Verify Tasks.ADJUST maps to ordinal value 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0007 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.ADJUST=${Tasks.ADJUST}, expected=6`);
      expect(Tasks.ADJUST).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.ADJUST=${typeof Tasks.ADJUST}`);
      expect(typeof Tasks.ADJUST).assertEqual('number');
      log('testAdjustDataModels0007 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0008
     * @tc.name      testAdjustDataModels0008
     * @tc.desc      Verify Tasks.MARK maps to ordinal value 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0008 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.MARK=${Tasks.MARK}, expected=7`);
      expect(Tasks.MARK).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.MARK=${typeof Tasks.MARK}, expected='number'`);
      expect(typeof Tasks.MARK).assertEqual('number');
      log('testAdjustDataModels0008 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0009
     * @tc.name      testAdjustDataModels0009
     * @tc.desc      Verify Tasks.COLORSPACE maps to ordinal value 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0009 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.COLORSPACE=${Tasks.COLORSPACE}, expected=8`);
      expect(Tasks.COLORSPACE).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.COLORSPACE=${typeof Tasks.COLORSPACE}`);
      expect(typeof Tasks.COLORSPACE).assertEqual('number');
      log('testAdjustDataModels0009 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0010
     * @tc.name      testAdjustDataModels0010
     * @tc.desc      Verify Tasks.HDR maps to ordinal value 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0010 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.HDR=${Tasks.HDR}, expected=9`);
      expect(Tasks.HDR).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.HDR=${typeof Tasks.HDR}, expected='number'`);
      expect(typeof Tasks.HDR).assertEqual('number');
      log('testAdjustDataModels0010 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0011
     * @tc.name      testAdjustDataModels0011
     * @tc.desc      Verify Tasks.ENCODEJS maps to ordinal value 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0011 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.ENCODEJS=${Tasks.ENCODEJS}, expected=10`);
      expect(Tasks.ENCODEJS).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.ENCODEJS=${typeof Tasks.ENCODEJS}`);
      expect(typeof Tasks.ENCODEJS).assertEqual('number');
      log('testAdjustDataModels0011 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0012
     * @tc.name      testAdjustDataModels0012
     * @tc.desc      Verify Tasks.DECODEJS maps to ordinal value 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0012 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.DECODEJS=${Tasks.DECODEJS}, expected=11`);
      expect(Tasks.DECODEJS).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.DECODEJS=${typeof Tasks.DECODEJS}`);
      expect(typeof Tasks.DECODEJS).assertEqual('number');
      log('testAdjustDataModels0012 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0013
     * @tc.name      testAdjustDataModels0013
     * @tc.desc      Verify Tasks.ENCODENDK maps to ordinal value 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0013 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.ENCODENDK=${Tasks.ENCODENDK}, expected=12`);
      expect(Tasks.ENCODENDK).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.ENCODENDK=${typeof Tasks.ENCODENDK}`);
      expect(typeof Tasks.ENCODENDK).assertEqual('number');
      log('testAdjustDataModels0013 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0014
     * @tc.name      testAdjustDataModels0014
     * @tc.desc      Verify Tasks.DECODENDK maps to ordinal value 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0014 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.DECODENDK=${Tasks.DECODENDK}, expected=13`);
      expect(Tasks.DECODENDK).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.DECODENDK=${typeof Tasks.DECODENDK}`);
      expect(typeof Tasks.DECODENDK).assertEqual('number');
      log('testAdjustDataModels0014 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0015
     * @tc.name      testAdjustDataModels0015
     * @tc.desc      Verify Tasks.NONE sentinel maps to reserved value 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0015 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Tasks.NONE=${Tasks.NONE}, expected=99`);
      expect(Tasks.NONE).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Tasks.NONE=${typeof Tasks.NONE}, expected='number'`);
      expect(typeof Tasks.NONE).assertEqual('number');
      log('testAdjustDataModels0015 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0016
     * @tc.name      testAdjustDataModels0016
     * @tc.desc      Verify CropTasks.ORIGIN maps to ordinal value 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0016 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CropTasks.ORIGIN=${CropTasks.ORIGIN}, expected=0`);
      expect(CropTasks.ORIGIN).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof CropTasks.ORIGIN=${typeof CropTasks.ORIGIN}`);
      expect(typeof CropTasks.ORIGIN).assertEqual('number');
      log('testAdjustDataModels0016 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0017
     * @tc.name      testAdjustDataModels0017
     * @tc.desc      Verify CropTasks.ONE_ONE maps to ordinal value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0017 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CropTasks.ONE_ONE=${CropTasks.ONE_ONE}, expected=1`);
      expect(CropTasks.ONE_ONE).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof CropTasks.ONE_ONE=${typeof CropTasks.ONE_ONE}`);
      expect(typeof CropTasks.ONE_ONE).assertEqual('number');
      log('testAdjustDataModels0017 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0018
     * @tc.name      testAdjustDataModels0018
     * @tc.desc      Verify CropTasks.THREE_FOUR maps to ordinal value 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0018 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CropTasks.THREE_FOUR=${CropTasks.THREE_FOUR}, expected=2`);
      expect(CropTasks.THREE_FOUR).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof CropTasks.THREE_FOUR=${typeof CropTasks.THREE_FOUR}`);
      expect(typeof CropTasks.THREE_FOUR).assertEqual('number');
      log('testAdjustDataModels0018 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0019
     * @tc.name      testAdjustDataModels0019
     * @tc.desc      Verify CropTasks.NINE_SIXTH maps to ordinal value 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0019 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CropTasks.NINE_SIXTH=${CropTasks.NINE_SIXTH}, expected=3`);
      expect(CropTasks.NINE_SIXTH).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof CropTasks.NINE_SIXTH=${typeof CropTasks.NINE_SIXTH}`);
      expect(typeof CropTasks.NINE_SIXTH).assertEqual('number');
      log('testAdjustDataModels0019 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0020
     * @tc.name      testAdjustDataModels0020
     * @tc.desc      Verify CropTasks.NONE sentinel maps to reserved value 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0020 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CropTasks.NONE=${CropTasks.NONE}, expected=99`);
      expect(CropTasks.NONE).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof CropTasks.NONE=${typeof CropTasks.NONE}`);
      expect(typeof CropTasks.NONE).assertEqual('number');
      log('testAdjustDataModels0020 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0021
     * @tc.name      testAdjustDataModels0021
     * @tc.desc      Verify ScaleTasks.AMPLIFICARION maps to ordinal value 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0021 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ScaleTasks.AMPLIFICARION=${ScaleTasks.AMPLIFICARION}`);
      expect(ScaleTasks.AMPLIFICARION).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof ScaleTasks.AMPLIFICARION}, expected='number'`);
      expect(typeof ScaleTasks.AMPLIFICARION).assertEqual('number');
      log('testAdjustDataModels0021 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0022
     * @tc.name      testAdjustDataModels0022
     * @tc.desc      Verify ScaleTasks.NARROW maps to ordinal value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0022 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ScaleTasks.NARROW=${ScaleTasks.NARROW}, expected=1`);
      expect(ScaleTasks.NARROW).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ScaleTasks.NARROW=${typeof ScaleTasks.NARROW}`);
      expect(typeof ScaleTasks.NARROW).assertEqual('number');
      log('testAdjustDataModels0022 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0023
     * @tc.name      testAdjustDataModels0023
     * @tc.desc      Verify ScaleTasks.NONE sentinel maps to reserved value 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0023 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ScaleTasks.NONE=${ScaleTasks.NONE}, expected=99`);
      expect(ScaleTasks.NONE).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ScaleTasks.NONE=${typeof ScaleTasks.NONE}`);
      expect(typeof ScaleTasks.NONE).assertEqual('number');
      log('testAdjustDataModels0023 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0024
     * @tc.name      testAdjustDataModels0024
     * @tc.desc      Verify ColorSpaceTasks.ADOBERGB maps to ordinal value 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0024 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ColorSpaceTasks.ADOBERGB=${ColorSpaceTasks.ADOBERGB}`);
      expect(ColorSpaceTasks.ADOBERGB).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof ColorSpaceTasks.ADOBERGB}, expected='number'`);
      expect(typeof ColorSpaceTasks.ADOBERGB).assertEqual('number');
      log('testAdjustDataModels0024 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0025
     * @tc.name      testAdjustDataModels0025
     * @tc.desc      Verify ColorSpaceTasks.SRGB maps to ordinal value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0025 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ColorSpaceTasks.SRGB=${ColorSpaceTasks.SRGB}, expected=1`);
      expect(ColorSpaceTasks.SRGB).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ColorSpaceTasks.SRGB=${typeof ColorSpaceTasks.SRGB}`);
      expect(typeof ColorSpaceTasks.SRGB).assertEqual('number');
      log('testAdjustDataModels0025 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0026
     * @tc.name      testAdjustDataModels0026
     * @tc.desc      Verify ColorSpaceTasks.DCIP3 maps to ordinal value 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0026 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ColorSpaceTasks.DCIP3=${ColorSpaceTasks.DCIP3}, expected=2`);
      expect(ColorSpaceTasks.DCIP3).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ColorSpaceTasks.DCIP3=${typeof ColorSpaceTasks.DCIP3}`);
      expect(typeof ColorSpaceTasks.DCIP3).assertEqual('number');
      log('testAdjustDataModels0026 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0027
     * @tc.name      testAdjustDataModels0027
     * @tc.desc      Verify ColorSpaceTasks.DISPLAYP3 maps to ordinal value 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0027 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ColorSpaceTasks.DISPLAYP3=${ColorSpaceTasks.DISPLAYP3}`);
      expect(ColorSpaceTasks.DISPLAYP3).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof ColorSpaceTasks.DISPLAYP3}`);
      expect(typeof ColorSpaceTasks.DISPLAYP3).assertEqual('number');
      log('testAdjustDataModels0027 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0028
     * @tc.name      testAdjustDataModels0028
     * @tc.desc      Verify ColorSpaceTasks.NONE sentinel maps to reserved value 99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0028 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual ColorSpaceTasks.NONE=${ColorSpaceTasks.NONE}, expected=99`);
      expect(ColorSpaceTasks.NONE).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof ColorSpaceTasks.NONE=${typeof ColorSpaceTasks.NONE}`);
      expect(typeof ColorSpaceTasks.NONE).assertEqual('number');
      log('testAdjustDataModels0028 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0029
     * @tc.name      testAdjustDataModels0029
     * @tc.desc      Verify default TaskData exposes undefined task field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0029 begin');
      const data: TaskData = new TaskData();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined data.task`);
      expect(data.task).assertUndefined();
      log('testAdjustDataModels0029 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0030
     * @tc.name      testAdjustDataModels0030
     * @tc.desc      Verify default TaskData exposes undefined name field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0030 begin');
      const data: TaskData = new TaskData();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined data.name`);
      expect(data.name).assertUndefined();
      log('testAdjustDataModels0030 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0031
     * @tc.name      testAdjustDataModels0031
     * @tc.desc      Verify default TaskData exposes undefined image and text fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0031 begin');
      const data: TaskData = new TaskData();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined data.image`);
      expect(data.image).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined data.text`);
      expect(data.text).assertUndefined();
      log('testAdjustDataModels0031 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0032
     * @tc.name      testAdjustDataModels0032
     * @tc.desc      Verify TaskData keeps the provided task value with matching UI id name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0032 begin');
      const data: TaskData = new TaskData(Tasks.DECODEJS, undefined, undefined, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.task=${data.task}, expected=Tasks.DECODEJS`);
      expect(data.task).assertEqual(Tasks.DECODEJS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.name=${data.name}, expected='decodingJs'`);
      expect(data.name).assertEqual('decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof data.name=${typeof data.name}, expected='string'`);
      expect(typeof data.name).assertEqual('string');
      log('testAdjustDataModels0032 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0033
     * @tc.name      testAdjustDataModels0033
     * @tc.desc      Verify TaskData is an instance of its class and mutable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0033 begin');
      const data: TaskData = new TaskData(Tasks.HDR);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue data instanceof TaskData=${data instanceof TaskData}`);
      expect(data instanceof TaskData).assertTrue();
      data.task = Tasks.NONE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.task=${data.task}, expected=99`);
      expect(data.task).assertEqual(99);
      log('testAdjustDataModels0033 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0034
     * @tc.name      testAdjustDataModels0034
     * @tc.desc      Verify two TaskData instances keep independent state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0034 begin');
      const first: TaskData = new TaskData(Tasks.SCALE);
      const second: TaskData = new TaskData(Tasks.CROP);
      first.task = Tasks.HDR;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.task=${first.task}, expected=Tasks.HDR`);
      expect(first.task).assertEqual(Tasks.HDR);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.task=${second.task}, expected=Tasks.CROP`);
      expect(second.task).assertEqual(Tasks.CROP);
      log('testAdjustDataModels0034 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0035
     * @tc.name      testAdjustDataModels0035
     * @tc.desc      Verify FontColorData default constructor leaves resource undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0035 begin');
      const data: FontColorData = new FontColorData();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined data.getResource()`);
      expect(data.getResource()).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined data.getName()`);
      expect(data.getName()).assertUndefined();
      log('testAdjustDataModels0035 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0036
     * @tc.name      testAdjustDataModels0036
     * @tc.desc      Verify ImageData default constructor leaves resource undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0036 begin');
      const data: ImageData = new ImageData();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined data.getResource()`);
      expect(data.getResource()).assertUndefined();
      log('testAdjustDataModels0036 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0037
     * @tc.name      testAdjustDataModels0037
     * @tc.desc      Verify FontColorData returns the same resource instance it was built with.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0037 begin');
      const fakeResource: Resource = { id: 1, type: 10001, params: [], bundleName: 'demo', moduleName: 'entry' };
      const data: FontColorData = new FontColorData(fakeResource, fakeResource);
      const got: Resource | undefined = data.getResource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue got === fakeResource=${got === fakeResource}`);
      expect(got === fakeResource).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${data.getName() === fakeResource}`);
      expect(data.getName() === fakeResource).assertTrue();
      log('testAdjustDataModels0037 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0038
     * @tc.name      testAdjustDataModels0038
     * @tc.desc      Verify ImageData returns the same image resource instance it was built with.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0038 begin');
      const fakeResource: Resource = { id: 2, type: 20001, params: [], bundleName: 'demo', moduleName: 'entry' };
      const data: ImageData = new ImageData(fakeResource);
      const got: Resource | undefined = data.getResource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue got === fakeResource=${got === fakeResource}`);
      expect(got === fakeResource).assertTrue();
      log('testAdjustDataModels0038 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0039
     * @tc.name      testAdjustDataModels0039
     * @tc.desc      Verify FontColorData and ImageData implement the MaterialData contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0039 begin');
      const fontData: MaterialData = new FontColorData();
      const imgData: MaterialData = new ImageData();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof fontData.getResource=${typeof fontData.getResource}`);
      expect(typeof fontData.getResource).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof imgData.getName=${typeof imgData.getName}`);
      expect(typeof imgData.getName).assertEqual('function');
      log('testAdjustDataModels0039 end');
    })

    /**
     * @tc.number    SUB_IMAGE_DATAMODEL_0040
     * @tc.name      testAdjustDataModels0040
     * @tc.desc      Verify enum members within one group stay pairwise distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAdjustDataModels0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testAdjustDataModels0040 begin');
      const values: number[] = [Tasks.SCALE, Tasks.CROP, Tasks.ROTATE, Tasks.TONING, Tasks.TEXT,
        Tasks.STICKER, Tasks.ADJUST, Tasks.MARK, Tasks.COLORSPACE, Tasks.HDR,
        Tasks.ENCODEJS, Tasks.DECODEJS, Tasks.ENCODENDK, Tasks.DECODENDK, Tasks.NONE];
      for (let i: number = 0; i < values.length; i++) {
        for (let j: number = i + 1; j < values.length; j++) {
          hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue values[i] !== values[j]=${values[i] !== values[j]}`);
          expect(values[i] !== values[j]).assertTrue();
        }
      }
      log('testAdjustDataModels0040 end');
    })
  })
}
