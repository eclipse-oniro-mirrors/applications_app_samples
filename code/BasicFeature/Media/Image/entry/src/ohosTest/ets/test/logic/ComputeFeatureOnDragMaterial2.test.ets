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

/** Logic checks for ComputeFeature.onDragMaterial (82 cases). */
export default function computeFeatureOnDragMaterial2Test(): void {
  describe('ComputeFeatureOnDragMaterial2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0082
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0082
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=70) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0082 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 70);
      logInfo(`onDragMaterial(dx=2, dy=70) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=70) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0083
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0083
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=75) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0083 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 75);
      logInfo(`onDragMaterial(dx=2, dy=75) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=75) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0084
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0084
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=80) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0084 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 80);
      logInfo(`onDragMaterial(dx=2, dy=80) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=80) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0085
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0085
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=85) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0085 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 85);
      logInfo(`onDragMaterial(dx=2, dy=85) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=85) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0086
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0086
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=90) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0086 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 90);
      logInfo(`onDragMaterial(dx=2, dy=90) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=90) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0087
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0087
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=95) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0087 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 95);
      logInfo(`onDragMaterial(dx=2, dy=95) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=95) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0088
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0088
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=182) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0088 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 182);
      logInfo(`onDragMaterial(dx=2, dy=182) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=182) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(182);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0089
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0089
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=-10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0089 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, -10);
      logInfo(`onDragMaterial(dx=2, dy=-10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=-10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0090
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0090
     * @tc.desc      ComputeFeature.onDragMaterial(dx=2, dy=6) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0090 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(2, 6);
      logInfo(`onDragMaterial(dx=2, dy=6) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`onDragMaterial(dx=2, dy=6) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0091
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0091
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=-100) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0091 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, -100);
      logInfo(`onDragMaterial(dx=1, dy=-100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=-100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0092
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0092
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=-1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0092 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, -1);
      logInfo(`onDragMaterial(dx=1, dy=-1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=-1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0093
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0093
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0093 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 2);
      logInfo(`onDragMaterial(dx=1, dy=2) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=2) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0094
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0094
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0094 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 1);
      logInfo(`onDragMaterial(dx=1, dy=1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0095
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0095
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=3) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0095 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 3);
      logInfo(`onDragMaterial(dx=1, dy=3) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=3) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0096
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0096
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=0) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0096 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 0);
      logInfo(`onDragMaterial(dx=1, dy=0) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0097
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0097
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=4) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0097 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 4);
      logInfo(`onDragMaterial(dx=1, dy=4) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=4) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0098
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0098
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=50) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0098 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 50);
      logInfo(`onDragMaterial(dx=1, dy=50) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=50) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0099
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0099
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=100) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0099 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 100);
      logInfo(`onDragMaterial(dx=1, dy=100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0100
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0100
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=10) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0100 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 10);
      logInfo(`onDragMaterial(dx=1, dy=10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0101
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0101
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=5) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0101 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 5);
      logInfo(`onDragMaterial(dx=1, dy=5) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=5) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0102
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0102
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=15) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0102 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 15);
      logInfo(`onDragMaterial(dx=1, dy=15) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=15) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0103
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0103
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=20) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0103 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 20);
      logInfo(`onDragMaterial(dx=1, dy=20) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=20) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0104
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0104
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=25) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0104 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 25);
      logInfo(`onDragMaterial(dx=1, dy=25) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=25) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0105
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0105
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=30) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0105 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 30);
      logInfo(`onDragMaterial(dx=1, dy=30) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=30) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0106
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0106
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=35) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0106 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 35);
      logInfo(`onDragMaterial(dx=1, dy=35) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=35) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0107
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0107
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=40) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0107 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 40);
      logInfo(`onDragMaterial(dx=1, dy=40) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=40) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0108
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0108
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=45) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0108 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 45);
      logInfo(`onDragMaterial(dx=1, dy=45) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=45) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0109
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0109
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=55) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0109 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 55);
      logInfo(`onDragMaterial(dx=1, dy=55) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=55) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0110
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0110
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=60) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0110 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 60);
      logInfo(`onDragMaterial(dx=1, dy=60) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=60) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0111
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0111
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=65) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0111 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 65);
      logInfo(`onDragMaterial(dx=1, dy=65) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=65) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0112
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0112
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=70) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0112 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 70);
      logInfo(`onDragMaterial(dx=1, dy=70) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=70) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0113
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0113
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=75) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0113 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 75);
      logInfo(`onDragMaterial(dx=1, dy=75) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=75) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0114
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0114
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=80) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0114 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 80);
      logInfo(`onDragMaterial(dx=1, dy=80) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=80) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0115
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0115
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=85) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0115 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 85);
      logInfo(`onDragMaterial(dx=1, dy=85) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=85) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0116
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0116
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=90) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0116 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 90);
      logInfo(`onDragMaterial(dx=1, dy=90) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=90) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0117
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0117
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=95) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0117 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 95);
      logInfo(`onDragMaterial(dx=1, dy=95) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=95) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0118
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0118
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=182) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0118 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 182);
      logInfo(`onDragMaterial(dx=1, dy=182) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=182) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(182);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0119
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0119
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=-10) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0119 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, -10);
      logInfo(`onDragMaterial(dx=1, dy=-10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=-10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0120
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0120
     * @tc.desc      ComputeFeature.onDragMaterial(dx=1, dy=6) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0120 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 6);
      logInfo(`onDragMaterial(dx=1, dy=6) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial(dx=1, dy=6) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0121
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0121
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=-100) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0121 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, -100);
      logInfo(`onDragMaterial(dx=3, dy=-100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=-100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0122
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0122
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=-1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0122 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, -1);
      logInfo(`onDragMaterial(dx=3, dy=-1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=-1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0123
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0123
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0123 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 2);
      logInfo(`onDragMaterial(dx=3, dy=2) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=2) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0124
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0124
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0124 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 1);
      logInfo(`onDragMaterial(dx=3, dy=1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0125
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0125
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0125 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 3);
      logInfo(`onDragMaterial(dx=3, dy=3) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=3) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0126
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0126
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=0) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0126 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 0);
      logInfo(`onDragMaterial(dx=3, dy=0) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0126 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0127
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0127
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=4) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0127 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 4);
      logInfo(`onDragMaterial(dx=3, dy=4) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=4) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0127 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0128
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0128
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=50) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0128 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 50);
      logInfo(`onDragMaterial(dx=3, dy=50) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=50) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0128 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0129
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0129
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=100) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0129 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 100);
      logInfo(`onDragMaterial(dx=3, dy=100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0129 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0130
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0130
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=10) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0130 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 10);
      logInfo(`onDragMaterial(dx=3, dy=10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0130 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0131
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0131
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=5) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0131 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 5);
      logInfo(`onDragMaterial(dx=3, dy=5) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=5) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0131 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0132
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0132
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=15) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0132 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 15);
      logInfo(`onDragMaterial(dx=3, dy=15) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=15) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0132 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0133
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0133
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=20) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0133 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 20);
      logInfo(`onDragMaterial(dx=3, dy=20) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=20) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0133 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0134
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0134
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=25) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0134 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 25);
      logInfo(`onDragMaterial(dx=3, dy=25) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=25) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0134 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0135
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0135
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=30) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0135 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 30);
      logInfo(`onDragMaterial(dx=3, dy=30) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=30) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0135 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0136
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0136
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=35) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0136 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 35);
      logInfo(`onDragMaterial(dx=3, dy=35) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=35) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0136 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0137
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0137
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=40) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0137 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 40);
      logInfo(`onDragMaterial(dx=3, dy=40) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=40) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0137 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0138
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0138
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=45) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0138 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 45);
      logInfo(`onDragMaterial(dx=3, dy=45) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=45) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0138 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0139
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0139
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=55) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0139 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 55);
      logInfo(`onDragMaterial(dx=3, dy=55) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=55) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0139 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0140
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0140
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=60) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0140 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 60);
      logInfo(`onDragMaterial(dx=3, dy=60) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=60) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0140 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0141
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0141
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=65) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0141 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 65);
      logInfo(`onDragMaterial(dx=3, dy=65) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=65) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0141 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0142
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0142
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=70) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0142 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 70);
      logInfo(`onDragMaterial(dx=3, dy=70) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=70) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0142 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0143
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0143
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=75) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0143 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 75);
      logInfo(`onDragMaterial(dx=3, dy=75) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=75) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0143 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0144
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0144
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=80) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0144 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 80);
      logInfo(`onDragMaterial(dx=3, dy=80) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=80) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0144 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0145
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0145
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=85) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0145 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 85);
      logInfo(`onDragMaterial(dx=3, dy=85) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=85) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0145 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0146
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0146
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=90) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0146 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 90);
      logInfo(`onDragMaterial(dx=3, dy=90) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=90) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0146 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0147
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0147
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=95) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0147 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 95);
      logInfo(`onDragMaterial(dx=3, dy=95) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=95) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0147 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0148
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0148
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=182) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0148 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 182);
      logInfo(`onDragMaterial(dx=3, dy=182) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=182) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(182);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0148 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0149
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0149
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=-10) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0149 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, -10);
      logInfo(`onDragMaterial(dx=3, dy=-10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=-10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0149 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0150
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0150
     * @tc.desc      ComputeFeature.onDragMaterial(dx=3, dy=6) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0150 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(3, 6);
      logInfo(`onDragMaterial(dx=3, dy=6) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`onDragMaterial(dx=3, dy=6) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0150 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0151
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0151
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=-100) yields -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0151 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, -100);
      logInfo(`onDragMaterial(dx=0, dy=-100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0151 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0152
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0152
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0152 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, -1);
      logInfo(`onDragMaterial(dx=0, dy=-1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0152 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0153
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0153
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0153 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 2);
      logInfo(`onDragMaterial(dx=0, dy=2) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0153 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0154
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0154
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0154 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 1);
      logInfo(`onDragMaterial(dx=0, dy=1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0154 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0155
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0155
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0155 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 3);
      logInfo(`onDragMaterial(dx=0, dy=3) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0155 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0156
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0156
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=4) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0156 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 4);
      logInfo(`onDragMaterial(dx=0, dy=4) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0156 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0157
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0157
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=50) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0157 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 50);
      logInfo(`onDragMaterial(dx=0, dy=50) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0157 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0158
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0158
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0158 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 100);
      logInfo(`onDragMaterial(dx=0, dy=100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0158 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0159
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0159
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0159 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 10);
      logInfo(`onDragMaterial(dx=0, dy=10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0159 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0160
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0160
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=5) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0160 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 5);
      logInfo(`onDragMaterial(dx=0, dy=5) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0160 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0161
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0161
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=15) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0161 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 15);
      logInfo(`onDragMaterial(dx=0, dy=15) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0161 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0162
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0162
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=20) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0162 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 20);
      logInfo(`onDragMaterial(dx=0, dy=20) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0162 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0163
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0163
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=25) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0163 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 25);
      logInfo(`onDragMaterial(dx=0, dy=25) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0163 end`);
    });
  });
}
