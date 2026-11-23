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
export default function computeFeatureSetMaterialAndImageSize2Test(): void {
  describe('ComputeFeatureSetMaterialAndImageSize2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0056
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0056
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=1, iw=100, ih=2) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0056 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 1, 100, 2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0056 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0057
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0057
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=2, ih=3) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0057 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 2, 3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=2,...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0057 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0058
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0058
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=2, iw=3, ih=4) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0058 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 2, 3, 4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=2, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0058 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0059
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0059
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=-1, iw=2, ih=1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0059 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, -1, 2, 1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0059 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0060
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0060
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=1, iw=0, ih=2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0060 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 1, 0, 2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=0...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=0...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=0...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=0...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=0...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=1, iw=0...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0060 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0061
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0061
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=3, iw=2, ih=3) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0061 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 3, 2, 3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=3, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=3, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=3, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=3, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=10, ch=3, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=3, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0061 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0062
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0062
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=0, iw=1, ih=3) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0062 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 0, 1, 3);
      logInfo(`setMaterialAndImageSize(cw=0, ch=0, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=0, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0062 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0063
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0063
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=100, iw=1, ih=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0063 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 100, 1, 10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=100, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0063 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0064
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0064
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=4, iw=3, ih=3) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0064 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 4, 3, 3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=3,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=3,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=3,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=3,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=3,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=3,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0064 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0065
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0065
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=0, iw=100, ih=2) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0065 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 0, 100, 2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=0, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=0, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0065 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0066
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0066
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=10, iw=10, ih=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0066 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 10, 10, 10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0066 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0067
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0067
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=0, iw=4, ih=100) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0067 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 0, 4, 100);
      logInfo(`setMaterialAndImageSize(cw=3, ch=0, iw=4,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=0, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=3, ch=0, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=3, ch=0, iw=4,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=0, iw=4,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(1.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=3, ch=0, iw=4,...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0067 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0068
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0068
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=2, iw=100, ih=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0068 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 2, 100, 10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=2, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0068 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0069
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0069
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=0, iw=4, ih=100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0069 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 0, 4, 100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=4, ch=0, iw=4,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0069 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0070
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0070
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=3, iw=3, ih=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0070 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 3, 3, 100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=3, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0070 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0071
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0071
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=-1, iw=2, ih=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0071 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, -1, 2, 100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0071 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0072
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0072
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=2, iw=-1, ih=-1) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0072 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 2, -1, -1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=2, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0072 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0073
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0073
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=100, iw=0, ih=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0073 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 100, 0, 100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=100, iw...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0073 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0074
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0074
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=0, ih=1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0074 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 0, 1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0074 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0075
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0075
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=1, iw=-1, ih=100) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0075 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 1, -1, 100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=-1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=-1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=-1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=-1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=-1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=1, iw=-1...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0075 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0076
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0076
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=4, iw=3, ih=3) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0076 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 4, 3, 3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=4, iw=3,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0076 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0077
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0077
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=0, iw=3, ih=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0077 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 0, 3, 10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=3,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=3,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=3,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=3,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=3,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=3,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0077 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0078
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0078
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=-1, iw=2, ih=2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0078 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, -1, 2, 2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=2...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0078 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0079
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0079
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=10, iw=4, ih=0) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0079 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 10, 4, 0);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=4...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=4...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=4...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=4...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=4...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(1.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=4...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0079 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0080
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0080
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=-1, iw=1, ih=2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0080 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, -1, 1, 2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0080 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0081
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0081
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=4, iw=0, ih=0) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0081 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 4, 0, 0);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=4, iw=...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0081 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0082
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0082
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=0, iw=100, ih=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0082 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 0, 100, 2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=1...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(5);
      logInfo(`setMaterialAndImageSize(cw=10, ch=0, iw=1...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0082 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0083
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0083
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=2, iw=0, ih=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0083 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 0, 10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=2, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0083 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0084
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0084
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=100, iw=4, ih=100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0084 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 100, 4, 100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=100, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0084 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0085
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0085
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=-1, iw=-1, ih=10) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0085 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, -1, -1, 10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=-1, iw...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0085 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0086
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0086
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=4, iw=-1, ih=2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0086 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 4, -1, 2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=-...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=-...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=-...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=-...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=-...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=4, iw=-...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0086 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0087
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0087
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=2, iw=2, ih=3) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0087 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 2, 2, 3);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0087 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0088
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0088
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=2, iw=0, ih=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0088 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 2, 0, 3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=0,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=0,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(1.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=0,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0088 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0089
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0089
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=0, iw=1, ih=2) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0089 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 0, 1, 2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0089 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0090
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0090
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=10, iw=3, ih=10) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0090 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 10, 3, 10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=10, iw=3...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0090 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0091
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0091
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=10, iw=-1, ih=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0091 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 10, -1, -1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=-...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0091 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0092
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0092
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=2, iw=2, ih=1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0092 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 2, 2, 1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=2, iw=2,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0092 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0093
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0093
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=-1, iw=10, ih=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0093 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, -1, 10, -1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0093 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0094
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0094
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=3, iw=100, ih=10) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0094 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 3, 100, 10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=10...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=10...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=10...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=10...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=10...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=3, iw=10...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0094 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0095
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0095
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=100, ch=0, iw=100, ih=10) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0095 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 0, 100, 10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`setMaterialAndImageSize(cw=100, ch=0, iw=...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0095 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0096
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0096
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=4, iw=1, ih=0) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0096 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 4, 1, 0);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=1,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=1,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=1,...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0096 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0097
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0097
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=-1, ch=-1, iw=3, ih=3) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0097 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, -1, 3, 3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=-1, ch=-1, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0097 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0098
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0098
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=4, iw=1, ih=-1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0098 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 4, 1, -1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=4, iw=1,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=4, iw=1,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=3, ch=4, iw=1,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=4, iw=1,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=4, iw=1,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=4, iw=1,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0098 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0099
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0099
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=4, iw=4, ih=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0099 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 4, 4, 2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=4,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=4,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=4,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=4, iw=4,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0099 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0100
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0100
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=10, ch=10, iw=1, ih=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0100 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, 10, 1, 10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=10, ch=10, iw=...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0100 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0101
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0101
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=-1, iw=10, ih=1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0101 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, -1, 10, 1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=-1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0101 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0102
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0102
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=4, iw=4, ih=-1) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0102 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 4, 4, -1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=4,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=4,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=4,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=4, iw=4,...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0102 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0103
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0103
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=1, ch=0, iw=2, ih=10) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0103 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 0, 2, 10);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=2,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=2,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=2,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=2,...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=2,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=1, ch=0, iw=2,...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0103 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0104
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0104
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=0, iw=0, ih=4) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0104 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 0, 0, 4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=0,...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=0,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=0,...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=0, iw=0,...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0104 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0105
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0105
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=3, ch=10, iw=-1, ih=2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0105 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 10, -1, 2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=-...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=-...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=-...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=-...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=-...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=3, ch=10, iw=-...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0105 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0106
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0106
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=10, iw=4, ih=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0106 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 10, 4, 10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=10, iw=4...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0106 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0107
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0107
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=-1, iw=0, ih=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0107 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, -1, 0, 100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=-1, iw=0...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=-1, iw=0...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=0, ch=-1, iw=0...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=-1, iw=0...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(-0.5, PRECISION);
      logInfo(`setMaterialAndImageSize(cw=0, ch=-1, iw=0...: subject.y=${subject.y}`);
      expect(subject.y).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0107 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0108
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0108
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=4, ch=1, iw=-1, ih=100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0108 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(4, 1, -1, 100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=4, ch=1, iw=-1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0108 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0109
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0109
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=2, ch=-1, iw=1, ih=1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0109 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, -1, 1, 1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=2, ch=-1, iw=1...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0109 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_MATERIAL_AND_IMAGE_SIZE_0110
     * @tc.name      Image_ComputeFeatureSetMaterialAndImageSize_0110
     * @tc.desc      ComputeFeature.setMaterialAndImageSize(cw=0, ch=2, iw=4, ih=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetMaterialAndImageSize_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0110 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 4, -1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(4);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize(cw=0, ch=2, iw=4,...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetMaterialAndImageSize_0110 end`);
      });
  });
}
