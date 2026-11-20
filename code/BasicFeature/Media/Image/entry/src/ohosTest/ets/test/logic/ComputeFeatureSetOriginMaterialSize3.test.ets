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
export default function computeFeatureSetOriginMaterialSize3Test(): void {
  describe('ComputeFeatureSetOriginMaterialSize3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0134
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0134
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=30) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0134 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 30);
      logInfo(`setOriginMaterialSize(w=-1, y=30) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=30) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(30);
      logInfo(`setOriginMaterialSize(w=-1, y=30) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=30) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0134 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0135
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0135
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=35) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0135 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 35);
      logInfo(`setOriginMaterialSize(w=-1, y=35) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=35) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`setOriginMaterialSize(w=-1, y=35) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=35) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0135 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0136
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0136
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=40) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0136 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 40);
      logInfo(`setOriginMaterialSize(w=-1, y=40) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=40) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(40);
      logInfo(`setOriginMaterialSize(w=-1, y=40) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=40) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0136 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0137
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0137
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=45) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0137 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 45);
      logInfo(`setOriginMaterialSize(w=-1, y=45) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=45) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setOriginMaterialSize(w=-1, y=45) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=45) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0137 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0138
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0138
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=55) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0138 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 55);
      logInfo(`setOriginMaterialSize(w=-1, y=55) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=55) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`setOriginMaterialSize(w=-1, y=55) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=55) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0138 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0139
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0139
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=60) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0139 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 60);
      logInfo(`setOriginMaterialSize(w=-1, y=60) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=60) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`setOriginMaterialSize(w=-1, y=60) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=60) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0139 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0140
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0140
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=65) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0140 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 65);
      logInfo(`setOriginMaterialSize(w=-1, y=65) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=65) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(65);
      logInfo(`setOriginMaterialSize(w=-1, y=65) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=65) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(32.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0140 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0141
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0141
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=70) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0141 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 70);
      logInfo(`setOriginMaterialSize(w=-1, y=70) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=70) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(70);
      logInfo(`setOriginMaterialSize(w=-1, y=70) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=70) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0141 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0142
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0142
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=75) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0142 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 75);
      logInfo(`setOriginMaterialSize(w=-1, y=75) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=75) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setOriginMaterialSize(w=-1, y=75) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=75) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0142 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0143
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0143
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=80) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0143 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 80);
      logInfo(`setOriginMaterialSize(w=-1, y=80) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=80) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(80);
      logInfo(`setOriginMaterialSize(w=-1, y=80) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=80) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0143 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0144
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0144
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=85) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0144 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 85);
      logInfo(`setOriginMaterialSize(w=-1, y=85) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=85) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(85);
      logInfo(`setOriginMaterialSize(w=-1, y=85) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=85) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(42.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0144 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0145
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0145
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=90) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0145 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 90);
      logInfo(`setOriginMaterialSize(w=-1, y=90) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=90) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(90);
      logInfo(`setOriginMaterialSize(w=-1, y=90) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=90) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0145 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0146
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0146
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=95) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0146 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 95);
      logInfo(`setOriginMaterialSize(w=-1, y=95) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=95) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(95);
      logInfo(`setOriginMaterialSize(w=-1, y=95) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=95) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(47.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0146 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0147
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0147
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=86.32) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0147 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 86.32);
      logInfo(`setOriginMaterialSize(w=-1, y=86.32) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=86.32) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertClose(86.32, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=86.32) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=86.32) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(43.16, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0147 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0148
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0148
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=69) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0148 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 69);
      logInfo(`setOriginMaterialSize(w=-1, y=69) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=69) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`setOriginMaterialSize(w=-1, y=69) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=69) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0148 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0149
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0149
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=-1, y=83) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0149 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 83);
      logInfo(`setOriginMaterialSize(w=-1, y=83) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=-1, y=83) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`setOriginMaterialSize(w=-1, y=83) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize(w=-1, y=83) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(41.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0149 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0150
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0150
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=-100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0150 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, -100);
      logInfo(`setOriginMaterialSize(w=4, y=-100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=-100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize(w=4, y=-100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=-100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0150 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0151
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0151
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=-1) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0151 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, -1);
      logInfo(`setOriginMaterialSize(w=4, y=-1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=-1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=4, y=-1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=-1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0151 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0152
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0152
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=2) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0152 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 2);
      logInfo(`setOriginMaterialSize(w=4, y=2) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=2) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=2) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=2) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0152 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0153
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0153
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=1) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0153 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 1);
      logInfo(`setOriginMaterialSize(w=4, y=1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=4, y=1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0153 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0154
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0154
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=3) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0154 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 3);
      logInfo(`setOriginMaterialSize(w=4, y=3) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=3) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=4, y=3) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=3) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0154 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0155
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0155
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=0) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0155 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 0);
      logInfo(`setOriginMaterialSize(w=4, y=0) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=0) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0155 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0156
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0156
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=4) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0156 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 4);
      logInfo(`setOriginMaterialSize(w=4, y=4) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=4) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=4) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=4) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0156 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0157
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0157
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=50) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0157 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 50);
      logInfo(`setOriginMaterialSize(w=4, y=50) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=50) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=4, y=50) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=50) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0157 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0158
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0158
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=100) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0158 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 100);
      logInfo(`setOriginMaterialSize(w=4, y=100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=4, y=100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0158 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0159
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0159
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=10) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0159 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 10);
      logInfo(`setOriginMaterialSize(w=4, y=10) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=10) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(10);
      logInfo(`setOriginMaterialSize(w=4, y=10) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=10) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0159 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0160
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0160
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=5) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0160 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 5);
      logInfo(`setOriginMaterialSize(w=4, y=5) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=5) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize(w=4, y=5) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=5) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0160 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0161
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0161
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=15) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0161 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 15);
      logInfo(`setOriginMaterialSize(w=4, y=15) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=15) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(15);
      logInfo(`setOriginMaterialSize(w=4, y=15) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=15) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0161 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0162
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0162
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=20) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0162 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 20);
      logInfo(`setOriginMaterialSize(w=4, y=20) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=20) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(20);
      logInfo(`setOriginMaterialSize(w=4, y=20) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=20) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0162 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0163
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0163
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=25) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0163 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 25);
      logInfo(`setOriginMaterialSize(w=4, y=25) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=25) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`setOriginMaterialSize(w=4, y=25) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=25) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0163 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0164
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0164
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=30) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0164 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 30);
      logInfo(`setOriginMaterialSize(w=4, y=30) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=30) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(30);
      logInfo(`setOriginMaterialSize(w=4, y=30) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=30) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0164 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0165
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0165
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=35) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0165 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 35);
      logInfo(`setOriginMaterialSize(w=4, y=35) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=35) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`setOriginMaterialSize(w=4, y=35) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=35) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0165 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0166
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0166
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=40) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0166 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 40);
      logInfo(`setOriginMaterialSize(w=4, y=40) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=40) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(40);
      logInfo(`setOriginMaterialSize(w=4, y=40) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=40) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0166 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0167
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0167
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=45) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0167 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 45);
      logInfo(`setOriginMaterialSize(w=4, y=45) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=45) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setOriginMaterialSize(w=4, y=45) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=45) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0167 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0168
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0168
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=55) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0168 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 55);
      logInfo(`setOriginMaterialSize(w=4, y=55) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=55) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`setOriginMaterialSize(w=4, y=55) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=55) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0168 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0169
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0169
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=60) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0169 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 60);
      logInfo(`setOriginMaterialSize(w=4, y=60) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=60) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`setOriginMaterialSize(w=4, y=60) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=60) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0169 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0170
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0170
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=65) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0170 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 65);
      logInfo(`setOriginMaterialSize(w=4, y=65) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=65) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(65);
      logInfo(`setOriginMaterialSize(w=4, y=65) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=65) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(32.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0170 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0171
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0171
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=70) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0171 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 70);
      logInfo(`setOriginMaterialSize(w=4, y=70) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=70) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(70);
      logInfo(`setOriginMaterialSize(w=4, y=70) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=70) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0171 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0172
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0172
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=75) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0172 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 75);
      logInfo(`setOriginMaterialSize(w=4, y=75) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=75) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setOriginMaterialSize(w=4, y=75) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=75) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0172 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0173
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0173
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=80) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0173 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 80);
      logInfo(`setOriginMaterialSize(w=4, y=80) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=80) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(80);
      logInfo(`setOriginMaterialSize(w=4, y=80) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=80) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0173 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0174
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0174
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=85) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0174 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 85);
      logInfo(`setOriginMaterialSize(w=4, y=85) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=85) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(85);
      logInfo(`setOriginMaterialSize(w=4, y=85) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=85) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(42.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0174 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0175
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0175
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=90) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0175 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 90);
      logInfo(`setOriginMaterialSize(w=4, y=90) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=90) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(90);
      logInfo(`setOriginMaterialSize(w=4, y=90) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=90) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0175 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0176
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0176
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=95) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0176 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 95);
      logInfo(`setOriginMaterialSize(w=4, y=95) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=95) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(95);
      logInfo(`setOriginMaterialSize(w=4, y=95) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=95) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(47.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0176 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0177
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0177
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=86.32) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0177 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 86.32);
      logInfo(`setOriginMaterialSize(w=4, y=86.32) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=86.32) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertClose(86.32, PRECISION);
      logInfo(`setOriginMaterialSize(w=4, y=86.32) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=86.32) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(43.16, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0177 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0178
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0178
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=69) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0178 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 69);
      logInfo(`setOriginMaterialSize(w=4, y=69) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=69) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`setOriginMaterialSize(w=4, y=69) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=69) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0178 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0179
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0179
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=4, y=83) yields 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0179 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(4, 83);
      logInfo(`setOriginMaterialSize(w=4, y=83) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=4, y=83) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`setOriginMaterialSize(w=4, y=83) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=4, y=83) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(41.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0179 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0180
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0180
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=-100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0180 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, -100);
      logInfo(`setOriginMaterialSize(w=100, y=-100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=-100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize(w=100, y=-100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=-100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0180 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0181
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0181
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=-1) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0181 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, -1);
      logInfo(`setOriginMaterialSize(w=100, y=-1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=-1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize(w=100, y=-1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=-1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0181 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0182
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0182
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=2) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0182 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 2);
      logInfo(`setOriginMaterialSize(w=100, y=2) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=2) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize(w=100, y=2) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=2) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0182 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0183
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0183
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=1) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0183 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 1);
      logInfo(`setOriginMaterialSize(w=100, y=1) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=1) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize(w=100, y=1) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=1) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0183 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0184
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0184
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=3) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0184 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 3);
      logInfo(`setOriginMaterialSize(w=100, y=3) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=3) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(3);
      logInfo(`setOriginMaterialSize(w=100, y=3) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=3) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0184 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0185
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0185
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=0) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0185 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 0);
      logInfo(`setOriginMaterialSize(w=100, y=0) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=0) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0185 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0186
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0186
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=4) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0186 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 4);
      logInfo(`setOriginMaterialSize(w=100, y=4) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=4) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(4);
      logInfo(`setOriginMaterialSize(w=100, y=4) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=4) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0186 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0187
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0187
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=50) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0187 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 50);
      logInfo(`setOriginMaterialSize(w=100, y=50) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=50) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=50) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=50) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0187 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0188
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0188
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0188 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 100);
      logInfo(`setOriginMaterialSize(w=100, y=100) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=100) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=100) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=100) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0188 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0189
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0189
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=10) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0189 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 10);
      logInfo(`setOriginMaterialSize(w=100, y=10) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=10) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(10);
      logInfo(`setOriginMaterialSize(w=100, y=10) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=10) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0189 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0190
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0190
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=5) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0190 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 5);
      logInfo(`setOriginMaterialSize(w=100, y=5) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=5) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize(w=100, y=5) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=5) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0190 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0191
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0191
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=15) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0191 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 15);
      logInfo(`setOriginMaterialSize(w=100, y=15) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=15) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(15);
      logInfo(`setOriginMaterialSize(w=100, y=15) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=15) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0191 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0192
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0192
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=20) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0192 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 20);
      logInfo(`setOriginMaterialSize(w=100, y=20) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=20) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(20);
      logInfo(`setOriginMaterialSize(w=100, y=20) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=20) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0192 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0193
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0193
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=25) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0193 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 25);
      logInfo(`setOriginMaterialSize(w=100, y=25) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=25) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`setOriginMaterialSize(w=100, y=25) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=25) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0193 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0194
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0194
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=30) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0194 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 30);
      logInfo(`setOriginMaterialSize(w=100, y=30) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=30) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(30);
      logInfo(`setOriginMaterialSize(w=100, y=30) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=30) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0194 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0195
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0195
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=35) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0195 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 35);
      logInfo(`setOriginMaterialSize(w=100, y=35) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=35) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`setOriginMaterialSize(w=100, y=35) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=35) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0195 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0196
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0196
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=40) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0196 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 40);
      logInfo(`setOriginMaterialSize(w=100, y=40) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=40) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(40);
      logInfo(`setOriginMaterialSize(w=100, y=40) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=40) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0196 end`);
      });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_SET_ORIGIN_MATERIAL_SIZE_0197
     * @tc.name      Image_ComputeFeatureSetOriginMaterialSize_0197
     * @tc.desc      ComputeFeature.setOriginMaterialSize(w=100, y=45) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureSetOriginMaterialSize_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0197 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(100, 45);
      logInfo(`setOriginMaterialSize(w=100, y=45) state: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize(w=100, y=45) state: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setOriginMaterialSize(w=100, y=45) state: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(50);
      logInfo(`setOriginMaterialSize(w=100, y=45) state: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureSetOriginMaterialSize_0197 end`);
      });
  });
}
