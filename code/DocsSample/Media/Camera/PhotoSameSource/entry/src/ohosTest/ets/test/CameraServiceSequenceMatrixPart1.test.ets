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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import CameraService, { SliderValue } from '../../../main/ets/mode/CameraService';
import { camera } from '@kit.CameraKit';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function CameraServiceSequenceMatrixPart1Test(): void {
  describe('CameraServiceSequenceMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_0100
     * @tc.name      testSceneSequence0001
     * @tc.desc      Verify scene mode sequence PHOTO-PHOTO-PHOTO ends on PHOTO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0001 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_PHOTO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_0200
     * @tc.name      testSceneSequence0002
     * @tc.desc      Verify scene mode sequence PHOTO-PHOTO-VIDEO ends on VIDEO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0002 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_VIDEO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_0300
     * @tc.name      testSceneSequence0003
     * @tc.desc      Verify scene mode sequence PHOTO-VIDEO-VIDEO ends on VIDEO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0003 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_VIDEO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_0400
     * @tc.name      testSceneSequence0004
     * @tc.desc      Verify scene mode sequence VIDEO-PHOTO-PHOTO ends on PHOTO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0004 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_PHOTO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_0500
     * @tc.name      testSceneSequence0005
     * @tc.desc      Verify scene mode sequence VIDEO-PHOTO-VIDEO ends on VIDEO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0005 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_VIDEO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_0600
     * @tc.name      testSceneSequence0006
     * @tc.desc      Verify scene mode sequence VIDEO-VIDEO-PHOTO ends on PHOTO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0006 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_PHOTO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_PHOTO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_0700
     * @tc.name      testSceneSequence0007
     * @tc.desc      Verify scene mode sequence VIDEO-VIDEO-VIDEO ends on VIDEO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0007 begin');
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      CameraService.setSceneMode(camera.SceneMode.NORMAL_VIDEO);
      expect(CameraService.getSceneMode()).assertEqual(camera.SceneMode.NORMAL_VIDEO);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneSequence0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_0800
     * @tc.name      testFrameSequence0008
     * @tc.desc      Verify frame flag sequence 0 then 0 ends on 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0008 begin');
      CameraService.frameStartFlag = 0;
      CameraService.frameStartFlag = 0;
      expect(CameraService.frameStartFlag).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_0900
     * @tc.name      testFrameSequence0009
     * @tc.desc      Verify frame flag sequence 0 then 1 ends on 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0009 begin');
      CameraService.frameStartFlag = 0;
      CameraService.frameStartFlag = 1;
      expect(CameraService.frameStartFlag).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1000
     * @tc.name      testFrameSequence0010
     * @tc.desc      Verify frame flag sequence 0 then -1 ends on -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0010 begin');
      CameraService.frameStartFlag = 0;
      CameraService.frameStartFlag = -1;
      expect(CameraService.frameStartFlag).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1100
     * @tc.name      testFrameSequence0011
     * @tc.desc      Verify frame flag sequence 0 then 99 ends on 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0011 begin');
      CameraService.frameStartFlag = 0;
      CameraService.frameStartFlag = 99;
      expect(CameraService.frameStartFlag).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1200
     * @tc.name      testFrameSequence0012
     * @tc.desc      Verify frame flag sequence 1 then 0 ends on 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0012 begin');
      CameraService.frameStartFlag = 1;
      CameraService.frameStartFlag = 0;
      expect(CameraService.frameStartFlag).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1300
     * @tc.name      testFrameSequence0013
     * @tc.desc      Verify frame flag sequence 1 then 1 ends on 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0013 begin');
      CameraService.frameStartFlag = 1;
      CameraService.frameStartFlag = 1;
      expect(CameraService.frameStartFlag).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1400
     * @tc.name      testFrameSequence0014
     * @tc.desc      Verify frame flag sequence 1 then -1 ends on -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0014 begin');
      CameraService.frameStartFlag = 1;
      CameraService.frameStartFlag = -1;
      expect(CameraService.frameStartFlag).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1500
     * @tc.name      testFrameSequence0015
     * @tc.desc      Verify frame flag sequence 1 then 99 ends on 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0015 begin');
      CameraService.frameStartFlag = 1;
      CameraService.frameStartFlag = 99;
      expect(CameraService.frameStartFlag).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1600
     * @tc.name      testFrameSequence0016
     * @tc.desc      Verify frame flag sequence -1 then 0 ends on 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0016 begin');
      CameraService.frameStartFlag = -1;
      CameraService.frameStartFlag = 0;
      expect(CameraService.frameStartFlag).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0016 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1700
     * @tc.name      testFrameSequence0017
     * @tc.desc      Verify frame flag sequence -1 then 1 ends on 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0017 begin');
      CameraService.frameStartFlag = -1;
      CameraService.frameStartFlag = 1;
      expect(CameraService.frameStartFlag).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0017 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1800
     * @tc.name      testFrameSequence0018
     * @tc.desc      Verify frame flag sequence -1 then -1 ends on -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0018 begin');
      CameraService.frameStartFlag = -1;
      CameraService.frameStartFlag = -1;
      expect(CameraService.frameStartFlag).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0018 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_1900
     * @tc.name      testFrameSequence0019
     * @tc.desc      Verify frame flag sequence -1 then 99 ends on 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0019 begin');
      CameraService.frameStartFlag = -1;
      CameraService.frameStartFlag = 99;
      expect(CameraService.frameStartFlag).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0019 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_2000
     * @tc.name      testFrameSequence0020
     * @tc.desc      Verify frame flag sequence 99 then 0 ends on 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0020 begin');
      CameraService.frameStartFlag = 99;
      CameraService.frameStartFlag = 0;
      expect(CameraService.frameStartFlag).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0020 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_2100
     * @tc.name      testFrameSequence0021
     * @tc.desc      Verify frame flag sequence 99 then 1 ends on 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0021 begin');
      CameraService.frameStartFlag = 99;
      CameraService.frameStartFlag = 1;
      expect(CameraService.frameStartFlag).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0021 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_2200
     * @tc.name      testFrameSequence0022
     * @tc.desc      Verify frame flag sequence 99 then -1 ends on -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0022 begin');
      CameraService.frameStartFlag = 99;
      CameraService.frameStartFlag = -1;
      expect(CameraService.frameStartFlag).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0022 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_2300
     * @tc.name      testFrameSequence0023
     * @tc.desc      Verify frame flag sequence 99 then 99 ends on 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFrameSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0023 begin');
      CameraService.frameStartFlag = 99;
      CameraService.frameStartFlag = 99;
      expect(CameraService.frameStartFlag).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFrameSequence0023 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_2400
     * @tc.name      testSliderCombination0024
     * @tc.desc      Verify SliderValue keeps min 0 max 0 step 0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSliderCombination0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderCombination0024 begin');
      const value: SliderValue = new SliderValue();
      value.min = 0;
      value.max = 0;
      value.step = 0.1;
      expect(value.min).assertEqual(0);
      expect(value.max).assertEqual(0);
      expect(value.step).assertEqual(0.1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderCombination0024 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_2500
     * @tc.name      testSliderCombination0025
     * @tc.desc      Verify SliderValue keeps min 1 max 6 step 0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSliderCombination0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderCombination0025 begin');
      const value: SliderValue = new SliderValue();
      value.min = 1;
      value.max = 6;
      value.step = 0.1;
      expect(value.min).assertEqual(1);
      expect(value.max).assertEqual(6);
      expect(value.step).assertEqual(0.1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderCombination0025 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_2600
     * @tc.name      testSliderCombination0026
     * @tc.desc      Verify SliderValue keeps min -1 max 10 step 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSliderCombination0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderCombination0026 begin');
      const value: SliderValue = new SliderValue();
      value.min = -1;
      value.max = 10;
      value.step = 1;
      expect(value.min).assertEqual(-1);
      expect(value.max).assertEqual(10);
      expect(value.step).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderCombination0026 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CSSQP1_2700
     * @tc.name      testSliderCombination0027
     * @tc.desc      Verify SliderValue keeps min 0.5 max 99 step 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSliderCombination0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderCombination0027 begin');
      const value: SliderValue = new SliderValue();
      value.min = 0.5;
      value.max = 99;
      value.step = 0.5;
      expect(value.min).assertEqual(0.5);
      expect(value.max).assertEqual(99);
      expect(value.step).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSliderCombination0027 end');
    })

  })
}
