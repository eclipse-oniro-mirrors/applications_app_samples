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

/** Logic checks for ComputeFeature.setOriginMaterialSize (64 cases). */
export default function computeFeatureSetOriginMaterialSize2Test(): void {
  describe('ComputeFeatureSetOriginMaterialSize2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0070
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0070
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=5) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0070 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 5);
      logInfo(`setOriginMaterialSize(w=2, y=5) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=5) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize(w=2, y=5) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=5) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0070 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0071
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0071
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=15) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0071 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 15);
      logInfo(`setOriginMaterialSize(w=2, y=15) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=15) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(15);
      logInfo(`setOriginMaterialSize(w=2, y=15) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=15) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0071 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0072
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0072
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=20) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0072 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 20);
      logInfo(`setOriginMaterialSize(w=2, y=20) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=20) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(20);
      logInfo(`setOriginMaterialSize(w=2, y=20) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=20) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0072 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0073
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0073
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=25) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0073 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 25);
      logInfo(`setOriginMaterialSize(w=2, y=25) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=25) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`setOriginMaterialSize(w=2, y=25) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=25) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0073 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0074
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0074
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=30) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0074 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 30);
      logInfo(`setOriginMaterialSize(w=2, y=30) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=30) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(30);
      logInfo(`setOriginMaterialSize(w=2, y=30) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=30) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0074 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0075
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0075
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=35) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0075 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 35);
      logInfo(`setOriginMaterialSize(w=2, y=35) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=35) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`setOriginMaterialSize(w=2, y=35) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=35) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0075 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0076
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0076
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=40) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0076 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 40);
      logInfo(`setOriginMaterialSize(w=2, y=40) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=40) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(40);
      logInfo(`setOriginMaterialSize(w=2, y=40) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=40) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0076 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0077
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0077
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=45) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0077 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 45);
      logInfo(`setOriginMaterialSize(w=2, y=45) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=45) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setOriginMaterialSize(w=2, y=45) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=45) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0077 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0078
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0078
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=55) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0078 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 55);
      logInfo(`setOriginMaterialSize(w=2, y=55) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=55) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`setOriginMaterialSize(w=2, y=55) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=55) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0078 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0079
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0079
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=60) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0079 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 60);
      logInfo(`setOriginMaterialSize(w=2, y=60) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=60) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`setOriginMaterialSize(w=2, y=60) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=60) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0079 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0080
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0080
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=65) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0080 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 65);
      logInfo(`setOriginMaterialSize(w=2, y=65) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=65) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(65);
      logInfo(`setOriginMaterialSize(w=2, y=65) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=65) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(32.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0080 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0081
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0081
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=70) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0081 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 70);
      logInfo(`setOriginMaterialSize(w=2, y=70) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=70) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(70);
      logInfo(`setOriginMaterialSize(w=2, y=70) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=70) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0081 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0082
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0082
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=75) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0082 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 75);
      logInfo(`setOriginMaterialSize(w=2, y=75) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=75) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setOriginMaterialSize(w=2, y=75) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=75) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0082 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0083
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0083
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=80) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0083 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 80);
      logInfo(`setOriginMaterialSize(w=2, y=80) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=80) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(80);
      logInfo(`setOriginMaterialSize(w=2, y=80) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=80) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0083 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0084
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0084
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=85) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0084 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 85);
      logInfo(`setOriginMaterialSize(w=2, y=85) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=85) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(85);
      logInfo(`setOriginMaterialSize(w=2, y=85) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=85) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(42.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0084 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0085
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0085
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=90) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0085 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 90);
      logInfo(`setOriginMaterialSize(w=2, y=90) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=90) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(90);
      logInfo(`setOriginMaterialSize(w=2, y=90) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=90) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0085 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0086
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0086
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=95) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0086 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 95);
      logInfo(`setOriginMaterialSize(w=2, y=95) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=95) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(95);
      logInfo(`setOriginMaterialSize(w=2, y=95) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=95) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(47.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0086 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0087
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0087
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=86.32) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0087 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 86.32);
      logInfo(`setOriginMaterialSize(w=2, y=86.32) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=86.32) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertClose(86.32, PRECISION);
      logInfo(`setOriginMaterialSize(w=2, y=86.32) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=86.32) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(43.16, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0087 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0088
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0088
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=69) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0088 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 69);
      logInfo(`setOriginMaterialSize(w=2, y=69) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=69) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`setOriginMaterialSize(w=2, y=69) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=69) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0088 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0089
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0089
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=2, y=83) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0089 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(2, 83);
      logInfo(`setOriginMaterialSize(w=2, y=83) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=2, y=83) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`setOriginMaterialSize(w=2, y=83) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=2, y=83) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(41.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0089 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0090
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0090
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=-100) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0090 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, -100);
      logInfo(`setOriginMaterialSize(w=3, y=-100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=-100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize(w=3, y=-100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=-100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0090 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0091
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0091
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=-1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0091 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, -1);
      logInfo(`setOriginMaterialSize(w=3, y=-1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=-1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=3, y=-1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=-1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0091 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0092
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0092
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0092 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 2);
      logInfo(`setOriginMaterialSize(w=3, y=2) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=2) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=3, y=2) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=2) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0092 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0093
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0093
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0093 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 1);
      logInfo(`setOriginMaterialSize(w=3, y=1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=3, y=1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0093 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0094
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0094
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0094 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 3);
      logInfo(`setOriginMaterialSize(w=3, y=3) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=3) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=3) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=3) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0094 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0095
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0095
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=0) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0095 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 0);
      logInfo(`setOriginMaterialSize(w=3, y=0) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=0) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0095 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0096
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0096
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=4) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0096 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 4);
      logInfo(`setOriginMaterialSize(w=3, y=4) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=4) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=3, y=4) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=4) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0096 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0097
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0097
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=50) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0097 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 50);
      logInfo(`setOriginMaterialSize(w=3, y=50) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=50) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=3, y=50) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=50) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0097 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0098
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0098
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=100) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0098 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 100);
      logInfo(`setOriginMaterialSize(w=3, y=100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=3, y=100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0098 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0099
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0099
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=10) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0099 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 10);
      logInfo(`setOriginMaterialSize(w=3, y=10) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=10) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(10);
      logInfo(`setOriginMaterialSize(w=3, y=10) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=10) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0099 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0100
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0100
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=5) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0100 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 5);
      logInfo(`setOriginMaterialSize(w=3, y=5) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=5) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize(w=3, y=5) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=5) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0100 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0101
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0101
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=15) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0101 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 15);
      logInfo(`setOriginMaterialSize(w=3, y=15) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=15) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(15);
      logInfo(`setOriginMaterialSize(w=3, y=15) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=15) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0101 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0102
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0102
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=20) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0102 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 20);
      logInfo(`setOriginMaterialSize(w=3, y=20) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=20) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(20);
      logInfo(`setOriginMaterialSize(w=3, y=20) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=20) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0102 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0103
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0103
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=25) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0103 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 25);
      logInfo(`setOriginMaterialSize(w=3, y=25) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=25) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`setOriginMaterialSize(w=3, y=25) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=25) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0103 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0104
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0104
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=30) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0104 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 30);
      logInfo(`setOriginMaterialSize(w=3, y=30) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=30) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(30);
      logInfo(`setOriginMaterialSize(w=3, y=30) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=30) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0104 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0105
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0105
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=35) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0105 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 35);
      logInfo(`setOriginMaterialSize(w=3, y=35) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=35) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`setOriginMaterialSize(w=3, y=35) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=35) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0105 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0106
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0106
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=40) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0106 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 40);
      logInfo(`setOriginMaterialSize(w=3, y=40) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=40) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(40);
      logInfo(`setOriginMaterialSize(w=3, y=40) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=40) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0106 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0107
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0107
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=45) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0107 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 45);
      logInfo(`setOriginMaterialSize(w=3, y=45) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=45) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setOriginMaterialSize(w=3, y=45) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=45) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0107 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0108
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0108
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=55) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0108 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 55);
      logInfo(`setOriginMaterialSize(w=3, y=55) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=55) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`setOriginMaterialSize(w=3, y=55) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=55) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0108 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0109
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0109
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=60) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0109 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 60);
      logInfo(`setOriginMaterialSize(w=3, y=60) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=60) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`setOriginMaterialSize(w=3, y=60) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=60) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0109 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0110
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0110
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=65) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0110 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 65);
      logInfo(`setOriginMaterialSize(w=3, y=65) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=65) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(65);
      logInfo(`setOriginMaterialSize(w=3, y=65) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=65) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(32.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0110 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0111
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0111
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=70) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0111 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 70);
      logInfo(`setOriginMaterialSize(w=3, y=70) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=70) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(70);
      logInfo(`setOriginMaterialSize(w=3, y=70) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=70) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0111 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0112
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0112
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=75) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0112 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 75);
      logInfo(`setOriginMaterialSize(w=3, y=75) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=75) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setOriginMaterialSize(w=3, y=75) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=75) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0112 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0113
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0113
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=80) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0113 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 80);
      logInfo(`setOriginMaterialSize(w=3, y=80) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=80) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(80);
      logInfo(`setOriginMaterialSize(w=3, y=80) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=80) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0113 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0114
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0114
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=85) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0114 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 85);
      logInfo(`setOriginMaterialSize(w=3, y=85) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=85) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(85);
      logInfo(`setOriginMaterialSize(w=3, y=85) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=85) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(42.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0114 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0115
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0115
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=90) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0115 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 90);
      logInfo(`setOriginMaterialSize(w=3, y=90) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=90) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(90);
      logInfo(`setOriginMaterialSize(w=3, y=90) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=90) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0115 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0116
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0116
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=95) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0116 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 95);
      logInfo(`setOriginMaterialSize(w=3, y=95) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=95) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(95);
      logInfo(`setOriginMaterialSize(w=3, y=95) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=95) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(47.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0116 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0117
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0117
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=86.32) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0117 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 86.32);
      logInfo(`setOriginMaterialSize(w=3, y=86.32) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=86.32) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertClose(86.32, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=86.32) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=86.32) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(43.16, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0117 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0118
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0118
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=69) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0118 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 69);
      logInfo(`setOriginMaterialSize(w=3, y=69) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=69) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`setOriginMaterialSize(w=3, y=69) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=69) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0118 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0119
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0119
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=3, y=83) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0119 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(3, 83);
      logInfo(`setOriginMaterialSize(w=3, y=83) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=3, y=83) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`setOriginMaterialSize(w=3, y=83) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(1.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=3, y=83) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(41.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0119 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0120
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0120
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=-100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0120 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, -100);
      logInfo(`setOriginMaterialSize(w=-1, y=-100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=-100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize(w=-1, y=-100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=-100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0120 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0121
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0121
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0121 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, -1);
      logInfo(`setOriginMaterialSize(w=-1, y=-1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=-1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=-1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=-1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0121 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0122
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0122
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0122 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 2);
      logInfo(`setOriginMaterialSize(w=-1, y=2) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=2) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=-1, y=2) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=2) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0122 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0123
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0123
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0123 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 1);
      logInfo(`setOriginMaterialSize(w=-1, y=1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=-1, y=1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0123 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0124
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0124
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=3) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0124 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 3);
      logInfo(`setOriginMaterialSize(w=-1, y=3) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=3) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=-1, y=3) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=3) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0124 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0125
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0125
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0125 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 0);
      logInfo(`setOriginMaterialSize(w=-1, y=0) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=0) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0125 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0126
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0126
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=4) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0126 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 4);
      logInfo(`setOriginMaterialSize(w=-1, y=4) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=4) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=-1, y=4) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=4) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0126 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0127
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0127
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=50) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0127 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 50);
      logInfo(`setOriginMaterialSize(w=-1, y=50) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=50) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=-1, y=50) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=50) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0127 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0128
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0128
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0128 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 100);
      logInfo(`setOriginMaterialSize(w=-1, y=100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=-1, y=100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0128 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0129
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0129
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0129 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 10);
      logInfo(`setOriginMaterialSize(w=-1, y=10) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=10) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(10);
      logInfo(`setOriginMaterialSize(w=-1, y=10) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=10) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0129 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0130
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0130
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=5) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0130 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 5);
      logInfo(`setOriginMaterialSize(w=-1, y=5) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=5) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize(w=-1, y=5) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=5) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0130 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0131
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0131
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=15) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0131 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 15);
      logInfo(`setOriginMaterialSize(w=-1, y=15) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=15) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(15);
      logInfo(`setOriginMaterialSize(w=-1, y=15) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=15) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0131 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0132
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0132
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=20) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0132 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 20);
      logInfo(`setOriginMaterialSize(w=-1, y=20) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=20) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(20);
      logInfo(`setOriginMaterialSize(w=-1, y=20) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=20) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0132 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0133
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0133
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=25) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0133 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 25);
      logInfo(`setOriginMaterialSize(w=-1, y=25) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=25) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`setOriginMaterialSize(w=-1, y=25) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=25) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0133 end`);
      });
  });
}
