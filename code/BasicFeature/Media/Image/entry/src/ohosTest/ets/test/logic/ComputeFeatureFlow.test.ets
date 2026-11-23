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

/** Logic checks for ComputeFeature flow (59 cases). */
export default function computeFeatureFlowTest(): void {
  describe('ComputeFeatureFlowTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0001
     * @tc.name      Image_ComputeFeatureFlow_0001
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > adjustMaxMin > setMaterialAndImageSize > setO...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0001 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 0, 5, 0);
      subject.adjustMaxMin(672, 384);
      subject.setMaterialAndImageSize(2, 2, 2, 1);
      subject.setOriginMaterialSize(96, 95);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setM...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setM...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setM...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setM...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setM...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(96);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>setM...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(95);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0002
     * @tc.name      Image_ComputeFeatureFlow_0002
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > onDragMaterial > endDrag > setFontSize keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0002 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(5, 1, 2, -1);
      subject.onDragMaterial(55, 15);
      subject.endDrag();
      subject.setFontSize(42);
      logInfo(`setMaterialAndImageSize>onDragMaterial>en...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(5);
      logInfo(`setMaterialAndImageSize>onDragMaterial>en...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>onDragMaterial>en...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>en...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>onDragMaterial>en...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>en...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0003
     * @tc.name      Image_ComputeFeatureFlow_0003
     * @tc.desc      ComputeFeature call flow adjustMaxMin > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0003 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(1824, 1824);
      subject.onDragMaterial(105, 80);
      logInfo(`adjustMaxMin>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(105);
      logInfo(`adjustMaxMin>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0004
     * @tc.name      Image_ComputeFeatureFlow_0004
     * @tc.desc      ComputeFeature call flow endDrag > setOriginMaterialSize > adjustMaxMin > setOriginMaterialSize ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0004 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setOriginMaterialSize(672, 100);
      subject.adjustMaxMin(1152, 360);
      subject.setOriginMaterialSize(1248, 55);
      logInfo(`endDrag>setOriginMaterialSize>adjustMaxMi...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1248);
      logInfo(`endDrag>setOriginMaterialSize>adjustMaxMi...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(55);
      logInfo(`endDrag>setOriginMaterialSize>adjustMaxMi...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(624);
      logInfo(`endDrag>setOriginMaterialSize>adjustMaxMi...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0005
     * @tc.name      Image_ComputeFeatureFlow_0005
     * @tc.desc      ComputeFeature call flow setFontSize > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0005 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(115);
      subject.setFontSize(86.96);
      logInfo(`setFontSize>setFontSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(86.96, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0006
     * @tc.name      Image_ComputeFeatureFlow_0006
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > endDrag > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0006 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(0, 20);
      subject.endDrag();
      subject.setFontSize(80);
      logInfo(`setOriginMaterialSize>endDrag>setFontSize...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(20);
      logInfo(`setOriginMaterialSize>endDrag>setFontSize...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(10);
      logInfo(`setOriginMaterialSize>endDrag>setFontSize...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(80);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0007
     * @tc.name      Image_ComputeFeatureFlow_0007
     * @tc.desc      ComputeFeature call flow startDrag > setFontSize > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0007 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_TOP);
      subject.setFontSize(133);
      subject.startDrag(NodeType.LEFT_TOP);
      logInfo(`startDrag>setFontSize>startDrag final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(133);
      logInfo(`startDrag>setFontSize>startDrag final: subject.dragStartFontSize=${subject.dragStartFontSize}`);
      expect(subject.dragStartFontSize).assertEqual(133);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0008
     * @tc.name      Image_ComputeFeatureFlow_0008
     * @tc.desc      ComputeFeature call flow endDrag > startDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0008 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.startDrag(NodeType.LEFT_TOP);
      subject.startDrag(NodeType.RIGHT_TOP);
      logInfo(`endDrag>startDrag>startDrag final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0009
     * @tc.name      Image_ComputeFeatureFlow_0009
     * @tc.desc      ComputeFeature call flow setFontSize > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0009 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(199);
      subject.setFontSize(27);
      logInfo(`setFontSize>setFontSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(27);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0010
     * @tc.name      Image_ComputeFeatureFlow_0010
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0010 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1248, 50);
      subject.adjustMaxMin(96, 672);
      logInfo(`setOriginMaterialSize>adjustMaxMin final: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(624);
      logInfo(`setOriginMaterialSize>adjustMaxMin final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0011
     * @tc.name      Image_ComputeFeatureFlow_0011
     * @tc.desc      ComputeFeature call flow setFontSize > adjustMaxMin > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0011 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(67);
      subject.adjustMaxMin(0, 288);
      subject.adjustMaxMin(1824, 0);
      logInfo(`setFontSize>adjustMaxMin>adjustMaxMin final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(67);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0012
     * @tc.name      Image_ComputeFeatureFlow_0012
     * @tc.desc      ComputeFeature call flow setFontSize > adjustMaxMin > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0012 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(22.55);
      subject.adjustMaxMin(2, 0);
      subject.endDrag();
      logInfo(`setFontSize>adjustMaxMin>endDrag final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertClose(22.55, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0013
     * @tc.name      Image_ComputeFeatureFlow_0013
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setOriginMaterialSize > endDrag > setFontSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0013 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 3, 1, 10);
      subject.setOriginMaterialSize(288, -100);
      subject.endDrag();
      subject.setFontSize(2);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(288);
      logInfo(`setMaterialAndImageSize>setOriginMaterial...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0014
     * @tc.name      Image_ComputeFeatureFlow_0014
     * @tc.desc      ComputeFeature call flow endDrag > setOriginMaterialSize > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0014 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setOriginMaterialSize(720, 45);
      subject.endDrag();
      logInfo(`endDrag>setOriginMaterialSize>endDrag final: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(720);
      logInfo(`endDrag>setOriginMaterialSize>endDrag final: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`endDrag>setOriginMaterialSize>endDrag final: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(360);
      logInfo(`endDrag>setOriginMaterialSize>endDrag final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0015
     * @tc.name      Image_ComputeFeatureFlow_0015
     * @tc.desc      ComputeFeature call flow onDragMaterial > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0015 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(50, 55);
      subject.setFontSize(-82);
      logInfo(`onDragMaterial>setFontSize final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(50);
      logInfo(`onDragMaterial>setFontSize final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(55);
      logInfo(`onDragMaterial>setFontSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-82);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0016
     * @tc.name      Image_ComputeFeatureFlow_0016
     * @tc.desc      ComputeFeature call flow adjustMaxMin > setMaterialAndImageSize > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0016 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(288, 288);
      subject.setMaterialAndImageSize(5, 2, 2, 2);
      subject.startDrag(NodeType.LEFT_TOP);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(5);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setMaterialAndImageSize>star...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0017
     * @tc.name      Image_ComputeFeatureFlow_0017
     * @tc.desc      ComputeFeature call flow setFontSize > endDrag > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0017 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(3);
      subject.endDrag();
      subject.adjustMaxMin(0, 384);
      logInfo(`setFontSize>endDrag>adjustMaxMin final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0018
     * @tc.name      Image_ComputeFeatureFlow_0018
     * @tc.desc      ComputeFeature call flow startDrag > onDragMaterial > onDragMaterial > setMaterialAndImageSize k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0018 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.onDragMaterial(95, 1);
      subject.onDragMaterial(100, 105);
      subject.setMaterialAndImageSize(0, 2, 1, 5);
      logInfo(`startDrag>onDragMaterial>onDragMaterial>s...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`startDrag>onDragMaterial>onDragMaterial>s...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`startDrag>onDragMaterial>onDragMaterial>s...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(5);
      logInfo(`startDrag>onDragMaterial>onDragMaterial>s...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`startDrag>onDragMaterial>onDragMaterial>s...: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(1);
      logInfo(`startDrag>onDragMaterial>onDragMaterial>s...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0019
     * @tc.name      Image_ComputeFeatureFlow_0019
     * @tc.desc      ComputeFeature call flow startDrag > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0019 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.onDragMaterial(22, -100);
      logInfo(`startDrag>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(22);
      logInfo(`startDrag>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`startDrag>onDragMaterial final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.LEFT_BOTTOM);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0020
     * @tc.name      Image_ComputeFeatureFlow_0020
     * @tc.desc      ComputeFeature call flow onDragMaterial > onDragMaterial > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0020 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(105, 80);
      subject.onDragMaterial(73, -100);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      logInfo(`onDragMaterial>onDragMaterial>startDrag f...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(178);
      logInfo(`onDragMaterial>onDragMaterial>startDrag f...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-20);
      logInfo(`onDragMaterial>onDragMaterial>startDrag f...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.CENTER_MATERIAL);
      logInfo(`onDragMaterial>onDragMaterial>startDrag f...: subject.dragStartX=${subject.dragStartX}`);
      expect(subject.dragStartX).assertEqual(178);
      logInfo(`onDragMaterial>onDragMaterial>startDrag f...: subject.dragStartY=${subject.dragStartY}`);
      expect(subject.dragStartY).assertEqual(-20);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0021
     * @tc.name      Image_ComputeFeatureFlow_0021
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0021 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 10, 0, 5);
      subject.endDrag();
      logInfo(`setMaterialAndImageSize>endDrag final: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(5);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(5);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(1.5, PRECISION);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(5);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0022
     * @tc.name      Image_ComputeFeatureFlow_0022
     * @tc.desc      ComputeFeature call flow adjustMaxMin > onDragMaterial > adjustMaxMin > setOriginMaterialSize ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0022 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(1056, 100);
      subject.onDragMaterial(55, 15);
      subject.adjustMaxMin(0, 1728);
      subject.setOriginMaterialSize(960, 45);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin>...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(960);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin>...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin>...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(480);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin>...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin>...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(55);
      logInfo(`adjustMaxMin>onDragMaterial>adjustMaxMin>...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(15);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0023
     * @tc.name      Image_ComputeFeatureFlow_0023
     * @tc.desc      ComputeFeature call flow onDragMaterial > onDragMaterial > adjustMaxMin keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0023 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(1, 182);
      subject.onDragMaterial(105, -100);
      subject.adjustMaxMin(96, 1080);
      logInfo(`onDragMaterial>onDragMaterial>adjustMaxMi...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(106);
      logInfo(`onDragMaterial>onDragMaterial>adjustMaxMi...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(82);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0024
     * @tc.name      Image_ComputeFeatureFlow_0024
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > startDrag > startDrag > setMaterialAndImageSi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0024 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(3, 2, 10, 1);
      subject.startDrag(NodeType.RIGHT_TOP);
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.setMaterialAndImageSize(2, 5, 2, 2);
      logInfo(`setMaterialAndImageSize>startDrag>startDr...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>startDrag>startDr...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(5);
      logInfo(`setMaterialAndImageSize>startDrag>startDr...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>startDrag>startDr...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>startDrag>startDr...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>startDrag>startDr...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0025
     * @tc.name      Image_ComputeFeatureFlow_0025
     * @tc.desc      ComputeFeature call flow adjustMaxMin > startDrag > setFontSize > onDragMaterial keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0025 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(0, 192);
      subject.startDrag(NodeType.LEFT_BOTTOM);
      subject.setFontSize(50);
      subject.onDragMaterial(30, 70);
      logInfo(`adjustMaxMin>startDrag>setFontSize>onDrag...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(30);
      logInfo(`adjustMaxMin>startDrag>setFontSize>onDrag...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(70);
      logInfo(`adjustMaxMin>startDrag>setFontSize>onDrag...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(50);
      logInfo(`adjustMaxMin>startDrag>setFontSize>onDrag...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.LEFT_BOTTOM);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0026
     * @tc.name      Image_ComputeFeatureFlow_0026
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > onDragMaterial > setOriginMaterialSize keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0026 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 5, -1, 100);
      subject.onDragMaterial(70, -100);
      subject.setOriginMaterialSize(1440, -100);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(5);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1440);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setMaterialAndImageSize>onDragMaterial>se...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0027
     * @tc.name      Image_ComputeFeatureFlow_0027
     * @tc.desc      ComputeFeature call flow setFontSize > endDrag > setFontSize > endDrag > adjustMaxMin keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0027 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(6);
      subject.endDrag();
      subject.setFontSize(39);
      subject.endDrag();
      subject.adjustMaxMin(1, 0);
      logInfo(`setFontSize>endDrag>setFontSize>endDrag>a...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(39);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0028
     * @tc.name      Image_ComputeFeatureFlow_0028
     * @tc.desc      ComputeFeature call flow endDrag > adjustMaxMin > onDragMaterial > setOriginMaterialSize keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0028 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.adjustMaxMin(96, 672);
      subject.onDragMaterial(70, 25);
      subject.setOriginMaterialSize(1152, 83);
      logInfo(`endDrag>adjustMaxMin>onDragMaterial>setOr...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1152);
      logInfo(`endDrag>adjustMaxMin>onDragMaterial>setOr...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`endDrag>adjustMaxMin>onDragMaterial>setOr...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(576);
      logInfo(`endDrag>adjustMaxMin>onDragMaterial>setOr...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(41.5, PRECISION);
      logInfo(`endDrag>adjustMaxMin>onDragMaterial>setOr...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(70);
      logInfo(`endDrag>adjustMaxMin>onDragMaterial>setOr...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(25);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0029
     * @tc.name      Image_ComputeFeatureFlow_0029
     * @tc.desc      ComputeFeature call flow adjustMaxMin > setOriginMaterialSize > setMaterialAndImageSize > startD...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0029 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(-1, 0);
      subject.setOriginMaterialSize(672, -100);
      subject.setMaterialAndImageSize(2, 3, 0, 100);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(672);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`adjustMaxMin>setOriginMaterialSize>setMat...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0030
     * @tc.name      Image_ComputeFeatureFlow_0030
     * @tc.desc      ComputeFeature call flow setFontSize > setFontSize > adjustMaxMin > adjustMaxMin > onDragMateria...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0030 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(155);
      subject.setFontSize(-39);
      subject.adjustMaxMin(1824, 0);
      subject.adjustMaxMin(0, 1248);
      subject.onDragMaterial(-37, 45);
      logInfo(`setFontSize>setFontSize>adjustMaxMin>adju...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-37);
      logInfo(`setFontSize>setFontSize>adjustMaxMin>adju...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(45);
      logInfo(`setFontSize>setFontSize>adjustMaxMin>adju...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-39);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0031
     * @tc.name      Image_ComputeFeatureFlow_0031
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > adjustMaxMin > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0031 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1344, 90);
      subject.adjustMaxMin(1536, 1728);
      subject.endDrag();
      logInfo(`setOriginMaterialSize>adjustMaxMin>endDra...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(672);
      logInfo(`setOriginMaterialSize>adjustMaxMin>endDra...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(45);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0032
     * @tc.name      Image_ComputeFeatureFlow_0032
     * @tc.desc      ComputeFeature call flow endDrag > endDrag > onDragMaterial > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0032 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.endDrag();
      subject.onDragMaterial(3, -100);
      subject.setFontSize(-28);
      logInfo(`endDrag>endDrag>onDragMaterial>setFontSiz...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(3);
      logInfo(`endDrag>endDrag>onDragMaterial>setFontSiz...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`endDrag>endDrag>onDragMaterial>setFontSiz...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-28);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0033
     * @tc.name      Image_ComputeFeatureFlow_0033
     * @tc.desc      ComputeFeature call flow startDrag > setFontSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0033 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_TOP);
      subject.setFontSize(75);
      logInfo(`startDrag>setFontSize final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(75);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0034
     * @tc.name      Image_ComputeFeatureFlow_0034
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > onDragMaterial > setOriginMaterialSize > onDrag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0034 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(480, 85);
      subject.onDragMaterial(1, 45);
      subject.setOriginMaterialSize(576, -100);
      subject.onDragMaterial(90, 2);
      subject.setFontSize(60);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(576);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(-100);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(288);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(91);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(47);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0035
     * @tc.name      Image_ComputeFeatureFlow_0035
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > onDragMaterial > setOriginMaterialSize > onDrag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0035 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(1920, -100);
      subject.onDragMaterial(95, 1);
      subject.setOriginMaterialSize(192, 60);
      subject.onDragMaterial(-100, 5);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(192);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(60);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(96);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(30);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(-5);
      logInfo(`setOriginMaterialSize>onDragMaterial>setO...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0036
     * @tc.name      Image_ComputeFeatureFlow_0036
     * @tc.desc      ComputeFeature call flow onDragMaterial > setOriginMaterialSize > endDrag > setMaterialAndImageS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0036 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(25, 6);
      subject.setOriginMaterialSize(360, 50);
      subject.endDrag();
      subject.setMaterialAndImageSize(0, 3, 0, 100);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(360);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`onDragMaterial>setOriginMaterialSize>endD...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(180);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0037
     * @tc.name      Image_ComputeFeatureFlow_0037
     * @tc.desc      ComputeFeature call flow setFontSize > adjustMaxMin > setMaterialAndImageSize > endDrag > endDra...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0037 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(49);
      subject.adjustMaxMin(480, 960);
      subject.setMaterialAndImageSize(10, 10, 1, 1);
      subject.endDrag();
      subject.endDrag();
      logInfo(`setFontSize>adjustMaxMin>setMaterialAndIm...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(10);
      logInfo(`setFontSize>adjustMaxMin>setMaterialAndIm...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setFontSize>adjustMaxMin>setMaterialAndIm...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setFontSize>adjustMaxMin>setMaterialAndIm...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setFontSize>adjustMaxMin>setMaterialAndIm...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setFontSize>adjustMaxMin>setMaterialAndIm...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0038
     * @tc.name      Image_ComputeFeatureFlow_0038
     * @tc.desc      ComputeFeature call flow onDragMaterial > setMaterialAndImageSize > setMaterialAndImageSize keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0038 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(65, -100);
      subject.setMaterialAndImageSize(100, 3, 1, 10);
      subject.setMaterialAndImageSize(3, 0, 10, 2);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(10);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(3);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.initX=${subject.initX}`);
      expect(subject.initX).assertClose(1.5, PRECISION);
      logInfo(`onDragMaterial>setMaterialAndImageSize>se...: subject.x=${subject.x}`);
      expect(subject.x).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0039
     * @tc.name      Image_ComputeFeatureFlow_0039
     * @tc.desc      ComputeFeature call flow endDrag > setFontSize > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0039 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setFontSize(-16);
      subject.onDragMaterial(22, 3);
      logInfo(`endDrag>setFontSize>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(22);
      logInfo(`endDrag>setFontSize>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(3);
      logInfo(`endDrag>setFontSize>onDragMaterial final: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(-16);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0040
     * @tc.name      Image_ComputeFeatureFlow_0040
     * @tc.desc      ComputeFeature call flow endDrag > setMaterialAndImageSize > onDragMaterial > adjustMaxMin keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0040 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setMaterialAndImageSize(3, 100, 1, 1);
      subject.onDragMaterial(80, 65);
      subject.adjustMaxMin(960, 288);
      logInfo(`endDrag>setMaterialAndImageSize>onDragMat...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(3);
      logInfo(`endDrag>setMaterialAndImageSize>onDragMat...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`endDrag>setMaterialAndImageSize>onDragMat...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`endDrag>setMaterialAndImageSize>onDragMat...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`endDrag>setMaterialAndImageSize>onDragMat...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(-159);
      logInfo(`endDrag>setMaterialAndImageSize>onDragMat...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0041
     * @tc.name      Image_ComputeFeatureFlow_0041
     * @tc.desc      ComputeFeature call flow endDrag > setOriginMaterialSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0041 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setOriginMaterialSize(288, 45);
      logInfo(`endDrag>setOriginMaterialSize final: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(288);
      logInfo(`endDrag>setOriginMaterialSize final: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(45);
      logInfo(`endDrag>setOriginMaterialSize final: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(144);
      logInfo(`endDrag>setOriginMaterialSize final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0042
     * @tc.name      Image_ComputeFeatureFlow_0042
     * @tc.desc      ComputeFeature call flow endDrag > setFontSize > setMaterialAndImageSize > setFontSize > adjustM...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0042 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setFontSize(-11);
      subject.setMaterialAndImageSize(100, 3, 100, -1);
      subject.setFontSize(195);
      subject.adjustMaxMin(96, 0);
      logInfo(`endDrag>setFontSize>setMaterialAndImageSi...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`endDrag>setFontSize>setMaterialAndImageSi...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`endDrag>setFontSize>setMaterialAndImageSi...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`endDrag>setFontSize>setMaterialAndImageSi...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`endDrag>setFontSize>setMaterialAndImageSi...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(96);
      logInfo(`endDrag>setFontSize>setMaterialAndImageSi...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0043
     * @tc.name      Image_ComputeFeatureFlow_0043
     * @tc.desc      ComputeFeature call flow setFontSize > startDrag > setMaterialAndImageSize > setOriginMaterialSi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0043 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(10);
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      subject.setMaterialAndImageSize(1, 2, 1, 0);
      subject.setOriginMaterialSize(576, 30);
      logInfo(`setFontSize>startDrag>setMaterialAndImage...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setFontSize>startDrag>setMaterialAndImage...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setFontSize>startDrag>setMaterialAndImage...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setFontSize>startDrag>setMaterialAndImage...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(576);
      logInfo(`setFontSize>startDrag>setMaterialAndImage...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(30);
      logInfo(`setFontSize>startDrag>setMaterialAndImage...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0044
     * @tc.name      Image_ComputeFeatureFlow_0044
     * @tc.desc      ComputeFeature call flow setOriginMaterialSize > setOriginMaterialSize > adjustMaxMin keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0044 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setOriginMaterialSize(576, 69);
      subject.setOriginMaterialSize(864, -100);
      subject.adjustMaxMin(576, 1080);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(432);
      logInfo(`setOriginMaterialSize>setOriginMaterialSi...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(-50);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0045
     * @tc.name      Image_ComputeFeatureFlow_0045
     * @tc.desc      ComputeFeature call flow startDrag > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0045 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_TOP);
      subject.onDragMaterial(2, -100);
      logInfo(`startDrag>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(2);
      logInfo(`startDrag>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(-100);
      logInfo(`startDrag>onDragMaterial final: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0046
     * @tc.name      Image_ComputeFeatureFlow_0046
     * @tc.desc      ComputeFeature call flow startDrag > onDragMaterial > endDrag > setOriginMaterialSize keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0046 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_TOP);
      subject.onDragMaterial(45, 20);
      subject.endDrag();
      subject.setOriginMaterialSize(672, 100);
      logInfo(`startDrag>onDragMaterial>endDrag>setOrigi...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(672);
      logInfo(`startDrag>onDragMaterial>endDrag>setOrigi...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`startDrag>onDragMaterial>endDrag>setOrigi...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(336);
      logInfo(`startDrag>onDragMaterial>endDrag>setOrigi...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(50);
      logInfo(`startDrag>onDragMaterial>endDrag>setOrigi...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(45);
      logInfo(`startDrag>onDragMaterial>endDrag>setOrigi...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(20);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0047
     * @tc.name      Image_ComputeFeatureFlow_0047
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > adjustMaxMin > adjustMaxMin keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0047 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 2, 100, 1);
      subject.adjustMaxMin(768, 384);
      subject.adjustMaxMin(1344, 1440);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>adjustMaxMin>adju...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0048
     * @tc.name      Image_ComputeFeatureFlow_0048
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setFontSize > adjustMaxMin > setOriginMateria...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0048 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(100, 3, 1, 10);
      subject.setFontSize(71.57);
      subject.adjustMaxMin(100, 0);
      subject.setOriginMaterialSize(0, 100);
      subject.startDrag(NodeType.LEFT_BOTTOM);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize>setFontSize>adjus...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0049
     * @tc.name      Image_ComputeFeatureFlow_0049
     * @tc.desc      ComputeFeature call flow startDrag > setFontSize > onDragMaterial > adjustMaxMin > endDrag keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0049 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.setFontSize(22);
      subject.onDragMaterial(105, 80);
      subject.adjustMaxMin(360, 1728);
      subject.endDrag();
      logInfo(`startDrag>setFontSize>onDragMaterial>adju...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(105);
      logInfo(`startDrag>setFontSize>onDragMaterial>adju...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(80);
      logInfo(`startDrag>setFontSize>onDragMaterial>adju...: subject.fontSize=${subject.fontSize}`);
      expect(subject.fontSize).assertEqual(22);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0050
     * @tc.name      Image_ComputeFeatureFlow_0050
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > setFontSize > endDrag > startDrag keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0050 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(1, 2, 2, -1);
      subject.setFontSize(130);
      subject.endDrag();
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize>setFontSize>endDr...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(-1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0051
     * @tc.name      Image_ComputeFeatureFlow_0051
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > onDragMaterial > startDrag keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0051 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(2, 1, 2, 2);
      subject.onDragMaterial(10, 30);
      subject.startDrag(NodeType.LEFT_TOP);
      logInfo(`setMaterialAndImageSize>onDragMaterial>st...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>st...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(1);
      logInfo(`setMaterialAndImageSize>onDragMaterial>st...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>st...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>st...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>onDragMaterial>st...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(1);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0052
     * @tc.name      Image_ComputeFeatureFlow_0052
     * @tc.desc      ComputeFeature call flow endDrag > setMaterialAndImageSize > endDrag > setOriginMaterialSize kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0052 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.endDrag();
      subject.setMaterialAndImageSize(100, 2, 2, 2);
      subject.endDrag();
      subject.setOriginMaterialSize(1152, 83);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(100);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1152);
      logInfo(`endDrag>setMaterialAndImageSize>endDrag>s...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(83);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0053
     * @tc.name      Image_ComputeFeatureFlow_0053
     * @tc.desc      ComputeFeature call flow onDragMaterial > endDrag > endDrag > setMaterialAndImageSize > onDragMa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0053 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(-100, 6);
      subject.endDrag();
      subject.endDrag();
      subject.setMaterialAndImageSize(2, 2, 5, 2);
      subject.onDragMaterial(90, -100);
      logInfo(`onDragMaterial>endDrag>endDrag>setMateria...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(2);
      logInfo(`onDragMaterial>endDrag>endDrag>setMateria...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(2);
      logInfo(`onDragMaterial>endDrag>endDrag>setMateria...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(5);
      logInfo(`onDragMaterial>endDrag>endDrag>setMateria...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(2);
      logInfo(`onDragMaterial>endDrag>endDrag>setMateria...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(2);
      logInfo(`onDragMaterial>endDrag>endDrag>setMateria...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(2);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0054
     * @tc.name      Image_ComputeFeatureFlow_0054
     * @tc.desc      ComputeFeature call flow onDragMaterial > setOriginMaterialSize keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0054 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.onDragMaterial(85, 6);
      subject.setOriginMaterialSize(0, 25);
      logInfo(`onDragMaterial>setOriginMaterialSize final: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(25);
      logInfo(`onDragMaterial>setOriginMaterialSize final: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertClose(12.5, PRECISION);
      logInfo(`onDragMaterial>setOriginMaterialSize final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(85);
      logInfo(`onDragMaterial>setOriginMaterialSize final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0055
     * @tc.name      Image_ComputeFeatureFlow_0055
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0055 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(-1, 3, 1, 10);
      subject.startDrag(NodeType.LEFT_TOP);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(3);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(1);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(10);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setMaterialAndImageSize>startDrag final: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(3);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0056
     * @tc.name      Image_ComputeFeatureFlow_0056
     * @tc.desc      ComputeFeature call flow adjustMaxMin > onDragMaterial keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0056 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.adjustMaxMin(864, 0);
      subject.onDragMaterial(105, 6);
      logInfo(`adjustMaxMin>onDragMaterial final: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(105);
      logInfo(`adjustMaxMin>onDragMaterial final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(6);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0057
     * @tc.name      Image_ComputeFeatureFlow_0057
     * @tc.desc      ComputeFeature call flow setFontSize > startDrag > onDragMaterial > endDrag > setOriginMaterialS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0057 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(40);
      subject.startDrag(NodeType.CENTER_MATERIAL);
      subject.onDragMaterial(85, 100);
      subject.endDrag();
      subject.setOriginMaterialSize(1632, 50);
      logInfo(`setFontSize>startDrag>onDragMaterial>endD...: subject.materialWidth=${subject.materialWidth}`);
      expect(subject.materialWidth).assertEqual(1632);
      logInfo(`setFontSize>startDrag>onDragMaterial>endD...: subject.materialHeight=${subject.materialHeight}`);
      expect(subject.materialHeight).assertEqual(50);
      logInfo(`setFontSize>startDrag>onDragMaterial>endD...: subject.minMaterialWidth=${subject.minMaterialWidth}`);
      expect(subject.minMaterialWidth).assertEqual(816);
      logInfo(`setFontSize>startDrag>onDragMaterial>endD...: subject.minMaterialHeight=${subject.minMaterialHeight}`);
      expect(subject.minMaterialHeight).assertEqual(25);
      logInfo(`setFontSize>startDrag>onDragMaterial>endD...: subject.x=${subject.x}`);
      expect(subject.x).assertEqual(85);
      logInfo(`setFontSize>startDrag>onDragMaterial>endD...: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(100);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0058
     * @tc.name      Image_ComputeFeatureFlow_0058
     * @tc.desc      ComputeFeature call flow setFontSize > endDrag > setFontSize > setMaterialAndImageSize keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0058 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setFontSize(160);
      subject.endDrag();
      subject.setFontSize(3.3);
      subject.setMaterialAndImageSize(-1, 10, -1, 100);
      logInfo(`setFontSize>endDrag>setFontSize>setMateri...: subject.containerWidth=${subject.containerWidth}`);
      expect(subject.containerWidth).assertEqual(-1);
      logInfo(`setFontSize>endDrag>setFontSize>setMateri...: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(10);
      logInfo(`setFontSize>endDrag>setFontSize>setMateri...: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(-1);
      logInfo(`setFontSize>endDrag>setFontSize>setMateri...: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(100);
      logInfo(`setFontSize>endDrag>setFontSize>setMateri...: subject.maxMaterialWidth=${subject.maxMaterialWidth}`);
      expect(subject.maxMaterialWidth).assertEqual(-1);
      logInfo(`setFontSize>endDrag>setFontSize>setMateri...: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(10);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_FLOW_0059
     * @tc.name      Image_ComputeFeatureFlow_0059
     * @tc.desc      ComputeFeature call flow setMaterialAndImageSize > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureFlow_0059 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.setMaterialAndImageSize(0, 100, 2, 5);
      subject.endDrag();
      logInfo(`setMaterialAndImageSize>endDrag final: subject.containerHeight=${subject.containerHeight}`);
      expect(subject.containerHeight).assertEqual(100);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.imageWidth=${subject.imageWidth}`);
      expect(subject.imageWidth).assertEqual(2);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.imageHeight=${subject.imageHeight}`);
      expect(subject.imageHeight).assertEqual(5);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.maxMaterialHeight=${subject.maxMaterialHeight}`);
      expect(subject.maxMaterialHeight).assertEqual(5);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.initY=${subject.initY}`);
      expect(subject.initY).assertEqual(50);
      logInfo(`setMaterialAndImageSize>endDrag final: subject.y=${subject.y}`);
      expect(subject.y).assertEqual(50);
      logInfo(`${BUNDLE}ComputeFeatureFlow_0059 end`);
    });
  });
}
