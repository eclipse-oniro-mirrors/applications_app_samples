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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { OffsetModel } from '../../../../main/ets/model/OffsetModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new OffsetModel (70 cases). */
export default function offsetModelCtor2Test(): void {
  describe('OffsetModelCtor2Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0071
     * @tc.name      ImageViewer_OffsetModelCtor_0071
     * @tc.desc      new OffsetModel(0, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0071 begin`);
      const subject: OffsetModel = new OffsetModel(0, 2);
      logInfo(`new OffsetModel(0, 2): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2);
      logInfo(`new OffsetModel(0, 2): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0072
     * @tc.name      ImageViewer_OffsetModelCtor_0072
     * @tc.desc      new OffsetModel(0, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0072 begin`);
      const subject: OffsetModel = new OffsetModel(0, 3);
      logInfo(`new OffsetModel(0, 3): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3);
      logInfo(`new OffsetModel(0, 3): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0073
     * @tc.name      ImageViewer_OffsetModelCtor_0073
     * @tc.desc      new OffsetModel(0, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0073 begin`);
      const subject: OffsetModel = new OffsetModel(0, 10);
      logInfo(`new OffsetModel(0, 10): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 10): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(10);
      logInfo(`new OffsetModel(0, 10): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 10): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0074
     * @tc.name      ImageViewer_OffsetModelCtor_0074
     * @tc.desc      new OffsetModel(0, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0074 begin`);
      const subject: OffsetModel = new OffsetModel(0, 100);
      logInfo(`new OffsetModel(0, 100): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 100): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(100);
      logInfo(`new OffsetModel(0, 100): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 100): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0075
     * @tc.name      ImageViewer_OffsetModelCtor_0075
     * @tc.desc      new OffsetModel(0, 180000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0075 begin`);
      const subject: OffsetModel = new OffsetModel(0, 180000);
      logInfo(`new OffsetModel(0, 180000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 180000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(180000);
      logInfo(`new OffsetModel(0, 180000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 180000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0076
     * @tc.name      ImageViewer_OffsetModelCtor_0076
     * @tc.desc      new OffsetModel(0, 360000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0076 begin`);
      const subject: OffsetModel = new OffsetModel(0, 360000);
      logInfo(`new OffsetModel(0, 360000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 360000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(360000);
      logInfo(`new OffsetModel(0, 360000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 360000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0077
     * @tc.name      ImageViewer_OffsetModelCtor_0077
     * @tc.desc      new OffsetModel(0, 540000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0077 begin`);
      const subject: OffsetModel = new OffsetModel(0, 540000);
      logInfo(`new OffsetModel(0, 540000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 540000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(540000);
      logInfo(`new OffsetModel(0, 540000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 540000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0078
     * @tc.name      ImageViewer_OffsetModelCtor_0078
     * @tc.desc      new OffsetModel(0, 720000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0078 begin`);
      const subject: OffsetModel = new OffsetModel(0, 720000);
      logInfo(`new OffsetModel(0, 720000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 720000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(720000);
      logInfo(`new OffsetModel(0, 720000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 720000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0079
     * @tc.name      ImageViewer_OffsetModelCtor_0079
     * @tc.desc      new OffsetModel(0, 900000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0079 begin`);
      const subject: OffsetModel = new OffsetModel(0, 900000);
      logInfo(`new OffsetModel(0, 900000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 900000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(900000);
      logInfo(`new OffsetModel(0, 900000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 900000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0080
     * @tc.name      ImageViewer_OffsetModelCtor_0080
     * @tc.desc      new OffsetModel(0, 1080000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0080 begin`);
      const subject: OffsetModel = new OffsetModel(0, 1080000);
      logInfo(`new OffsetModel(0, 1080000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1080000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1080000);
      logInfo(`new OffsetModel(0, 1080000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1080000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0081
     * @tc.name      ImageViewer_OffsetModelCtor_0081
     * @tc.desc      new OffsetModel(0, 1260000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0081 begin`);
      const subject: OffsetModel = new OffsetModel(0, 1260000);
      logInfo(`new OffsetModel(0, 1260000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1260000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1260000);
      logInfo(`new OffsetModel(0, 1260000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1260000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0082
     * @tc.name      ImageViewer_OffsetModelCtor_0082
     * @tc.desc      new OffsetModel(0, 1440000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0082 begin`);
      const subject: OffsetModel = new OffsetModel(0, 1440000);
      logInfo(`new OffsetModel(0, 1440000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1440000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1440000);
      logInfo(`new OffsetModel(0, 1440000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1440000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0083
     * @tc.name      ImageViewer_OffsetModelCtor_0083
     * @tc.desc      new OffsetModel(0, 1620000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0083 begin`);
      const subject: OffsetModel = new OffsetModel(0, 1620000);
      logInfo(`new OffsetModel(0, 1620000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1620000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1620000);
      logInfo(`new OffsetModel(0, 1620000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1620000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0084
     * @tc.name      ImageViewer_OffsetModelCtor_0084
     * @tc.desc      new OffsetModel(0, 1800000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0084 begin`);
      const subject: OffsetModel = new OffsetModel(0, 1800000);
      logInfo(`new OffsetModel(0, 1800000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1800000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1800000);
      logInfo(`new OffsetModel(0, 1800000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1800000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0085
     * @tc.name      ImageViewer_OffsetModelCtor_0085
     * @tc.desc      new OffsetModel(0, 1980000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0085 begin`);
      const subject: OffsetModel = new OffsetModel(0, 1980000);
      logInfo(`new OffsetModel(0, 1980000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1980000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1980000);
      logInfo(`new OffsetModel(0, 1980000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1980000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0086
     * @tc.name      ImageViewer_OffsetModelCtor_0086
     * @tc.desc      new OffsetModel(0, 2160000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0086 begin`);
      const subject: OffsetModel = new OffsetModel(0, 2160000);
      logInfo(`new OffsetModel(0, 2160000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2160000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2160000);
      logInfo(`new OffsetModel(0, 2160000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2160000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0087
     * @tc.name      ImageViewer_OffsetModelCtor_0087
     * @tc.desc      new OffsetModel(0, 2340000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0087 begin`);
      const subject: OffsetModel = new OffsetModel(0, 2340000);
      logInfo(`new OffsetModel(0, 2340000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2340000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2340000);
      logInfo(`new OffsetModel(0, 2340000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2340000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0088
     * @tc.name      ImageViewer_OffsetModelCtor_0088
     * @tc.desc      new OffsetModel(0, 2520000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0088 begin`);
      const subject: OffsetModel = new OffsetModel(0, 2520000);
      logInfo(`new OffsetModel(0, 2520000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2520000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2520000);
      logInfo(`new OffsetModel(0, 2520000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2520000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0089
     * @tc.name      ImageViewer_OffsetModelCtor_0089
     * @tc.desc      new OffsetModel(0, 2700000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0089 begin`);
      const subject: OffsetModel = new OffsetModel(0, 2700000);
      logInfo(`new OffsetModel(0, 2700000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2700000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2700000);
      logInfo(`new OffsetModel(0, 2700000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2700000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0090
     * @tc.name      ImageViewer_OffsetModelCtor_0090
     * @tc.desc      new OffsetModel(0, 2880000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0090 begin`);
      const subject: OffsetModel = new OffsetModel(0, 2880000);
      logInfo(`new OffsetModel(0, 2880000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2880000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2880000);
      logInfo(`new OffsetModel(0, 2880000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 2880000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0091
     * @tc.name      ImageViewer_OffsetModelCtor_0091
     * @tc.desc      new OffsetModel(0, 3060000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0091 begin`);
      const subject: OffsetModel = new OffsetModel(0, 3060000);
      logInfo(`new OffsetModel(0, 3060000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3060000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3060000);
      logInfo(`new OffsetModel(0, 3060000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3060000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0092
     * @tc.name      ImageViewer_OffsetModelCtor_0092
     * @tc.desc      new OffsetModel(0, 3240000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0092 begin`);
      const subject: OffsetModel = new OffsetModel(0, 3240000);
      logInfo(`new OffsetModel(0, 3240000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3240000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3240000);
      logInfo(`new OffsetModel(0, 3240000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3240000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0093
     * @tc.name      ImageViewer_OffsetModelCtor_0093
     * @tc.desc      new OffsetModel(0, 3420000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0093 begin`);
      const subject: OffsetModel = new OffsetModel(0, 3420000);
      logInfo(`new OffsetModel(0, 3420000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3420000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3420000);
      logInfo(`new OffsetModel(0, 3420000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3420000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0094
     * @tc.name      ImageViewer_OffsetModelCtor_0094
     * @tc.desc      new OffsetModel(0, 3780000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0094 begin`);
      const subject: OffsetModel = new OffsetModel(0, 3780000);
      logInfo(`new OffsetModel(0, 3780000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3780000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3780000);
      logInfo(`new OffsetModel(0, 3780000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3780000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0095
     * @tc.name      ImageViewer_OffsetModelCtor_0095
     * @tc.desc      new OffsetModel(0, 3960000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0095 begin`);
      const subject: OffsetModel = new OffsetModel(0, 3960000);
      logInfo(`new OffsetModel(0, 3960000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3960000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3960000);
      logInfo(`new OffsetModel(0, 3960000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3960000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0096
     * @tc.name      ImageViewer_OffsetModelCtor_0096
     * @tc.desc      new OffsetModel(0, 4140000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0096 begin`);
      const subject: OffsetModel = new OffsetModel(0, 4140000);
      logInfo(`new OffsetModel(0, 4140000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4140000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4140000);
      logInfo(`new OffsetModel(0, 4140000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4140000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0097
     * @tc.name      ImageViewer_OffsetModelCtor_0097
     * @tc.desc      new OffsetModel(0, 4320000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0097 begin`);
      const subject: OffsetModel = new OffsetModel(0, 4320000);
      logInfo(`new OffsetModel(0, 4320000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4320000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4320000);
      logInfo(`new OffsetModel(0, 4320000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4320000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0098
     * @tc.name      ImageViewer_OffsetModelCtor_0098
     * @tc.desc      new OffsetModel(0, 4500000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0098 begin`);
      const subject: OffsetModel = new OffsetModel(0, 4500000);
      logInfo(`new OffsetModel(0, 4500000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4500000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4500000);
      logInfo(`new OffsetModel(0, 4500000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4500000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0099
     * @tc.name      ImageViewer_OffsetModelCtor_0099
     * @tc.desc      new OffsetModel(0, 4680000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0099 begin`);
      const subject: OffsetModel = new OffsetModel(0, 4680000);
      logInfo(`new OffsetModel(0, 4680000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4680000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4680000);
      logInfo(`new OffsetModel(0, 4680000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4680000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0100
     * @tc.name      ImageViewer_OffsetModelCtor_0100
     * @tc.desc      new OffsetModel(0, 4860000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0100 begin`);
      const subject: OffsetModel = new OffsetModel(0, 4860000);
      logInfo(`new OffsetModel(0, 4860000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4860000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4860000);
      logInfo(`new OffsetModel(0, 4860000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4860000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0101
     * @tc.name      ImageViewer_OffsetModelCtor_0101
     * @tc.desc      new OffsetModel(0, 5040000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0101 begin`);
      const subject: OffsetModel = new OffsetModel(0, 5040000);
      logInfo(`new OffsetModel(0, 5040000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5040000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5040000);
      logInfo(`new OffsetModel(0, 5040000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5040000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0102
     * @tc.name      ImageViewer_OffsetModelCtor_0102
     * @tc.desc      new OffsetModel(0, 5220000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0102 begin`);
      const subject: OffsetModel = new OffsetModel(0, 5220000);
      logInfo(`new OffsetModel(0, 5220000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5220000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5220000);
      logInfo(`new OffsetModel(0, 5220000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5220000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0103
     * @tc.name      ImageViewer_OffsetModelCtor_0103
     * @tc.desc      new OffsetModel(0, 5400000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0103 begin`);
      const subject: OffsetModel = new OffsetModel(0, 5400000);
      logInfo(`new OffsetModel(0, 5400000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5400000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5400000);
      logInfo(`new OffsetModel(0, 5400000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5400000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0104
     * @tc.name      ImageViewer_OffsetModelCtor_0104
     * @tc.desc      new OffsetModel(0, 5580000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0104 begin`);
      const subject: OffsetModel = new OffsetModel(0, 5580000);
      logInfo(`new OffsetModel(0, 5580000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5580000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5580000);
      logInfo(`new OffsetModel(0, 5580000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5580000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0105
     * @tc.name      ImageViewer_OffsetModelCtor_0105
     * @tc.desc      new OffsetModel(0, 5760000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0105 begin`);
      const subject: OffsetModel = new OffsetModel(0, 5760000);
      logInfo(`new OffsetModel(0, 5760000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5760000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5760000);
      logInfo(`new OffsetModel(0, 5760000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5760000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0106
     * @tc.name      ImageViewer_OffsetModelCtor_0106
     * @tc.desc      new OffsetModel(0, 5940000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0106 begin`);
      const subject: OffsetModel = new OffsetModel(0, 5940000);
      logInfo(`new OffsetModel(0, 5940000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5940000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5940000);
      logInfo(`new OffsetModel(0, 5940000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 5940000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0107
     * @tc.name      ImageViewer_OffsetModelCtor_0107
     * @tc.desc      new OffsetModel(0, 6120000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0107 begin`);
      const subject: OffsetModel = new OffsetModel(0, 6120000);
      logInfo(`new OffsetModel(0, 6120000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6120000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6120000);
      logInfo(`new OffsetModel(0, 6120000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6120000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0108
     * @tc.name      ImageViewer_OffsetModelCtor_0108
     * @tc.desc      new OffsetModel(0, 6300000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0108 begin`);
      const subject: OffsetModel = new OffsetModel(0, 6300000);
      logInfo(`new OffsetModel(0, 6300000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6300000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6300000);
      logInfo(`new OffsetModel(0, 6300000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6300000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0109
     * @tc.name      ImageViewer_OffsetModelCtor_0109
     * @tc.desc      new OffsetModel(0, 6480000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0109 begin`);
      const subject: OffsetModel = new OffsetModel(0, 6480000);
      logInfo(`new OffsetModel(0, 6480000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6480000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6480000);
      logInfo(`new OffsetModel(0, 6480000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6480000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0110
     * @tc.name      ImageViewer_OffsetModelCtor_0110
     * @tc.desc      new OffsetModel(0, 6660000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0110 begin`);
      const subject: OffsetModel = new OffsetModel(0, 6660000);
      logInfo(`new OffsetModel(0, 6660000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6660000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6660000);
      logInfo(`new OffsetModel(0, 6660000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6660000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0111
     * @tc.name      ImageViewer_OffsetModelCtor_0111
     * @tc.desc      new OffsetModel(0, 6840000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0111 begin`);
      const subject: OffsetModel = new OffsetModel(0, 6840000);
      logInfo(`new OffsetModel(0, 6840000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6840000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6840000);
      logInfo(`new OffsetModel(0, 6840000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6840000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0112
     * @tc.name      ImageViewer_OffsetModelCtor_0112
     * @tc.desc      new OffsetModel(0, 7020000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0112 begin`);
      const subject: OffsetModel = new OffsetModel(0, 7020000);
      logInfo(`new OffsetModel(0, 7020000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 7020000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(7020000);
      logInfo(`new OffsetModel(0, 7020000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 7020000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0113
     * @tc.name      ImageViewer_OffsetModelCtor_0113
     * @tc.desc      new OffsetModel(0, 7200000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0113 begin`);
      const subject: OffsetModel = new OffsetModel(0, 7200000);
      logInfo(`new OffsetModel(0, 7200000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 7200000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(7200000);
      logInfo(`new OffsetModel(0, 7200000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 7200000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0114
     * @tc.name      ImageViewer_OffsetModelCtor_0114
     * @tc.desc      new OffsetModel(0, 4472221) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0114 begin`);
      const subject: OffsetModel = new OffsetModel(0, 4472221);
      logInfo(`new OffsetModel(0, 4472221): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4472221): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4472221);
      logInfo(`new OffsetModel(0, 4472221): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4472221): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0115
     * @tc.name      ImageViewer_OffsetModelCtor_0115
     * @tc.desc      new OffsetModel(0, 4418726) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0115 begin`);
      const subject: OffsetModel = new OffsetModel(0, 4418726);
      logInfo(`new OffsetModel(0, 4418726): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4418726): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4418726);
      logInfo(`new OffsetModel(0, 4418726): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4418726): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0116
     * @tc.name      ImageViewer_OffsetModelCtor_0116
     * @tc.desc      new OffsetModel(0, 6733929) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0116 begin`);
      const subject: OffsetModel = new OffsetModel(0, 6733929);
      logInfo(`new OffsetModel(0, 6733929): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6733929): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6733929);
      logInfo(`new OffsetModel(0, 6733929): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 6733929): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0117
     * @tc.name      ImageViewer_OffsetModelCtor_0117
     * @tc.desc      new OffsetModel(0, 4273794) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0117 begin`);
      const subject: OffsetModel = new OffsetModel(0, 4273794);
      logInfo(`new OffsetModel(0, 4273794): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4273794): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4273794);
      logInfo(`new OffsetModel(0, 4273794): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 4273794): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0118
     * @tc.name      ImageViewer_OffsetModelCtor_0118
     * @tc.desc      new OffsetModel(0, -3272622) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0118 begin`);
      const subject: OffsetModel = new OffsetModel(0, -3272622);
      logInfo(`new OffsetModel(0, -3272622): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, -3272622): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(-3272622);
      logInfo(`new OffsetModel(0, -3272622): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, -3272622): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0119
     * @tc.name      ImageViewer_OffsetModelCtor_0119
     * @tc.desc      new OffsetModel(0, -3110387) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0119 begin`);
      const subject: OffsetModel = new OffsetModel(0, -3110387);
      logInfo(`new OffsetModel(0, -3110387): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, -3110387): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(-3110387);
      logInfo(`new OffsetModel(0, -3110387): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, -3110387): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0120
     * @tc.name      ImageViewer_OffsetModelCtor_0120
     * @tc.desc      new OffsetModel(500, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0120 begin`);
      const subject: OffsetModel = new OffsetModel(500, -1);
      logInfo(`new OffsetModel(500, -1): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(500);
      logInfo(`new OffsetModel(500, -1): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(-1);
      logInfo(`new OffsetModel(500, -1): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(500, -1): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0121
     * @tc.name      ImageViewer_OffsetModelCtor_0121
     * @tc.desc      new OffsetModel(1800000, 540000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0121 begin`);
      const subject: OffsetModel = new OffsetModel(1800000, 540000);
      logInfo(`new OffsetModel(1800000, 540000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1800000);
      logInfo(`new OffsetModel(1800000, 540000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(540000);
      logInfo(`new OffsetModel(1800000, 540000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1800000, 540000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0122
     * @tc.name      ImageViewer_OffsetModelCtor_0122
     * @tc.desc      new OffsetModel(61000, 61000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0122 begin`);
      const subject: OffsetModel = new OffsetModel(61000, 61000);
      logInfo(`new OffsetModel(61000, 61000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(61000);
      logInfo(`new OffsetModel(61000, 61000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(61000);
      logInfo(`new OffsetModel(61000, 61000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(61000, 61000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0123
     * @tc.name      ImageViewer_OffsetModelCtor_0123
     * @tc.desc      new OffsetModel(1080000, 2340000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0123 begin`);
      const subject: OffsetModel = new OffsetModel(1080000, 2340000);
      logInfo(`new OffsetModel(1080000, 2340000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1080000);
      logInfo(`new OffsetModel(1080000, 2340000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2340000);
      logInfo(`new OffsetModel(1080000, 2340000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1080000, 2340000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0124
     * @tc.name      ImageViewer_OffsetModelCtor_0124
     * @tc.desc      new OffsetModel(4860000, 900000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0124 begin`);
      const subject: OffsetModel = new OffsetModel(4860000, 900000);
      logInfo(`new OffsetModel(4860000, 900000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4860000);
      logInfo(`new OffsetModel(4860000, 900000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(900000);
      logInfo(`new OffsetModel(4860000, 900000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4860000, 900000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0125
     * @tc.name      ImageViewer_OffsetModelCtor_0125
     * @tc.desc      new OffsetModel(-1, 5220000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0125 begin`);
      const subject: OffsetModel = new OffsetModel(-1, 5220000);
      logInfo(`new OffsetModel(-1, 5220000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(-1);
      logInfo(`new OffsetModel(-1, 5220000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5220000);
      logInfo(`new OffsetModel(-1, 5220000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(-1, 5220000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0126
     * @tc.name      ImageViewer_OffsetModelCtor_0126
     * @tc.desc      new OffsetModel(-1, 6300000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0126 begin`);
      const subject: OffsetModel = new OffsetModel(-1, 6300000);
      logInfo(`new OffsetModel(-1, 6300000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(-1);
      logInfo(`new OffsetModel(-1, 6300000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6300000);
      logInfo(`new OffsetModel(-1, 6300000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(-1, 6300000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0126 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0127
     * @tc.name      ImageViewer_OffsetModelCtor_0127
     * @tc.desc      new OffsetModel(2520000, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0127 begin`);
      const subject: OffsetModel = new OffsetModel(2520000, 10);
      logInfo(`new OffsetModel(2520000, 10): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2520000);
      logInfo(`new OffsetModel(2520000, 10): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(10);
      logInfo(`new OffsetModel(2520000, 10): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2520000, 10): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0127 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0128
     * @tc.name      ImageViewer_OffsetModelCtor_0128
     * @tc.desc      new OffsetModel(7020000, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0128 begin`);
      const subject: OffsetModel = new OffsetModel(7020000, 1);
      logInfo(`new OffsetModel(7020000, 1): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(7020000);
      logInfo(`new OffsetModel(7020000, 1): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1);
      logInfo(`new OffsetModel(7020000, 1): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(7020000, 1): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0128 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0129
     * @tc.name      ImageViewer_OffsetModelCtor_0129
     * @tc.desc      new OffsetModel(6840000, 180000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0129 begin`);
      const subject: OffsetModel = new OffsetModel(6840000, 180000);
      logInfo(`new OffsetModel(6840000, 180000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6840000);
      logInfo(`new OffsetModel(6840000, 180000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(180000);
      logInfo(`new OffsetModel(6840000, 180000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6840000, 180000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0129 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0130
     * @tc.name      ImageViewer_OffsetModelCtor_0130
     * @tc.desc      new OffsetModel(1000, 5220000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0130 begin`);
      const subject: OffsetModel = new OffsetModel(1000, 5220000);
      logInfo(`new OffsetModel(1000, 5220000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1000);
      logInfo(`new OffsetModel(1000, 5220000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5220000);
      logInfo(`new OffsetModel(1000, 5220000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1000, 5220000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0130 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0131
     * @tc.name      ImageViewer_OffsetModelCtor_0131
     * @tc.desc      new OffsetModel(1260000, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0131 begin`);
      const subject: OffsetModel = new OffsetModel(1260000, -1);
      logInfo(`new OffsetModel(1260000, -1): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1260000);
      logInfo(`new OffsetModel(1260000, -1): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(-1);
      logInfo(`new OffsetModel(1260000, -1): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1260000, -1): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0131 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0132
     * @tc.name      ImageViewer_OffsetModelCtor_0132
     * @tc.desc      new OffsetModel(7200000, 6120000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0132 begin`);
      const subject: OffsetModel = new OffsetModel(7200000, 6120000);
      logInfo(`new OffsetModel(7200000, 6120000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(7200000);
      logInfo(`new OffsetModel(7200000, 6120000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6120000);
      logInfo(`new OffsetModel(7200000, 6120000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(7200000, 6120000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0132 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0133
     * @tc.name      ImageViewer_OffsetModelCtor_0133
     * @tc.desc      new OffsetModel(5760000, 1000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0133 begin`);
      const subject: OffsetModel = new OffsetModel(5760000, 1000);
      logInfo(`new OffsetModel(5760000, 1000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5760000);
      logInfo(`new OffsetModel(5760000, 1000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1000);
      logInfo(`new OffsetModel(5760000, 1000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5760000, 1000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0133 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0134
     * @tc.name      ImageViewer_OffsetModelCtor_0134
     * @tc.desc      new OffsetModel(2340000, 999) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0134 begin`);
      const subject: OffsetModel = new OffsetModel(2340000, 999);
      logInfo(`new OffsetModel(2340000, 999): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2340000);
      logInfo(`new OffsetModel(2340000, 999): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(999);
      logInfo(`new OffsetModel(2340000, 999): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2340000, 999): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0134 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0135
     * @tc.name      ImageViewer_OffsetModelCtor_0135
     * @tc.desc      new OffsetModel(5940000, 60000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0135 begin`);
      const subject: OffsetModel = new OffsetModel(5940000, 60000);
      logInfo(`new OffsetModel(5940000, 60000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5940000);
      logInfo(`new OffsetModel(5940000, 60000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(60000);
      logInfo(`new OffsetModel(5940000, 60000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5940000, 60000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0135 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0136
     * @tc.name      ImageViewer_OffsetModelCtor_0136
     * @tc.desc      new OffsetModel(3960000, 7200000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0136 begin`);
      const subject: OffsetModel = new OffsetModel(3960000, 7200000);
      logInfo(`new OffsetModel(3960000, 7200000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3960000);
      logInfo(`new OffsetModel(3960000, 7200000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(7200000);
      logInfo(`new OffsetModel(3960000, 7200000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3960000, 7200000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0136 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0137
     * @tc.name      ImageViewer_OffsetModelCtor_0137
     * @tc.desc      new OffsetModel(4680000, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0137 begin`);
      const subject: OffsetModel = new OffsetModel(4680000, 3);
      logInfo(`new OffsetModel(4680000, 3): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4680000);
      logInfo(`new OffsetModel(4680000, 3): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3);
      logInfo(`new OffsetModel(4680000, 3): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4680000, 3): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0137 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0138
     * @tc.name      ImageViewer_OffsetModelCtor_0138
     * @tc.desc      new OffsetModel(60000, 2520000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0138 begin`);
      const subject: OffsetModel = new OffsetModel(60000, 2520000);
      logInfo(`new OffsetModel(60000, 2520000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(60000);
      logInfo(`new OffsetModel(60000, 2520000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2520000);
      logInfo(`new OffsetModel(60000, 2520000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(60000, 2520000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0138 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0139
     * @tc.name      ImageViewer_OffsetModelCtor_0139
     * @tc.desc      new OffsetModel(59999, 3600000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0139 begin`);
      const subject: OffsetModel = new OffsetModel(59999, 3600000);
      logInfo(`new OffsetModel(59999, 3600000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(59999);
      logInfo(`new OffsetModel(59999, 3600000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3600000);
      logInfo(`new OffsetModel(59999, 3600000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(59999, 3600000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0139 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0140
     * @tc.name      ImageViewer_OffsetModelCtor_0140
     * @tc.desc      new OffsetModel(999, 60000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0140 begin`);
      const subject: OffsetModel = new OffsetModel(999, 60000);
      logInfo(`new OffsetModel(999, 60000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(999);
      logInfo(`new OffsetModel(999, 60000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(60000);
      logInfo(`new OffsetModel(999, 60000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(999, 60000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0140 end`);
    });
  });
}
