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
import { ComputeFeature, NodeType } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ComputeFeature flow (54 cases). */
export default function computeFeatureFlow4Test(): void {
  describe('ComputeFeatureFlow4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0175
     * @tc.name      Image_ComputeFeatureFlow_0175
     * @tc.desc      ComputeFeature call flow onDragMaterial > setMaterialAndImageSize > setMaterialAndImageSize keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0175 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(80, 65);
      subject.setMaterialAndImageSize(3, -1, 100, -1);
      subject.setMaterialAndImageSize(2, 2, 2, 5);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(5);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0176
     * @tc.name      Image_ComputeFeatureFlow_0176
     * @tc.desc      ComputeFeature call flow endDrag > setFontSize > setFontSize > setFontSize > onDragMaterial keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0176 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setFontSize(136);
      subject.setFontSize(105);
      subject.setFontSize(85);
      subject.onDragMaterial(10, 2);
      logInfo(`endDrag>setFontSize>setFontSize>setFontSi...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(10);
      logInfo(`endDrag>setFontSize>setFontSize>setFontSi...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`endDrag>setFontSize>setFontSize>setFontSi...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0177
     * @tc.name      Image_ComputeFeatureFlow_0177
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > onDragMaterial > startDrag > adjustMaxMin keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0177 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1344, 86.32);
      subject.onDragMaterial(-100, 80);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.adjustMaxMin(0, 672);
      logInfo(`setOriginMaterialSize>onDragMaterial>star...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(672);
      logInfo(`setOriginMaterialSize>onDragMaterial>star...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(43.16, PRECISION);
      logInfo(`setOriginMaterialSize>onDragMaterial>star...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`setOriginMaterialSize>onDragMaterial>star...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`setOriginMaterialSize>onDragMaterial>star...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.CENTER_MATERIAL);
      logInfo(`setOriginMaterialSize>onDragMaterial>star...: subject.dragStartWidth=${subject.dragStartWidth}`);
      expect(subject.dragStartWidth).assertEqual(1344);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0178
     * @tc.name      Image_ComputeFeatureFlow_0178
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0178 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 69);
      subject.setMaterialAndImageSize(10, -1, 3, 5);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0179
     * @tc.name      Image_ComputeFeatureFlow_0179
     * @tc.desc      ComputeFeature call flow setFontSize > startDrag > setOriginMaterialSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0179 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(120);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.setOriginMaterialSize(-1, 69);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(120);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_BOTTOM);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0180
     * @tc.name      Image_ComputeFeatureFlow_0180
     * @tc.desc      ComputeFeature call flow onDragMaterial > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0180 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(90, -100);
      subject.adjustMaxMin(1824, 864);
      logInfo(`onDragMaterial>adjustMaxMin final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(90);
      logInfo(`onDragMaterial>adjustMaxMin final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0181
     * @tc.name      Image_ComputeFeatureFlow_0181
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > onDragMaterial > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0181 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1248, 75);
      subject.onDragMaterial(95, 105);
      subject.endDrag();
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1248);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(624);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(95);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(105);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0182
     * @tc.name      Image_ComputeFeatureFlow_0182
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0182 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 3, 2, 5);
      subject.setMaterialAndImageSize(0, 100, 3, 2);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(50);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0183
     * @tc.name      Image_ComputeFeatureFlow_0183
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0183 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(864, 86.32);
      subject.setMaterialAndImageSize(2, 3, 100, -1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(864);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertClose(86.32, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0184
     * @tc.name      Image_ComputeFeatureFlow_0184
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > endDrag > startDrag > setFontSize > setOrigin...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0184 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 2, 0, 0);
      subject.endDrag();
      subject.startDrag(NodeType.LEFT_TOP);
      subject.setFontSize(-11);
      subject.setOriginMaterialSize(0, 75);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-11);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0185
     * @tc.name      Image_ComputeFeatureFlow_0185
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setFontSize > endDrag > adjustMaxMin keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0185 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, -1, 2, 2);
      subject.setFontSize(116);
      subject.endDrag();
      subject.adjustMaxMin(1152, 100);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0186
     * @tc.name      Image_ComputeFeatureFlow_0186
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0186 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1056, 69);
      subject.startDrag(NodeType.RIGHT_TOP);
      logInfo(`setOriginMaterialSize>startDrag final: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1056);
      logInfo(`setOriginMaterialSize>startDrag final: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`setOriginMaterialSize>startDrag final: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(528);
      logInfo(`setOriginMaterialSize>startDrag final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`setOriginMaterialSize>startDrag final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`setOriginMaterialSize>startDrag final: subject.dragStartWidth=${subject.dragStartWidth}`);
      expect(subject.dragStartWidth).assertEqual(1056);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0187
     * @tc.name      Image_ComputeFeatureFlow_0187
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > adjustMaxMin > setFontSize keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0187 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(5, 3, 5, 0);
      subject.adjustMaxMin(0, 2);
      subject.setFontSize(154);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setF...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setF...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setF...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setF...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setF...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(2.5, PRECISION);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setF...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0188
     * @tc.name      Image_ComputeFeatureFlow_0188
     * @tc.desc      ComputeFeature call flow startDrag > adjustMaxMin > setMaterialAndImageSize > setOriginMaterialS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0188 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.adjustMaxMin(720, 0);
      subject.setMaterialAndImageSize(100, 2, 10, 1);
      subject.setOriginMaterialSize(1632, 50);
      subject.setMaterialAndImageSize(0, 3, 100, 1);
      logInfo(`startDrag>adjustMaxMin>setMaterialAndImag...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`startDrag>adjustMaxMin>setMaterialAndImag...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`startDrag>adjustMaxMin>setMaterialAndImag...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`startDrag>adjustMaxMin>setMaterialAndImag...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1632);
      logInfo(`startDrag>adjustMaxMin>setMaterialAndImag...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`startDrag>adjustMaxMin>setMaterialAndImag...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0189
     * @tc.name      Image_ComputeFeatureFlow_0189
     * @tc.desc      ComputeFeature call flow startDrag > setMaterialAndImageSize > endDrag > adjustMaxMin keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0189 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.setMaterialAndImageSize(100, 3, 2, 1);
      subject.endDrag();
      subject.adjustMaxMin(96, 10);
      logInfo(`startDrag>setMaterialAndImageSize>endDrag...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`startDrag>setMaterialAndImageSize>endDrag...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`startDrag>setMaterialAndImageSize>endDrag...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`startDrag>setMaterialAndImageSize>endDrag...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`startDrag>setMaterialAndImageSize>endDrag...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`startDrag>setMaterialAndImageSize>endDrag...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0190
     * @tc.name      Image_ComputeFeatureFlow_0190
     * @tc.desc      ComputeFeature call flow setFontSize > adjustMaxMin > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0190 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(132);
      subject.adjustMaxMin(1248, 0);
      subject.adjustMaxMin(360, 288);
      logInfo(`setFontSize>adjustMaxMin>adjustMaxMin final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(132);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0191
     * @tc.name      Image_ComputeFeatureFlow_0191
     * @tc.desc      ComputeFeature call flow startDrag > startDrag > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0191 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_TOP);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.setFontSize(155);
      logInfo(`startDrag>startDrag>setFontSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(155);
      logInfo(`startDrag>startDrag>setFontSize final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.CENTER_MATERIAL);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0192
     * @tc.name      Image_ComputeFeatureFlow_0192
     * @tc.desc      ComputeFeature call flow endDrag > setFontSize > startDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0192 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setFontSize(25);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.startDrag(NodeType.RIGHT_TOP);
      logInfo(`endDrag>setFontSize>startDrag>startDrag f...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(25);
      logInfo(`endDrag>setFontSize>startDrag>startDrag f...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`endDrag>setFontSize>startDrag>startDrag f...: subject.dragStartFontSize=${subject.dragStartFontSize}`);
      expect(subject.dragStartFontSize).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0193
     * @tc.name      Image_ComputeFeatureFlow_0193
     * @tc.desc      ComputeFeature call flow startDrag > setOriginMaterialSize > endDrag > setMaterialAndImageSize >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0193 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_TOP);
      subject.setOriginMaterialSize(0, 70);
      subject.endDrag();
      subject.setMaterialAndImageSize(2, 2, 2, 0);
      subject.setOriginMaterialSize(192, 55);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(192);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0194
     * @tc.name      Image_ComputeFeatureFlow_0194
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > startDrag > adjustMaxMin > setMaterialAndImageS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0194 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 65);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.adjustMaxMin(0, 0);
      subject.setMaterialAndImageSize(0, 5, -1, 100);
      logInfo(`setOriginMaterialSize>startDrag>adjustMax...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize>startDrag>adjustMax...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize>startDrag>adjustMax...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize>startDrag>adjustMax...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize>startDrag>adjustMax...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize>startDrag>adjustMax...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(32.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0195
     * @tc.name      Image_ComputeFeatureFlow_0195
     * @tc.desc      ComputeFeature call flow onDragMaterial > setOriginMaterialSize > startDrag > setFontSize keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0195 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(75, -100);
      subject.setOriginMaterialSize(1248, 55);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.setFontSize(-9);
      logInfo(`onDragMaterial>setOriginMaterialSize>star...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1248);
      logInfo(`onDragMaterial>setOriginMaterialSize>star...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`onDragMaterial>setOriginMaterialSize>star...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(624);
      logInfo(`onDragMaterial>setOriginMaterialSize>star...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`onDragMaterial>setOriginMaterialSize>star...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(75);
      logInfo(`onDragMaterial>setOriginMaterialSize>star...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0196
     * @tc.name      Image_ComputeFeatureFlow_0196
     * @tc.desc      ComputeFeature call flow setFontSize > setMaterialAndImageSize > adjustMaxMin > setOriginMateria...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0196 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(17);
      subject.setMaterialAndImageSize(-1, 3, 1, 10);
      subject.adjustMaxMin(2, 1824);
      subject.setOriginMaterialSize(1152, 2);
      logInfo(`setFontSize>setMaterialAndImageSize>adjus...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setFontSize>setMaterialAndImageSize>adjus...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setFontSize>setMaterialAndImageSize>adjus...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setFontSize>setMaterialAndImageSize>adjus...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setFontSize>setMaterialAndImageSize>adjus...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1152);
      logInfo(`setFontSize>setMaterialAndImageSize>adjus...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0197
     * @tc.name      Image_ComputeFeatureFlow_0197
     * @tc.desc      ComputeFeature call flow onDragMaterial > onDragMaterial > endDrag > setMaterialAndImageSize kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0197 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 55);
      subject.onDragMaterial(35, 6);
      subject.endDrag();
      subject.setMaterialAndImageSize(0, 3, 0, 0);
      logInfo(`onDragMaterial>onDragMaterial>endDrag>set...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`onDragMaterial>onDragMaterial>endDrag>set...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(1.5, PRECISION);
      logInfo(`onDragMaterial>onDragMaterial>endDrag>set...: subject.y=${subject.y}`);
      expect(subject.y).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0198
     * @tc.name      Image_ComputeFeatureFlow_0198
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > endDrag > startDrag > setMaterialAndImageSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0198 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, -1, 2);
      subject.endDrag();
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.setMaterialAndImageSize(10, 10, 5, 10);
      subject.endDrag();
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>endDrag>startDrag...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0199
     * @tc.name      Image_ComputeFeatureFlow_0199
     * @tc.desc      ComputeFeature call flow startDrag > onDragMaterial > setMaterialAndImageSize > onDragMaterial >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0199 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.onDragMaterial(-100, 10);
      subject.setMaterialAndImageSize(2, 2, 2, 2);
      subject.onDragMaterial(-37, 100);
      subject.setMaterialAndImageSize(3, 2, 3, 3);
      logInfo(`startDrag>onDragMaterial>setMaterialAndIm...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`startDrag>onDragMaterial>setMaterialAndIm...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`startDrag>onDragMaterial>setMaterialAndIm...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`startDrag>onDragMaterial>setMaterialAndIm...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`startDrag>onDragMaterial>setMaterialAndIm...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`startDrag>onDragMaterial>setMaterialAndIm...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0200
     * @tc.name      Image_ComputeFeatureFlow_0200
     * @tc.desc      ComputeFeature call flow onDragMaterial > setFontSize > setMaterialAndImageSize > endDrag keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0200 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(95, 105);
      subject.setFontSize(16.21);
      subject.setMaterialAndImageSize(3, 0, 2, 100);
      subject.endDrag();
      logInfo(`onDragMaterial>setFontSize>setMaterialAnd...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`onDragMaterial>setFontSize>setMaterialAnd...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`onDragMaterial>setFontSize>setMaterialAnd...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`onDragMaterial>setFontSize>setMaterialAnd...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`onDragMaterial>setFontSize>setMaterialAnd...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(1.5, PRECISION);
      logInfo(`onDragMaterial>setFontSize>setMaterialAnd...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0201
     * @tc.name      Image_ComputeFeatureFlow_0201
     * @tc.desc      ComputeFeature call flow onDragMaterial > endDrag > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0201 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 0);
      subject.endDrag();
      subject.adjustMaxMin(480, 1920);
      logInfo(`onDragMaterial>endDrag>adjustMaxMin final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0202
     * @tc.name      Image_ComputeFeatureFlow_0202
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > onDragMaterial > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0202 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(192, 1);
      subject.onDragMaterial(45, 80);
      subject.endDrag();
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(192);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(96);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(45);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0203
     * @tc.name      Image_ComputeFeatureFlow_0203
     * @tc.desc      ComputeFeature call flow onDragMaterial > onDragMaterial > startDrag > setFontSize keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0203 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(75, 30);
      subject.onDragMaterial(45, 90);
      subject.startDrag(NodeType.RIGHT_TOP);
      subject.setFontSize(197);
      logInfo(`onDragMaterial>onDragMaterial>startDrag>s...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(120);
      logInfo(`onDragMaterial>onDragMaterial>startDrag>s...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(120);
      logInfo(`onDragMaterial>onDragMaterial>startDrag>s...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(197);
      logInfo(`onDragMaterial>onDragMaterial>startDrag>s...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`onDragMaterial>onDragMaterial>startDrag>s...: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(120);
      logInfo(`onDragMaterial>onDragMaterial>startDrag>s...: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(120);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0204
     * @tc.name      Image_ComputeFeatureFlow_0204
     * @tc.desc      ComputeFeature call flow adjustMaxMin > endDrag > setOriginMaterialSize > setOriginMaterialSize ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0204 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(864, 288);
      subject.endDrag();
      subject.setOriginMaterialSize(288, 45);
      subject.setOriginMaterialSize(1536, -100);
      subject.setFontSize(-1);
      logInfo(`adjustMaxMin>endDrag>setOriginMaterialSiz...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1536);
      logInfo(`adjustMaxMin>endDrag>setOriginMaterialSiz...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`adjustMaxMin>endDrag>setOriginMaterialSiz...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(768);
      logInfo(`adjustMaxMin>endDrag>setOriginMaterialSiz...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`adjustMaxMin>endDrag>setOriginMaterialSiz...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0205
     * @tc.name      Image_ComputeFeatureFlow_0205
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0205 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 1, 5, 1);
      subject.endDrag();
      logInfo(`setMaterialAndImageSize>endDrag final: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0206
     * @tc.name      Image_ComputeFeatureFlow_0206
     * @tc.desc      ComputeFeature call flow setFontSize > setMaterialAndImageSize > setMaterialAndImageSize > setOr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0206 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(88.26);
      subject.setMaterialAndImageSize(1, 2, 1, 0);
      subject.setMaterialAndImageSize(-1, 100, -1, -1);
      subject.setOriginMaterialSize(-1, 69);
      subject.endDrag();
      logInfo(`setFontSize>setMaterialAndImageSize>setMa...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setFontSize>setMaterialAndImageSize>setMa...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setFontSize>setMaterialAndImageSize>setMa...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setFontSize>setMaterialAndImageSize>setMa...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setFontSize>setMaterialAndImageSize>setMa...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setFontSize>setMaterialAndImageSize>setMa...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0207
     * @tc.name      Image_ComputeFeatureFlow_0207
     * @tc.desc      ComputeFeature call flow startDrag > endDrag > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0207 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.endDrag();
      subject.onDragMaterial(-100, -10);
      logInfo(`startDrag>endDrag>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`startDrag>endDrag>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0208
     * @tc.name      Image_ComputeFeatureFlow_0208
     * @tc.desc      ComputeFeature call flow adjustMaxMin > setMaterialAndImageSize > startDrag > endDrag > setMater...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0208 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(768, 288);
      subject.setMaterialAndImageSize(-1, 1, 10, 0);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.endDrag();
      subject.setMaterialAndImageSize(100, 3, 2, 0);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(50);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0209
     * @tc.name      Image_ComputeFeatureFlow_0209
     * @tc.desc      ComputeFeature call flow endDrag > setOriginMaterialSize > endDrag > setOriginMaterialSize keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0209 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setOriginMaterialSize(96, 95);
      subject.endDrag();
      subject.setOriginMaterialSize(1536, 60);
      logInfo(`endDrag>setOriginMaterialSize>endDrag>set...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1536);
      logInfo(`endDrag>setOriginMaterialSize>endDrag>set...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`endDrag>setOriginMaterialSize>endDrag>set...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(768);
      logInfo(`endDrag>setOriginMaterialSize>endDrag>set...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0210
     * @tc.name      Image_ComputeFeatureFlow_0210
     * @tc.desc      ComputeFeature call flow endDrag > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0210 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.onDragMaterial(65, -100);
      logInfo(`endDrag>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(65);
      logInfo(`endDrag>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0211
     * @tc.name      Image_ComputeFeatureFlow_0211
     * @tc.desc      ComputeFeature call flow onDragMaterial > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0211 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(22, -1);
      subject.adjustMaxMin(0, 1632);
      logInfo(`onDragMaterial>adjustMaxMin final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(22);
      logInfo(`onDragMaterial>adjustMaxMin final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0212
     * @tc.name      Image_ComputeFeatureFlow_0212
     * @tc.desc      ComputeFeature call flow setFontSize > setOriginMaterialSize > endDrag > setOriginMaterialSize >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0212 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(171);
      subject.setOriginMaterialSize(672, -100);
      subject.endDrag();
      subject.setOriginMaterialSize(480, 1);
      subject.startDrag(NodeType.LEFT_TOP);
      logInfo(`setFontSize>setOriginMaterialSize>endDrag...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(480);
      logInfo(`setFontSize>setOriginMaterialSize>endDrag...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`setFontSize>setOriginMaterialSize>endDrag...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(240);
      logInfo(`setFontSize>setOriginMaterialSize>endDrag...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`setFontSize>setOriginMaterialSize>endDrag...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(171);
      logInfo(`setFontSize>setOriginMaterialSize>endDrag...: subject.dragStartWidth=${subject.dragStartWidth}`);
      expect(subject.dragStartWidth).assertEqual(480);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0213
     * @tc.name      Image_ComputeFeatureFlow_0213
     * @tc.desc      ComputeFeature call flow setFontSize > setFontSize > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0213 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-82);
      subject.setFontSize(116);
      subject.setFontSize(43);
      logInfo(`setFontSize>setFontSize>setFontSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(43);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0214
     * @tc.name      Image_ComputeFeatureFlow_0214
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setMaterialAndImageSize > setMaterialAndImageSi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0214 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1632, 50);
      subject.setMaterialAndImageSize(3, 2, 10, 1);
      subject.setMaterialAndImageSize(10, -1, 0, 2);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1632);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0215
     * @tc.name      Image_ComputeFeatureFlow_0215
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > endDrag > setOriginMaterialSize > setFontSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0215 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 100, 2, 2);
      subject.endDrag();
      subject.setOriginMaterialSize(1056, 85);
      subject.setFontSize(53);
      subject.onDragMaterial(-100, 182);
      logInfo(`setMaterialAndImageSize>endDrag>setOrigin...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>endDrag>setOrigin...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize>endDrag>setOrigin...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>endDrag>setOrigin...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>endDrag>setOrigin...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1056);
      logInfo(`setMaterialAndImageSize>endDrag>setOrigin...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0216
     * @tc.name      Image_ComputeFeatureFlow_0216
     * @tc.desc      ComputeFeature call flow startDrag > endDrag > setFontSize > setOriginMaterialSize keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0216 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_TOP);
      subject.endDrag();
      subject.setFontSize(190);
      subject.setOriginMaterialSize(1344, 90);
      logInfo(`startDrag>endDrag>setFontSize>setOriginMa...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1344);
      logInfo(`startDrag>endDrag>setFontSize>setOriginMa...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(90);
      logInfo(`startDrag>endDrag>setFontSize>setOriginMa...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(672);
      logInfo(`startDrag>endDrag>setFontSize>setOriginMa...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`startDrag>endDrag>setFontSize>setOriginMa...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(190);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0217
     * @tc.name      Image_ComputeFeatureFlow_0217
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > endDrag > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0217 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(10, 0);
      subject.endDrag();
      subject.setFontSize(24.92);
      logInfo(`setOriginMaterialSize>endDrag>setFontSize...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(10);
      logInfo(`setOriginMaterialSize>endDrag>setFontSize...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(5);
      logInfo(`setOriginMaterialSize>endDrag>setFontSize...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(24.92, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0218
     * @tc.name      Image_ComputeFeatureFlow_0218
     * @tc.desc      ComputeFeature call flow adjustMaxMin > setOriginMaterialSize > setMaterialAndImageSize > onDrag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0218 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(360, 1152);
      subject.setOriginMaterialSize(1056, 69);
      subject.setMaterialAndImageSize(0, 2, 2, 0);
      subject.onDragMaterial(73, -100);
      subject.endDrag();
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1056);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(528);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0219
     * @tc.name      Image_ComputeFeatureFlow_0219
     * @tc.desc      ComputeFeature call flow onDragMaterial > onDragMaterial > endDrag > setFontSize > endDrag keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0219 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(40, 0);
      subject.onDragMaterial(65, 80);
      subject.endDrag();
      subject.setFontSize(43);
      subject.endDrag();
      logInfo(`onDragMaterial>onDragMaterial>endDrag>set...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(105);
      logInfo(`onDragMaterial>onDragMaterial>endDrag>set...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`onDragMaterial>onDragMaterial>endDrag>set...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(43);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0220
     * @tc.name      Image_ComputeFeatureFlow_0220
     * @tc.desc      ComputeFeature call flow onDragMaterial > adjustMaxMin > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0220 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(100, -10);
      subject.adjustMaxMin(-1, -1);
      subject.adjustMaxMin(1, 1632);
      logInfo(`onDragMaterial>adjustMaxMin>adjustMaxMin ...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(100);
      logInfo(`onDragMaterial>adjustMaxMin>adjustMaxMin ...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0221
     * @tc.name      Image_ComputeFeatureFlow_0221
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setOriginMaterialSize > endDrag keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0221 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 3);
      subject.setOriginMaterialSize(672, 100);
      subject.endDrag();
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(672);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(336);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0222
     * @tc.name      Image_ComputeFeatureFlow_0222
     * @tc.desc      ComputeFeature call flow endDrag > setFontSize > setOriginMaterialSize > setMaterialAndImageSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0222 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setFontSize(144);
      subject.setOriginMaterialSize(-1, 5);
      subject.setMaterialAndImageSize(100, 3, 1, 10);
      logInfo(`endDrag>setFontSize>setOriginMaterialSize...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`endDrag>setFontSize>setOriginMaterialSize...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`endDrag>setFontSize>setOriginMaterialSize...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`endDrag>setFontSize>setOriginMaterialSize...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`endDrag>setFontSize>setOriginMaterialSize...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`endDrag>setFontSize>setOriginMaterialSize...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0223
     * @tc.name      Image_ComputeFeatureFlow_0223
     * @tc.desc      ComputeFeature call flow startDrag > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0223 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.onDragMaterial(22, 90);
      logInfo(`startDrag>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(22);
      logInfo(`startDrag>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(90);
      logInfo(`startDrag>onDragMaterial final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.CENTER_MATERIAL);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0224
     * @tc.name      Image_ComputeFeatureFlow_0224
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > onDragMaterial > setMaterialAndImageSize > on...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0224 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 2, 10, 5);
      subject.onDragMaterial(-100, 20);
      subject.setMaterialAndImageSize(100, 3, 2, 1);
      subject.onDragMaterial(-37, 182);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0225
     * @tc.name      Image_ComputeFeatureFlow_0225
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setMaterialAndImageSize > endDrag > adjustMax...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0225 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 1, 100, 10);
      subject.setMaterialAndImageSize(3, -1, 10, 3);
      subject.endDrag();
      subject.adjustMaxMin(0, 1152);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0226
     * @tc.name      Image_ComputeFeatureFlow_0226
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > endDrag > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0226 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1152, -100);
      subject.endDrag();
      subject.onDragMaterial(-100, 70);
      logInfo(`setOriginMaterialSize>endDrag>onDragMater...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1152);
      logInfo(`setOriginMaterialSize>endDrag>onDragMater...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize>endDrag>onDragMater...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(576);
      logInfo(`setOriginMaterialSize>endDrag>onDragMater...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`setOriginMaterialSize>endDrag>onDragMater...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`setOriginMaterialSize>endDrag>onDragMater...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0227
     * @tc.name      Image_ComputeFeatureFlow_0227
     * @tc.desc      ComputeFeature call flow endDrag > onDragMaterial > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0227 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.onDragMaterial(-1, 6);
      subject.adjustMaxMin(576, 1728);
      logInfo(`endDrag>onDragMaterial>adjustMaxMin final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`endDrag>onDragMaterial>adjustMaxMin final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0228
     * @tc.name      Image_ComputeFeatureFlow_0228
     * @tc.desc      ComputeFeature call flow onDragMaterial > setOriginMaterialSize > endDrag > onDragMaterial keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0228 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(55, -100);
      subject.setOriginMaterialSize(1248, 80);
      subject.endDrag();
      subject.onDragMaterial(-100, 80);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1248);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(80);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(624);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(40);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-45);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-20);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0228 end`);
    });
  });
}
