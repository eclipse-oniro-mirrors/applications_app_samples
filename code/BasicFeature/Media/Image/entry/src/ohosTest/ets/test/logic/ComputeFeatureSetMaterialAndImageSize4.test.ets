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

/** Logic checks for ComputeFeature.setMaterialAndImageSize (55 cases). */
export default function computeFeatureSetMaterialAndImageSize4Test(): void {
  describe('ComputeFeatureSetMaterialAndImageSize4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0166
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0166
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=1, iw=4, ih=-1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0166 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 1, 4, -1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=4,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=4,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=4,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=4,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0166 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0167
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0167
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=100, iw=100, ih=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0167 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 100, 100, 10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0167 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0168
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0168
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=10, iw=1, ih=1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0168 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 10, 1, 1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0168 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0169
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0169
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=10, iw=4, ih=4) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0169 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 10, 4, 4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=4...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=4...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=4...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=4...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=4...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=4...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0169 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0170
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0170
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=10, iw=10, ih=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0170 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 10, 10, 2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0170 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0171
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0171
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=4, iw=0, ih=3) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0171 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 4, 0, 3);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0171 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0172
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0172
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=-1, iw=100, ih=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0172 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, -1, 100, 4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0172 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0173
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0173
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=10, iw=1, ih=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0173 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 10, 1, 10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0173 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0174
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0174
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=3, iw=100, ih=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0174 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 3, 100, 4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0174 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0175
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0175
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=-1, iw=100, ih=3) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0175 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, -1, 100, 3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0175 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0176
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0176
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=1, iw=1, ih=3) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0176 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 1, 1, 3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=1, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=1, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=1, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=1, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=1, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=1, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0176 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0177
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0177
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=1, iw=-1, ih=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0177 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 1, -1, 2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=-...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=-...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=-...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=-...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=-...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=-...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0177 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0178
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0178
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=10, iw=0, ih=100) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0178 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 10, 0, 100);
      logInfo(`setMaterialAndImageSize(cw=1, ch=10, iw=0...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=10, iw=0...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=1, ch=10, iw=0...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=1, ch=10, iw=0...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=1, ch=10, iw=0...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=1, ch=10, iw=0...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0178 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0179
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0179
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=3, iw=1, ih=3) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0179 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 3, 1, 3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0179 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0180
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0180
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=10, iw=100, ih=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0180 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 10, 100, 2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0180 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0181
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0181
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=1, iw=1, ih=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0181 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 1, 1, 2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=1,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=1,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=1,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=1,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0181 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0182
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0182
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=4, iw=3, ih=-1) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0182 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 4, 3, -1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0182 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0183
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0183
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=-1, iw=3, ih=2) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0183 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, -1, 3, 2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0183 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0184
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0184
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=100, iw=3, ih=1) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0184 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 100, 3, 1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0184 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0185
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0185
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=0, iw=3, ih=-1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0185 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 0, 3, -1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=3,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=3,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=3,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=3,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=3,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=3,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0185 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0186
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0186
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=100, iw=0, ih=-1) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0186 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 100, 0, -1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0186 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0187
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0187
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=1, iw=1, ih=3) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0187 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 1, 1, 3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0187 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0188
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0188
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=0, iw=0, ih=0) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0188 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 0, 0, 0);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0188 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0189
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0189
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=3, iw=-1, ih=100) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0189 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 3, -1, 100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=3, iw=-1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=3, iw=-1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=3, iw=-1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=3, iw=-1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=3, iw=-1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=3, iw=-1...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0189 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0190
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0190
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=10, iw=3, ih=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0190 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 10, 3, 2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0190 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0191
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0191
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=1, ih=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0191 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 1, 4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=1,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=1,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=1,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=1,...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0191 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0192
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0192
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=4, ih=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0192 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 4, 10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0192 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0193
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0193
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=100, ih=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0193 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 100, 4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0193 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0194
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0194
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=10, iw=10, ih=2) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0194 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 10, 10, 2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0194 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0195
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0195
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=10, iw=2, ih=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0195 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 10, 2, 10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0195 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0196
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0196
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=0, iw=10, ih=1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0196 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 0, 10, 1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0196 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0197
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0197
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=3, iw=0, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0197 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 3, 0, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0197 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0198
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0198
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=10, iw=-1, ih=4) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0198 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 10, -1, 4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0198 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0199
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0199
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=3, iw=2, ih=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0199 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 3, 2, 100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0199 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0200
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0200
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=100, iw=-1, ih=4) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0200 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 100, -1, 4);
      logInfo(`setMaterialAndImageSize(cw=3, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=3, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=3, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0200 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0201
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0201
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=-1, iw=0, ih=3) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0201 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, -1, 0, 3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0201 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0202
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0202
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=2, iw=3, ih=2) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0202 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 2, 3, 2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0202 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0203
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0203
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=10, iw=4, ih=0) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0203 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 10, 4, 0);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0203 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0204
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0204
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=4, iw=3, ih=0) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0204 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 4, 3, 0);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0204 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0205
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0205
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=-1, iw=0, ih=4) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0205 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, -1, 0, 4);
      logInfo(`setMaterialAndImageSize(cw=1, ch=-1, iw=0...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=-1, iw=0...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=-1, iw=0...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=1, ch=-1, iw=0...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=-1, iw=0...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=1, ch=-1, iw=0...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0205 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0206
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0206
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=2, iw=0, ih=0) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0206 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 2, 0, 0);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=0,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=0,...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0206 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0207
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0207
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=0, iw=-1, ih=4) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0207 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 0, -1, 4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=0, iw=-1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=0, iw=-1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=0, iw=-1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0207 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0208
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0208
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=0, iw=3, ih=100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0208 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 0, 3, 100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=3,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=3,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=3,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=3,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=3,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=3,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0208 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0209
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0209
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=100, iw=3, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0209 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 100, 3, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0209 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0210
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0210
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=3, iw=10, ih=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0210 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 3, 10, 3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0210 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0211
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0211
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=0, iw=1, ih=2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0211 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 0, 1, 2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=1...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0211 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0212
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0212
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=10, iw=2, ih=100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0212 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 10, 2, 100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0212 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0213
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0213
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=10, iw=-1, ih=1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0213 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 10, -1, 1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0213 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0214
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0214
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=10, iw=0, ih=4) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0214 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 10, 0, 4);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0214 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0215
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0215
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=100, iw=3, ih=2) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0215 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 100, 3, 2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0215 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0216
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0216
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=2, iw=2, ih=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0216 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 2, 2, 10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0216 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0217
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0217
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=10, iw=3, ih=0) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0217 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 10, 3, 0);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0217 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0218
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0218
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=4, iw=10, ih=3) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0218 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 4, 10, 3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0218 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0219
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0219
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=100, iw=4, ih=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0219 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 100, 4, 2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0219 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0220
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0220
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=-1, iw=100, ih=-1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0220 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, -1, 100, -1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0220 end`);
      });
  });
}
