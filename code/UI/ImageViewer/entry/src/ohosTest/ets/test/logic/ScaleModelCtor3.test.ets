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
import { ScaleModel } from '../../../../main/ets/model/ScaleModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new ScaleModel (13 cases). */
export default function scaleModelCtor3Test(): void {
  describe('ScaleModelCtor3Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0129
     * @tc.name      ImageViewer_ScaleModelCtor_0129
     * @tc.desc      new ScaleModel(5, 25, 30, -1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0129 begin`);
      const subject: ScaleModel = new ScaleModel(5, 25, 30, -1);
      logInfo(`new ScaleModel(5, 25, 30, -1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(5);
      logInfo(`new ScaleModel(5, 25, 30, -1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(25);
      logInfo(`new ScaleModel(5, 25, 30, -1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(5, 25, 30, -1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(5, 25, 30, -1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0129 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0130
     * @tc.name      ImageViewer_ScaleModelCtor_0130
     * @tc.desc      new ScaleModel(20, 100, 15, 20) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0130 begin`);
      const subject: ScaleModel = new ScaleModel(20, 100, 15, 20);
      logInfo(`new ScaleModel(20, 100, 15, 20): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(20);
      logInfo(`new ScaleModel(20, 100, 15, 20): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(100);
      logInfo(`new ScaleModel(20, 100, 15, 20): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(20, 100, 15, 20): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(20, 100, 15, 20): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0130 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0131
     * @tc.name      ImageViewer_ScaleModelCtor_0131
     * @tc.desc      new ScaleModel(1.5, 0, 35, 1.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0131 begin`);
      const subject: ScaleModel = new ScaleModel(1.5, 0, 35, 1.5);
      logInfo(`new ScaleModel(1.5, 0, 35, 1.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 0, 35, 1.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(1.5, 0, 35, 1.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(35);
      logInfo(`new ScaleModel(1.5, 0, 35, 1.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 0, 35, 1.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0131 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0132
     * @tc.name      ImageViewer_ScaleModelCtor_0132
     * @tc.desc      new ScaleModel(15, 100, 1, 100) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0132 begin`);
      const subject: ScaleModel = new ScaleModel(15, 100, 1, 100);
      logInfo(`new ScaleModel(15, 100, 1, 100): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(15);
      logInfo(`new ScaleModel(15, 100, 1, 100): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(100);
      logInfo(`new ScaleModel(15, 100, 1, 100): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(15, 100, 1, 100): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(15, 100, 1, 100): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0132 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0133
     * @tc.name      ImageViewer_ScaleModelCtor_0133
     * @tc.desc      new ScaleModel(25, 10, 96.76, 25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0133 begin`);
      const subject: ScaleModel = new ScaleModel(25, 10, 96.76, 25);
      logInfo(`new ScaleModel(25, 10, 96.76, 25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(25);
      logInfo(`new ScaleModel(25, 10, 96.76, 25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(25, 10, 96.76, 25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(96.76, PRECISION);
      logInfo(`new ScaleModel(25, 10, 96.76, 25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(25, 10, 96.76, 25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0133 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0134
     * @tc.name      ImageViewer_ScaleModelCtor_0134
     * @tc.desc      new ScaleModel(0.25, 85, 30, 1.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0134 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 85, 30, 1.5);
      logInfo(`new ScaleModel(0.25, 85, 30, 1.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(0.25, 85, 30, 1.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(85);
      logInfo(`new ScaleModel(0.25, 85, 30, 1.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(0.25, 85, 30, 1.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(0.25, 85, 30, 1.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0134 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0135
     * @tc.name      ImageViewer_ScaleModelCtor_0135
     * @tc.desc      new ScaleModel(-13, 40, 40, 0.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0135 begin`);
      const subject: ScaleModel = new ScaleModel(-13, 40, 40, 0.5);
      logInfo(`new ScaleModel(-13, 40, 40, 0.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-13);
      logInfo(`new ScaleModel(-13, 40, 40, 0.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(40);
      logInfo(`new ScaleModel(-13, 40, 40, 0.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(40);
      logInfo(`new ScaleModel(-13, 40, 40, 0.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(-13, 40, 40, 0.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0135 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0136
     * @tc.name      ImageViewer_ScaleModelCtor_0136
     * @tc.desc      new ScaleModel(10, 40, 12.73, 0.25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0136 begin`);
      const subject: ScaleModel = new ScaleModel(10, 40, 12.73, 0.25);
      logInfo(`new ScaleModel(10, 40, 12.73, 0.25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(10);
      logInfo(`new ScaleModel(10, 40, 12.73, 0.25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(40);
      logInfo(`new ScaleModel(10, 40, 12.73, 0.25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(10, 40, 12.73, 0.25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(10, 40, 12.73, 0.25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0136 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0137
     * @tc.name      ImageViewer_ScaleModelCtor_0137
     * @tc.desc      new ScaleModel(1, 10, 10, 15) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0137 begin`);
      const subject: ScaleModel = new ScaleModel(1, 10, 10, 15);
      logInfo(`new ScaleModel(1, 10, 10, 15): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`new ScaleModel(1, 10, 10, 15): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(1, 10, 10, 15): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(1, 10, 10, 15): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(1, 10, 10, 15): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0137 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0138
     * @tc.name      ImageViewer_ScaleModelCtor_0138
     * @tc.desc      new ScaleModel(2, 35, 40, 0.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0138 begin`);
      const subject: ScaleModel = new ScaleModel(2, 35, 40, 0.5);
      logInfo(`new ScaleModel(2, 35, 40, 0.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(2);
      logInfo(`new ScaleModel(2, 35, 40, 0.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(35);
      logInfo(`new ScaleModel(2, 35, 40, 0.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(40);
      logInfo(`new ScaleModel(2, 35, 40, 0.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(2, 35, 40, 0.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0138 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0139
     * @tc.name      ImageViewer_ScaleModelCtor_0139
     * @tc.desc      new ScaleModel(30, 3, 100, 0.25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0139 begin`);
      const subject: ScaleModel = new ScaleModel(30, 3, 100, 0.25);
      logInfo(`new ScaleModel(30, 3, 100, 0.25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(30);
      logInfo(`new ScaleModel(30, 3, 100, 0.25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(3);
      logInfo(`new ScaleModel(30, 3, 100, 0.25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(30, 3, 100, 0.25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(30, 3, 100, 0.25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0139 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0140
     * @tc.name      ImageViewer_ScaleModelCtor_0140
     * @tc.desc      new ScaleModel(3, 35, 3, 30) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0140 begin`);
      const subject: ScaleModel = new ScaleModel(3, 35, 3, 30);
      logInfo(`new ScaleModel(3, 35, 3, 30): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(3);
      logInfo(`new ScaleModel(3, 35, 3, 30): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(35);
      logInfo(`new ScaleModel(3, 35, 3, 30): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(3, 35, 3, 30): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(3, 35, 3, 30): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0140 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0141
     * @tc.name      ImageViewer_ScaleModelCtor_0141
     * @tc.desc      new ScaleModel(0, 5, 12.73, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0141 begin`);
      const subject: ScaleModel = new ScaleModel(0, 5, 12.73, 0);
      logInfo(`new ScaleModel(0, 5, 12.73, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 5, 12.73, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(5);
      logInfo(`new ScaleModel(0, 5, 12.73, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(0, 5, 12.73, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 5, 12.73, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0141 end`);
    });
  });
}
