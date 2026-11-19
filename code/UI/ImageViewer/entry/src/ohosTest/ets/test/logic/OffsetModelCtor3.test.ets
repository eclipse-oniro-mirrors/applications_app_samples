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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new OffsetModel (53 cases). */
export default function offsetModelCtor3Test(): void {
  describe('OffsetModelCtor3Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0141
     * @tc.name      ImageViewer_OffsetModelCtor_0141
     * @tc.desc      new OffsetModel(2880000, 1260000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0141 begin`);
      const subject: OffsetModel = new OffsetModel(2880000, 1260000);
      logInfo(`new OffsetModel(2880000, 1260000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2880000);
      logInfo(`new OffsetModel(2880000, 1260000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1260000);
      logInfo(`new OffsetModel(2880000, 1260000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2880000, 1260000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0141 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0142
     * @tc.name      ImageViewer_OffsetModelCtor_0142
     * @tc.desc      new OffsetModel(3600000, 4500000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0142 begin`);
      const subject: OffsetModel = new OffsetModel(3600000, 4500000);
      logInfo(`new OffsetModel(3600000, 4500000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3600000);
      logInfo(`new OffsetModel(3600000, 4500000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4500000);
      logInfo(`new OffsetModel(3600000, 4500000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3600000, 4500000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0142 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0143
     * @tc.name      ImageViewer_OffsetModelCtor_0143
     * @tc.desc      new OffsetModel(7200000, 4320000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0143 begin`);
      const subject: OffsetModel = new OffsetModel(7200000, 4320000);
      logInfo(`new OffsetModel(7200000, 4320000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(7200000);
      logInfo(`new OffsetModel(7200000, 4320000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4320000);
      logInfo(`new OffsetModel(7200000, 4320000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(7200000, 4320000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0143 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0144
     * @tc.name      ImageViewer_OffsetModelCtor_0144
     * @tc.desc      new OffsetModel(2520000, 2520000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0144 begin`);
      const subject: OffsetModel = new OffsetModel(2520000, 2520000);
      logInfo(`new OffsetModel(2520000, 2520000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2520000);
      logInfo(`new OffsetModel(2520000, 2520000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2520000);
      logInfo(`new OffsetModel(2520000, 2520000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2520000, 2520000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0144 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0145
     * @tc.name      ImageViewer_OffsetModelCtor_0145
     * @tc.desc      new OffsetModel(3420000, 7020000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0145 begin`);
      const subject: OffsetModel = new OffsetModel(3420000, 7020000);
      logInfo(`new OffsetModel(3420000, 7020000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3420000);
      logInfo(`new OffsetModel(3420000, 7020000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(7020000);
      logInfo(`new OffsetModel(3420000, 7020000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3420000, 7020000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0145 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0146
     * @tc.name      ImageViewer_OffsetModelCtor_0146
     * @tc.desc      new OffsetModel(3060000, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0146 begin`);
      const subject: OffsetModel = new OffsetModel(3060000, 3);
      logInfo(`new OffsetModel(3060000, 3): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3060000);
      logInfo(`new OffsetModel(3060000, 3): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3);
      logInfo(`new OffsetModel(3060000, 3): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3060000, 3): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0146 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0147
     * @tc.name      ImageViewer_OffsetModelCtor_0147
     * @tc.desc      new OffsetModel(6120000, 5580000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0147 begin`);
      const subject: OffsetModel = new OffsetModel(6120000, 5580000);
      logInfo(`new OffsetModel(6120000, 5580000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6120000);
      logInfo(`new OffsetModel(6120000, 5580000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5580000);
      logInfo(`new OffsetModel(6120000, 5580000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6120000, 5580000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0147 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0148
     * @tc.name      ImageViewer_OffsetModelCtor_0148
     * @tc.desc      new OffsetModel(4500000, 4680000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0148 begin`);
      const subject: OffsetModel = new OffsetModel(4500000, 4680000);
      logInfo(`new OffsetModel(4500000, 4680000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4500000);
      logInfo(`new OffsetModel(4500000, 4680000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4680000);
      logInfo(`new OffsetModel(4500000, 4680000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4500000, 4680000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0148 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0149
     * @tc.name      ImageViewer_OffsetModelCtor_0149
     * @tc.desc      new OffsetModel(3240000, 5400000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0149 begin`);
      const subject: OffsetModel = new OffsetModel(3240000, 5400000);
      logInfo(`new OffsetModel(3240000, 5400000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3240000);
      logInfo(`new OffsetModel(3240000, 5400000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5400000);
      logInfo(`new OffsetModel(3240000, 5400000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3240000, 5400000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0149 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0150
     * @tc.name      ImageViewer_OffsetModelCtor_0150
     * @tc.desc      new OffsetModel(59999, 60000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0150 begin`);
      const subject: OffsetModel = new OffsetModel(59999, 60000);
      logInfo(`new OffsetModel(59999, 60000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(59999);
      logInfo(`new OffsetModel(59999, 60000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(60000);
      logInfo(`new OffsetModel(59999, 60000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(59999, 60000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0150 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0151
     * @tc.name      ImageViewer_OffsetModelCtor_0151
     * @tc.desc      new OffsetModel(540000, 7200000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0151 begin`);
      const subject: OffsetModel = new OffsetModel(540000, 7200000);
      logInfo(`new OffsetModel(540000, 7200000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(540000);
      logInfo(`new OffsetModel(540000, 7200000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(7200000);
      logInfo(`new OffsetModel(540000, 7200000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(540000, 7200000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0151 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0152
     * @tc.name      ImageViewer_OffsetModelCtor_0152
     * @tc.desc      new OffsetModel(5580000, 3240000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0152 begin`);
      const subject: OffsetModel = new OffsetModel(5580000, 3240000);
      logInfo(`new OffsetModel(5580000, 3240000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5580000);
      logInfo(`new OffsetModel(5580000, 3240000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3240000);
      logInfo(`new OffsetModel(5580000, 3240000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5580000, 3240000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0152 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0153
     * @tc.name      ImageViewer_OffsetModelCtor_0153
     * @tc.desc      new OffsetModel(3060000, 5940000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0153 begin`);
      const subject: OffsetModel = new OffsetModel(3060000, 5940000);
      logInfo(`new OffsetModel(3060000, 5940000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3060000);
      logInfo(`new OffsetModel(3060000, 5940000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5940000);
      logInfo(`new OffsetModel(3060000, 5940000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3060000, 5940000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0153 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0154
     * @tc.name      ImageViewer_OffsetModelCtor_0154
     * @tc.desc      new OffsetModel(3960000, 2700000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0154 begin`);
      const subject: OffsetModel = new OffsetModel(3960000, 2700000);
      logInfo(`new OffsetModel(3960000, 2700000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3960000);
      logInfo(`new OffsetModel(3960000, 2700000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2700000);
      logInfo(`new OffsetModel(3960000, 2700000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3960000, 2700000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0154 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0155
     * @tc.name      ImageViewer_OffsetModelCtor_0155
     * @tc.desc      new OffsetModel(4860000, 720000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0155 begin`);
      const subject: OffsetModel = new OffsetModel(4860000, 720000);
      logInfo(`new OffsetModel(4860000, 720000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4860000);
      logInfo(`new OffsetModel(4860000, 720000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(720000);
      logInfo(`new OffsetModel(4860000, 720000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4860000, 720000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0155 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0156
     * @tc.name      ImageViewer_OffsetModelCtor_0156
     * @tc.desc      new OffsetModel(6673810, 6733929) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0156 begin`);
      const subject: OffsetModel = new OffsetModel(6673810, 6733929);
      logInfo(`new OffsetModel(6673810, 6733929): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6673810);
      logInfo(`new OffsetModel(6673810, 6733929): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6733929);
      logInfo(`new OffsetModel(6673810, 6733929): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6673810, 6733929): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0156 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0157
     * @tc.name      ImageViewer_OffsetModelCtor_0157
     * @tc.desc      new OffsetModel(6300000, 5580000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0157 begin`);
      const subject: OffsetModel = new OffsetModel(6300000, 5580000);
      logInfo(`new OffsetModel(6300000, 5580000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6300000);
      logInfo(`new OffsetModel(6300000, 5580000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5580000);
      logInfo(`new OffsetModel(6300000, 5580000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6300000, 5580000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0157 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0158
     * @tc.name      ImageViewer_OffsetModelCtor_0158
     * @tc.desc      new OffsetModel(3420000, 540000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0158 begin`);
      const subject: OffsetModel = new OffsetModel(3420000, 540000);
      logInfo(`new OffsetModel(3420000, 540000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3420000);
      logInfo(`new OffsetModel(3420000, 540000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(540000);
      logInfo(`new OffsetModel(3420000, 540000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3420000, 540000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0158 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0159
     * @tc.name      ImageViewer_OffsetModelCtor_0159
     * @tc.desc      new OffsetModel(360000, 540000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0159 begin`);
      const subject: OffsetModel = new OffsetModel(360000, 540000);
      logInfo(`new OffsetModel(360000, 540000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(360000);
      logInfo(`new OffsetModel(360000, 540000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(540000);
      logInfo(`new OffsetModel(360000, 540000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(360000, 540000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0159 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0160
     * @tc.name      ImageViewer_OffsetModelCtor_0160
     * @tc.desc      new OffsetModel(500, 1980000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0160 begin`);
      const subject: OffsetModel = new OffsetModel(500, 1980000);
      logInfo(`new OffsetModel(500, 1980000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(500);
      logInfo(`new OffsetModel(500, 1980000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1980000);
      logInfo(`new OffsetModel(500, 1980000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(500, 1980000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0160 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0161
     * @tc.name      ImageViewer_OffsetModelCtor_0161
     * @tc.desc      new OffsetModel(3420000, 6733929) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0161 begin`);
      const subject: OffsetModel = new OffsetModel(3420000, 6733929);
      logInfo(`new OffsetModel(3420000, 6733929): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3420000);
      logInfo(`new OffsetModel(3420000, 6733929): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6733929);
      logInfo(`new OffsetModel(3420000, 6733929): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3420000, 6733929): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0161 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0162
     * @tc.name      ImageViewer_OffsetModelCtor_0162
     * @tc.desc      new OffsetModel(6660000, 4680000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0162 begin`);
      const subject: OffsetModel = new OffsetModel(6660000, 4680000);
      logInfo(`new OffsetModel(6660000, 4680000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6660000);
      logInfo(`new OffsetModel(6660000, 4680000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4680000);
      logInfo(`new OffsetModel(6660000, 4680000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6660000, 4680000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0162 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0163
     * @tc.name      ImageViewer_OffsetModelCtor_0163
     * @tc.desc      new OffsetModel(5400000, 1260000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0163 begin`);
      const subject: OffsetModel = new OffsetModel(5400000, 1260000);
      logInfo(`new OffsetModel(5400000, 1260000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5400000);
      logInfo(`new OffsetModel(5400000, 1260000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1260000);
      logInfo(`new OffsetModel(5400000, 1260000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5400000, 1260000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0163 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0164
     * @tc.name      ImageViewer_OffsetModelCtor_0164
     * @tc.desc      new OffsetModel(6300000, 2160000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0164 begin`);
      const subject: OffsetModel = new OffsetModel(6300000, 2160000);
      logInfo(`new OffsetModel(6300000, 2160000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6300000);
      logInfo(`new OffsetModel(6300000, 2160000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2160000);
      logInfo(`new OffsetModel(6300000, 2160000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6300000, 2160000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0164 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0165
     * @tc.name      ImageViewer_OffsetModelCtor_0165
     * @tc.desc      new OffsetModel(3, 1260000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0165 begin`);
      const subject: OffsetModel = new OffsetModel(3, 1260000);
      logInfo(`new OffsetModel(3, 1260000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3);
      logInfo(`new OffsetModel(3, 1260000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1260000);
      logInfo(`new OffsetModel(3, 1260000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3, 1260000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0165 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0166
     * @tc.name      ImageViewer_OffsetModelCtor_0166
     * @tc.desc      new OffsetModel(180000, 5400000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0166 begin`);
      const subject: OffsetModel = new OffsetModel(180000, 5400000);
      logInfo(`new OffsetModel(180000, 5400000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(180000);
      logInfo(`new OffsetModel(180000, 5400000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5400000);
      logInfo(`new OffsetModel(180000, 5400000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(180000, 5400000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0166 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0167
     * @tc.name      ImageViewer_OffsetModelCtor_0167
     * @tc.desc      new OffsetModel(4860000, 7200000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0167 begin`);
      const subject: OffsetModel = new OffsetModel(4860000, 7200000);
      logInfo(`new OffsetModel(4860000, 7200000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4860000);
      logInfo(`new OffsetModel(4860000, 7200000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(7200000);
      logInfo(`new OffsetModel(4860000, 7200000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4860000, 7200000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0167 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0168
     * @tc.name      ImageViewer_OffsetModelCtor_0168
     * @tc.desc      new OffsetModel(3, 6120000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0168 begin`);
      const subject: OffsetModel = new OffsetModel(3, 6120000);
      logInfo(`new OffsetModel(3, 6120000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3);
      logInfo(`new OffsetModel(3, 6120000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(6120000);
      logInfo(`new OffsetModel(3, 6120000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3, 6120000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0168 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0169
     * @tc.name      ImageViewer_OffsetModelCtor_0169
     * @tc.desc      new OffsetModel(-513826, 4273794) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0169 begin`);
      const subject: OffsetModel = new OffsetModel(-513826, 4273794);
      logInfo(`new OffsetModel(-513826, 4273794): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(-513826);
      logInfo(`new OffsetModel(-513826, 4273794): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4273794);
      logInfo(`new OffsetModel(-513826, 4273794): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(-513826, 4273794): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0169 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0170
     * @tc.name      ImageViewer_OffsetModelCtor_0170
     * @tc.desc      new OffsetModel(-513826, 180000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0170 begin`);
      const subject: OffsetModel = new OffsetModel(-513826, 180000);
      logInfo(`new OffsetModel(-513826, 180000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(-513826);
      logInfo(`new OffsetModel(-513826, 180000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(180000);
      logInfo(`new OffsetModel(-513826, 180000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(-513826, 180000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0170 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0171
     * @tc.name      ImageViewer_OffsetModelCtor_0171
     * @tc.desc      new OffsetModel(5580000, 5760000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0171 begin`);
      const subject: OffsetModel = new OffsetModel(5580000, 5760000);
      logInfo(`new OffsetModel(5580000, 5760000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5580000);
      logInfo(`new OffsetModel(5580000, 5760000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(5760000);
      logInfo(`new OffsetModel(5580000, 5760000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5580000, 5760000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0171 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0172
     * @tc.name      ImageViewer_OffsetModelCtor_0172
     * @tc.desc      new OffsetModel(60000, 900000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0172 begin`);
      const subject: OffsetModel = new OffsetModel(60000, 900000);
      logInfo(`new OffsetModel(60000, 900000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(60000);
      logInfo(`new OffsetModel(60000, 900000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(900000);
      logInfo(`new OffsetModel(60000, 900000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(60000, 900000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0172 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0173
     * @tc.name      ImageViewer_OffsetModelCtor_0173
     * @tc.desc      new OffsetModel(3599000, 4418726) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0173 begin`);
      const subject: OffsetModel = new OffsetModel(3599000, 4418726);
      logInfo(`new OffsetModel(3599000, 4418726): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3599000);
      logInfo(`new OffsetModel(3599000, 4418726): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4418726);
      logInfo(`new OffsetModel(3599000, 4418726): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3599000, 4418726): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0173 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0174
     * @tc.name      ImageViewer_OffsetModelCtor_0174
     * @tc.desc      new OffsetModel(3960000, 900000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0174 begin`);
      const subject: OffsetModel = new OffsetModel(3960000, 900000);
      logInfo(`new OffsetModel(3960000, 900000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3960000);
      logInfo(`new OffsetModel(3960000, 900000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(900000);
      logInfo(`new OffsetModel(3960000, 900000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3960000, 900000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0174 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0175
     * @tc.name      ImageViewer_OffsetModelCtor_0175
     * @tc.desc      new OffsetModel(2160000, 360000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0175 begin`);
      const subject: OffsetModel = new OffsetModel(2160000, 360000);
      logInfo(`new OffsetModel(2160000, 360000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2160000);
      logInfo(`new OffsetModel(2160000, 360000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(360000);
      logInfo(`new OffsetModel(2160000, 360000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2160000, 360000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0175 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0176
     * @tc.name      ImageViewer_OffsetModelCtor_0176
     * @tc.desc      new OffsetModel(1867463.57, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0176 begin`);
      const subject: OffsetModel = new OffsetModel(1867463.57, 1);
      logInfo(`new OffsetModel(1867463.57, 1): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertClose(1867463.57, PRECISION);
      logInfo(`new OffsetModel(1867463.57, 1): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1);
      logInfo(`new OffsetModel(1867463.57, 1): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1867463.57, 1): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0176 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0177
     * @tc.name      ImageViewer_OffsetModelCtor_0177
     * @tc.desc      new OffsetModel(7020000, 61000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0177 begin`);
      const subject: OffsetModel = new OffsetModel(7020000, 61000);
      logInfo(`new OffsetModel(7020000, 61000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(7020000);
      logInfo(`new OffsetModel(7020000, 61000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(61000);
      logInfo(`new OffsetModel(7020000, 61000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(7020000, 61000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0177 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0178
     * @tc.name      ImageViewer_OffsetModelCtor_0178
     * @tc.desc      new OffsetModel(999, 999) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0178 begin`);
      const subject: OffsetModel = new OffsetModel(999, 999);
      logInfo(`new OffsetModel(999, 999): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(999);
      logInfo(`new OffsetModel(999, 999): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(999);
      logInfo(`new OffsetModel(999, 999): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(999, 999): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0178 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0179
     * @tc.name      ImageViewer_OffsetModelCtor_0179
     * @tc.desc      new OffsetModel(3600000, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0179 begin`);
      const subject: OffsetModel = new OffsetModel(3600000, 100);
      logInfo(`new OffsetModel(3600000, 100): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3600000);
      logInfo(`new OffsetModel(3600000, 100): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(100);
      logInfo(`new OffsetModel(3600000, 100): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3600000, 100): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0179 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0180
     * @tc.name      ImageViewer_OffsetModelCtor_0180
     * @tc.desc      new OffsetModel(5040000, 2340000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0180 begin`);
      const subject: OffsetModel = new OffsetModel(5040000, 2340000);
      logInfo(`new OffsetModel(5040000, 2340000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5040000);
      logInfo(`new OffsetModel(5040000, 2340000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2340000);
      logInfo(`new OffsetModel(5040000, 2340000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5040000, 2340000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0180 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0181
     * @tc.name      ImageViewer_OffsetModelCtor_0181
     * @tc.desc      new OffsetModel(720000, 999) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0181 begin`);
      const subject: OffsetModel = new OffsetModel(720000, 999);
      logInfo(`new OffsetModel(720000, 999): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(720000);
      logInfo(`new OffsetModel(720000, 999): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(999);
      logInfo(`new OffsetModel(720000, 999): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(720000, 999): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0181 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0182
     * @tc.name      ImageViewer_OffsetModelCtor_0182
     * @tc.desc      new OffsetModel(500, 3060000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0182 begin`);
      const subject: OffsetModel = new OffsetModel(500, 3060000);
      logInfo(`new OffsetModel(500, 3060000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(500);
      logInfo(`new OffsetModel(500, 3060000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3060000);
      logInfo(`new OffsetModel(500, 3060000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(500, 3060000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0182 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0183
     * @tc.name      ImageViewer_OffsetModelCtor_0183
     * @tc.desc      new OffsetModel(3599000, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0183 begin`);
      const subject: OffsetModel = new OffsetModel(3599000, 2);
      logInfo(`new OffsetModel(3599000, 2): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3599000);
      logInfo(`new OffsetModel(3599000, 2): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2);
      logInfo(`new OffsetModel(3599000, 2): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3599000, 2): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0183 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0184
     * @tc.name      ImageViewer_OffsetModelCtor_0184
     * @tc.desc      new OffsetModel(999, 4500000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0184 begin`);
      const subject: OffsetModel = new OffsetModel(999, 4500000);
      logInfo(`new OffsetModel(999, 4500000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(999);
      logInfo(`new OffsetModel(999, 4500000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4500000);
      logInfo(`new OffsetModel(999, 4500000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(999, 4500000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0184 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0185
     * @tc.name      ImageViewer_OffsetModelCtor_0185
     * @tc.desc      new OffsetModel(-513826, 1080000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0185 begin`);
      const subject: OffsetModel = new OffsetModel(-513826, 1080000);
      logInfo(`new OffsetModel(-513826, 1080000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(-513826);
      logInfo(`new OffsetModel(-513826, 1080000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1080000);
      logInfo(`new OffsetModel(-513826, 1080000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(-513826, 1080000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0185 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0186
     * @tc.name      ImageViewer_OffsetModelCtor_0186
     * @tc.desc      new OffsetModel(5886866, 3600000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0186 begin`);
      const subject: OffsetModel = new OffsetModel(5886866, 3600000);
      logInfo(`new OffsetModel(5886866, 3600000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5886866);
      logInfo(`new OffsetModel(5886866, 3600000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3600000);
      logInfo(`new OffsetModel(5886866, 3600000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5886866, 3600000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0186 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0187
     * @tc.name      ImageViewer_OffsetModelCtor_0187
     * @tc.desc      new OffsetModel(3, 4860000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0187 begin`);
      const subject: OffsetModel = new OffsetModel(3, 4860000);
      logInfo(`new OffsetModel(3, 4860000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3);
      logInfo(`new OffsetModel(3, 4860000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(4860000);
      logInfo(`new OffsetModel(3, 4860000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3, 4860000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0187 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0188
     * @tc.name      ImageViewer_OffsetModelCtor_0188
     * @tc.desc      new OffsetModel(2, 3420000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0188 begin`);
      const subject: OffsetModel = new OffsetModel(2, 3420000);
      logInfo(`new OffsetModel(2, 3420000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2);
      logInfo(`new OffsetModel(2, 3420000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3420000);
      logInfo(`new OffsetModel(2, 3420000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2, 3420000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0188 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0189
     * @tc.name      ImageViewer_OffsetModelCtor_0189
     * @tc.desc      new OffsetModel(1754722, 2700000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0189 begin`);
      const subject: OffsetModel = new OffsetModel(1754722, 2700000);
      logInfo(`new OffsetModel(1754722, 2700000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1754722);
      logInfo(`new OffsetModel(1754722, 2700000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2700000);
      logInfo(`new OffsetModel(1754722, 2700000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1754722, 2700000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0189 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0190
     * @tc.name      ImageViewer_OffsetModelCtor_0190
     * @tc.desc      new OffsetModel(6660000, 180000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0190 begin`);
      const subject: OffsetModel = new OffsetModel(6660000, 180000);
      logInfo(`new OffsetModel(6660000, 180000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6660000);
      logInfo(`new OffsetModel(6660000, 180000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(180000);
      logInfo(`new OffsetModel(6660000, 180000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6660000, 180000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0190 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0191
     * @tc.name      ImageViewer_OffsetModelCtor_0191
     * @tc.desc      new OffsetModel(1754722, 2340000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0191 begin`);
      const subject: OffsetModel = new OffsetModel(1754722, 2340000);
      logInfo(`new OffsetModel(1754722, 2340000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1754722);
      logInfo(`new OffsetModel(1754722, 2340000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(2340000);
      logInfo(`new OffsetModel(1754722, 2340000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1754722, 2340000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0191 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0192
     * @tc.name      ImageViewer_OffsetModelCtor_0192
     * @tc.desc      new OffsetModel(7200000, 1260000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0192 begin`);
      const subject: OffsetModel = new OffsetModel(7200000, 1260000);
      logInfo(`new OffsetModel(7200000, 1260000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(7200000);
      logInfo(`new OffsetModel(7200000, 1260000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1260000);
      logInfo(`new OffsetModel(7200000, 1260000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(7200000, 1260000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0192 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0193
     * @tc.name      ImageViewer_OffsetModelCtor_0193
     * @tc.desc      new OffsetModel(3240000, 7200000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0193 begin`);
      const subject: OffsetModel = new OffsetModel(3240000, 7200000);
      logInfo(`new OffsetModel(3240000, 7200000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3240000);
      logInfo(`new OffsetModel(3240000, 7200000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(7200000);
      logInfo(`new OffsetModel(3240000, 7200000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3240000, 7200000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0193 end`);
    });
  });
}
