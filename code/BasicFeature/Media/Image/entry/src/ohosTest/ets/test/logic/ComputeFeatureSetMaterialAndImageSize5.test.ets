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

/** Logic checks for ComputeFeature.setMaterialAndImageSize (9 cases). */
export default function computeFeatureSetMaterialAndImageSize5Test(): void {
  describe('ComputeFeatureSetMaterialAndImageSize5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0221
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0221
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=2, iw=3, ih=1) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0221 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 2, 3, 1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0221 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0222
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0222
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=1, iw=1, ih=2) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0222 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 1, 1, 2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0222 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0223
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0223
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=0, iw=100, ih=0) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0223 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 0, 100, 0);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0223 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0224
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0224
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=2, iw=3, ih=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0224 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 2, 3, 0);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0224 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0225
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0225
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=1, iw=4, ih=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0225 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 1, 4, 100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=4...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=4...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=4...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=4...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=4...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=4...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0225 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0226
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0226
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=0, iw=4, ih=1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0226 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 0, 4, 1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=4...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=4...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=4...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=4...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=4...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=0, iw=4...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0226 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0227
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0227
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=4, iw=10, ih=1) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0227 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 4, 10, 1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0227 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0228
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0228
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=2, iw=2, ih=4) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0228 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 2, 2, 4);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0228 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0229
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0229
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=2, iw=0, ih=1) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0229 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 2, 0, 1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=0...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=0...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=0...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=0...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=0...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(5);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=0...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0229 end`);
      });
  });
}
