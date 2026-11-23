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

/** Logic checks for ComputeFeature flow (58 cases). */
export default function computeFeatureFlow2Test(): void {
  describe('ComputeFeatureFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0060
     * @tc.name      Image_ComputeFeatureFlow_0060
     * @tc.desc      ComputeFeature call flow setFontSize > setOriginMaterialSize > setOriginMaterialSize > setFontSi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0060 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(175);
      subject.setOriginMaterialSize(1, 5);
      subject.setOriginMaterialSize(720, 45);
      subject.setFontSize(31);
      subject.adjustMaxMin(960, 0);
      logInfo(`setFontSize>setOriginMaterialSize>setOrig...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(360);
      logInfo(`setFontSize>setOriginMaterialSize>setOrig...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`setFontSize>setOriginMaterialSize>setOrig...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(31);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0061
     * @tc.name      Image_ComputeFeatureFlow_0061
     * @tc.desc      ComputeFeature call flow startDrag > adjustMaxMin > startDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0061 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.adjustMaxMin(768, 384);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      logInfo(`startDrag>adjustMaxMin>startDrag>startDra...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_BOTTOM);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0062
     * @tc.name      Image_ComputeFeatureFlow_0062
     * @tc.desc      ComputeFeature call flow setFontSize > setOriginMaterialSize > onDragMaterial > setMaterialAndIm...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0062 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(170);
      subject.setOriginMaterialSize(960, 45);
      subject.onDragMaterial(105, 6);
      subject.setMaterialAndImageSize(3, 100, 0, 5);
      logInfo(`setFontSize>setOriginMaterialSize>onDragM...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setFontSize>setOriginMaterialSize>onDragM...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setFontSize>setOriginMaterialSize>onDragM...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(5);
      logInfo(`setFontSize>setOriginMaterialSize>onDragM...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(960);
      logInfo(`setFontSize>setOriginMaterialSize>onDragM...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setFontSize>setOriginMaterialSize>onDragM...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0063
     * @tc.name      Image_ComputeFeatureFlow_0063
     * @tc.desc      ComputeFeature call flow setFontSize > setFontSize > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0063 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(70);
      subject.setFontSize(155);
      subject.onDragMaterial(80, -100);
      logInfo(`setFontSize>setFontSize>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(80);
      logInfo(`setFontSize>setFontSize>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`setFontSize>setFontSize>onDragMaterial final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(155);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0064
     * @tc.name      Image_ComputeFeatureFlow_0064
     * @tc.desc      ComputeFeature call flow adjustMaxMin > setFontSize > setMaterialAndImageSize keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0064 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(672, 384);
      subject.setFontSize(27);
      subject.setMaterialAndImageSize(100, -1, 1, 10);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0065
     * @tc.name      Image_ComputeFeatureFlow_0065
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > onDragMaterial > onDragMaterial > setMaterial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0065 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, -1, 0, 2);
      subject.onDragMaterial(-100, 5);
      subject.onDragMaterial(-100, 60);
      subject.setMaterialAndImageSize(2, 2, 2, 100);
      logInfo(`setMaterialAndImageSize>onDragMaterial>on...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>on...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>on...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>on...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize>onDragMaterial>on...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>on...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0066
     * @tc.name      Image_ComputeFeatureFlow_0066
     * @tc.desc      ComputeFeature call flow onDragMaterial > adjustMaxMin > setMaterialAndImageSize > startDrag > s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0066 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, 6);
      subject.adjustMaxMin(672, 384);
      subject.setMaterialAndImageSize(100, 3, 1, 10);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.setMaterialAndImageSize(5, 1, 10, 0);
      logInfo(`onDragMaterial>adjustMaxMin>setMaterialAn...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(5);
      logInfo(`onDragMaterial>adjustMaxMin>setMaterialAn...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`onDragMaterial>adjustMaxMin>setMaterialAn...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`onDragMaterial>adjustMaxMin>setMaterialAn...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(5);
      logInfo(`onDragMaterial>adjustMaxMin>setMaterialAn...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(2.5, PRECISION);
      logInfo(`onDragMaterial>adjustMaxMin>setMaterialAn...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0067
     * @tc.name      Image_ComputeFeatureFlow_0067
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0067 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 25);
      subject.setMaterialAndImageSize(-1, 1, 10, 0);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0068
     * @tc.name      Image_ComputeFeatureFlow_0068
     * @tc.desc      ComputeFeature call flow setFontSize > startDrag > endDrag > setMaterialAndImageSize keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0068 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(153);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.endDrag();
      subject.setMaterialAndImageSize(10, 0, -1, 1);
      logInfo(`setFontSize>startDrag>endDrag>setMaterial...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setFontSize>startDrag>endDrag>setMaterial...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setFontSize>startDrag>endDrag>setMaterial...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setFontSize>startDrag>endDrag>setMaterial...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setFontSize>startDrag>endDrag>setMaterial...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertEqual(5);
      logInfo(`setFontSize>startDrag>endDrag>setMaterial...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0069
     * @tc.name      Image_ComputeFeatureFlow_0069
     * @tc.desc      ComputeFeature call flow setFontSize > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0069 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-31);
      subject.setMaterialAndImageSize(5, 10, 0, 5);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(5);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(5);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(5);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(2.5, PRECISION);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0070
     * @tc.name      Image_ComputeFeatureFlow_0070
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setFontSize > endDrag > endDrag keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0070 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 5);
      subject.setFontSize(95);
      subject.endDrag();
      subject.endDrag();
      logInfo(`setOriginMaterialSize>setFontSize>endDrag...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setFontSize>endDrag...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize>setFontSize>endDrag...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize>setFontSize>endDrag...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`setOriginMaterialSize>setFontSize>endDrag...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0071
     * @tc.name      Image_ComputeFeatureFlow_0071
     * @tc.desc      ComputeFeature call flow setFontSize > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0071 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-18);
      subject.adjustMaxMin(3, 1);
      logInfo(`setFontSize>adjustMaxMin final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-18);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0072
     * @tc.name      Image_ComputeFeatureFlow_0072
     * @tc.desc      ComputeFeature call flow setFontSize > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0072 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(6.55);
      subject.onDragMaterial(-1, 105);
      logInfo(`setFontSize>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`setFontSize>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(105);
      logInfo(`setFontSize>onDragMaterial final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(6.55, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0073
     * @tc.name      Image_ComputeFeatureFlow_0073
     * @tc.desc      ComputeFeature call flow startDrag > startDrag > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0073 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.onDragMaterial(70, 1);
      logInfo(`startDrag>startDrag>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(70);
      logInfo(`startDrag>startDrag>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0074
     * @tc.name      Image_ComputeFeatureFlow_0074
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setMaterialAndImageSize > setOriginMaterialSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0074 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 65);
      subject.setMaterialAndImageSize(2, 2, 2, 0);
      subject.setOriginMaterialSize(960, 25);
      subject.setOriginMaterialSize(720, 5);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(720);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0075
     * @tc.name      Image_ComputeFeatureFlow_0075
     * @tc.desc      ComputeFeature call flow adjustMaxMin > onDragMaterial > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0075 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(1824, 0);
      subject.onDragMaterial(85, 182);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      logInfo(`adjustMaxMin>onDragMaterial>startDrag final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(85);
      logInfo(`adjustMaxMin>onDragMaterial>startDrag final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(182);
      logInfo(`adjustMaxMin>onDragMaterial>startDrag final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_BOTTOM);
      logInfo(`adjustMaxMin>onDragMaterial>startDrag final: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(85);
      logInfo(`adjustMaxMin>onDragMaterial>startDrag final: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(182);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0076
     * @tc.name      Image_ComputeFeatureFlow_0076
     * @tc.desc      ComputeFeature call flow startDrag > startDrag > setOriginMaterialSize > setFontSize > setOrigin...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0076 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.startDrag(NodeType.RIGHT_TOP);
      subject.setOriginMaterialSize(1152, -100);
      subject.setFontSize(180);
      subject.setOriginMaterialSize(0, 69);
      logInfo(`startDrag>startDrag>setOriginMaterialSize...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(69);
      logInfo(`startDrag>startDrag>setOriginMaterialSize...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(34.5, PRECISION);
      logInfo(`startDrag>startDrag>setOriginMaterialSize...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(180);
      logInfo(`startDrag>startDrag>setOriginMaterialSize...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0077
     * @tc.name      Image_ComputeFeatureFlow_0077
     * @tc.desc      ComputeFeature call flow endDrag > setMaterialAndImageSize > adjustMaxMin > onDragMaterial keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0077 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setMaterialAndImageSize(100, -1, 100, 2);
      subject.adjustMaxMin(1536, 0);
      subject.onDragMaterial(75, 182);
      logInfo(`endDrag>setMaterialAndImageSize>adjustMax...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`endDrag>setMaterialAndImageSize>adjustMax...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`endDrag>setMaterialAndImageSize>adjustMax...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`endDrag>setMaterialAndImageSize>adjustMax...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`endDrag>setMaterialAndImageSize>adjustMax...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`endDrag>setMaterialAndImageSize>adjustMax...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0078
     * @tc.name      Image_ComputeFeatureFlow_0078
     * @tc.desc      ComputeFeature call flow endDrag > setOriginMaterialSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0078 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setOriginMaterialSize(0, 5);
      logInfo(`endDrag>setOriginMaterialSize final: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`endDrag>setOriginMaterialSize final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0079
     * @tc.name      Image_ComputeFeatureFlow_0079
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > onDragMaterial > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0079 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1, 5);
      subject.onDragMaterial(60, 75);
      subject.endDrag();
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(0.5, PRECISION);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(60);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0080
     * @tc.name      Image_ComputeFeatureFlow_0080
     * @tc.desc      ComputeFeature call flow startDrag > setFontSize > adjustMaxMin > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0080 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.setFontSize(165);
      subject.adjustMaxMin(720, 1080);
      subject.endDrag();
      logInfo(`startDrag>setFontSize>adjustMaxMin>endDra...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(165);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0081
     * @tc.name      Image_ComputeFeatureFlow_0081
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setMaterialAndImageSize > onDragMaterial keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0081 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 50);
      subject.setMaterialAndImageSize(0, 100, 3, 2);
      subject.onDragMaterial(25, 6);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0082
     * @tc.name      Image_ComputeFeatureFlow_0082
     * @tc.desc      ComputeFeature call flow adjustMaxMin > adjustMaxMin > setOriginMaterialSize > onDragMaterial > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0082 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(1824, 100);
      subject.adjustMaxMin(0, 1440);
      subject.setOriginMaterialSize(0, 2);
      subject.onDragMaterial(25, 15);
      subject.onDragMaterial(30, 70);
      logInfo(`adjustMaxMin>adjustMaxMin>setOriginMateri...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`adjustMaxMin>adjustMaxMin>setOriginMateri...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`adjustMaxMin>adjustMaxMin>setOriginMateri...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(55);
      logInfo(`adjustMaxMin>adjustMaxMin>setOriginMateri...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0083
     * @tc.name      Image_ComputeFeatureFlow_0083
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > adjustMaxMin > endDrag > setOriginMaterialSize ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0083 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1632, -100);
      subject.adjustMaxMin(1080, 384);
      subject.endDrag();
      subject.setOriginMaterialSize(0, 55);
      logInfo(`setOriginMaterialSize>adjustMaxMin>endDra...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`setOriginMaterialSize>adjustMaxMin>endDra...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0084
     * @tc.name      Image_ComputeFeatureFlow_0084
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > adjustMaxMin > onDragMaterial > startDrag > end...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0084 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(768, 35);
      subject.adjustMaxMin(1080, 384);
      subject.onDragMaterial(40, -100);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.endDrag();
      logInfo(`setOriginMaterialSize>adjustMaxMin>onDrag...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(384);
      logInfo(`setOriginMaterialSize>adjustMaxMin>onDrag...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`setOriginMaterialSize>adjustMaxMin>onDrag...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(40);
      logInfo(`setOriginMaterialSize>adjustMaxMin>onDrag...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0085
     * @tc.name      Image_ComputeFeatureFlow_0085
     * @tc.desc      ComputeFeature call flow onDragMaterial > setFontSize > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0085 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(30, 55);
      subject.setFontSize(175);
      subject.adjustMaxMin(96, 1080);
      logInfo(`onDragMaterial>setFontSize>adjustMaxMin f...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(30);
      logInfo(`onDragMaterial>setFontSize>adjustMaxMin f...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`onDragMaterial>setFontSize>adjustMaxMin f...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(175);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0086
     * @tc.name      Image_ComputeFeatureFlow_0086
     * @tc.desc      ComputeFeature call flow adjustMaxMin > setFontSize > setMaterialAndImageSize > setMaterialAndIm...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0086 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(1440, 192);
      subject.setFontSize(-82);
      subject.setMaterialAndImageSize(2, 2, 5, 2);
      subject.setMaterialAndImageSize(2, 10, 2, 2);
      subject.endDrag();
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0087
     * @tc.name      Image_ComputeFeatureFlow_0087
     * @tc.desc      ComputeFeature call flow startDrag > startDrag > startDrag > setOriginMaterialSize keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0087 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.setOriginMaterialSize(960, 25);
      logInfo(`startDrag>startDrag>startDrag>setOriginMa...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(960);
      logInfo(`startDrag>startDrag>startDrag>setOriginMa...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`startDrag>startDrag>startDrag>setOriginMa...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(480);
      logInfo(`startDrag>startDrag>startDrag>setOriginMa...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0088
     * @tc.name      Image_ComputeFeatureFlow_0088
     * @tc.desc      ComputeFeature call flow onDragMaterial > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0088 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(0, 10);
      subject.startDrag(NodeType.RIGHT_TOP);
      logInfo(`onDragMaterial>startDrag final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`onDragMaterial>startDrag final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`onDragMaterial>startDrag final: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0089
     * @tc.name      Image_ComputeFeatureFlow_0089
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setFontSize > setOriginMaterialSize keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0089 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 2, 10, 1);
      subject.setFontSize(23);
      subject.setOriginMaterialSize(192, -1);
      logInfo(`setMaterialAndImageSize>setFontSize>setOr...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setFontSize>setOr...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setFontSize>setOr...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize>setFontSize>setOr...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>setFontSize>setOr...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(192);
      logInfo(`setMaterialAndImageSize>setFontSize>setOr...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0090
     * @tc.name      Image_ComputeFeatureFlow_0090
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > adjustMaxMin > adjustMaxMin > onDragMaterial ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0090 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(10, -1, -1, -1);
      subject.adjustMaxMin(100, 1056);
      subject.adjustMaxMin(0, 1152);
      subject.onDragMaterial(0, -100);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0091
     * @tc.name      Image_ComputeFeatureFlow_0091
     * @tc.desc      ComputeFeature call flow adjustMaxMin > onDragMaterial > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0091 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(480, 960);
      subject.onDragMaterial(45, 45);
      subject.adjustMaxMin(1920, 1824);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin ...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(45);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin ...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0092
     * @tc.name      Image_ComputeFeatureFlow_0092
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setOriginMaterialSize > setFontSize > adjustM...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0092 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 100, 3, 2);
      subject.setOriginMaterialSize(-1, 35);
      subject.setFontSize(123);
      subject.adjustMaxMin(100, 720);
      subject.adjustMaxMin(768, 0);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertClose(17.5, PRECISION);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0093
     * @tc.name      Image_ComputeFeatureFlow_0093
     * @tc.desc      ComputeFeature call flow startDrag > endDrag > setFontSize > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0093 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.endDrag();
      subject.setFontSize(-83);
      subject.endDrag();
      logInfo(`startDrag>endDrag>setFontSize>endDrag final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-83);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0094
     * @tc.name      Image_ComputeFeatureFlow_0094
     * @tc.desc      ComputeFeature call flow setFontSize > setOriginMaterialSize > adjustMaxMin > setMaterialAndImag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0094 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(86.96);
      subject.setOriginMaterialSize(0, -1);
      subject.adjustMaxMin(672, 384);
      subject.setMaterialAndImageSize(2, 2, 0, 2);
      subject.setOriginMaterialSize(0, 10);
      logInfo(`setFontSize>setOriginMaterialSize>adjustM...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setFontSize>setOriginMaterialSize>adjustM...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setFontSize>setOriginMaterialSize>adjustM...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setFontSize>setOriginMaterialSize>adjustM...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(10);
      logInfo(`setFontSize>setOriginMaterialSize>adjustM...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`setFontSize>setOriginMaterialSize>adjustM...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0095
     * @tc.name      Image_ComputeFeatureFlow_0095
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > startDrag > setOriginMaterialSize > setMaterial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0095 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(96, 25);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.setOriginMaterialSize(96, 80);
      subject.setMaterialAndImageSize(5, 1, 3, 1);
      subject.endDrag();
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(5);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(96);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0096
     * @tc.name      Image_ComputeFeatureFlow_0096
     * @tc.desc      ComputeFeature call flow setFontSize > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0096 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(95);
      subject.startDrag(NodeType.LEFT_TOP);
      logInfo(`setFontSize>startDrag final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(95);
      logInfo(`setFontSize>startDrag final: subject.dragStartFontSize=${subject.dragStartFontSize}`);
      expect(subject.dragStartFontSize).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0097
     * @tc.name      Image_ComputeFeatureFlow_0097
     * @tc.desc      ComputeFeature call flow endDrag > startDrag > setMaterialAndImageSize > setOriginMaterialSize >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0097 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.setMaterialAndImageSize(100, 3, 100, -1);
      subject.setOriginMaterialSize(0, 5);
      subject.onDragMaterial(80, -1);
      logInfo(`endDrag>startDrag>setMaterialAndImageSize...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`endDrag>startDrag>setMaterialAndImageSize...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`endDrag>startDrag>setMaterialAndImageSize...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`endDrag>startDrag>setMaterialAndImageSize...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`endDrag>startDrag>setMaterialAndImageSize...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`endDrag>startDrag>setMaterialAndImageSize...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0098
     * @tc.name      Image_ComputeFeatureFlow_0098
     * @tc.desc      ComputeFeature call flow startDrag > onDragMaterial > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0098 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.onDragMaterial(90, 2);
      subject.endDrag();
      logInfo(`startDrag>onDragMaterial>endDrag final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(90);
      logInfo(`startDrag>onDragMaterial>endDrag final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0099
     * @tc.name      Image_ComputeFeatureFlow_0099
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0099 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(5, 2, 100, 2);
      subject.setFontSize(179);
      logInfo(`setMaterialAndImageSize>setFontSize final: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>setFontSize final: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setFontSize final: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setFontSize final: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setFontSize final: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>setFontSize final: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0100
     * @tc.name      Image_ComputeFeatureFlow_0100
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0100 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1248, 55);
      subject.adjustMaxMin(100, 720);
      logInfo(`setOriginMaterialSize>adjustMaxMin final: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(624);
      logInfo(`setOriginMaterialSize>adjustMaxMin final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0101
     * @tc.name      Image_ComputeFeatureFlow_0101
     * @tc.desc      ComputeFeature call flow endDrag > onDragMaterial > onDragMaterial > setFontSize > setFontSize k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0101 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.onDragMaterial(20, 0);
      subject.onDragMaterial(105, 10);
      subject.setFontSize(120);
      subject.setFontSize(15);
      logInfo(`endDrag>onDragMaterial>onDragMaterial>set...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(125);
      logInfo(`endDrag>onDragMaterial>onDragMaterial>set...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`endDrag>onDragMaterial>onDragMaterial>set...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0102
     * @tc.name      Image_ComputeFeatureFlow_0102
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0102 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 3, 0, 100);
      subject.setMaterialAndImageSize(0, 1, 100, -1);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(0.5, PRECISION);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.y=${subject.y}`);
      expect(subject.y).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0103
     * @tc.name      Image_ComputeFeatureFlow_0103
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > adjustMaxMin > endDrag > endDrag keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0103 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(96, 5);
      subject.adjustMaxMin(672, 2);
      subject.endDrag();
      subject.endDrag();
      logInfo(`setOriginMaterialSize>adjustMaxMin>endDra...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(48);
      logInfo(`setOriginMaterialSize>adjustMaxMin>endDra...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0104
     * @tc.name      Image_ComputeFeatureFlow_0104
     * @tc.desc      ComputeFeature call flow adjustMaxMin > onDragMaterial > adjustMaxMin > endDrag > setFontSize ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0104 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(1056, 100);
      subject.onDragMaterial(105, 3);
      subject.adjustMaxMin(1056, 100);
      subject.endDrag();
      subject.setFontSize(24);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin>...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(105);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin>...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin>...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(24);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0105
     * @tc.name      Image_ComputeFeatureFlow_0105
     * @tc.desc      ComputeFeature call flow adjustMaxMin > startDrag > onDragMaterial > setFontSize keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0105 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(768, 1728);
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.onDragMaterial(-100, 40);
      subject.setFontSize(3.3);
      logInfo(`adjustMaxMin>startDrag>onDragMaterial>set...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`adjustMaxMin>startDrag>onDragMaterial>set...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(40);
      logInfo(`adjustMaxMin>startDrag>onDragMaterial>set...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(3.3, PRECISION);
      logInfo(`adjustMaxMin>startDrag>onDragMaterial>set...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.LEFT_BOTTOM);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0106
     * @tc.name      Image_ComputeFeatureFlow_0106
     * @tc.desc      ComputeFeature call flow startDrag > endDrag > onDragMaterial > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0106 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.endDrag();
      subject.onDragMaterial(40, 0);
      subject.endDrag();
      logInfo(`startDrag>endDrag>onDragMaterial>endDrag ...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0107
     * @tc.name      Image_ComputeFeatureFlow_0107
     * @tc.desc      ComputeFeature call flow endDrag > adjustMaxMin > setFontSize > setFontSize > setMaterialAndImag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0107 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.adjustMaxMin(100, 2);
      subject.setFontSize(15);
      subject.setFontSize(60);
      subject.setMaterialAndImageSize(3, 3, 100, 0);
      logInfo(`endDrag>adjustMaxMin>setFontSize>setFontS...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`endDrag>adjustMaxMin>setFontSize>setFontS...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`endDrag>adjustMaxMin>setFontSize>setFontS...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`endDrag>adjustMaxMin>setFontSize>setFontS...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`endDrag>adjustMaxMin>setFontSize>setFontS...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(1.5, PRECISION);
      logInfo(`endDrag>adjustMaxMin>setFontSize>setFontS...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0108
     * @tc.name      Image_ComputeFeatureFlow_0108
     * @tc.desc      ComputeFeature call flow onDragMaterial > onDragMaterial > setFontSize > startDrag keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0108 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(100, -100);
      subject.onDragMaterial(73, 40);
      subject.setFontSize(195);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(173);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-60);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(195);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_BOTTOM);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.dragStartFontSize=${subject.dragStartFontSize}`);
      expect(subject.dragStartFontSize).assertEqual(195);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(173);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0109
     * @tc.name      Image_ComputeFeatureFlow_0109
     * @tc.desc      ComputeFeature call flow adjustMaxMin > startDrag > adjustMaxMin > setOriginMaterialSize > start...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0109 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(1632, 0);
      subject.startDrag(NodeType.RIGHT_TOP);
      subject.adjustMaxMin(1440, 192);
      subject.setOriginMaterialSize(192, 60);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      logInfo(`adjustMaxMin>startDrag>adjustMaxMin>setOr...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(192);
      logInfo(`adjustMaxMin>startDrag>adjustMaxMin>setOr...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`adjustMaxMin>startDrag>adjustMaxMin>setOr...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(96);
      logInfo(`adjustMaxMin>startDrag>adjustMaxMin>setOr...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`adjustMaxMin>startDrag>adjustMaxMin>setOr...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.CENTER_MATERIAL);
      logInfo(`adjustMaxMin>startDrag>adjustMaxMin>setOr...: subject.dragStartWidth=${subject.dragStartWidth}`);
      expect(subject.dragStartWidth).assertEqual(192);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0110
     * @tc.name      Image_ComputeFeatureFlow_0110
     * @tc.desc      ComputeFeature call flow endDrag > endDrag > onDragMaterial > onDragMaterial > startDrag keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0110 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.endDrag();
      subject.onDragMaterial(-100, 55);
      subject.onDragMaterial(1, 6);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      logInfo(`endDrag>endDrag>onDragMaterial>onDragMate...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-99);
      logInfo(`endDrag>endDrag>onDragMaterial>onDragMate...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(61);
      logInfo(`endDrag>endDrag>onDragMaterial>onDragMate...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.CENTER_MATERIAL);
      logInfo(`endDrag>endDrag>onDragMaterial>onDragMate...: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(-99);
      logInfo(`endDrag>endDrag>onDragMaterial>onDragMate...: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(61);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0111
     * @tc.name      Image_ComputeFeatureFlow_0111
     * @tc.desc      ComputeFeature call flow setFontSize > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0111 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(174);
      subject.endDrag();
      logInfo(`setFontSize>endDrag final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(174);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0112
     * @tc.name      Image_ComputeFeatureFlow_0112
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setOriginMaterialSize > setFontSize > setMateri...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0112 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 10);
      subject.setOriginMaterialSize(288, 45);
      subject.setFontSize(6.55);
      subject.setMaterialAndImageSize(2, -1, 0, 2);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(288);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0113
     * @tc.name      Image_ComputeFeatureFlow_0113
     * @tc.desc      ComputeFeature call flow endDrag > endDrag > setMaterialAndImageSize > endDrag > adjustMaxMin ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0113 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.endDrag();
      subject.setMaterialAndImageSize(100, 3, 100, -1);
      subject.endDrag();
      subject.adjustMaxMin(576, 0);
      logInfo(`endDrag>endDrag>setMaterialAndImageSize>e...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`endDrag>endDrag>setMaterialAndImageSize>e...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`endDrag>endDrag>setMaterialAndImageSize>e...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`endDrag>endDrag>setMaterialAndImageSize>e...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`endDrag>endDrag>setMaterialAndImageSize>e...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(100);
      logInfo(`endDrag>endDrag>setMaterialAndImageSize>e...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0114
     * @tc.name      Image_ComputeFeatureFlow_0114
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setMaterialAndImageSize > setMaterialAndImageSi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0114 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 75);
      subject.setMaterialAndImageSize(2, 2, 1, 2);
      subject.setMaterialAndImageSize(0, 5, -1, 100);
      subject.setMaterialAndImageSize(0, 1, 100, -1);
      subject.startDrag(NodeType.RIGHT_TOP);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0115
     * @tc.name      Image_ComputeFeatureFlow_0115
     * @tc.desc      ComputeFeature call flow startDrag > setMaterialAndImageSize > setOriginMaterialSize keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0115 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.setMaterialAndImageSize(100, 100, 3, 3);
      subject.setOriginMaterialSize(0, 1);
      logInfo(`startDrag>setMaterialAndImageSize>setOrig...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`startDrag>setMaterialAndImageSize>setOrig...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`startDrag>setMaterialAndImageSize>setOrig...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`startDrag>setMaterialAndImageSize>setOrig...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`startDrag>setMaterialAndImageSize>setOrig...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`startDrag>setMaterialAndImageSize>setOrig...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0116
     * @tc.name      Image_ComputeFeatureFlow_0116
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setFontSize > adjustMaxMin > setFontSize > ad...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0116 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 0, 5, 1);
      subject.setFontSize(124);
      subject.adjustMaxMin(768, 1824);
      subject.setFontSize(18);
      subject.adjustMaxMin(864, 288);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0117
     * @tc.name      Image_ComputeFeatureFlow_0117
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > adjustMaxMin > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0117 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 2, 2, 2);
      subject.adjustMaxMin(0, 1728);
      subject.startDrag(NodeType.LEFT_BOTTOM);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>star...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>star...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>star...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>star...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>star...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>star...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0117 end`);
    });
  });
}
