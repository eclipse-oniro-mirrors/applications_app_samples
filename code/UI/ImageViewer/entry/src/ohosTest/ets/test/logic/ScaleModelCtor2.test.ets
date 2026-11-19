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

/** Logic checks for new ScaleModel (64 cases). */
export default function scaleModelCtor2Test(): void {
  describe('ScaleModelCtor2Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0065
     * @tc.name      ImageViewer_ScaleModelCtor_0065
     * @tc.desc      new ScaleModel(30, 15, 12.73, 5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0065 begin`);
      const subject: ScaleModel = new ScaleModel(30, 15, 12.73, 5);
      logInfo(`new ScaleModel(30, 15, 12.73, 5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(30);
      logInfo(`new ScaleModel(30, 15, 12.73, 5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(15);
      logInfo(`new ScaleModel(30, 15, 12.73, 5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(30, 15, 12.73, 5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(30, 15, 12.73, 5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0066
     * @tc.name      ImageViewer_ScaleModelCtor_0066
     * @tc.desc      new ScaleModel(1, 35, -1, 0.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0066 begin`);
      const subject: ScaleModel = new ScaleModel(1, 35, -1, 0.5);
      logInfo(`new ScaleModel(1, 35, -1, 0.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`new ScaleModel(1, 35, -1, 0.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(35);
      logInfo(`new ScaleModel(1, 35, -1, 0.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(1, 35, -1, 0.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(1, 35, -1, 0.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0067
     * @tc.name      ImageViewer_ScaleModelCtor_0067
     * @tc.desc      new ScaleModel(-13, 85, 5, -1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0067 begin`);
      const subject: ScaleModel = new ScaleModel(-13, 85, 5, -1);
      logInfo(`new ScaleModel(-13, 85, 5, -1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-13);
      logInfo(`new ScaleModel(-13, 85, 5, -1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(85);
      logInfo(`new ScaleModel(-13, 85, 5, -1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(-13, 85, 5, -1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(-13, 85, 5, -1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0068
     * @tc.name      ImageViewer_ScaleModelCtor_0068
     * @tc.desc      new ScaleModel(1.5, 100, 12.73, 0.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0068 begin`);
      const subject: ScaleModel = new ScaleModel(1.5, 100, 12.73, 0.5);
      logInfo(`new ScaleModel(1.5, 100, 12.73, 0.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 100, 12.73, 0.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(100);
      logInfo(`new ScaleModel(1.5, 100, 12.73, 0.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(1.5, 100, 12.73, 0.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 100, 12.73, 0.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0069
     * @tc.name      ImageViewer_ScaleModelCtor_0069
     * @tc.desc      new ScaleModel(30, 5, 12.73, 25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0069 begin`);
      const subject: ScaleModel = new ScaleModel(30, 5, 12.73, 25);
      logInfo(`new ScaleModel(30, 5, 12.73, 25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(30);
      logInfo(`new ScaleModel(30, 5, 12.73, 25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(5);
      logInfo(`new ScaleModel(30, 5, 12.73, 25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(30, 5, 12.73, 25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(30, 5, 12.73, 25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0070
     * @tc.name      ImageViewer_ScaleModelCtor_0070
     * @tc.desc      new ScaleModel(0, 25, 15, 15) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0070 begin`);
      const subject: ScaleModel = new ScaleModel(0, 25, 15, 15);
      logInfo(`new ScaleModel(0, 25, 15, 15): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 25, 15, 15): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(25);
      logInfo(`new ScaleModel(0, 25, 15, 15): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(0, 25, 15, 15): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(0, 25, 15, 15): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0071
     * @tc.name      ImageViewer_ScaleModelCtor_0071
     * @tc.desc      new ScaleModel(3, 100, 100, 1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0071 begin`);
      const subject: ScaleModel = new ScaleModel(3, 100, 100, 1);
      logInfo(`new ScaleModel(3, 100, 100, 1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(3);
      logInfo(`new ScaleModel(3, 100, 100, 1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(100);
      logInfo(`new ScaleModel(3, 100, 100, 1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(3, 100, 100, 1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(3, 100, 100, 1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0072
     * @tc.name      ImageViewer_ScaleModelCtor_0072
     * @tc.desc      new ScaleModel(10, 35, 40, 3) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0072 begin`);
      const subject: ScaleModel = new ScaleModel(10, 35, 40, 3);
      logInfo(`new ScaleModel(10, 35, 40, 3): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(10);
      logInfo(`new ScaleModel(10, 35, 40, 3): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(35);
      logInfo(`new ScaleModel(10, 35, 40, 3): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(40);
      logInfo(`new ScaleModel(10, 35, 40, 3): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(10, 35, 40, 3): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0073
     * @tc.name      ImageViewer_ScaleModelCtor_0073
     * @tc.desc      new ScaleModel(0.25, -1, 20, 3) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0073 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, -1, 20, 3);
      logInfo(`new ScaleModel(0.25, -1, 20, 3): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(0.25, -1, 20, 3): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(-1);
      logInfo(`new ScaleModel(0.25, -1, 20, 3): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(0.25, -1, 20, 3): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(0.25, -1, 20, 3): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0074
     * @tc.name      ImageViewer_ScaleModelCtor_0074
     * @tc.desc      new ScaleModel(30, 35, 15, 100) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0074 begin`);
      const subject: ScaleModel = new ScaleModel(30, 35, 15, 100);
      logInfo(`new ScaleModel(30, 35, 15, 100): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(30);
      logInfo(`new ScaleModel(30, 35, 15, 100): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(35);
      logInfo(`new ScaleModel(30, 35, 15, 100): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(30, 35, 15, 100): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(30, 35, 15, 100): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0075
     * @tc.name      ImageViewer_ScaleModelCtor_0075
     * @tc.desc      new ScaleModel(-13, 25, 25, 25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0075 begin`);
      const subject: ScaleModel = new ScaleModel(-13, 25, 25, 25);
      logInfo(`new ScaleModel(-13, 25, 25, 25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-13);
      logInfo(`new ScaleModel(-13, 25, 25, 25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(25);
      logInfo(`new ScaleModel(-13, 25, 25, 25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(-13, 25, 25, 25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(-13, 25, 25, 25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0076
     * @tc.name      ImageViewer_ScaleModelCtor_0076
     * @tc.desc      new ScaleModel(0, 85, 12.73, 1.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0076 begin`);
      const subject: ScaleModel = new ScaleModel(0, 85, 12.73, 1.5);
      logInfo(`new ScaleModel(0, 85, 12.73, 1.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 85, 12.73, 1.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(85);
      logInfo(`new ScaleModel(0, 85, 12.73, 1.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(0, 85, 12.73, 1.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(0, 85, 12.73, 1.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0077
     * @tc.name      ImageViewer_ScaleModelCtor_0077
     * @tc.desc      new ScaleModel(2, 15, 0, 3) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0077 begin`);
      const subject: ScaleModel = new ScaleModel(2, 15, 0, 3);
      logInfo(`new ScaleModel(2, 15, 0, 3): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(2);
      logInfo(`new ScaleModel(2, 15, 0, 3): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(15);
      logInfo(`new ScaleModel(2, 15, 0, 3): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(2, 15, 0, 3): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(2, 15, 0, 3): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0078
     * @tc.name      ImageViewer_ScaleModelCtor_0078
     * @tc.desc      new ScaleModel(100, 45, 5, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0078 begin`);
      const subject: ScaleModel = new ScaleModel(100, 45, 5, 0);
      logInfo(`new ScaleModel(100, 45, 5, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(100);
      logInfo(`new ScaleModel(100, 45, 5, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(45);
      logInfo(`new ScaleModel(100, 45, 5, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(100, 45, 5, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(100, 45, 5, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0079
     * @tc.name      ImageViewer_ScaleModelCtor_0079
     * @tc.desc      new ScaleModel(-1, 5, 96.76, 1.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0079 begin`);
      const subject: ScaleModel = new ScaleModel(-1, 5, 96.76, 1.5);
      logInfo(`new ScaleModel(-1, 5, 96.76, 1.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(-1, 5, 96.76, 1.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(5);
      logInfo(`new ScaleModel(-1, 5, 96.76, 1.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(96.76, PRECISION);
      logInfo(`new ScaleModel(-1, 5, 96.76, 1.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(-1, 5, 96.76, 1.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0080
     * @tc.name      ImageViewer_ScaleModelCtor_0080
     * @tc.desc      new ScaleModel(0.5, 10, 20, 25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0080 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 10, 20, 25);
      logInfo(`new ScaleModel(0.5, 10, 20, 25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(0.5, 10, 20, 25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(0.5, 10, 20, 25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(0.5, 10, 20, 25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(0.5, 10, 20, 25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0081
     * @tc.name      ImageViewer_ScaleModelCtor_0081
     * @tc.desc      new ScaleModel(3, 100, -1, 20) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0081 begin`);
      const subject: ScaleModel = new ScaleModel(3, 100, -1, 20);
      logInfo(`new ScaleModel(3, 100, -1, 20): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(3);
      logInfo(`new ScaleModel(3, 100, -1, 20): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(100);
      logInfo(`new ScaleModel(3, 100, -1, 20): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(3, 100, -1, 20): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(3, 100, -1, 20): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0082
     * @tc.name      ImageViewer_ScaleModelCtor_0082
     * @tc.desc      new ScaleModel(3, -1, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0082 begin`);
      const subject: ScaleModel = new ScaleModel(3, -1, 0, 0);
      logInfo(`new ScaleModel(3, -1, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(3);
      logInfo(`new ScaleModel(3, -1, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(-1);
      logInfo(`new ScaleModel(3, -1, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(3, -1, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(3, -1, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0083
     * @tc.name      ImageViewer_ScaleModelCtor_0083
     * @tc.desc      new ScaleModel(-1, 3, 10, 0.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0083 begin`);
      const subject: ScaleModel = new ScaleModel(-1, 3, 10, 0.5);
      logInfo(`new ScaleModel(-1, 3, 10, 0.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(-1, 3, 10, 0.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(3);
      logInfo(`new ScaleModel(-1, 3, 10, 0.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(-1, 3, 10, 0.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(-1, 3, 10, 0.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0084
     * @tc.name      ImageViewer_ScaleModelCtor_0084
     * @tc.desc      new ScaleModel(20, 85, 3, 100) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0084 begin`);
      const subject: ScaleModel = new ScaleModel(20, 85, 3, 100);
      logInfo(`new ScaleModel(20, 85, 3, 100): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(20);
      logInfo(`new ScaleModel(20, 85, 3, 100): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(85);
      logInfo(`new ScaleModel(20, 85, 3, 100): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(20, 85, 3, 100): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(20, 85, 3, 100): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0085
     * @tc.name      ImageViewer_ScaleModelCtor_0085
     * @tc.desc      new ScaleModel(10, 100, 3, 10) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0085 begin`);
      const subject: ScaleModel = new ScaleModel(10, 100, 3, 10);
      logInfo(`new ScaleModel(10, 100, 3, 10): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(10);
      logInfo(`new ScaleModel(10, 100, 3, 10): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(100);
      logInfo(`new ScaleModel(10, 100, 3, 10): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(10, 100, 3, 10): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(10, 100, 3, 10): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0086
     * @tc.name      ImageViewer_ScaleModelCtor_0086
     * @tc.desc      new ScaleModel(5, 10, 3, 20) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0086 begin`);
      const subject: ScaleModel = new ScaleModel(5, 10, 3, 20);
      logInfo(`new ScaleModel(5, 10, 3, 20): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(5);
      logInfo(`new ScaleModel(5, 10, 3, 20): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(5, 10, 3, 20): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(5, 10, 3, 20): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(5, 10, 3, 20): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0087
     * @tc.name      ImageViewer_ScaleModelCtor_0087
     * @tc.desc      new ScaleModel(3, 15, 15, 5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0087 begin`);
      const subject: ScaleModel = new ScaleModel(3, 15, 15, 5);
      logInfo(`new ScaleModel(3, 15, 15, 5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(3);
      logInfo(`new ScaleModel(3, 15, 15, 5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(15);
      logInfo(`new ScaleModel(3, 15, 15, 5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(3, 15, 15, 5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(3, 15, 15, 5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0088
     * @tc.name      ImageViewer_ScaleModelCtor_0088
     * @tc.desc      new ScaleModel(25, 40, 30, -1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0088 begin`);
      const subject: ScaleModel = new ScaleModel(25, 40, 30, -1);
      logInfo(`new ScaleModel(25, 40, 30, -1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(25);
      logInfo(`new ScaleModel(25, 40, 30, -1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(40);
      logInfo(`new ScaleModel(25, 40, 30, -1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(25, 40, 30, -1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(25, 40, 30, -1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0089
     * @tc.name      ImageViewer_ScaleModelCtor_0089
     * @tc.desc      new ScaleModel(2, 0, -1, 0.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0089 begin`);
      const subject: ScaleModel = new ScaleModel(2, 0, -1, 0.5);
      logInfo(`new ScaleModel(2, 0, -1, 0.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(2);
      logInfo(`new ScaleModel(2, 0, -1, 0.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(2, 0, -1, 0.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(2, 0, -1, 0.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(2, 0, -1, 0.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0090
     * @tc.name      ImageViewer_ScaleModelCtor_0090
     * @tc.desc      new ScaleModel(0.5, 20, -1, -1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0090 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 20, -1, -1);
      logInfo(`new ScaleModel(0.5, 20, -1, -1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(0.5, 20, -1, -1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(20);
      logInfo(`new ScaleModel(0.5, 20, -1, -1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(0.5, 20, -1, -1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(0.5, 20, -1, -1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0091
     * @tc.name      ImageViewer_ScaleModelCtor_0091
     * @tc.desc      new ScaleModel(1.5, 5, 5, 1.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0091 begin`);
      const subject: ScaleModel = new ScaleModel(1.5, 5, 5, 1.5);
      logInfo(`new ScaleModel(1.5, 5, 5, 1.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 5, 5, 1.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(5);
      logInfo(`new ScaleModel(1.5, 5, 5, 1.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(1.5, 5, 5, 1.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 5, 5, 1.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0092
     * @tc.name      ImageViewer_ScaleModelCtor_0092
     * @tc.desc      new ScaleModel(15, 45, 3, 25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0092 begin`);
      const subject: ScaleModel = new ScaleModel(15, 45, 3, 25);
      logInfo(`new ScaleModel(15, 45, 3, 25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(15);
      logInfo(`new ScaleModel(15, 45, 3, 25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(45);
      logInfo(`new ScaleModel(15, 45, 3, 25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(15, 45, 3, 25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(15, 45, 3, 25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0093
     * @tc.name      ImageViewer_ScaleModelCtor_0093
     * @tc.desc      new ScaleModel(0.5, 10, 30, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0093 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 10, 30, 0);
      logInfo(`new ScaleModel(0.5, 10, 30, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(0.5, 10, 30, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(0.5, 10, 30, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(0.5, 10, 30, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0.5, 10, 30, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0094
     * @tc.name      ImageViewer_ScaleModelCtor_0094
     * @tc.desc      new ScaleModel(0, 30, 12.73, -1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0094 begin`);
      const subject: ScaleModel = new ScaleModel(0, 30, 12.73, -1);
      logInfo(`new ScaleModel(0, 30, 12.73, -1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 30, 12.73, -1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(30);
      logInfo(`new ScaleModel(0, 30, 12.73, -1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(0, 30, 12.73, -1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(0, 30, 12.73, -1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0095
     * @tc.name      ImageViewer_ScaleModelCtor_0095
     * @tc.desc      new ScaleModel(1, 35, 30, 20) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0095 begin`);
      const subject: ScaleModel = new ScaleModel(1, 35, 30, 20);
      logInfo(`new ScaleModel(1, 35, 30, 20): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`new ScaleModel(1, 35, 30, 20): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(35);
      logInfo(`new ScaleModel(1, 35, 30, 20): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(1, 35, 30, 20): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(1, 35, 30, 20): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0096
     * @tc.name      ImageViewer_ScaleModelCtor_0096
     * @tc.desc      new ScaleModel(0.25, 1, 100, 1.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0096 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 1, 100, 1.5);
      logInfo(`new ScaleModel(0.25, 1, 100, 1.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(0.25, 1, 100, 1.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`new ScaleModel(0.25, 1, 100, 1.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(0.25, 1, 100, 1.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(0.25, 1, 100, 1.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0097
     * @tc.name      ImageViewer_ScaleModelCtor_0097
     * @tc.desc      new ScaleModel(2, 3, 35, -1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0097 begin`);
      const subject: ScaleModel = new ScaleModel(2, 3, 35, -1);
      logInfo(`new ScaleModel(2, 3, 35, -1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(2);
      logInfo(`new ScaleModel(2, 3, 35, -1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(3);
      logInfo(`new ScaleModel(2, 3, 35, -1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(35);
      logInfo(`new ScaleModel(2, 3, 35, -1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(2, 3, 35, -1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0098
     * @tc.name      ImageViewer_ScaleModelCtor_0098
     * @tc.desc      new ScaleModel(2, 20, 96.76, 3) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0098 begin`);
      const subject: ScaleModel = new ScaleModel(2, 20, 96.76, 3);
      logInfo(`new ScaleModel(2, 20, 96.76, 3): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(2);
      logInfo(`new ScaleModel(2, 20, 96.76, 3): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(20);
      logInfo(`new ScaleModel(2, 20, 96.76, 3): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(96.76, PRECISION);
      logInfo(`new ScaleModel(2, 20, 96.76, 3): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(2, 20, 96.76, 3): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0099
     * @tc.name      ImageViewer_ScaleModelCtor_0099
     * @tc.desc      new ScaleModel(10, 25, 5, 30) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0099 begin`);
      const subject: ScaleModel = new ScaleModel(10, 25, 5, 30);
      logInfo(`new ScaleModel(10, 25, 5, 30): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(10);
      logInfo(`new ScaleModel(10, 25, 5, 30): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(25);
      logInfo(`new ScaleModel(10, 25, 5, 30): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(10, 25, 5, 30): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(10, 25, 5, 30): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0100
     * @tc.name      ImageViewer_ScaleModelCtor_0100
     * @tc.desc      new ScaleModel(1.5, 25, 40, 25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0100 begin`);
      const subject: ScaleModel = new ScaleModel(1.5, 25, 40, 25);
      logInfo(`new ScaleModel(1.5, 25, 40, 25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 25, 40, 25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(25);
      logInfo(`new ScaleModel(1.5, 25, 40, 25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(40);
      logInfo(`new ScaleModel(1.5, 25, 40, 25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(1.5, 25, 40, 25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0101
     * @tc.name      ImageViewer_ScaleModelCtor_0101
     * @tc.desc      new ScaleModel(15, 5, 20, 2) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0101 begin`);
      const subject: ScaleModel = new ScaleModel(15, 5, 20, 2);
      logInfo(`new ScaleModel(15, 5, 20, 2): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(15);
      logInfo(`new ScaleModel(15, 5, 20, 2): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(5);
      logInfo(`new ScaleModel(15, 5, 20, 2): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(15, 5, 20, 2): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(2);
      logInfo(`new ScaleModel(15, 5, 20, 2): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0102
     * @tc.name      ImageViewer_ScaleModelCtor_0102
     * @tc.desc      new ScaleModel(0.5, 30, 25, 5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0102 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 30, 25, 5);
      logInfo(`new ScaleModel(0.5, 30, 25, 5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(0.5, 30, 25, 5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(30);
      logInfo(`new ScaleModel(0.5, 30, 25, 5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(0.5, 30, 25, 5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(0.5, 30, 25, 5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0103
     * @tc.name      ImageViewer_ScaleModelCtor_0103
     * @tc.desc      new ScaleModel(20, 45, 2, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0103 begin`);
      const subject: ScaleModel = new ScaleModel(20, 45, 2, 0);
      logInfo(`new ScaleModel(20, 45, 2, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(20);
      logInfo(`new ScaleModel(20, 45, 2, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(45);
      logInfo(`new ScaleModel(20, 45, 2, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(2);
      logInfo(`new ScaleModel(20, 45, 2, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(20, 45, 2, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0104
     * @tc.name      ImageViewer_ScaleModelCtor_0104
     * @tc.desc      new ScaleModel(5, 1, 100, 1.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0104 begin`);
      const subject: ScaleModel = new ScaleModel(5, 1, 100, 1.5);
      logInfo(`new ScaleModel(5, 1, 100, 1.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(5);
      logInfo(`new ScaleModel(5, 1, 100, 1.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`new ScaleModel(5, 1, 100, 1.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(5, 1, 100, 1.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(5, 1, 100, 1.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0105
     * @tc.name      ImageViewer_ScaleModelCtor_0105
     * @tc.desc      new ScaleModel(-1, 30, 20, 10) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0105 begin`);
      const subject: ScaleModel = new ScaleModel(-1, 30, 20, 10);
      logInfo(`new ScaleModel(-1, 30, 20, 10): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(-1, 30, 20, 10): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(30);
      logInfo(`new ScaleModel(-1, 30, 20, 10): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(-1, 30, 20, 10): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(-1, 30, 20, 10): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0106
     * @tc.name      ImageViewer_ScaleModelCtor_0106
     * @tc.desc      new ScaleModel(3, 30, 20, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0106 begin`);
      const subject: ScaleModel = new ScaleModel(3, 30, 20, 0);
      logInfo(`new ScaleModel(3, 30, 20, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(3);
      logInfo(`new ScaleModel(3, 30, 20, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(30);
      logInfo(`new ScaleModel(3, 30, 20, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(3, 30, 20, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(3, 30, 20, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0107
     * @tc.name      ImageViewer_ScaleModelCtor_0107
     * @tc.desc      new ScaleModel(20, 3, 20, 0.25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0107 begin`);
      const subject: ScaleModel = new ScaleModel(20, 3, 20, 0.25);
      logInfo(`new ScaleModel(20, 3, 20, 0.25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(20);
      logInfo(`new ScaleModel(20, 3, 20, 0.25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(3);
      logInfo(`new ScaleModel(20, 3, 20, 0.25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(20, 3, 20, 0.25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(20, 3, 20, 0.25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0108
     * @tc.name      ImageViewer_ScaleModelCtor_0108
     * @tc.desc      new ScaleModel(5, 1, 1, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0108 begin`);
      const subject: ScaleModel = new ScaleModel(5, 1, 1, 0);
      logInfo(`new ScaleModel(5, 1, 1, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(5);
      logInfo(`new ScaleModel(5, 1, 1, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`new ScaleModel(5, 1, 1, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(5, 1, 1, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(5, 1, 1, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0109
     * @tc.name      ImageViewer_ScaleModelCtor_0109
     * @tc.desc      new ScaleModel(15, -1, 35, 30) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0109 begin`);
      const subject: ScaleModel = new ScaleModel(15, -1, 35, 30);
      logInfo(`new ScaleModel(15, -1, 35, 30): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(15);
      logInfo(`new ScaleModel(15, -1, 35, 30): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(-1);
      logInfo(`new ScaleModel(15, -1, 35, 30): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(35);
      logInfo(`new ScaleModel(15, -1, 35, 30): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(15, -1, 35, 30): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0110
     * @tc.name      ImageViewer_ScaleModelCtor_0110
     * @tc.desc      new ScaleModel(1.5, 3, 5, 3) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0110 begin`);
      const subject: ScaleModel = new ScaleModel(1.5, 3, 5, 3);
      logInfo(`new ScaleModel(1.5, 3, 5, 3): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 3, 5, 3): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(3);
      logInfo(`new ScaleModel(1.5, 3, 5, 3): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(1.5, 3, 5, 3): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(1.5, 3, 5, 3): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0111
     * @tc.name      ImageViewer_ScaleModelCtor_0111
     * @tc.desc      new ScaleModel(100, 10, 1, 30) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0111 begin`);
      const subject: ScaleModel = new ScaleModel(100, 10, 1, 30);
      logInfo(`new ScaleModel(100, 10, 1, 30): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(100);
      logInfo(`new ScaleModel(100, 10, 1, 30): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(100, 10, 1, 30): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(100, 10, 1, 30): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(100, 10, 1, 30): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0112
     * @tc.name      ImageViewer_ScaleModelCtor_0112
     * @tc.desc      new ScaleModel(-1, 45, 2, 30) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0112 begin`);
      const subject: ScaleModel = new ScaleModel(-1, 45, 2, 30);
      logInfo(`new ScaleModel(-1, 45, 2, 30): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(-1, 45, 2, 30): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(45);
      logInfo(`new ScaleModel(-1, 45, 2, 30): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(2);
      logInfo(`new ScaleModel(-1, 45, 2, 30): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(-1, 45, 2, 30): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0113
     * @tc.name      ImageViewer_ScaleModelCtor_0113
     * @tc.desc      new ScaleModel(30, 2, 15, 15) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0113 begin`);
      const subject: ScaleModel = new ScaleModel(30, 2, 15, 15);
      logInfo(`new ScaleModel(30, 2, 15, 15): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(30);
      logInfo(`new ScaleModel(30, 2, 15, 15): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(2);
      logInfo(`new ScaleModel(30, 2, 15, 15): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(30, 2, 15, 15): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(30, 2, 15, 15): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0114
     * @tc.name      ImageViewer_ScaleModelCtor_0114
     * @tc.desc      new ScaleModel(10, 45, 5, 20) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0114 begin`);
      const subject: ScaleModel = new ScaleModel(10, 45, 5, 20);
      logInfo(`new ScaleModel(10, 45, 5, 20): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(10);
      logInfo(`new ScaleModel(10, 45, 5, 20): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(45);
      logInfo(`new ScaleModel(10, 45, 5, 20): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(10, 45, 5, 20): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(10, 45, 5, 20): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0115
     * @tc.name      ImageViewer_ScaleModelCtor_0115
     * @tc.desc      new ScaleModel(0.25, 10, 12.73, 100) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0115 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 10, 12.73, 100);
      logInfo(`new ScaleModel(0.25, 10, 12.73, 100): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(0.25, 10, 12.73, 100): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(0.25, 10, 12.73, 100): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(0.25, 10, 12.73, 100): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(0.25, 10, 12.73, 100): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0116
     * @tc.name      ImageViewer_ScaleModelCtor_0116
     * @tc.desc      new ScaleModel(0.5, 15, 3, 100) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0116 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 15, 3, 100);
      logInfo(`new ScaleModel(0.5, 15, 3, 100): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(0.5, 15, 3, 100): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(15);
      logInfo(`new ScaleModel(0.5, 15, 3, 100): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(0.5, 15, 3, 100): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(0.5, 15, 3, 100): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0117
     * @tc.name      ImageViewer_ScaleModelCtor_0117
     * @tc.desc      new ScaleModel(-1, 20, 1, 10) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0117 begin`);
      const subject: ScaleModel = new ScaleModel(-1, 20, 1, 10);
      logInfo(`new ScaleModel(-1, 20, 1, 10): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(-1, 20, 1, 10): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(20);
      logInfo(`new ScaleModel(-1, 20, 1, 10): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(-1, 20, 1, 10): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(-1, 20, 1, 10): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0118
     * @tc.name      ImageViewer_ScaleModelCtor_0118
     * @tc.desc      new ScaleModel(0, 10, -1, 1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0118 begin`);
      const subject: ScaleModel = new ScaleModel(0, 10, -1, 1);
      logInfo(`new ScaleModel(0, 10, -1, 1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 10, -1, 1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(0, 10, -1, 1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(0, 10, -1, 1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(0, 10, -1, 1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0119
     * @tc.name      ImageViewer_ScaleModelCtor_0119
     * @tc.desc      new ScaleModel(0, 5, 0, 0.25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0119 begin`);
      const subject: ScaleModel = new ScaleModel(0, 5, 0, 0.25);
      logInfo(`new ScaleModel(0, 5, 0, 0.25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 5, 0, 0.25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(5);
      logInfo(`new ScaleModel(0, 5, 0, 0.25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 5, 0, 0.25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(0, 5, 0, 0.25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0120
     * @tc.name      ImageViewer_ScaleModelCtor_0120
     * @tc.desc      new ScaleModel(0, 20, 40, 10) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0120 begin`);
      const subject: ScaleModel = new ScaleModel(0, 20, 40, 10);
      logInfo(`new ScaleModel(0, 20, 40, 10): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 20, 40, 10): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(20);
      logInfo(`new ScaleModel(0, 20, 40, 10): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(40);
      logInfo(`new ScaleModel(0, 20, 40, 10): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(0, 20, 40, 10): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0121
     * @tc.name      ImageViewer_ScaleModelCtor_0121
     * @tc.desc      new ScaleModel(0, 45, 40, -1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0121 begin`);
      const subject: ScaleModel = new ScaleModel(0, 45, 40, -1);
      logInfo(`new ScaleModel(0, 45, 40, -1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 45, 40, -1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(45);
      logInfo(`new ScaleModel(0, 45, 40, -1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(40);
      logInfo(`new ScaleModel(0, 45, 40, -1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(0, 45, 40, -1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0122
     * @tc.name      ImageViewer_ScaleModelCtor_0122
     * @tc.desc      new ScaleModel(0.5, 100, -1, 0.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0122 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 100, -1, 0.5);
      logInfo(`new ScaleModel(0.5, 100, -1, 0.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(0.5, 100, -1, 0.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(100);
      logInfo(`new ScaleModel(0.5, 100, -1, 0.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(0.5, 100, -1, 0.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(0.5, 100, -1, 0.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0123
     * @tc.name      ImageViewer_ScaleModelCtor_0123
     * @tc.desc      new ScaleModel(10, 25, 0, 1.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0123 begin`);
      const subject: ScaleModel = new ScaleModel(10, 25, 0, 1.5);
      logInfo(`new ScaleModel(10, 25, 0, 1.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(10);
      logInfo(`new ScaleModel(10, 25, 0, 1.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(25);
      logInfo(`new ScaleModel(10, 25, 0, 1.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(10, 25, 0, 1.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(10, 25, 0, 1.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0124
     * @tc.name      ImageViewer_ScaleModelCtor_0124
     * @tc.desc      new ScaleModel(1, 25, 15, -1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0124 begin`);
      const subject: ScaleModel = new ScaleModel(1, 25, 15, -1);
      logInfo(`new ScaleModel(1, 25, 15, -1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`new ScaleModel(1, 25, 15, -1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(25);
      logInfo(`new ScaleModel(1, 25, 15, -1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(1, 25, 15, -1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(1, 25, 15, -1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0125
     * @tc.name      ImageViewer_ScaleModelCtor_0125
     * @tc.desc      new ScaleModel(-13, 10, 3, 3) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0125 begin`);
      const subject: ScaleModel = new ScaleModel(-13, 10, 3, 3);
      logInfo(`new ScaleModel(-13, 10, 3, 3): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-13);
      logInfo(`new ScaleModel(-13, 10, 3, 3): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(-13, 10, 3, 3): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(-13, 10, 3, 3): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(-13, 10, 3, 3): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0126
     * @tc.name      ImageViewer_ScaleModelCtor_0126
     * @tc.desc      new ScaleModel(0.25, 20, 96.76, 0.25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0126 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 20, 96.76, 0.25);
      logInfo(`new ScaleModel(0.25, 20, 96.76, 0.25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(0.25, 20, 96.76, 0.25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(20);
      logInfo(`new ScaleModel(0.25, 20, 96.76, 0.25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(96.76, PRECISION);
      logInfo(`new ScaleModel(0.25, 20, 96.76, 0.25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(0.25, 20, 96.76, 0.25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0126 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0127
     * @tc.name      ImageViewer_ScaleModelCtor_0127
     * @tc.desc      new ScaleModel(2, 2, 10, 30) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0127 begin`);
      const subject: ScaleModel = new ScaleModel(2, 2, 10, 30);
      logInfo(`new ScaleModel(2, 2, 10, 30): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(2);
      logInfo(`new ScaleModel(2, 2, 10, 30): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(2);
      logInfo(`new ScaleModel(2, 2, 10, 30): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(2, 2, 10, 30): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(2, 2, 10, 30): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0127 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0128
     * @tc.name      ImageViewer_ScaleModelCtor_0128
     * @tc.desc      new ScaleModel(2, -1, 10, 53.4) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0128 begin`);
      const subject: ScaleModel = new ScaleModel(2, -1, 10, 53.4);
      logInfo(`new ScaleModel(2, -1, 10, 53.4): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(2);
      logInfo(`new ScaleModel(2, -1, 10, 53.4): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(-1);
      logInfo(`new ScaleModel(2, -1, 10, 53.4): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(2, -1, 10, 53.4): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(53.4, PRECISION);
      logInfo(`new ScaleModel(2, -1, 10, 53.4): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0128 end`);
    });
  });
}
