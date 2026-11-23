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

/** Logic checks for ComputeFeature.setOriginMaterialSize (31 cases). */
export default function computeFeatureSetOriginMaterialSize4Test(): void {
  describe('ComputeFeatureSetOriginMaterialSize4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0198
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0198
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=55) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0198 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 55);
      logInfo(`setOriginMaterialSize(w=100, y=55) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=55) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`setOriginMaterialSize(w=100, y=55) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=55) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0198 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0199
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0199
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=60) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0199 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 60);
      logInfo(`setOriginMaterialSize(w=100, y=60) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=60) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`setOriginMaterialSize(w=100, y=60) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=60) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0199 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0200
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0200
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=65) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0200 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 65);
      logInfo(`setOriginMaterialSize(w=100, y=65) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=65) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(65);
      logInfo(`setOriginMaterialSize(w=100, y=65) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=65) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(32.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0200 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0201
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0201
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=70) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0201 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 70);
      logInfo(`setOriginMaterialSize(w=100, y=70) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=70) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(70);
      logInfo(`setOriginMaterialSize(w=100, y=70) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=70) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0201 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0202
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0202
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=75) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0202 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 75);
      logInfo(`setOriginMaterialSize(w=100, y=75) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=75) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setOriginMaterialSize(w=100, y=75) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=75) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0202 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0203
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0203
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=80) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0203 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 80);
      logInfo(`setOriginMaterialSize(w=100, y=80) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=80) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(80);
      logInfo(`setOriginMaterialSize(w=100, y=80) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=80) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0203 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0204
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0204
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=85) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0204 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 85);
      logInfo(`setOriginMaterialSize(w=100, y=85) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=85) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(85);
      logInfo(`setOriginMaterialSize(w=100, y=85) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=85) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(42.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0204 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0205
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0205
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=90) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0205 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 90);
      logInfo(`setOriginMaterialSize(w=100, y=90) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=90) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(90);
      logInfo(`setOriginMaterialSize(w=100, y=90) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=90) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0205 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0206
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0206
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=95) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0206 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 95);
      logInfo(`setOriginMaterialSize(w=100, y=95) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=95) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(95);
      logInfo(`setOriginMaterialSize(w=100, y=95) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=95) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(47.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0206 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0207
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0207
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=86.32) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0207 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 86.32);
      logInfo(`setOriginMaterialSize(w=100, y=86.32) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=86.32) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertClose(86.32, PRECISION);
      logInfo(`setOriginMaterialSize(w=100, y=86.32) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=86.32) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(43.16, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0207 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0208
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0208
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=69) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0208 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 69);
      logInfo(`setOriginMaterialSize(w=100, y=69) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=69) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`setOriginMaterialSize(w=100, y=69) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=69) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0208 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0209
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0209
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=83) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0209 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 83);
      logInfo(`setOriginMaterialSize(w=100, y=83) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=83) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`setOriginMaterialSize(w=100, y=83) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=83) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(41.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0209 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0210
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0210
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=-100) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0210 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, -100);
      logInfo(`setOriginMaterialSize(w=360, y=-100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=-100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize(w=360, y=-100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=-100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0210 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0211
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0211
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=-1) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0211 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, -1);
      logInfo(`setOriginMaterialSize(w=360, y=-1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=-1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=360, y=-1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=-1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0211 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0212
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0212
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=2) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0212 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 2);
      logInfo(`setOriginMaterialSize(w=360, y=2) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=2) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=360, y=2) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=2) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0212 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0213
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0213
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=1) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0213 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 1);
      logInfo(`setOriginMaterialSize(w=360, y=1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=360, y=1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0213 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0214
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0214
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=3) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0214 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 3);
      logInfo(`setOriginMaterialSize(w=360, y=3) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=3) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=360, y=3) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=3) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0214 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0215
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0215
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=0) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0215 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 0);
      logInfo(`setOriginMaterialSize(w=360, y=0) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=0) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0215 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0216
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0216
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=4) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0216 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 4);
      logInfo(`setOriginMaterialSize(w=360, y=4) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=4) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=360, y=4) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=4) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0216 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0217
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0217
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=50) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0217 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 50);
      logInfo(`setOriginMaterialSize(w=360, y=50) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=50) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=360, y=50) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=50) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0217 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0218
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0218
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=100) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0218 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 100);
      logInfo(`setOriginMaterialSize(w=360, y=100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=360, y=100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0218 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0219
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0219
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=10) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0219 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 10);
      logInfo(`setOriginMaterialSize(w=360, y=10) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=10) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(10);
      logInfo(`setOriginMaterialSize(w=360, y=10) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=10) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0219 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0220
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0220
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=5) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0220 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 5);
      logInfo(`setOriginMaterialSize(w=360, y=5) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=5) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize(w=360, y=5) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=5) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0220 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0221
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0221
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=15) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0221 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 15);
      logInfo(`setOriginMaterialSize(w=360, y=15) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=15) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(15);
      logInfo(`setOriginMaterialSize(w=360, y=15) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=15) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0221 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0222
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0222
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=20) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0222 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 20);
      logInfo(`setOriginMaterialSize(w=360, y=20) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=20) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(20);
      logInfo(`setOriginMaterialSize(w=360, y=20) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=20) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0222 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0223
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0223
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=25) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0223 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 25);
      logInfo(`setOriginMaterialSize(w=360, y=25) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=25) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`setOriginMaterialSize(w=360, y=25) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=25) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0223 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0224
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0224
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=30) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0224 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 30);
      logInfo(`setOriginMaterialSize(w=360, y=30) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=30) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(30);
      logInfo(`setOriginMaterialSize(w=360, y=30) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=30) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0224 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0225
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0225
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=35) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0225 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 35);
      logInfo(`setOriginMaterialSize(w=360, y=35) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=35) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`setOriginMaterialSize(w=360, y=35) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=35) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0225 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0226
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0226
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=40) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0226 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 40);
      logInfo(`setOriginMaterialSize(w=360, y=40) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=40) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(40);
      logInfo(`setOriginMaterialSize(w=360, y=40) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=40) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0226 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0227
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0227
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=45) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0227 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 45);
      logInfo(`setOriginMaterialSize(w=360, y=45) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=45) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setOriginMaterialSize(w=360, y=45) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=45) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0227 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0228
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0228
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=360, y=55) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0228 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 55);
      logInfo(`setOriginMaterialSize(w=360, y=55) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize(w=360, y=55) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`setOriginMaterialSize(w=360, y=55) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`setOriginMaterialSize(w=360, y=55) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0228 end`);
      });
  });
}
