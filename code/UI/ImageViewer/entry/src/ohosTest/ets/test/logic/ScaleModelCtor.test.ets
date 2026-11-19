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
export default function scaleModelCtorTest(): void {
  describe('ScaleModelCtorTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0001
     * @tc.name      ImageViewer_ScaleModelCtor_0001
     * @tc.desc      new ScaleModel(0, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_ScaleModelCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0001 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0);
      logInfo(`new ScaleModel(0, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0002
     * @tc.name      ImageViewer_ScaleModelCtor_0002
     * @tc.desc      new ScaleModel(0.25, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_ScaleModelCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0002 begin`);
      const subject: ScaleModel = new ScaleModel(0.25, 0, 0, 0);
      logInfo(`new ScaleModel(0.25, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(0.25, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0.25, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0.25, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0.25, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0003
     * @tc.name      ImageViewer_ScaleModelCtor_0003
     * @tc.desc      new ScaleModel(0.5, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0003 begin`);
      const subject: ScaleModel = new ScaleModel(0.5, 0, 0, 0);
      logInfo(`new ScaleModel(0.5, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(0.5, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0.5, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0.5, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0.5, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0004
     * @tc.name      ImageViewer_ScaleModelCtor_0004
     * @tc.desc      new ScaleModel(1, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0004 begin`);
      const subject: ScaleModel = new ScaleModel(1, 0, 0, 0);
      logInfo(`new ScaleModel(1, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(1);
      logInfo(`new ScaleModel(1, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(1, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(1, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(1, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0005
     * @tc.name      ImageViewer_ScaleModelCtor_0005
     * @tc.desc      new ScaleModel(1.5, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0005 begin`);
      const subject: ScaleModel = new ScaleModel(1.5, 0, 0, 0);
      logInfo(`new ScaleModel(1.5, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(1.5, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(1.5, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(1.5, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0006
     * @tc.name      ImageViewer_ScaleModelCtor_0006
     * @tc.desc      new ScaleModel(2, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0006 begin`);
      const subject: ScaleModel = new ScaleModel(2, 0, 0, 0);
      logInfo(`new ScaleModel(2, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(2);
      logInfo(`new ScaleModel(2, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(2, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(2, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(2, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0007
     * @tc.name      ImageViewer_ScaleModelCtor_0007
     * @tc.desc      new ScaleModel(-1, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0007 begin`);
      const subject: ScaleModel = new ScaleModel(-1, 0, 0, 0);
      logInfo(`new ScaleModel(-1, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(-1, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(-1, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(-1, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(-1, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0008
     * @tc.name      ImageViewer_ScaleModelCtor_0008
     * @tc.desc      new ScaleModel(3, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0008 begin`);
      const subject: ScaleModel = new ScaleModel(3, 0, 0, 0);
      logInfo(`new ScaleModel(3, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(3);
      logInfo(`new ScaleModel(3, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(3, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(3, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(3, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0009
     * @tc.name      ImageViewer_ScaleModelCtor_0009
     * @tc.desc      new ScaleModel(10, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0009 begin`);
      const subject: ScaleModel = new ScaleModel(10, 0, 0, 0);
      logInfo(`new ScaleModel(10, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(10);
      logInfo(`new ScaleModel(10, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(10, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(10, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(10, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0010
     * @tc.name      ImageViewer_ScaleModelCtor_0010
     * @tc.desc      new ScaleModel(100, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0010 begin`);
      const subject: ScaleModel = new ScaleModel(100, 0, 0, 0);
      logInfo(`new ScaleModel(100, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(100);
      logInfo(`new ScaleModel(100, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(100, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(100, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(100, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0011
     * @tc.name      ImageViewer_ScaleModelCtor_0011
     * @tc.desc      new ScaleModel(5, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0011 begin`);
      const subject: ScaleModel = new ScaleModel(5, 0, 0, 0);
      logInfo(`new ScaleModel(5, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(5);
      logInfo(`new ScaleModel(5, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(5, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(5, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(5, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0012
     * @tc.name      ImageViewer_ScaleModelCtor_0012
     * @tc.desc      new ScaleModel(15, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0012 begin`);
      const subject: ScaleModel = new ScaleModel(15, 0, 0, 0);
      logInfo(`new ScaleModel(15, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(15);
      logInfo(`new ScaleModel(15, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(15, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(15, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(15, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0013
     * @tc.name      ImageViewer_ScaleModelCtor_0013
     * @tc.desc      new ScaleModel(20, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0013 begin`);
      const subject: ScaleModel = new ScaleModel(20, 0, 0, 0);
      logInfo(`new ScaleModel(20, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(20);
      logInfo(`new ScaleModel(20, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(20, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(20, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(20, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0014
     * @tc.name      ImageViewer_ScaleModelCtor_0014
     * @tc.desc      new ScaleModel(25, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0014 begin`);
      const subject: ScaleModel = new ScaleModel(25, 0, 0, 0);
      logInfo(`new ScaleModel(25, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(25);
      logInfo(`new ScaleModel(25, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(25, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(25, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(25, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0015
     * @tc.name      ImageViewer_ScaleModelCtor_0015
     * @tc.desc      new ScaleModel(30, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0015 begin`);
      const subject: ScaleModel = new ScaleModel(30, 0, 0, 0);
      logInfo(`new ScaleModel(30, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(30);
      logInfo(`new ScaleModel(30, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(30, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(30, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(30, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0016
     * @tc.name      ImageViewer_ScaleModelCtor_0016
     * @tc.desc      new ScaleModel(-13, 0, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0016 begin`);
      const subject: ScaleModel = new ScaleModel(-13, 0, 0, 0);
      logInfo(`new ScaleModel(-13, 0, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(-13);
      logInfo(`new ScaleModel(-13, 0, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(-13, 0, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(-13, 0, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(-13, 0, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0017
     * @tc.name      ImageViewer_ScaleModelCtor_0017
     * @tc.desc      new ScaleModel(0, 1, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0017 begin`);
      const subject: ScaleModel = new ScaleModel(0, 1, 0, 0);
      logInfo(`new ScaleModel(0, 1, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 1, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(1);
      logInfo(`new ScaleModel(0, 1, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 1, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 1, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0018
     * @tc.name      ImageViewer_ScaleModelCtor_0018
     * @tc.desc      new ScaleModel(0, -1, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0018 begin`);
      const subject: ScaleModel = new ScaleModel(0, -1, 0, 0);
      logInfo(`new ScaleModel(0, -1, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, -1, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(-1);
      logInfo(`new ScaleModel(0, -1, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, -1, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, -1, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0019
     * @tc.name      ImageViewer_ScaleModelCtor_0019
     * @tc.desc      new ScaleModel(0, 2, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0019 begin`);
      const subject: ScaleModel = new ScaleModel(0, 2, 0, 0);
      logInfo(`new ScaleModel(0, 2, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 2, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(2);
      logInfo(`new ScaleModel(0, 2, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 2, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 2, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0020
     * @tc.name      ImageViewer_ScaleModelCtor_0020
     * @tc.desc      new ScaleModel(0, 3, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0020 begin`);
      const subject: ScaleModel = new ScaleModel(0, 3, 0, 0);
      logInfo(`new ScaleModel(0, 3, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 3, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(3);
      logInfo(`new ScaleModel(0, 3, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 3, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 3, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0021
     * @tc.name      ImageViewer_ScaleModelCtor_0021
     * @tc.desc      new ScaleModel(0, 10, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0021 begin`);
      const subject: ScaleModel = new ScaleModel(0, 10, 0, 0);
      logInfo(`new ScaleModel(0, 10, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 10, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(0, 10, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 10, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 10, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0022
     * @tc.name      ImageViewer_ScaleModelCtor_0022
     * @tc.desc      new ScaleModel(0, 100, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0022 begin`);
      const subject: ScaleModel = new ScaleModel(0, 100, 0, 0);
      logInfo(`new ScaleModel(0, 100, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 100, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(100);
      logInfo(`new ScaleModel(0, 100, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 100, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 100, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0023
     * @tc.name      ImageViewer_ScaleModelCtor_0023
     * @tc.desc      new ScaleModel(0, 5, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0023 begin`);
      const subject: ScaleModel = new ScaleModel(0, 5, 0, 0);
      logInfo(`new ScaleModel(0, 5, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 5, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(5);
      logInfo(`new ScaleModel(0, 5, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 5, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 5, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0024
     * @tc.name      ImageViewer_ScaleModelCtor_0024
     * @tc.desc      new ScaleModel(0, 15, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0024 begin`);
      const subject: ScaleModel = new ScaleModel(0, 15, 0, 0);
      logInfo(`new ScaleModel(0, 15, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 15, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(15);
      logInfo(`new ScaleModel(0, 15, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 15, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 15, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0025
     * @tc.name      ImageViewer_ScaleModelCtor_0025
     * @tc.desc      new ScaleModel(0, 20, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0025 begin`);
      const subject: ScaleModel = new ScaleModel(0, 20, 0, 0);
      logInfo(`new ScaleModel(0, 20, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 20, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(20);
      logInfo(`new ScaleModel(0, 20, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 20, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 20, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0026
     * @tc.name      ImageViewer_ScaleModelCtor_0026
     * @tc.desc      new ScaleModel(0, 25, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0026 begin`);
      const subject: ScaleModel = new ScaleModel(0, 25, 0, 0);
      logInfo(`new ScaleModel(0, 25, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 25, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(25);
      logInfo(`new ScaleModel(0, 25, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 25, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 25, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0027
     * @tc.name      ImageViewer_ScaleModelCtor_0027
     * @tc.desc      new ScaleModel(0, 30, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0027 begin`);
      const subject: ScaleModel = new ScaleModel(0, 30, 0, 0);
      logInfo(`new ScaleModel(0, 30, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 30, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(30);
      logInfo(`new ScaleModel(0, 30, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 30, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 30, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0028
     * @tc.name      ImageViewer_ScaleModelCtor_0028
     * @tc.desc      new ScaleModel(0, 35, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0028 begin`);
      const subject: ScaleModel = new ScaleModel(0, 35, 0, 0);
      logInfo(`new ScaleModel(0, 35, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 35, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(35);
      logInfo(`new ScaleModel(0, 35, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 35, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 35, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0029
     * @tc.name      ImageViewer_ScaleModelCtor_0029
     * @tc.desc      new ScaleModel(0, 40, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0029 begin`);
      const subject: ScaleModel = new ScaleModel(0, 40, 0, 0);
      logInfo(`new ScaleModel(0, 40, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 40, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(40);
      logInfo(`new ScaleModel(0, 40, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 40, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 40, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0030
     * @tc.name      ImageViewer_ScaleModelCtor_0030
     * @tc.desc      new ScaleModel(0, 45, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0030 begin`);
      const subject: ScaleModel = new ScaleModel(0, 45, 0, 0);
      logInfo(`new ScaleModel(0, 45, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 45, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(45);
      logInfo(`new ScaleModel(0, 45, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 45, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 45, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0031
     * @tc.name      ImageViewer_ScaleModelCtor_0031
     * @tc.desc      new ScaleModel(0, 85, 0, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0031 begin`);
      const subject: ScaleModel = new ScaleModel(0, 85, 0, 0);
      logInfo(`new ScaleModel(0, 85, 0, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 85, 0, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(85);
      logInfo(`new ScaleModel(0, 85, 0, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 85, 0, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 85, 0, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0032
     * @tc.name      ImageViewer_ScaleModelCtor_0032
     * @tc.desc      new ScaleModel(0, 0, 1, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0032 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 1, 0);
      logInfo(`new ScaleModel(0, 0, 1, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 1, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 1, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(0, 0, 1, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 1, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0033
     * @tc.name      ImageViewer_ScaleModelCtor_0033
     * @tc.desc      new ScaleModel(0, 0, 2, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0033 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 2, 0);
      logInfo(`new ScaleModel(0, 0, 2, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 2, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 2, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(2);
      logInfo(`new ScaleModel(0, 0, 2, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 2, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0034
     * @tc.name      ImageViewer_ScaleModelCtor_0034
     * @tc.desc      new ScaleModel(0, 0, 5, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0034 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 5, 0);
      logInfo(`new ScaleModel(0, 0, 5, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 5, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 5, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(0, 0, 5, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 5, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0035
     * @tc.name      ImageViewer_ScaleModelCtor_0035
     * @tc.desc      new ScaleModel(0, 0, 10, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0035 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 10, 0);
      logInfo(`new ScaleModel(0, 0, 10, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 10, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 10, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(0, 0, 10, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 10, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0036
     * @tc.name      ImageViewer_ScaleModelCtor_0036
     * @tc.desc      new ScaleModel(0, 0, 100, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0036 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 100, 0);
      logInfo(`new ScaleModel(0, 0, 100, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 100, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 100, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(0, 0, 100, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 100, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0037
     * @tc.name      ImageViewer_ScaleModelCtor_0037
     * @tc.desc      new ScaleModel(0, 0, -1, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0037 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, -1, 0);
      logInfo(`new ScaleModel(0, 0, -1, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, -1, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, -1, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(0, 0, -1, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, -1, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0038
     * @tc.name      ImageViewer_ScaleModelCtor_0038
     * @tc.desc      new ScaleModel(0, 0, 3, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0038 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 3, 0);
      logInfo(`new ScaleModel(0, 0, 3, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 3, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 3, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(0, 0, 3, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 3, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0039
     * @tc.name      ImageViewer_ScaleModelCtor_0039
     * @tc.desc      new ScaleModel(0, 0, 15, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0039 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 15, 0);
      logInfo(`new ScaleModel(0, 0, 15, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 15, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 15, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(0, 0, 15, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 15, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0040
     * @tc.name      ImageViewer_ScaleModelCtor_0040
     * @tc.desc      new ScaleModel(0, 0, 20, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0040 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 20, 0);
      logInfo(`new ScaleModel(0, 0, 20, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 20, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 20, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(0, 0, 20, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 20, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0041
     * @tc.name      ImageViewer_ScaleModelCtor_0041
     * @tc.desc      new ScaleModel(0, 0, 25, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0041 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 25, 0);
      logInfo(`new ScaleModel(0, 0, 25, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 25, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 25, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(0, 0, 25, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 25, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0042
     * @tc.name      ImageViewer_ScaleModelCtor_0042
     * @tc.desc      new ScaleModel(0, 0, 30, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0042 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 30, 0);
      logInfo(`new ScaleModel(0, 0, 30, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 30, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 30, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(0, 0, 30, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 30, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0043
     * @tc.name      ImageViewer_ScaleModelCtor_0043
     * @tc.desc      new ScaleModel(0, 0, 35, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0043 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 35, 0);
      logInfo(`new ScaleModel(0, 0, 35, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 35, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 35, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(35);
      logInfo(`new ScaleModel(0, 0, 35, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 35, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0044
     * @tc.name      ImageViewer_ScaleModelCtor_0044
     * @tc.desc      new ScaleModel(0, 0, 40, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0044 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 40, 0);
      logInfo(`new ScaleModel(0, 0, 40, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 40, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 40, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(40);
      logInfo(`new ScaleModel(0, 0, 40, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 40, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0045
     * @tc.name      ImageViewer_ScaleModelCtor_0045
     * @tc.desc      new ScaleModel(0, 0, 96.76, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0045 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 96.76, 0);
      logInfo(`new ScaleModel(0, 0, 96.76, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 96.76, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 96.76, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(96.76, PRECISION);
      logInfo(`new ScaleModel(0, 0, 96.76, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 96.76, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0046
     * @tc.name      ImageViewer_ScaleModelCtor_0046
     * @tc.desc      new ScaleModel(0, 0, 12.73, 0) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0046 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 12.73, 0);
      logInfo(`new ScaleModel(0, 0, 12.73, 0): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 12.73, 0): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 12.73, 0): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(0, 0, 12.73, 0): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 12.73, 0): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0047
     * @tc.name      ImageViewer_ScaleModelCtor_0047
     * @tc.desc      new ScaleModel(0, 0, 0, 0.25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0047 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0.25);
      logInfo(`new ScaleModel(0, 0, 0, 0.25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0.25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0.25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0.25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.25, PRECISION);
      logInfo(`new ScaleModel(0, 0, 0, 0.25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0048
     * @tc.name      ImageViewer_ScaleModelCtor_0048
     * @tc.desc      new ScaleModel(0, 0, 0, 0.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0048 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 0.5);
      logInfo(`new ScaleModel(0, 0, 0, 0.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 0.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(0, 0, 0, 0.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0049
     * @tc.name      ImageViewer_ScaleModelCtor_0049
     * @tc.desc      new ScaleModel(0, 0, 0, 1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0049 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 1);
      logInfo(`new ScaleModel(0, 0, 0, 1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(0, 0, 0, 1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0050
     * @tc.name      ImageViewer_ScaleModelCtor_0050
     * @tc.desc      new ScaleModel(0, 0, 0, 1.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0050 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 1.5);
      logInfo(`new ScaleModel(0, 0, 0, 1.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 1.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 1.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 1.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(0, 0, 0, 1.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0051
     * @tc.name      ImageViewer_ScaleModelCtor_0051
     * @tc.desc      new ScaleModel(0, 0, 0, 2) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0051 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 2);
      logInfo(`new ScaleModel(0, 0, 0, 2): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 2): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 2): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 2): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(2);
      logInfo(`new ScaleModel(0, 0, 0, 2): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0052
     * @tc.name      ImageViewer_ScaleModelCtor_0052
     * @tc.desc      new ScaleModel(0, 0, 0, -1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0052 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, -1);
      logInfo(`new ScaleModel(0, 0, 0, -1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, -1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, -1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, -1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(-1);
      logInfo(`new ScaleModel(0, 0, 0, -1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0053
     * @tc.name      ImageViewer_ScaleModelCtor_0053
     * @tc.desc      new ScaleModel(0, 0, 0, 3) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0053 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 3);
      logInfo(`new ScaleModel(0, 0, 0, 3): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 3): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 3): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 3): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(3);
      logInfo(`new ScaleModel(0, 0, 0, 3): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0054
     * @tc.name      ImageViewer_ScaleModelCtor_0054
     * @tc.desc      new ScaleModel(0, 0, 0, 10) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0054 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 10);
      logInfo(`new ScaleModel(0, 0, 0, 10): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 10): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 10): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 10): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(10);
      logInfo(`new ScaleModel(0, 0, 0, 10): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0055
     * @tc.name      ImageViewer_ScaleModelCtor_0055
     * @tc.desc      new ScaleModel(0, 0, 0, 100) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0055 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 100);
      logInfo(`new ScaleModel(0, 0, 0, 100): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 100): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 100): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 100): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(100);
      logInfo(`new ScaleModel(0, 0, 0, 100): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0056
     * @tc.name      ImageViewer_ScaleModelCtor_0056
     * @tc.desc      new ScaleModel(0, 0, 0, 5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0056 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 5);
      logInfo(`new ScaleModel(0, 0, 0, 5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(5);
      logInfo(`new ScaleModel(0, 0, 0, 5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0057
     * @tc.name      ImageViewer_ScaleModelCtor_0057
     * @tc.desc      new ScaleModel(0, 0, 0, 15) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0057 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 15);
      logInfo(`new ScaleModel(0, 0, 0, 15): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 15): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 15): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 15): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(15);
      logInfo(`new ScaleModel(0, 0, 0, 15): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0058
     * @tc.name      ImageViewer_ScaleModelCtor_0058
     * @tc.desc      new ScaleModel(0, 0, 0, 20) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0058 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 20);
      logInfo(`new ScaleModel(0, 0, 0, 20): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 20): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 20): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 20): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(20);
      logInfo(`new ScaleModel(0, 0, 0, 20): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0059
     * @tc.name      ImageViewer_ScaleModelCtor_0059
     * @tc.desc      new ScaleModel(0, 0, 0, 25) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0059 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 25);
      logInfo(`new ScaleModel(0, 0, 0, 25): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 25): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 25): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 25): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(25);
      logInfo(`new ScaleModel(0, 0, 0, 25): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0060
     * @tc.name      ImageViewer_ScaleModelCtor_0060
     * @tc.desc      new ScaleModel(0, 0, 0, 30) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0060 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 30);
      logInfo(`new ScaleModel(0, 0, 0, 30): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 30): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 30): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 30): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(0, 0, 0, 30): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0061
     * @tc.name      ImageViewer_ScaleModelCtor_0061
     * @tc.desc      new ScaleModel(0, 0, 0, 53.4) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0061 begin`);
      const subject: ScaleModel = new ScaleModel(0, 0, 0, 53.4);
      logInfo(`new ScaleModel(0, 0, 0, 53.4): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 53.4): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 53.4): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(0);
      logInfo(`new ScaleModel(0, 0, 0, 53.4): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(53.4, PRECISION);
      logInfo(`new ScaleModel(0, 0, 0, 53.4): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0062
     * @tc.name      ImageViewer_ScaleModelCtor_0062
     * @tc.desc      new ScaleModel(1.5, 35, 12.73, 30) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0062 begin`);
      const subject: ScaleModel = new ScaleModel(1.5, 35, 12.73, 30);
      logInfo(`new ScaleModel(1.5, 35, 12.73, 30): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertClose(1.5, PRECISION);
      logInfo(`new ScaleModel(1.5, 35, 12.73, 30): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(35);
      logInfo(`new ScaleModel(1.5, 35, 12.73, 30): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(12.73, PRECISION);
      logInfo(`new ScaleModel(1.5, 35, 12.73, 30): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(30);
      logInfo(`new ScaleModel(1.5, 35, 12.73, 30): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0063
     * @tc.name      ImageViewer_ScaleModelCtor_0063
     * @tc.desc      new ScaleModel(15, 10, 1, 1) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0063 begin`);
      const subject: ScaleModel = new ScaleModel(15, 10, 1, 1);
      logInfo(`new ScaleModel(15, 10, 1, 1): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(15);
      logInfo(`new ScaleModel(15, 10, 1, 1): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(10);
      logInfo(`new ScaleModel(15, 10, 1, 1): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(15, 10, 1, 1): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertEqual(1);
      logInfo(`new ScaleModel(15, 10, 1, 1): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALE_MODEL_CTOR_0064
     * @tc.name      ImageViewer_ScaleModelCtor_0064
     * @tc.desc      new ScaleModel(5, 15, 96.76, 0.5) initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_ScaleModelCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleModelCtor_0064 begin`);
      const subject: ScaleModel = new ScaleModel(5, 15, 96.76, 0.5);
      logInfo(`new ScaleModel(5, 15, 96.76, 0.5): subject.scaleValue=${subject.scaleValue}`);
      expect(subject.scaleValue).assertEqual(5);
      logInfo(`new ScaleModel(5, 15, 96.76, 0.5): subject.lastValue=${subject.lastValue}`);
      expect(subject.lastValue).assertEqual(15);
      logInfo(`new ScaleModel(5, 15, 96.76, 0.5): subject.maxScaleValue=${subject.maxScaleValue}`);
      expect(subject.maxScaleValue).assertClose(96.76, PRECISION);
      logInfo(`new ScaleModel(5, 15, 96.76, 0.5): subject.extraScaleValue=${subject.extraScaleValue}`);
      expect(subject.extraScaleValue).assertClose(0.5, PRECISION);
      logInfo(`new ScaleModel(5, 15, 96.76, 0.5): subject.defaultScaleValue=${subject.defaultScaleValue}`);
      expect(subject.defaultScaleValue).assertEqual(1);
      logInfo(`${BUNDLE}ScaleModelCtor_0064 end`);
    });
  });
}
