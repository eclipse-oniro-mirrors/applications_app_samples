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
export default function computeFeatureSetMaterialAndImageSizeTest(): void {
  describe('ComputeFeatureSetMaterialAndImageSizeTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0001
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0001
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=2, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0001 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0001 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0002
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0002
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=2, iw=2, ih=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0002 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 2, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0002 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0003
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0003
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=2, iw=2, ih=2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0003 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 2, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0003 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0004
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0004
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=2, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0004 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0004 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0005
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0005
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=2, iw=2, ih=2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0005 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 2, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0005 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0006
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0006
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=2, iw=2, ih=2) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0006 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 2, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0006 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0007
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0007
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=2, iw=2, ih=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0007 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 2, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0007 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0008
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0008
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=2, iw=2, ih=2) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0008 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 2, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0008 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0009
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0009
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=1, iw=2, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0009 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 1, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=1, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=1, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=1, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=1, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=1, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=1, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0009 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0010
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0010
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=3, iw=2, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0010 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 3, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=3, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0010 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0011
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0011
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=0, iw=2, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0011 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 0, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=2,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0011 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0012
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0012
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=-1, iw=2, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0012 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, -1, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0012 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0013
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0013
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=4, iw=2, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0013 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 4, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0013 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0014
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0014
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=10, iw=2, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0014 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 10, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0014 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0015
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0015
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=100, iw=2, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0015 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 100, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0015 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0016
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0016
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=1, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0016 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 1, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=1,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=1,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=1,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=1,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0016 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0017
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0017
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=3, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0017 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 3, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=3,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=3,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=3,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=3,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=3,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=3,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0017 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0018
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0018
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=0, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0018 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 0, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0018 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0019
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0019
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=-1, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0019 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, -1, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=-1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=-1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=-1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=-1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=-1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=-1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0019 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0020
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0020
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=4, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0020 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 4, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=4,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0020 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0021
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0021
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=10, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0021 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 10, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0021 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0022
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0022
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=100, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0022 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 100, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0022 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0023
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0023
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=2, ih=1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0023 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 2, 1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0023 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0024
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0024
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=2, ih=3) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0024 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 2, 3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0024 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0025
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0025
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=2, ih=0) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0025 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 2, 0);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0025 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0026
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0026
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=2, ih=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0026 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 2, -1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0026 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0027
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0027
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=2, ih=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0027 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 2, 4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0027 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0028
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0028
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=2, ih=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0028 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 2, 10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0028 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0029
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0029
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=2, ih=100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0029 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 2, 100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0029 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0030
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0030
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=0, iw=10, ih=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0030 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 0, 10, 1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=10...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0030 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0031
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0031
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=4, iw=2, ih=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0031 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 4, 2, 1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=4, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0031 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0032
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0032
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=1, iw=100, ih=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0032 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 1, 100, 10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0032 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0033
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0033
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=0, iw=4, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0033 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 0, 4, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=4,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=4,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=4,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=4,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0033 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0034
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0034
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=0, iw=3, ih=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0034 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 0, 3, 3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=0, iw=3,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=0, iw=3,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0034 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0035
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0035
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=-1, iw=3, ih=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0035 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, -1, 3, 4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0035 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0036
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0036
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=-1, iw=2, ih=-1) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0036 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, -1, 2, -1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0036 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0037
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0037
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=3, iw=0, ih=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0037 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 3, 0, 2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=3, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=3, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=1, ch=3, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=3, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=3, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=1, ch=3, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0037 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0038
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0038
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=100, iw=4, ih=3) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0038 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 100, 4, 3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0038 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0039
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0039
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=4, iw=-1, ih=-1) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0039 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 4, -1, -1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=-1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=-1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=-1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=-1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=-1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=-1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0039 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0040
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0040
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=100, iw=0, ih=1) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0040 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 100, 0, 1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=100, iw=...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=0, ch=100, iw=...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0040 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0041
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0041
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=1, iw=1, ih=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0041 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 1, 1, 1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=1,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=1,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=1,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=1,...: subject.y=${subject.y}`);
      expect(subject.y).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0041 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0042
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0042
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=1, iw=1, ih=10) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0042 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 1, 1, 10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=1,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0042 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0043
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0043
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=0, iw=2, ih=100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0043 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 0, 2, 100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=2,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=2,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0043 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0044
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0044
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=-1, iw=1, ih=0) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0044 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, -1, 1, 0);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0044 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0045
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0045
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=1, iw=100, ih=4) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0045 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 1, 100, 4);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=1, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0045 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0046
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0046
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=3, iw=0, ih=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0046 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 3, 0, 100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=0...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=0...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=0...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=0...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=0...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=0...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0046 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0047
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0047
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=2, iw=100, ih=0) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0047 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 2, 100, 0);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=10...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=10...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0047 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0048
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0048
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=4, iw=-1, ih=100) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0048 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 4, -1, 100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=4, iw=-...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0048 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0049
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0049
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=10, ih=100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0049 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 10, 100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=10...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0049 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0050
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0050
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=0, iw=1, ih=2) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0050 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 0, 1, 2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=1,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=1,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=1,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=1,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0050 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0051
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0051
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=-1, iw=10, ih=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0051 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, -1, 10, 2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=-1, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0051 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0052
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0052
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=10, iw=100, ih=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0052 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 10, 100, 2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`setMaterialAndImageSize(cw=0, ch=10, iw=1...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0052 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0053
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0053
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=100, iw=10, ih=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0053 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 100, 10, 10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0053 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0054
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0054
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=100, iw=10, ih=3) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0054 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 100, 10, 3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0054 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0055
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0055
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=1, iw=-1, ih=10) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0055 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 1, -1, 10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0055 end`);
      });
  });
}
