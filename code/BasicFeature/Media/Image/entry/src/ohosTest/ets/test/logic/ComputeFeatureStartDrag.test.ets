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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ComputeFeature.startDrag (4 cases). */
export default function computeFeatureStartDragTest(): void {
  describe('ComputeFeatureStartDragTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_START_DRAG_0001
     * @tc.name      Image_ComputeFeatureStartDrag_0001
     * @tc.desc      ComputeFeature.startDrag(nodeType=NodeType.RIGHT_TOP) yields NodeType.RIGHT_TOP
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureStartDrag_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComputeFeatureStartDrag_0001 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_TOP);
      logInfo(`startDrag(nodeType=NodeType.RIGHT_TOP) state: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_TOP);
      logInfo(`${BUNDLE}ComputeFeatureStartDrag_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_START_DRAG_0002
     * @tc.name      Image_ComputeFeatureStartDrag_0002
     * @tc.desc      ComputeFeature.startDrag(nodeType=NodeType.LEFT_BOTTOM) yields NodeType.LEFT_BOTTOM
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ComputeFeatureStartDrag_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComputeFeatureStartDrag_0002 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.LEFT_BOTTOM);
      logInfo(`startDrag(nodeType=NodeType.LEFT_BOTTOM) ...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.LEFT_BOTTOM);
      logInfo(`${BUNDLE}ComputeFeatureStartDrag_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_START_DRAG_0003
     * @tc.name      Image_ComputeFeatureStartDrag_0003
     * @tc.desc      ComputeFeature.startDrag(nodeType=NodeType.RIGHT_BOTTOM) yields NodeType.RIGHT_BOTTOM
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureStartDrag_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureStartDrag_0003 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.RIGHT_BOTTOM);
      logInfo(`startDrag(nodeType=NodeType.RIGHT_BOTTOM)...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.RIGHT_BOTTOM);
      logInfo(`${BUNDLE}ComputeFeatureStartDrag_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COMPUTE_FEATURE_START_DRAG_0004
     * @tc.name      Image_ComputeFeatureStartDrag_0004
     * @tc.desc      ComputeFeature.startDrag(nodeType=NodeType.CENTER_MATERIAL) yields NodeType.CENTER_MATERIAL
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ComputeFeatureStartDrag_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComputeFeatureStartDrag_0004 begin`);
      const subject: ComputeFeature = new ComputeFeature();
      subject.startDrag(NodeType.CENTER_MATERIAL);
      logInfo(`startDrag(nodeType=NodeType.CENTER_MATERI...: subject.currentType=${subject.currentType}`);
      expect(subject.currentType).assertEqual(NodeType.CENTER_MATERIAL);
      logInfo(`${BUNDLE}ComputeFeatureStartDrag_0004 end`);
    });
  });
}
