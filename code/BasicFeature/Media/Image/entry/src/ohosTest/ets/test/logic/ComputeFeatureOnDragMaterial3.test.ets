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

/** Logic checks for ComputeFeature.onDragMaterial (65 cases). */
export default function computeFeatureOnDragMaterial3Test(): void {
  describe('ComputeFeatureOnDragMaterial3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0164
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0164
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=30) yields 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0164 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 30);
      logInfo(`onDragMaterial(dx=0, dy=30) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0164 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0165
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0165
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=35) yields 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0165 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 35);
      logInfo(`onDragMaterial(dx=0, dy=35) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0165 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0166
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0166
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=40) yields 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0166 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 40);
      logInfo(`onDragMaterial(dx=0, dy=40) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0166 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0167
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0167
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=45) yields 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0167 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 45);
      logInfo(`onDragMaterial(dx=0, dy=45) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0167 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0168
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0168
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=55) yields 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0168 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 55);
      logInfo(`onDragMaterial(dx=0, dy=55) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0168 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0169
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0169
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=60) yields 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0169 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 60);
      logInfo(`onDragMaterial(dx=0, dy=60) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0169 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0170
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0170
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=65) yields 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0170 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 65);
      logInfo(`onDragMaterial(dx=0, dy=65) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0170 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0171
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0171
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=70) yields 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0171 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 70);
      logInfo(`onDragMaterial(dx=0, dy=70) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0171 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0172
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0172
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=75) yields 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0172 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 75);
      logInfo(`onDragMaterial(dx=0, dy=75) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0172 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0173
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0173
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=80) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0173 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 80);
      logInfo(`onDragMaterial(dx=0, dy=80) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0173 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0174
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0174
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=85) yields 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0174 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 85);
      logInfo(`onDragMaterial(dx=0, dy=85) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0174 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0175
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0175
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=90) yields 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0175 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 90);
      logInfo(`onDragMaterial(dx=0, dy=90) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0175 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0176
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0176
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=95) yields 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0176 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 95);
      logInfo(`onDragMaterial(dx=0, dy=95) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0176 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0177
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0177
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=182) yields 182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0177 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 182);
      logInfo(`onDragMaterial(dx=0, dy=182) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(182);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0177 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0178
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0178
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=-10) yields -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0178 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, -10);
      logInfo(`onDragMaterial(dx=0, dy=-10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0178 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0179
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0179
     * @tc.desc      ComputeFeature.onDragMaterial(dx=0, dy=6) yields 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0179 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 6);
      logInfo(`onDragMaterial(dx=0, dy=6) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0179 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0180
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0180
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=-100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0180 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, -100);
      logInfo(`onDragMaterial(dx=4, dy=-100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=-100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0180 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0181
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0181
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=-1) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0181 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, -1);
      logInfo(`onDragMaterial(dx=4, dy=-1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=-1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0181 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0182
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0182
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=2) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0182 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 2);
      logInfo(`onDragMaterial(dx=4, dy=2) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=2) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0182 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0183
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0183
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=1) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0183 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 1);
      logInfo(`onDragMaterial(dx=4, dy=1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0183 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0184
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0184
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=3) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0184 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 3);
      logInfo(`onDragMaterial(dx=4, dy=3) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=3) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0184 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0185
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0185
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=0) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0185 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 0);
      logInfo(`onDragMaterial(dx=4, dy=0) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0185 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0186
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0186
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=4) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0186 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 4);
      logInfo(`onDragMaterial(dx=4, dy=4) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=4) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0186 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0187
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0187
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=50) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0187 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 50);
      logInfo(`onDragMaterial(dx=4, dy=50) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=50) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0187 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0188
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0188
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0188 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 100);
      logInfo(`onDragMaterial(dx=4, dy=100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0188 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0189
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0189
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=10) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0189 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 10);
      logInfo(`onDragMaterial(dx=4, dy=10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0189 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0190
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0190
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=5) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0190 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 5);
      logInfo(`onDragMaterial(dx=4, dy=5) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=5) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0190 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0191
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0191
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=15) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0191 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 15);
      logInfo(`onDragMaterial(dx=4, dy=15) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=15) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0191 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0192
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0192
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=20) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0192 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 20);
      logInfo(`onDragMaterial(dx=4, dy=20) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=20) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0192 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0193
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0193
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=25) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0193 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 25);
      logInfo(`onDragMaterial(dx=4, dy=25) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=25) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0193 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0194
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0194
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=30) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0194 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 30);
      logInfo(`onDragMaterial(dx=4, dy=30) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=30) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0194 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0195
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0195
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=35) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0195 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 35);
      logInfo(`onDragMaterial(dx=4, dy=35) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=35) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0195 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0196
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0196
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=40) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0196 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 40);
      logInfo(`onDragMaterial(dx=4, dy=40) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=40) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0196 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0197
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0197
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=45) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0197 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 45);
      logInfo(`onDragMaterial(dx=4, dy=45) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=45) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0197 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0198
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0198
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=55) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0198 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 55);
      logInfo(`onDragMaterial(dx=4, dy=55) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=55) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0198 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0199
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0199
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=60) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0199 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 60);
      logInfo(`onDragMaterial(dx=4, dy=60) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=60) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(60);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0199 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0200
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0200
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=65) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0200 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 65);
      logInfo(`onDragMaterial(dx=4, dy=65) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=65) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(65);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0200 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0201
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0201
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=70) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0201 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 70);
      logInfo(`onDragMaterial(dx=4, dy=70) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=70) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0201 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0202
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0202
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=75) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0202 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 75);
      logInfo(`onDragMaterial(dx=4, dy=75) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=75) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0202 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0203
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0203
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=80) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0203 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 80);
      logInfo(`onDragMaterial(dx=4, dy=80) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=80) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0203 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0204
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0204
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=85) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0204 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 85);
      logInfo(`onDragMaterial(dx=4, dy=85) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=85) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0204 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0205
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0205
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=90) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0205 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 90);
      logInfo(`onDragMaterial(dx=4, dy=90) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=90) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0205 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0206
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0206
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=95) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0206 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 95);
      logInfo(`onDragMaterial(dx=4, dy=95) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=95) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0206 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0207
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0207
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=182) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0207 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 182);
      logInfo(`onDragMaterial(dx=4, dy=182) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=182) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(182);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0207 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0208
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0208
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=-10) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0208 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, -10);
      logInfo(`onDragMaterial(dx=4, dy=-10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=-10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0208 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0209
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0209
     * @tc.desc      ComputeFeature.onDragMaterial(dx=4, dy=6) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0209 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(4, 6);
      logInfo(`onDragMaterial(dx=4, dy=6) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(4);
      logInfo(`onDragMaterial(dx=4, dy=6) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0209 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0210
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0210
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=-100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0210 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, -100);
      logInfo(`onDragMaterial(dx=50, dy=-100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=-100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0210 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0211
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0211
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=-1) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureOnDragMaterial_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0211 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, -1);
      logInfo(`onDragMaterial(dx=50, dy=-1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=-1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0211 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0212
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0212
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=2) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0212 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 2);
      logInfo(`onDragMaterial(dx=50, dy=2) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=2) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0212 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0213
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0213
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=1) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0213 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 1);
      logInfo(`onDragMaterial(dx=50, dy=1) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=1) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0213 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0214
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0214
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=3) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0214 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 3);
      logInfo(`onDragMaterial(dx=50, dy=3) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=3) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0214 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0215
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0215
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=0) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0215 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 0);
      logInfo(`onDragMaterial(dx=50, dy=0) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0215 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0216
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0216
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=4) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureOnDragMaterial_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0216 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 4);
      logInfo(`onDragMaterial(dx=50, dy=4) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=4) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(4);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0216 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0217
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0217
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=50) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0217 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 50);
      logInfo(`onDragMaterial(dx=50, dy=50) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=50) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0217 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0218
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0218
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=100) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0218 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 100);
      logInfo(`onDragMaterial(dx=50, dy=100) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=100) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0218 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0219
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0219
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=10) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0219 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 10);
      logInfo(`onDragMaterial(dx=50, dy=10) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=10) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0219 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0220
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0220
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=5) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0220 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 5);
      logInfo(`onDragMaterial(dx=50, dy=5) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=5) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0220 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0221
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0221
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=15) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0221 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 15);
      logInfo(`onDragMaterial(dx=50, dy=15) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=15) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0221 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0222
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0222
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=20) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0222 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 20);
      logInfo(`onDragMaterial(dx=50, dy=20) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=20) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0222 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0223
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0223
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=25) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0223 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 25);
      logInfo(`onDragMaterial(dx=50, dy=25) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=25) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0223 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0224
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0224
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=30) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0224 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 30);
      logInfo(`onDragMaterial(dx=50, dy=30) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=30) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0224 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0225
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0225
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=35) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0225 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 35);
      logInfo(`onDragMaterial(dx=50, dy=35) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=35) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0225 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0226
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0226
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=40) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0226 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 40);
      logInfo(`onDragMaterial(dx=50, dy=40) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=40) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0226 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0227
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0227
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=45) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0227 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 45);
      logInfo(`onDragMaterial(dx=50, dy=45) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=45) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0227 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_ON_DRAG_MATERIAL_0228
     * @tc.name      Image_ComputeFeatureOnDragMaterial_0228
     * @tc.desc      ComputeFeature.onDragMaterial(dx=50, dy=55) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureOnDragMaterial_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0228 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 55);
      logInfo(`onDragMaterial(dx=50, dy=55) state: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial(dx=50, dy=55) state: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureOnDragMaterial_0228 end`);
    });
  });
}
