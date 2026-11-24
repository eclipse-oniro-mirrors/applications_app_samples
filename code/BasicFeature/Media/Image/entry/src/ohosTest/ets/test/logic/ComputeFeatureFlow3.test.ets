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

/** Logic checks for ComputeFeature flow (57 cases). */
export default function computeFeatureFlow3Test(): void {
  describe('ComputeFeatureFlow3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0118
     * @tc.name      Image_ComputeFeatureFlow_0118
     * @tc.desc      ComputeFeature call flow setFontSize > startDrag > setOriginMaterialSize > onDragMaterial > setF...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0118 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(154);
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.setOriginMaterialSize(96, -100);
      subject.onDragMaterial(25, 15);
      subject.setFontSize(144);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(96);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(48);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(25);
      logInfo(`setFontSize>startDrag>setOriginMaterialSi...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0119
     * @tc.name      Image_ComputeFeatureFlow_0119
     * @tc.desc      ComputeFeature call flow adjustMaxMin > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0119 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(768, 384);
      subject.setMaterialAndImageSize(3, 10, 5, 10);
      logInfo(`adjustMaxMin>setMaterialAndImageSize final: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`adjustMaxMin>setMaterialAndImageSize final: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`adjustMaxMin>setMaterialAndImageSize final: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(5);
      logInfo(`adjustMaxMin>setMaterialAndImageSize final: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`adjustMaxMin>setMaterialAndImageSize final: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`adjustMaxMin>setMaterialAndImageSize final: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0120
     * @tc.name      Image_ComputeFeatureFlow_0120
     * @tc.desc      ComputeFeature call flow onDragMaterial > setFontSize > onDragMaterial > onDragMaterial keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0120 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(45, 80);
      subject.setFontSize(85);
      subject.onDragMaterial(1, 182);
      subject.onDragMaterial(30, 55);
      logInfo(`onDragMaterial>setFontSize>onDragMaterial...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(76);
      logInfo(`onDragMaterial>setFontSize>onDragMaterial...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(317);
      logInfo(`onDragMaterial>setFontSize>onDragMaterial...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0121
     * @tc.name      Image_ComputeFeatureFlow_0121
     * @tc.desc      ComputeFeature call flow startDrag > setOriginMaterialSize > endDrag > setOriginMaterialSize kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0121 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_TOP);
      subject.setOriginMaterialSize(672, 100);
      subject.endDrag();
      subject.setOriginMaterialSize(360, -100);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`startDrag>setOriginMaterialSize>endDrag>s...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0122
     * @tc.name      Image_ComputeFeatureFlow_0122
     * @tc.desc      ComputeFeature call flow setFontSize > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0122 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-36);
      subject.adjustMaxMin(1920, 1824);
      logInfo(`setFontSize>adjustMaxMin final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-36);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0123
     * @tc.name      Image_ComputeFeatureFlow_0123
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setMaterialAndImageSize > endDrag > onDragMat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0123 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 2, 3, 3);
      subject.setMaterialAndImageSize(3, 5, 100, 3);
      subject.endDrag();
      subject.onDragMaterial(55, -100);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(5);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0124
     * @tc.name      Image_ComputeFeatureFlow_0124
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setOriginMaterialSize > startDrag keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0124 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 3, 2, 5);
      subject.setOriginMaterialSize(864, 60);
      subject.startDrag(NodeType.LEFT_BOTTOM);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(5);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(864);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0125
     * @tc.name      Image_ComputeFeatureFlow_0125
     * @tc.desc      ComputeFeature call flow endDrag > setFontSize > adjustMaxMin > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0125 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setFontSize(18);
      subject.adjustMaxMin(0, 576);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      logInfo(`endDrag>setFontSize>adjustMaxMin>startDra...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(18);
      logInfo(`endDrag>setFontSize>adjustMaxMin>startDra...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_BOTTOM);
      logInfo(`endDrag>setFontSize>adjustMaxMin>startDra...: subject.dragStartFontSize=${subject.dragStartFontSize}`);
      expect(subject.dragStartFontSize).assertEqual(18);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0126
     * @tc.name      Image_ComputeFeatureFlow_0126
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0126 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(384, -100);
      subject.setMaterialAndImageSize(100, 2, 10, 1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(384);
      logInfo(`setOriginMaterialSize>setMaterialAndImage...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0127
     * @tc.name      Image_ComputeFeatureFlow_0127
     * @tc.desc      ComputeFeature call flow endDrag > setOriginMaterialSize > setOriginMaterialSize keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0127 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setOriginMaterialSize(1344, 86.32);
      subject.setOriginMaterialSize(1440, 35);
      logInfo(`endDrag>setOriginMaterialSize>setOriginMa...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1440);
      logInfo(`endDrag>setOriginMaterialSize>setOriginMa...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`endDrag>setOriginMaterialSize>setOriginMa...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(720);
      logInfo(`endDrag>setOriginMaterialSize>setOriginMa...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0128
     * @tc.name      Image_ComputeFeatureFlow_0128
     * @tc.desc      ComputeFeature call flow setFontSize > startDrag > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0128 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(135);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.adjustMaxMin(0, 100);
      logInfo(`setFontSize>startDrag>adjustMaxMin final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(135);
      logInfo(`setFontSize>startDrag>adjustMaxMin final: subject.dragStartFontSize=${subject.dragStartFontSize}`);
      expect(subject.dragStartFontSize).assertEqual(135);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0129
     * @tc.name      Image_ComputeFeatureFlow_0129
     * @tc.desc      ComputeFeature call flow endDrag > endDrag > onDragMaterial > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0129 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.endDrag();
      subject.onDragMaterial(100, 105);
      subject.adjustMaxMin(100, 720);
      logInfo(`endDrag>endDrag>onDragMaterial>adjustMaxM...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(100);
      logInfo(`endDrag>endDrag>onDragMaterial>adjustMaxM...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(105);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0130
     * @tc.name      Image_ComputeFeatureFlow_0130
     * @tc.desc      ComputeFeature call flow endDrag > setFontSize > startDrag > setMaterialAndImageSize keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0130 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setFontSize(115);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.setMaterialAndImageSize(-1, 0, -1, 2);
      logInfo(`endDrag>setFontSize>startDrag>setMaterial...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`endDrag>setFontSize>startDrag>setMaterial...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`endDrag>setFontSize>startDrag>setMaterial...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`endDrag>setFontSize>startDrag>setMaterial...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`endDrag>setFontSize>startDrag>setMaterial...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(-0.5, PRECISION);
      logInfo(`endDrag>setFontSize>startDrag>setMaterial...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0131
     * @tc.name      Image_ComputeFeatureFlow_0131
     * @tc.desc      ComputeFeature call flow onDragMaterial > onDragMaterial > setFontSize > setOriginMaterialSize >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0131 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(30, -1);
      subject.onDragMaterial(-37, 45);
      subject.setFontSize(185);
      subject.setOriginMaterialSize(1344, 60);
      subject.onDragMaterial(25, 70);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1344);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(672);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(18);
      logInfo(`onDragMaterial>onDragMaterial>setFontSize...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(114);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0132
     * @tc.name      Image_ComputeFeatureFlow_0132
     * @tc.desc      ComputeFeature call flow onDragMaterial > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0132 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(90, -10);
      subject.setFontSize(150);
      logInfo(`onDragMaterial>setFontSize final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(90);
      logInfo(`onDragMaterial>setFontSize final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-10);
      logInfo(`onDragMaterial>setFontSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(150);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0133
     * @tc.name      Image_ComputeFeatureFlow_0133
     * @tc.desc      ComputeFeature call flow endDrag > onDragMaterial > endDrag > endDrag > onDragMaterial keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0133 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.onDragMaterial(10, 6);
      subject.endDrag();
      subject.endDrag();
      subject.onDragMaterial(25, 15);
      logInfo(`endDrag>onDragMaterial>endDrag>endDrag>on...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(35);
      logInfo(`endDrag>onDragMaterial>endDrag>endDrag>on...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(21);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0134
     * @tc.name      Image_ComputeFeatureFlow_0134
     * @tc.desc      ComputeFeature call flow setFontSize > endDrag > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0134 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(75);
      subject.endDrag();
      subject.onDragMaterial(1, 45);
      logInfo(`setFontSize>endDrag>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`setFontSize>endDrag>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`setFontSize>endDrag>onDragMaterial final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0135
     * @tc.name      Image_ComputeFeatureFlow_0135
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > onDragMaterial > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0135 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(192, -100);
      subject.onDragMaterial(25, 10);
      subject.endDrag();
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(192);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(96);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(25);
      logInfo(`setOriginMaterialSize>onDragMaterial>endD...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0136
     * @tc.name      Image_ComputeFeatureFlow_0136
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > endDrag > onDragMaterial > onDragMaterial kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0136 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 2, 5, -1);
      subject.endDrag();
      subject.onDragMaterial(65, 95);
      subject.onDragMaterial(50, -10);
      logInfo(`setMaterialAndImageSize>endDrag>onDragMat...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>endDrag>onDragMat...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>endDrag>onDragMat...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>endDrag>onDragMat...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>endDrag>onDragMat...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>endDrag>onDragMat...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0137
     * @tc.name      Image_ComputeFeatureFlow_0137
     * @tc.desc      ComputeFeature call flow endDrag > setFontSize > setFontSize > setFontSize > setOriginMaterialSi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0137 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setFontSize(-31);
      subject.setFontSize(65);
      subject.setFontSize(88.26);
      subject.setOriginMaterialSize(-1, 35);
      logInfo(`endDrag>setFontSize>setFontSize>setFontSi...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`endDrag>setFontSize>setFontSize>setFontSi...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(35);
      logInfo(`endDrag>setFontSize>setFontSize>setFontSi...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`endDrag>setFontSize>setFontSize>setFontSi...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(17.5, PRECISION);
      logInfo(`endDrag>setFontSize>setFontSize>setFontSi...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(88.26, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0138
     * @tc.name      Image_ComputeFeatureFlow_0138
     * @tc.desc      ComputeFeature call flow onDragMaterial > startDrag > onDragMaterial > setFontSize keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0138 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 55);
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.onDragMaterial(25, 0);
      subject.setFontSize(6.55);
      logInfo(`onDragMaterial>startDrag>onDragMaterial>s...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(75);
      logInfo(`onDragMaterial>startDrag>onDragMaterial>s...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`onDragMaterial>startDrag>onDragMaterial>s...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(6.55, PRECISION);
      logInfo(`onDragMaterial>startDrag>onDragMaterial>s...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.LEFT_BOTTOM);
      logInfo(`onDragMaterial>startDrag>onDragMaterial>s...: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(50);
      logInfo(`onDragMaterial>startDrag>onDragMaterial>s...: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(55);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0139
     * @tc.name      Image_ComputeFeatureFlow_0139
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0139 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(672, -100);
      subject.setFontSize(185);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(672);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(336);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(185);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0140
     * @tc.name      Image_ComputeFeatureFlow_0140
     * @tc.desc      ComputeFeature call flow onDragMaterial > setOriginMaterialSize > setOriginMaterialSize keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0140 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 85);
      subject.setOriginMaterialSize(0, 85);
      subject.setOriginMaterialSize(480, 1);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(480);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(240);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(0.5, PRECISION);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0141
     * @tc.name      Image_ComputeFeatureFlow_0141
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > endDrag > setMaterialAndImageSize > onDragMater...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0141 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(360, 40);
      subject.endDrag();
      subject.setMaterialAndImageSize(5, 1, 2, 2);
      subject.onDragMaterial(95, 1);
      subject.onDragMaterial(-100, 6);
      logInfo(`setOriginMaterialSize>endDrag>setMaterial...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(5);
      logInfo(`setOriginMaterialSize>endDrag>setMaterial...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setOriginMaterialSize>endDrag>setMaterial...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setOriginMaterialSize>endDrag>setMaterial...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setOriginMaterialSize>endDrag>setMaterial...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`setOriginMaterialSize>endDrag>setMaterial...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(40);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0142
     * @tc.name      Image_ComputeFeatureFlow_0142
     * @tc.desc      ComputeFeature call flow onDragMaterial > setOriginMaterialSize > setOriginMaterialSize keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0142 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 50);
      subject.setOriginMaterialSize(672, 100);
      subject.setOriginMaterialSize(360, 50);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial>setOriginMaterialSize>setO...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0143
     * @tc.name      Image_ComputeFeatureFlow_0143
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0143 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, -1, 10, 1);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0144
     * @tc.name      Image_ComputeFeatureFlow_0144
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setMaterialAndImageSize > onDragMaterial > se...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0144 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 3, 100, -1);
      subject.setMaterialAndImageSize(100, 100, 2, 1);
      subject.onDragMaterial(25, -100);
      subject.setOriginMaterialSize(1824, -100);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1824);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0145
     * @tc.name      Image_ComputeFeatureFlow_0145
     * @tc.desc      ComputeFeature call flow adjustMaxMin > adjustMaxMin > startDrag > setOriginMaterialSize > endDr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0145 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(360, 10);
      subject.adjustMaxMin(864, 1824);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.setOriginMaterialSize(1344, 2);
      subject.endDrag();
      logInfo(`adjustMaxMin>adjustMaxMin>startDrag>setOr...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1344);
      logInfo(`adjustMaxMin>adjustMaxMin>startDrag>setOr...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(2);
      logInfo(`adjustMaxMin>adjustMaxMin>startDrag>setOr...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(672);
      logInfo(`adjustMaxMin>adjustMaxMin>startDrag>setOr...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0146
     * @tc.name      Image_ComputeFeatureFlow_0146
     * @tc.desc      ComputeFeature call flow setFontSize > onDragMaterial > endDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0146 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(173);
      subject.onDragMaterial(-100, 85);
      subject.endDrag();
      subject.startDrag(NodeType.LEFT_TOP);
      logInfo(`setFontSize>onDragMaterial>endDrag>startD...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`setFontSize>onDragMaterial>endDrag>startD...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(85);
      logInfo(`setFontSize>onDragMaterial>endDrag>startD...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(173);
      logInfo(`setFontSize>onDragMaterial>endDrag>startD...: subject.dragStartFontSize=${subject.dragStartFontSize}`);
      expect(subject.dragStartFontSize).assertEqual(173);
      logInfo(`setFontSize>onDragMaterial>endDrag>startD...: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(-100);
      logInfo(`setFontSize>onDragMaterial>endDrag>startD...: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(85);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0147
     * @tc.name      Image_ComputeFeatureFlow_0147
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > startDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0147 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, -100);
      subject.startDrag(NodeType.LEFT_TOP);
      subject.endDrag();
      logInfo(`setOriginMaterialSize>startDrag>endDrag f...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize>startDrag>endDrag f...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize>startDrag>endDrag f...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertClose(-0.5, PRECISION);
      logInfo(`setOriginMaterialSize>startDrag>endDrag f...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0148
     * @tc.name      Image_ComputeFeatureFlow_0148
     * @tc.desc      ComputeFeature call flow setFontSize > setOriginMaterialSize > setMaterialAndImageSize keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0148 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-28);
      subject.setOriginMaterialSize(720, 5);
      subject.setMaterialAndImageSize(10, -1, -1, -1);
      logInfo(`setFontSize>setOriginMaterialSize>setMate...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setFontSize>setOriginMaterialSize>setMate...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setFontSize>setOriginMaterialSize>setMate...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setFontSize>setOriginMaterialSize>setMate...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setFontSize>setOriginMaterialSize>setMate...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(720);
      logInfo(`setFontSize>setOriginMaterialSize>setMate...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0149
     * @tc.name      Image_ComputeFeatureFlow_0149
     * @tc.desc      ComputeFeature call flow endDrag > setMaterialAndImageSize > endDrag > startDrag keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0149 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setMaterialAndImageSize(100, 100, 2, 1);
      subject.endDrag();
      subject.startDrag(NodeType.LEFT_BOTTOM);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0150
     * @tc.name      Image_ComputeFeatureFlow_0150
     * @tc.desc      ComputeFeature call flow endDrag > setOriginMaterialSize > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0150 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setOriginMaterialSize(384, 100);
      subject.setFontSize(-31);
      logInfo(`endDrag>setOriginMaterialSize>setFontSize...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(384);
      logInfo(`endDrag>setOriginMaterialSize>setFontSize...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`endDrag>setOriginMaterialSize>setFontSize...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(192);
      logInfo(`endDrag>setOriginMaterialSize>setFontSize...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`endDrag>setOriginMaterialSize>setFontSize...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-31);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0151
     * @tc.name      Image_ComputeFeatureFlow_0151
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setOriginMaterialSize > onDragMaterial > setM...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0151 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 10, -1, 100);
      subject.setOriginMaterialSize(768, 83);
      subject.onDragMaterial(-37, 45);
      subject.setMaterialAndImageSize(5, 2, 2, 2);
      subject.setMaterialAndImageSize(0, 5, -1, 100);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(5);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(768);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0152
     * @tc.name      Image_ComputeFeatureFlow_0152
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0152 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 0, 2);
      subject.setMaterialAndImageSize(10, -1, 5, 10);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>setMaterialAndIma...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0153
     * @tc.name      Image_ComputeFeatureFlow_0153
     * @tc.desc      ComputeFeature call flow endDrag > setOriginMaterialSize > startDrag > startDrag > endDrag keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0153 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setOriginMaterialSize(0, 75);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.endDrag();
      logInfo(`endDrag>setOriginMaterialSize>startDrag>s...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(75);
      logInfo(`endDrag>setOriginMaterialSize>startDrag>s...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(37.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0154
     * @tc.name      Image_ComputeFeatureFlow_0154
     * @tc.desc      ComputeFeature call flow onDragMaterial > startDrag > setOriginMaterialSize > setOriginMaterialS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0154 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 182);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.setOriginMaterialSize(1056, 25);
      subject.setOriginMaterialSize(0, 83);
      subject.setFontSize(20);
      logInfo(`onDragMaterial>startDrag>setOriginMateria...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`onDragMaterial>startDrag>setOriginMateria...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(41.5, PRECISION);
      logInfo(`onDragMaterial>startDrag>setOriginMateria...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(1);
      logInfo(`onDragMaterial>startDrag>setOriginMateria...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(182);
      logInfo(`onDragMaterial>startDrag>setOriginMateria...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(20);
      logInfo(`onDragMaterial>startDrag>setOriginMateria...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.CENTER_MATERIAL);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0155
     * @tc.name      Image_ComputeFeatureFlow_0155
     * @tc.desc      ComputeFeature call flow onDragMaterial > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0155 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-1, -100);
      subject.startDrag(NodeType.RIGHT_TOP);
      logInfo(`onDragMaterial>startDrag final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-1);
      logInfo(`onDragMaterial>startDrag final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`onDragMaterial>startDrag final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`onDragMaterial>startDrag final: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(-1);
      logInfo(`onDragMaterial>startDrag final: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0156
     * @tc.name      Image_ComputeFeatureFlow_0156
     * @tc.desc      ComputeFeature call flow adjustMaxMin > adjustMaxMin > setFontSize > setFontSize keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0156 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(0, 1824);
      subject.adjustMaxMin(1056, 1536);
      subject.setFontSize(49);
      subject.setFontSize(173);
      logInfo(`adjustMaxMin>adjustMaxMin>setFontSize>set...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(173);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0157
     * @tc.name      Image_ComputeFeatureFlow_0157
     * @tc.desc      ComputeFeature call flow adjustMaxMin > setFontSize > setMaterialAndImageSize > setFontSize > se...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0157 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(720, 1080);
      subject.setFontSize(123);
      subject.setMaterialAndImageSize(10, -1, 3, 5);
      subject.setFontSize(53);
      subject.setFontSize(-7);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(-1);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(5);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`adjustMaxMin>setFontSize>setMaterialAndIm...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0158
     * @tc.name      Image_ComputeFeatureFlow_0158
     * @tc.desc      ComputeFeature call flow setFontSize > setOriginMaterialSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0158 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(45);
      subject.setOriginMaterialSize(1344, 90);
      logInfo(`setFontSize>setOriginMaterialSize final: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1344);
      logInfo(`setFontSize>setOriginMaterialSize final: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(90);
      logInfo(`setFontSize>setOriginMaterialSize final: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(672);
      logInfo(`setFontSize>setOriginMaterialSize final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`setFontSize>setOriginMaterialSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0159
     * @tc.name      Image_ComputeFeatureFlow_0159
     * @tc.desc      ComputeFeature call flow setFontSize > setMaterialAndImageSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0159 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(-18);
      subject.setMaterialAndImageSize(-1, 100, 3, 100);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(3);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setFontSize>setMaterialAndImageSize final: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0160
     * @tc.name      Image_ComputeFeatureFlow_0160
     * @tc.desc      ComputeFeature call flow adjustMaxMin > adjustMaxMin > endDrag > onDragMaterial > onDragMaterial...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0160 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(0, 192);
      subject.adjustMaxMin(1632, 720);
      subject.endDrag();
      subject.onDragMaterial(80, 105);
      subject.onDragMaterial(73, -100);
      logInfo(`adjustMaxMin>adjustMaxMin>endDrag>onDragM...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(153);
      logInfo(`adjustMaxMin>adjustMaxMin>endDrag>onDragM...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0161
     * @tc.name      Image_ComputeFeatureFlow_0161
     * @tc.desc      ComputeFeature call flow adjustMaxMin > setMaterialAndImageSize > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0161 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(1920, 768);
      subject.setMaterialAndImageSize(1, 2, 2, 2);
      subject.startDrag(NodeType.LEFT_TOP);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0162
     * @tc.name      Image_ComputeFeatureFlow_0162
     * @tc.desc      ComputeFeature call flow endDrag > onDragMaterial > endDrag > endDrag > onDragMaterial keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0162 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.onDragMaterial(75, 182);
      subject.endDrag();
      subject.endDrag();
      subject.onDragMaterial(-1, 105);
      logInfo(`endDrag>onDragMaterial>endDrag>endDrag>on...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(74);
      logInfo(`endDrag>onDragMaterial>endDrag>endDrag>on...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(287);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0163
     * @tc.name      Image_ComputeFeatureFlow_0163
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setOriginMaterialSize > endDrag > endDrag > o...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0163 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 1, 2);
      subject.setOriginMaterialSize(1344, 65);
      subject.endDrag();
      subject.endDrag();
      subject.onDragMaterial(85, 6);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1344);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(65);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0164
     * @tc.name      Image_ComputeFeatureFlow_0164
     * @tc.desc      ComputeFeature call flow onDragMaterial > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0164 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(73, 95);
      subject.startDrag(NodeType.RIGHT_TOP);
      logInfo(`onDragMaterial>startDrag final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(73);
      logInfo(`onDragMaterial>startDrag final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(95);
      logInfo(`onDragMaterial>startDrag final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`onDragMaterial>startDrag final: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(73);
      logInfo(`onDragMaterial>startDrag final: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0165
     * @tc.name      Image_ComputeFeatureFlow_0165
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0165 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(768, 100);
      subject.setFontSize(86.96);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(768);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(384);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`setOriginMaterialSize>setFontSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(86.96, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0166
     * @tc.name      Image_ComputeFeatureFlow_0166
     * @tc.desc      ComputeFeature call flow adjustMaxMin > endDrag > setFontSize > endDrag > setOriginMaterialSize ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0166 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(0, 720);
      subject.endDrag();
      subject.setFontSize(-97);
      subject.endDrag();
      subject.setOriginMaterialSize(1536, 0);
      logInfo(`adjustMaxMin>endDrag>setFontSize>endDrag>...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1536);
      logInfo(`adjustMaxMin>endDrag>setFontSize>endDrag>...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(768);
      logInfo(`adjustMaxMin>endDrag>setFontSize>endDrag>...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-97);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0167
     * @tc.name      Image_ComputeFeatureFlow_0167
     * @tc.desc      ComputeFeature call flow endDrag > setMaterialAndImageSize > setOriginMaterialSize > onDragMater...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0167 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setMaterialAndImageSize(-1, 1, 10, 0);
      subject.setOriginMaterialSize(864, -1);
      subject.onDragMaterial(10, 6);
      logInfo(`endDrag>setMaterialAndImageSize>setOrigin...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`endDrag>setMaterialAndImageSize>setOrigin...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`endDrag>setMaterialAndImageSize>setOrigin...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`endDrag>setMaterialAndImageSize>setOrigin...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(864);
      logInfo(`endDrag>setMaterialAndImageSize>setOrigin...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`endDrag>setMaterialAndImageSize>setOrigin...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0168
     * @tc.name      Image_ComputeFeatureFlow_0168
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0168 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(10, -100);
      subject.startDrag(NodeType.LEFT_TOP);
      logInfo(`setOriginMaterialSize>startDrag final: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(10);
      logInfo(`setOriginMaterialSize>startDrag final: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize>startDrag final: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(5);
      logInfo(`setOriginMaterialSize>startDrag final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`setOriginMaterialSize>startDrag final: subject.dragStartWidth=${subject.dragStartWidth}`);
      expect(subject.dragStartWidth).assertEqual(10);
      logInfo(`setOriginMaterialSize>startDrag final: subject.dragStartHeight=${subject.dragStartHeight}`);
      expect(subject.dragStartHeight).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0169
     * @tc.name      Image_ComputeFeatureFlow_0169
     * @tc.desc      ComputeFeature call flow adjustMaxMin > startDrag > onDragMaterial > startDrag > startDrag keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0169 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(0, 360);
      subject.startDrag(NodeType.RIGHT_TOP);
      subject.onDragMaterial(-100, 6);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      logInfo(`adjustMaxMin>startDrag>onDragMaterial>sta...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`adjustMaxMin>startDrag>onDragMaterial>sta...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`adjustMaxMin>startDrag>onDragMaterial>sta...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.CENTER_MATERIAL);
      logInfo(`adjustMaxMin>startDrag>onDragMaterial>sta...: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(-100);
      logInfo(`adjustMaxMin>startDrag>onDragMaterial>sta...: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0170
     * @tc.name      Image_ComputeFeatureFlow_0170
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setOriginMaterialSize > onDragMaterial keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0170 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(768, 100);
      subject.setOriginMaterialSize(672, -100);
      subject.onDragMaterial(-100, -100);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(672);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(336);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0171
     * @tc.name      Image_ComputeFeatureFlow_0171
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > startDrag > setOriginMaterialSize keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0171 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(-1, 35);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.setOriginMaterialSize(0, 85);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(85);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(42.5, PRECISION);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_BOTTOM);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.dragStartWidth=${subject.dragStartWidth}`);
      expect(subject.dragStartWidth).assertEqual(-1);
      logInfo(`setOriginMaterialSize>startDrag>setOrigin...: subject.dragStartHeight=${subject.dragStartHeight}`);
      expect(subject.dragStartHeight).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0172
     * @tc.name      Image_ComputeFeatureFlow_0172
     * @tc.desc      ComputeFeature call flow setFontSize > setFontSize > setOriginMaterialSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0172 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(23);
      subject.setFontSize(199);
      subject.setOriginMaterialSize(0, -1);
      logInfo(`setFontSize>setFontSize>setOriginMaterial...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-1);
      logInfo(`setFontSize>setFontSize>setOriginMaterial...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(-0.5, PRECISION);
      logInfo(`setFontSize>setFontSize>setOriginMaterial...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(199);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0173
     * @tc.name      Image_ComputeFeatureFlow_0173
     * @tc.desc      ComputeFeature call flow startDrag > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0173 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_TOP);
      subject.onDragMaterial(-100, 50);
      logInfo(`startDrag>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-100);
      logInfo(`startDrag>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0174
     * @tc.name      Image_ComputeFeatureFlow_0174
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setOriginMaterialSize > onDragMaterial > adjust...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0174 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(96, 25);
      subject.setOriginMaterialSize(1920, -100);
      subject.onDragMaterial(35, 35);
      subject.adjustMaxMin(-1, 288);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-50);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(960);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(35);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(35);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0174 end`);
    });
  });
}
