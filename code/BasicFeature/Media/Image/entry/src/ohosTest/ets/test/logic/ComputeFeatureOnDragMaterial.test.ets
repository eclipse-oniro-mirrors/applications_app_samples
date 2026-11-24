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
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ComputeFeature } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ComputeFeature.onDragMaterial (81 cases). */
export default function computeFeatureOnDragMaterialTest(): void {
  describe('ComputeFeatureOnDragMaterialTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0001
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0001
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=-100) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureOnDragMaterial_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0001 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, -100);
      logInfo(`onDragMaterial(dx=-100, dy=-100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=-100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0002
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0002
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=-1) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureOnDragMaterial_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0002 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, -1);
      logInfo(`onDragMaterial(dx=-100, dy=-1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=-1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0003
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0003
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=2) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0003 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 2);
      logInfo(`onDragMaterial(dx=-100, dy=2) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=2) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0004
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0004
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=1) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0004 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 1);
      logInfo(`onDragMaterial(dx=-100, dy=1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0005
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0005
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=3) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0005 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 3);
      logInfo(`onDragMaterial(dx=-100, dy=3) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=3) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0006
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0006
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=0) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0006 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 0);
      logInfo(`onDragMaterial(dx=-100, dy=0) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0007
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0007
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=4) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0007 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 4);
      logInfo(`onDragMaterial(dx=-100, dy=4) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=4) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0008
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0008
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=50) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0008 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 50);
      logInfo(`onDragMaterial(dx=-100, dy=50) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=50) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0009
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0009
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=100) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0009 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 100);
      logInfo(`onDragMaterial(dx=-100, dy=100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0010
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0010
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=10) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0010 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 10);
      logInfo(`onDragMaterial(dx=-100, dy=10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0011
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0011
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=5) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0011 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 5);
      logInfo(`onDragMaterial(dx=-100, dy=5) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=5) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0012
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0012
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=15) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0012 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 15);
      logInfo(`onDragMaterial(dx=-100, dy=15) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=15) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0013
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0013
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=20) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0013 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 20);
      logInfo(`onDragMaterial(dx=-100, dy=20) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=20) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0014
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0014
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=25) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0014 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 25);
      logInfo(`onDragMaterial(dx=-100, dy=25) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=25) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0015
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0015
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=30) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0015 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 30);
      logInfo(`onDragMaterial(dx=-100, dy=30) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=30) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0016
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0016
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=35) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0016 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 35);
      logInfo(`onDragMaterial(dx=-100, dy=35) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=35) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0017
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0017
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=40) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0017 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 40);
      logInfo(`onDragMaterial(dx=-100, dy=40) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=40) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0018
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0018
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=45) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0018 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 45);
      logInfo(`onDragMaterial(dx=-100, dy=45) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=45) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0019
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0019
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=55) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0019 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 55);
      logInfo(`onDragMaterial(dx=-100, dy=55) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=55) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0020
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0020
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=60) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0020 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 60);
      logInfo(`onDragMaterial(dx=-100, dy=60) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=60) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0021
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0021
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=65) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0021 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 65);
      logInfo(`onDragMaterial(dx=-100, dy=65) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=65) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0022
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0022
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=70) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0022 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 70);
      logInfo(`onDragMaterial(dx=-100, dy=70) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=70) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0023
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0023
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=75) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0023 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 75);
      logInfo(`onDragMaterial(dx=-100, dy=75) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=75) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0024
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0024
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=80) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0024 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 80);
      logInfo(`onDragMaterial(dx=-100, dy=80) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=80) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0025
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0025
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=85) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0025 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 85);
      logInfo(`onDragMaterial(dx=-100, dy=85) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=85) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0026
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0026
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=90) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0026 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 90);
      logInfo(`onDragMaterial(dx=-100, dy=90) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=90) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0027
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0027
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=95) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0027 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 95);
      logInfo(`onDragMaterial(dx=-100, dy=95) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=95) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0028
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0028
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=182) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0028 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 182);
      logInfo(`onDragMaterial(dx=-100, dy=182) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=182) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(182);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0029
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0029
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=-10) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0029 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, -10);
      logInfo(`onDragMaterial(dx=-100, dy=-10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=-10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0030
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0030
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-100, dy=6) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0030 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 6);
      logInfo(`onDragMaterial(dx=-100, dy=6) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial(dx=-100, dy=6) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0031
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0031
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=-100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0031 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, -100);
      logInfo(`onDragMaterial(dx=-1, dy=-100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=-100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0032
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0032
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0032 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, -1);
      logInfo(`onDragMaterial(dx=-1, dy=-1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=-1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0033
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0033
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0033 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 2);
      logInfo(`onDragMaterial(dx=-1, dy=2) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=2) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0034
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0034
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0034 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 1);
      logInfo(`onDragMaterial(dx=-1, dy=1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0035
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0035
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=3) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0035 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 3);
      logInfo(`onDragMaterial(dx=-1, dy=3) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=3) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0036
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0036
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0036 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 0);
      logInfo(`onDragMaterial(dx=-1, dy=0) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0037
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0037
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=4) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0037 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 4);
      logInfo(`onDragMaterial(dx=-1, dy=4) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=4) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0038
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0038
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=50) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0038 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 50);
      logInfo(`onDragMaterial(dx=-1, dy=50) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=50) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0039
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0039
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0039 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 100);
      logInfo(`onDragMaterial(dx=-1, dy=100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0040
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0040
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0040 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 10);
      logInfo(`onDragMaterial(dx=-1, dy=10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0041
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0041
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=5) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0041 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 5);
      logInfo(`onDragMaterial(dx=-1, dy=5) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=5) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0042
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0042
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=15) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0042 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 15);
      logInfo(`onDragMaterial(dx=-1, dy=15) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=15) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0043
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0043
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=20) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0043 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 20);
      logInfo(`onDragMaterial(dx=-1, dy=20) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=20) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0044
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0044
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=25) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0044 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 25);
      logInfo(`onDragMaterial(dx=-1, dy=25) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=25) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0045
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0045
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=30) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0045 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 30);
      logInfo(`onDragMaterial(dx=-1, dy=30) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=30) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0046
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0046
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=35) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0046 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 35);
      logInfo(`onDragMaterial(dx=-1, dy=35) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=35) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0047
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0047
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=40) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0047 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 40);
      logInfo(`onDragMaterial(dx=-1, dy=40) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=40) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0048
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0048
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=45) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0048 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 45);
      logInfo(`onDragMaterial(dx=-1, dy=45) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=45) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0049
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0049
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=55) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0049 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 55);
      logInfo(`onDragMaterial(dx=-1, dy=55) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=55) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0050
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0050
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=60) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0050 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 60);
      logInfo(`onDragMaterial(dx=-1, dy=60) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=60) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0051
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0051
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=65) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0051 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 65);
      logInfo(`onDragMaterial(dx=-1, dy=65) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=65) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0052
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0052
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=70) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0052 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 70);
      logInfo(`onDragMaterial(dx=-1, dy=70) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=70) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0053
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0053
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=75) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0053 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 75);
      logInfo(`onDragMaterial(dx=-1, dy=75) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=75) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0054
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0054
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=80) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0054 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 80);
      logInfo(`onDragMaterial(dx=-1, dy=80) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=80) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0055
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0055
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=85) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0055 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 85);
      logInfo(`onDragMaterial(dx=-1, dy=85) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=85) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0056
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0056
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=90) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0056 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 90);
      logInfo(`onDragMaterial(dx=-1, dy=90) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=90) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0057
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0057
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=95) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0057 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 95);
      logInfo(`onDragMaterial(dx=-1, dy=95) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=95) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0058
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0058
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=182) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0058 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 182);
      logInfo(`onDragMaterial(dx=-1, dy=182) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=182) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(182);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0059
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0059
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=-10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0059 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, -10);
      logInfo(`onDragMaterial(dx=-1, dy=-10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=-10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0060
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0060
     * @tc.desc      ComputeFeature.onDragMaterial(dx=-1, dy=6) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0060 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 6);
      logInfo(`onDragMaterial(dx=-1, dy=6) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial(dx=-1, dy=6) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0061
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0061
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=-100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0061 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, -100);
      logInfo(`onDragMaterial(dx=2, dy=-100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=-100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0062
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0062
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0062 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, -1);
      logInfo(`onDragMaterial(dx=2, dy=-1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=-1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0063
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0063
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0063 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 2);
      logInfo(`onDragMaterial(dx=2, dy=2) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=2) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0064
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0064
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0064 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 1);
      logInfo(`onDragMaterial(dx=2, dy=1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0065
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0065
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=3) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0065 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 3);
      logInfo(`onDragMaterial(dx=2, dy=3) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=3) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0066
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0066
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=0) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0066 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 0);
      logInfo(`onDragMaterial(dx=2, dy=0) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0067
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0067
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0067 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 4);
      logInfo(`onDragMaterial(dx=2, dy=4) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=4) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0068
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0068
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=50) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0068 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 50);
      logInfo(`onDragMaterial(dx=2, dy=50) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=50) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0069
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0069
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0069 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 100);
      logInfo(`onDragMaterial(dx=2, dy=100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0070
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0070
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0070 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 10);
      logInfo(`onDragMaterial(dx=2, dy=10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0071
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0071
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=5) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0071 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 5);
      logInfo(`onDragMaterial(dx=2, dy=5) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=5) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0072
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0072
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=15) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0072 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 15);
      logInfo(`onDragMaterial(dx=2, dy=15) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=15) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0073
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0073
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=20) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0073 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 20);
      logInfo(`onDragMaterial(dx=2, dy=20) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=20) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0074
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0074
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=25) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0074 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 25);
      logInfo(`onDragMaterial(dx=2, dy=25) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=25) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0075
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0075
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=30) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0075 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 30);
      logInfo(`onDragMaterial(dx=2, dy=30) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=30) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0076
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0076
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=35) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0076 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 35);
      logInfo(`onDragMaterial(dx=2, dy=35) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=35) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0077
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0077
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=40) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0077 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 40);
      logInfo(`onDragMaterial(dx=2, dy=40) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=40) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0078
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0078
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=45) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0078 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 45);
      logInfo(`onDragMaterial(dx=2, dy=45) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=45) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0079
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0079
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=55) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0079 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 55);
      logInfo(`onDragMaterial(dx=2, dy=55) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=55) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0080
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0080
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=60) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0080 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 60);
      logInfo(`onDragMaterial(dx=2, dy=60) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=60) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0081
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0081
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=65) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0081 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 65);
      logInfo(`onDragMaterial(dx=2, dy=65) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=65) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0081 end`);
    });
  });
}
