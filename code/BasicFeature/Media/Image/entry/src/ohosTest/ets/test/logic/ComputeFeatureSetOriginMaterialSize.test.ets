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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ComputeFeature.setOriginMaterialSize (69 cases). */
export default function computeFeatureSetOriginMaterialSizeTest(): void {
  describe('ComputeFeatureSetOriginMaterialSizeTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0001
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0001
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=-100) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0001 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, -100);
      logInfo(`setOriginMaterialSize(w=0, y=-100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize(w=0, y=-100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0001 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0002
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0002
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0002 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, -1);
      logInfo(`setOriginMaterialSize(w=0, y=-1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=0, y=-1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0002 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0003
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0003
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0003 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 2);
      logInfo(`setOriginMaterialSize(w=0, y=2) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=0, y=2) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0003 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0004
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0004
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0004 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 1);
      logInfo(`setOriginMaterialSize(w=0, y=1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=0, y=1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0004 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0005
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0005
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0005 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 3);
      logInfo(`setOriginMaterialSize(w=0, y=3) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=0, y=3) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0005 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0006
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0006
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=4) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0006 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 4);
      logInfo(`setOriginMaterialSize(w=0, y=4) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=0, y=4) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0006 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0007
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0007
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=50) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0007 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 50);
      logInfo(`setOriginMaterialSize(w=0, y=50) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=0, y=50) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0007 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0008
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0008
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0008 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 100);
      logInfo(`setOriginMaterialSize(w=0, y=100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=0, y=100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0008 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0009
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0009
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0009 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 10);
      logInfo(`setOriginMaterialSize(w=0, y=10) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(10);
      logInfo(`setOriginMaterialSize(w=0, y=10) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0009 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0010
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0010
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=5) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0010 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 5);
      logInfo(`setOriginMaterialSize(w=0, y=5) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize(w=0, y=5) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0010 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0011
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0011
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=15) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0011 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 15);
      logInfo(`setOriginMaterialSize(w=0, y=15) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(15);
      logInfo(`setOriginMaterialSize(w=0, y=15) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0011 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0012
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0012
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=20) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0012 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 20);
      logInfo(`setOriginMaterialSize(w=0, y=20) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(20);
      logInfo(`setOriginMaterialSize(w=0, y=20) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0012 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0013
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0013
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=25) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0013 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 25);
      logInfo(`setOriginMaterialSize(w=0, y=25) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`setOriginMaterialSize(w=0, y=25) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0013 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0014
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0014
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=30) yields 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0014 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 30);
      logInfo(`setOriginMaterialSize(w=0, y=30) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(30);
      logInfo(`setOriginMaterialSize(w=0, y=30) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0014 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0015
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0015
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=35) yields 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0015 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 35);
      logInfo(`setOriginMaterialSize(w=0, y=35) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`setOriginMaterialSize(w=0, y=35) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0015 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0016
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0016
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=40) yields 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0016 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 40);
      logInfo(`setOriginMaterialSize(w=0, y=40) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(40);
      logInfo(`setOriginMaterialSize(w=0, y=40) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0016 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0017
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0017
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=45) yields 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0017 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 45);
      logInfo(`setOriginMaterialSize(w=0, y=45) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setOriginMaterialSize(w=0, y=45) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0017 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0018
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0018
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=55) yields 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0018 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 55);
      logInfo(`setOriginMaterialSize(w=0, y=55) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`setOriginMaterialSize(w=0, y=55) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0018 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0019
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0019
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=60) yields 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0019 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 60);
      logInfo(`setOriginMaterialSize(w=0, y=60) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`setOriginMaterialSize(w=0, y=60) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0019 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0020
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0020
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=65) yields 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0020 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 65);
      logInfo(`setOriginMaterialSize(w=0, y=65) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(65);
      logInfo(`setOriginMaterialSize(w=0, y=65) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(32.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0020 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0021
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0021
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=70) yields 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0021 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 70);
      logInfo(`setOriginMaterialSize(w=0, y=70) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(70);
      logInfo(`setOriginMaterialSize(w=0, y=70) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0021 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0022
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0022
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=75) yields 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0022 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 75);
      logInfo(`setOriginMaterialSize(w=0, y=75) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setOriginMaterialSize(w=0, y=75) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0022 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0023
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0023
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=80) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0023 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 80);
      logInfo(`setOriginMaterialSize(w=0, y=80) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(80);
      logInfo(`setOriginMaterialSize(w=0, y=80) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0023 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0024
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0024
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=85) yields 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0024 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 85);
      logInfo(`setOriginMaterialSize(w=0, y=85) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(85);
      logInfo(`setOriginMaterialSize(w=0, y=85) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(42.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0024 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0025
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0025
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=90) yields 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0025 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 90);
      logInfo(`setOriginMaterialSize(w=0, y=90) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(90);
      logInfo(`setOriginMaterialSize(w=0, y=90) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0025 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0026
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0026
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=95) yields 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0026 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 95);
      logInfo(`setOriginMaterialSize(w=0, y=95) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(95);
      logInfo(`setOriginMaterialSize(w=0, y=95) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(47.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0026 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0027
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0027
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=86.32) yields 86.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0027 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 86.32);
      logInfo(`setOriginMaterialSize(w=0, y=86.32) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertClose(86.32, PRECISION);
      logInfo(`setOriginMaterialSize(w=0, y=86.32) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(43.16, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0027 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0028
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0028
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=69) yields 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0028 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 69);
      logInfo(`setOriginMaterialSize(w=0, y=69) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`setOriginMaterialSize(w=0, y=69) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0028 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0029
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0029
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=0, y=83) yields 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0029 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 83);
      logInfo(`setOriginMaterialSize(w=0, y=83) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`setOriginMaterialSize(w=0, y=83) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(41.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0029 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0030
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0030
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=-100) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0030 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, -100);
      logInfo(`setOriginMaterialSize(w=1, y=-100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=-100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize(w=1, y=-100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=-100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0030 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0031
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0031
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=-1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0031 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, -1);
      logInfo(`setOriginMaterialSize(w=1, y=-1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=-1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=1, y=-1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=-1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0031 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0032
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0032
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0032 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 2);
      logInfo(`setOriginMaterialSize(w=1, y=2) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=2) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=1, y=2) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=2) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0032 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0033
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0033
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0033 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 1);
      logInfo(`setOriginMaterialSize(w=1, y=1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0033 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0034
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0034
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=3) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0034 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 3);
      logInfo(`setOriginMaterialSize(w=1, y=3) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=3) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=1, y=3) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=3) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0034 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0035
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0035
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=0) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0035 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 0);
      logInfo(`setOriginMaterialSize(w=1, y=0) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=0) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0035 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0036
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0036
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=4) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0036 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 4);
      logInfo(`setOriginMaterialSize(w=1, y=4) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=4) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=1, y=4) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=4) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0036 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0037
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0037
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=50) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0037 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 50);
      logInfo(`setOriginMaterialSize(w=1, y=50) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=50) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=1, y=50) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=50) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0037 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0038
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0038
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=100) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0038 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 100);
      logInfo(`setOriginMaterialSize(w=1, y=100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=1, y=100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0038 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0039
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0039
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=10) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0039 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 10);
      logInfo(`setOriginMaterialSize(w=1, y=10) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=10) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(10);
      logInfo(`setOriginMaterialSize(w=1, y=10) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=10) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0039 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0040
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0040
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=5) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0040 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 5);
      logInfo(`setOriginMaterialSize(w=1, y=5) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=5) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize(w=1, y=5) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=5) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0040 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0041
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0041
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=15) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0041 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 15);
      logInfo(`setOriginMaterialSize(w=1, y=15) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=15) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(15);
      logInfo(`setOriginMaterialSize(w=1, y=15) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=15) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0041 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0042
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0042
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=20) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0042 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 20);
      logInfo(`setOriginMaterialSize(w=1, y=20) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=20) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(20);
      logInfo(`setOriginMaterialSize(w=1, y=20) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=20) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0042 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0043
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0043
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=25) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0043 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 25);
      logInfo(`setOriginMaterialSize(w=1, y=25) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=25) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`setOriginMaterialSize(w=1, y=25) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=25) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0043 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0044
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0044
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=30) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0044 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 30);
      logInfo(`setOriginMaterialSize(w=1, y=30) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=30) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(30);
      logInfo(`setOriginMaterialSize(w=1, y=30) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=30) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0044 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0045
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0045
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=35) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0045 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 35);
      logInfo(`setOriginMaterialSize(w=1, y=35) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=35) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`setOriginMaterialSize(w=1, y=35) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=35) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0045 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0046
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0046
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=40) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0046 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 40);
      logInfo(`setOriginMaterialSize(w=1, y=40) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=40) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(40);
      logInfo(`setOriginMaterialSize(w=1, y=40) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=40) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0046 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0047
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0047
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=45) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0047 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 45);
      logInfo(`setOriginMaterialSize(w=1, y=45) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=45) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setOriginMaterialSize(w=1, y=45) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=45) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0047 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0048
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0048
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=55) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0048 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 55);
      logInfo(`setOriginMaterialSize(w=1, y=55) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=55) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`setOriginMaterialSize(w=1, y=55) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=55) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0048 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0049
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0049
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=60) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0049 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 60);
      logInfo(`setOriginMaterialSize(w=1, y=60) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=60) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`setOriginMaterialSize(w=1, y=60) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=60) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0049 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0050
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0050
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=65) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0050 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 65);
      logInfo(`setOriginMaterialSize(w=1, y=65) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=65) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(65);
      logInfo(`setOriginMaterialSize(w=1, y=65) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=65) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(32.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0050 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0051
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0051
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=70) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0051 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 70);
      logInfo(`setOriginMaterialSize(w=1, y=70) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=70) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(70);
      logInfo(`setOriginMaterialSize(w=1, y=70) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=70) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0051 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0052
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0052
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=75) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0052 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 75);
      logInfo(`setOriginMaterialSize(w=1, y=75) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=75) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setOriginMaterialSize(w=1, y=75) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=75) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0052 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0053
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0053
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=80) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0053 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 80);
      logInfo(`setOriginMaterialSize(w=1, y=80) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=80) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(80);
      logInfo(`setOriginMaterialSize(w=1, y=80) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=80) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0053 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0054
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0054
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=85) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0054 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 85);
      logInfo(`setOriginMaterialSize(w=1, y=85) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=85) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(85);
      logInfo(`setOriginMaterialSize(w=1, y=85) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=85) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(42.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0054 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0055
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0055
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=90) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0055 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 90);
      logInfo(`setOriginMaterialSize(w=1, y=90) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=90) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(90);
      logInfo(`setOriginMaterialSize(w=1, y=90) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=90) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0055 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0056
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0056
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=95) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0056 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 95);
      logInfo(`setOriginMaterialSize(w=1, y=95) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=95) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(95);
      logInfo(`setOriginMaterialSize(w=1, y=95) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=95) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(47.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0056 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0057
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0057
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=86.32) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0057 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 86.32);
      logInfo(`setOriginMaterialSize(w=1, y=86.32) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=86.32) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertClose(86.32, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=86.32) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=86.32) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(43.16, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0057 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0058
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0058
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=69) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0058 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 69);
      logInfo(`setOriginMaterialSize(w=1, y=69) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=69) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`setOriginMaterialSize(w=1, y=69) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=69) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0058 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0059
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0059
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=1, y=83) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0059 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 83);
      logInfo(`setOriginMaterialSize(w=1, y=83) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=1, y=83) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`setOriginMaterialSize(w=1, y=83) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=1, y=83) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(41.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0059 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0060
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0060
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=-100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0060 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, -100);
      logInfo(`setOriginMaterialSize(w=2, y=-100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=-100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize(w=2, y=-100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=-100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0060 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0061
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0061
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0061 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, -1);
      logInfo(`setOriginMaterialSize(w=2, y=-1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=-1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=2, y=-1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=-1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0061 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0062
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0062
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0062 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 2);
      logInfo(`setOriginMaterialSize(w=2, y=2) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=2) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=2) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=2) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0062 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0063
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0063
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0063 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 1);
      logInfo(`setOriginMaterialSize(w=2, y=1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0063 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0064
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0064
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=3) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0064 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 3);
      logInfo(`setOriginMaterialSize(w=2, y=3) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=3) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=2, y=3) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=3) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0064 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0065
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0065
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=0) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0065 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 0);
      logInfo(`setOriginMaterialSize(w=2, y=0) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=0) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0065 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0066
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0066
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0066 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 4);
      logInfo(`setOriginMaterialSize(w=2, y=4) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=4) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=2, y=4) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=4) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0066 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0067
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0067
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=50) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0067 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 50);
      logInfo(`setOriginMaterialSize(w=2, y=50) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=50) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=2, y=50) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=50) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0067 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0068
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0068
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0068 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 100);
      logInfo(`setOriginMaterialSize(w=2, y=100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=2, y=100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0068 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0069
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0069
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0069 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 10);
      logInfo(`setOriginMaterialSize(w=2, y=10) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=10) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(10);
      logInfo(`setOriginMaterialSize(w=2, y=10) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=10) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0069 end`);
      });
  });
}
