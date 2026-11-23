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
export default function computeFeatureSetMaterialAndImageSize3Test(): void {
  describe('ComputeFeatureSetMaterialAndImageSize3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0111
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0111
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=3, iw=0, ih=1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0111 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 3, 0, 1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(1.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=3, ch=3, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0111 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0112
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0112
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=10, iw=10, ih=2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0112 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 10, 10, 2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0112 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0113
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0113
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=1, iw=100, ih=4) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0113 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 1, 100, 4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0113 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0114
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0114
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=-1, iw=4, ih=3) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0114 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, -1, 4, 3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0114 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0115
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0115
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=100, iw=100, ih=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0115 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 100, 100, -1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0115 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0116
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0116
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=10, iw=1, ih=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0116 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 10, 1, -1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0116 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0117
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0117
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=2, iw=0, ih=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0117 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 2, 0, -1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=0...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=0...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=0...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=0...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=0...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=0...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0117 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0118
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0118
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=10, iw=3, ih=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0118 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 10, 3, 10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0118 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0119
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0119
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=0, iw=0, ih=4) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0119 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 0, 0, 4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=0,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0119 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0120
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0120
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=0, iw=4, ih=0) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0120 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 0, 4, 0);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0120 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0121
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0121
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=-1, ih=3) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0121 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, -1, 3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=-1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=-1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=-1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=-1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=-1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=-1...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0121 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0122
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0122
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=0, iw=-1, ih=3) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0122 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 0, -1, 3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0122 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0123
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0123
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=3, iw=3, ih=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0123 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 3, 3, 10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0123 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0124
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0124
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=10, iw=-1, ih=1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0124 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 10, -1, 1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0124 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0125
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0125
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=4, iw=1, ih=-1) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0125 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 4, 1, -1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0125 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0126
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0126
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=2, iw=-1, ih=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0126 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 2, -1, 2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=-1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=-1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=-1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=-1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=-1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=-1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0126 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0127
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0127
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=10, iw=100, ih=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0127 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 10, 100, -1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0127 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0128
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0128
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=3, iw=0, ih=-1) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0128 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 3, 0, -1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0128 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0129
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0129
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=100, iw=10, ih=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0129 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 100, 10, -1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0129 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0130
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0130
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=-1, iw=10, ih=2) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0130 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, -1, 10, 2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0130 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0131
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0131
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=4, iw=100, ih=-1) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0131 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 4, 100, -1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0131 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0132
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0132
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=10, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0132 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 10, 2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0132 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0133
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0133
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=10, iw=2, ih=10) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0133 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 10, 2, 10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0133 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0134
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0134
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=100, ih=100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0134 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 100, 100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0134 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0135
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0135
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=3, iw=1, ih=100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0135 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 3, 1, 100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=1,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=1,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=1,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=1,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0135 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0136
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0136
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=0, iw=4, ih=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0136 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 0, 4, 10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=4...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=4...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=4...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=4...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=4...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(5);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=4...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0136 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0137
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0137
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=100, iw=-1, ih=4) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0137 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 100, -1, 4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0137 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0138
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0138
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=4, ih=100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0138 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 4, 100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0138 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0139
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0139
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=1, iw=100, ih=3) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0139 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 1, 100, 3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0139 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0140
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0140
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=10, iw=2, ih=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0140 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 10, 2, 10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0140 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0141
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0141
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=-1, iw=2, ih=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0141 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, -1, 2, 3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0141 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0142
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0142
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=4, iw=3, ih=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0142 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 4, 3, 10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0142 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0143
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0143
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=1, iw=1, ih=4) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0143 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 1, 1, 4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0143 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0144
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0144
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=100, iw=100, ih=2) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0144 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 100, 100, 2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=100, i...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0144 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0145
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0145
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=100, iw=4, ih=-1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0145 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 100, 4, -1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0145 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0146
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0146
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=100, iw=4, ih=3) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0146 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 100, 4, 3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0146 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0147
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0147
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=1, iw=0, ih=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0147 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 1, 0, 3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(1.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0147 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0148
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0148
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=100, iw=4, ih=0) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0148 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 100, 4, 0);
      logInfo(`setMaterialAndImageSize(cw=0, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=100, iw=...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=0, ch=100, iw=...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0148 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0149
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0149
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=1, iw=10, ih=100) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0149 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 1, 10, 100);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=1, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0149 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0150
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0150
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=3, iw=4, ih=10) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0150 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 3, 4, 10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=4,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=4,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=4,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=4,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0150 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0151
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0151
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=0, iw=2, ih=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0151 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 0, 2, 10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0151 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0152
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0152
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=0, ih=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0152 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 0, 4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0152 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0153
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0153
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=10, iw=10, ih=4) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0153 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 10, 10, 4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0153 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0154
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0154
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=100, iw=3, ih=1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0154 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 100, 3, 1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0154 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0155
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0155
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=4, iw=-1, ih=3) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0155 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 4, -1, 3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0155 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0156
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0156
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=10, iw=3, ih=0) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0156 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 10, 3, 0);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=3...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=3...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0156 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0157
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0157
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=2, iw=4, ih=4) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0157 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 2, 4, 4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=4...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=4...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=4...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=4...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=4...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=4...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0157 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0158
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0158
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=1, iw=4, ih=1) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0158 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 1, 4, 1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=4...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=4...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=4...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=4...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=4...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=4...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0158 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0159
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0159
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=10, iw=4, ih=10) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0159 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 10, 4, 10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=100, ch=10, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0159 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0160
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0160
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=10, iw=1, ih=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0160 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 10, 1, 2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0160 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0161
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0161
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=10, iw=1, ih=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0161 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 10, 1, 10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0161 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0162
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0162
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=-1, iw=2, ih=-1) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0162 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, -1, 2, -1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=-1, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0162 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0163
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0163
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=10, iw=0, ih=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0163 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 10, 0, -1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=10, iw=...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0163 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0164
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0164
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=3, iw=1, ih=4) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0164 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 3, 1, 4);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=3, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0164 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0165
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0165
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=2, iw=1, ih=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0165 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 2, 1, 100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0165 end`);
      });
  });
}
