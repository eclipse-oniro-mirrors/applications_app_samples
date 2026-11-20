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

/** Logic checks for new ComputeFeature (1 cases). */
export default function computeFeatureCtorTest(): void {
  describe('ComputeFeatureCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_CTOR_0001
     * @tc.name      Image_ComputeFeatureCtor_0001
     * @tc.desc      new ComputeFeature() initialises 10 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComputeFeatureCtor_0001 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      logInfo(`new ComputeFeature(): subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(0);
      logInfo(`new ComputeFeature(): subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(0);
      logInfo(`new ComputeFeature(): subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(0);
      logInfo(`new ComputeFeature(): subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(0);
      logInfo(`new ComputeFeature(): subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(0);
      logInfo(`new ComputeFeature(): subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(0);
      logInfo(`new ComputeFeature(): subject.minScale=${subject.minScale}`);
      expect(subject.minScale).assertClose(0.5, PRECISION);
      logInfo(`new ComputeFeature(): subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(0);
      logInfo(`new ComputeFeature(): subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(0);
      logInfo(`new ComputeFeature(): subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(0);
      logInfo(`${BUNDLE}ComputeFeatureCtor_0001 end`);
    });
  });
}
