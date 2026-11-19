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
import { RotateModel } from '../../../../main/ets/model/RotateModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new RotateModel (77 cases). */
export default function rotateModelCtorTest(): void {
  describe('RotateModelCtorTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0001
     * @tc.name      ImageViewer_RotateModelCtor_0001
     * @tc.desc      new RotateModel(0) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_RotateModelCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0001 begin`);
      const subject: RotateModel = new RotateModel(0);
      logInfo(`new RotateModel(0): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(0);
      logInfo(`new RotateModel(0): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(0): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0002
     * @tc.name      ImageViewer_RotateModelCtor_0002
     * @tc.desc      new RotateModel(500) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_RotateModelCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0002 begin`);
      const subject: RotateModel = new RotateModel(500);
      logInfo(`new RotateModel(500): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(500);
      logInfo(`new RotateModel(500): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(500): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0003
     * @tc.name      ImageViewer_RotateModelCtor_0003
     * @tc.desc      new RotateModel(999) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0003 begin`);
      const subject: RotateModel = new RotateModel(999);
      logInfo(`new RotateModel(999): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(999);
      logInfo(`new RotateModel(999): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(999): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0004
     * @tc.name      ImageViewer_RotateModelCtor_0004
     * @tc.desc      new RotateModel(1000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0004 begin`);
      const subject: RotateModel = new RotateModel(1000);
      logInfo(`new RotateModel(1000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1000);
      logInfo(`new RotateModel(1000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0005
     * @tc.name      ImageViewer_RotateModelCtor_0005
     * @tc.desc      new RotateModel(59999) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0005 begin`);
      const subject: RotateModel = new RotateModel(59999);
      logInfo(`new RotateModel(59999): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(59999);
      logInfo(`new RotateModel(59999): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(59999): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0006
     * @tc.name      ImageViewer_RotateModelCtor_0006
     * @tc.desc      new RotateModel(60000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0006 begin`);
      const subject: RotateModel = new RotateModel(60000);
      logInfo(`new RotateModel(60000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(60000);
      logInfo(`new RotateModel(60000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(60000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0007
     * @tc.name      ImageViewer_RotateModelCtor_0007
     * @tc.desc      new RotateModel(61000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0007 begin`);
      const subject: RotateModel = new RotateModel(61000);
      logInfo(`new RotateModel(61000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(61000);
      logInfo(`new RotateModel(61000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(61000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0008
     * @tc.name      ImageViewer_RotateModelCtor_0008
     * @tc.desc      new RotateModel(3599000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0008 begin`);
      const subject: RotateModel = new RotateModel(3599000);
      logInfo(`new RotateModel(3599000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3599000);
      logInfo(`new RotateModel(3599000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3599000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0009
     * @tc.name      ImageViewer_RotateModelCtor_0009
     * @tc.desc      new RotateModel(3600000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0009 begin`);
      const subject: RotateModel = new RotateModel(3600000);
      logInfo(`new RotateModel(3600000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3600000);
      logInfo(`new RotateModel(3600000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3600000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0010
     * @tc.name      ImageViewer_RotateModelCtor_0010
     * @tc.desc      new RotateModel(1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0010 begin`);
      const subject: RotateModel = new RotateModel(1);
      logInfo(`new RotateModel(1): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1);
      logInfo(`new RotateModel(1): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0011
     * @tc.name      ImageViewer_RotateModelCtor_0011
     * @tc.desc      new RotateModel(-1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0011 begin`);
      const subject: RotateModel = new RotateModel(-1);
      logInfo(`new RotateModel(-1): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1);
      logInfo(`new RotateModel(-1): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0012
     * @tc.name      ImageViewer_RotateModelCtor_0012
     * @tc.desc      new RotateModel(2) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0012 begin`);
      const subject: RotateModel = new RotateModel(2);
      logInfo(`new RotateModel(2): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2);
      logInfo(`new RotateModel(2): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0013
     * @tc.name      ImageViewer_RotateModelCtor_0013
     * @tc.desc      new RotateModel(3) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0013 begin`);
      const subject: RotateModel = new RotateModel(3);
      logInfo(`new RotateModel(3): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3);
      logInfo(`new RotateModel(3): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0014
     * @tc.name      ImageViewer_RotateModelCtor_0014
     * @tc.desc      new RotateModel(10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0014 begin`);
      const subject: RotateModel = new RotateModel(10);
      logInfo(`new RotateModel(10): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(10);
      logInfo(`new RotateModel(10): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(10): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0015
     * @tc.name      ImageViewer_RotateModelCtor_0015
     * @tc.desc      new RotateModel(100) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0015 begin`);
      const subject: RotateModel = new RotateModel(100);
      logInfo(`new RotateModel(100): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(100);
      logInfo(`new RotateModel(100): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(100): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0016
     * @tc.name      ImageViewer_RotateModelCtor_0016
     * @tc.desc      new RotateModel(180000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0016 begin`);
      const subject: RotateModel = new RotateModel(180000);
      logInfo(`new RotateModel(180000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(180000);
      logInfo(`new RotateModel(180000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(180000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0017
     * @tc.name      ImageViewer_RotateModelCtor_0017
     * @tc.desc      new RotateModel(360000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0017 begin`);
      const subject: RotateModel = new RotateModel(360000);
      logInfo(`new RotateModel(360000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(360000);
      logInfo(`new RotateModel(360000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(360000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0018
     * @tc.name      ImageViewer_RotateModelCtor_0018
     * @tc.desc      new RotateModel(540000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0018 begin`);
      const subject: RotateModel = new RotateModel(540000);
      logInfo(`new RotateModel(540000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(540000);
      logInfo(`new RotateModel(540000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(540000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0019
     * @tc.name      ImageViewer_RotateModelCtor_0019
     * @tc.desc      new RotateModel(720000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0019 begin`);
      const subject: RotateModel = new RotateModel(720000);
      logInfo(`new RotateModel(720000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(720000);
      logInfo(`new RotateModel(720000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(720000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0020
     * @tc.name      ImageViewer_RotateModelCtor_0020
     * @tc.desc      new RotateModel(900000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0020 begin`);
      const subject: RotateModel = new RotateModel(900000);
      logInfo(`new RotateModel(900000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(900000);
      logInfo(`new RotateModel(900000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(900000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0021
     * @tc.name      ImageViewer_RotateModelCtor_0021
     * @tc.desc      new RotateModel(1080000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0021 begin`);
      const subject: RotateModel = new RotateModel(1080000);
      logInfo(`new RotateModel(1080000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1080000);
      logInfo(`new RotateModel(1080000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1080000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0022
     * @tc.name      ImageViewer_RotateModelCtor_0022
     * @tc.desc      new RotateModel(1260000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0022 begin`);
      const subject: RotateModel = new RotateModel(1260000);
      logInfo(`new RotateModel(1260000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1260000);
      logInfo(`new RotateModel(1260000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1260000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0023
     * @tc.name      ImageViewer_RotateModelCtor_0023
     * @tc.desc      new RotateModel(1440000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0023 begin`);
      const subject: RotateModel = new RotateModel(1440000);
      logInfo(`new RotateModel(1440000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1440000);
      logInfo(`new RotateModel(1440000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1440000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0024
     * @tc.name      ImageViewer_RotateModelCtor_0024
     * @tc.desc      new RotateModel(1620000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0024 begin`);
      const subject: RotateModel = new RotateModel(1620000);
      logInfo(`new RotateModel(1620000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1620000);
      logInfo(`new RotateModel(1620000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1620000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0025
     * @tc.name      ImageViewer_RotateModelCtor_0025
     * @tc.desc      new RotateModel(1800000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0025 begin`);
      const subject: RotateModel = new RotateModel(1800000);
      logInfo(`new RotateModel(1800000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1800000);
      logInfo(`new RotateModel(1800000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1800000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0026
     * @tc.name      ImageViewer_RotateModelCtor_0026
     * @tc.desc      new RotateModel(1980000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0026 begin`);
      const subject: RotateModel = new RotateModel(1980000);
      logInfo(`new RotateModel(1980000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1980000);
      logInfo(`new RotateModel(1980000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1980000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0027
     * @tc.name      ImageViewer_RotateModelCtor_0027
     * @tc.desc      new RotateModel(2160000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0027 begin`);
      const subject: RotateModel = new RotateModel(2160000);
      logInfo(`new RotateModel(2160000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2160000);
      logInfo(`new RotateModel(2160000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2160000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0028
     * @tc.name      ImageViewer_RotateModelCtor_0028
     * @tc.desc      new RotateModel(2340000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0028 begin`);
      const subject: RotateModel = new RotateModel(2340000);
      logInfo(`new RotateModel(2340000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2340000);
      logInfo(`new RotateModel(2340000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2340000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0029
     * @tc.name      ImageViewer_RotateModelCtor_0029
     * @tc.desc      new RotateModel(2520000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0029 begin`);
      const subject: RotateModel = new RotateModel(2520000);
      logInfo(`new RotateModel(2520000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2520000);
      logInfo(`new RotateModel(2520000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2520000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0030
     * @tc.name      ImageViewer_RotateModelCtor_0030
     * @tc.desc      new RotateModel(2700000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0030 begin`);
      const subject: RotateModel = new RotateModel(2700000);
      logInfo(`new RotateModel(2700000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2700000);
      logInfo(`new RotateModel(2700000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2700000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0031
     * @tc.name      ImageViewer_RotateModelCtor_0031
     * @tc.desc      new RotateModel(2880000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0031 begin`);
      const subject: RotateModel = new RotateModel(2880000);
      logInfo(`new RotateModel(2880000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2880000);
      logInfo(`new RotateModel(2880000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2880000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0032
     * @tc.name      ImageViewer_RotateModelCtor_0032
     * @tc.desc      new RotateModel(3060000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0032 begin`);
      const subject: RotateModel = new RotateModel(3060000);
      logInfo(`new RotateModel(3060000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3060000);
      logInfo(`new RotateModel(3060000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3060000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0033
     * @tc.name      ImageViewer_RotateModelCtor_0033
     * @tc.desc      new RotateModel(3240000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0033 begin`);
      const subject: RotateModel = new RotateModel(3240000);
      logInfo(`new RotateModel(3240000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3240000);
      logInfo(`new RotateModel(3240000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3240000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0034
     * @tc.name      ImageViewer_RotateModelCtor_0034
     * @tc.desc      new RotateModel(3420000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0034 begin`);
      const subject: RotateModel = new RotateModel(3420000);
      logInfo(`new RotateModel(3420000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3420000);
      logInfo(`new RotateModel(3420000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3420000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0035
     * @tc.name      ImageViewer_RotateModelCtor_0035
     * @tc.desc      new RotateModel(3780000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0035 begin`);
      const subject: RotateModel = new RotateModel(3780000);
      logInfo(`new RotateModel(3780000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3780000);
      logInfo(`new RotateModel(3780000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3780000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0036
     * @tc.name      ImageViewer_RotateModelCtor_0036
     * @tc.desc      new RotateModel(3960000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0036 begin`);
      const subject: RotateModel = new RotateModel(3960000);
      logInfo(`new RotateModel(3960000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3960000);
      logInfo(`new RotateModel(3960000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3960000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0037
     * @tc.name      ImageViewer_RotateModelCtor_0037
     * @tc.desc      new RotateModel(4140000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0037 begin`);
      const subject: RotateModel = new RotateModel(4140000);
      logInfo(`new RotateModel(4140000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4140000);
      logInfo(`new RotateModel(4140000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4140000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0038
     * @tc.name      ImageViewer_RotateModelCtor_0038
     * @tc.desc      new RotateModel(4320000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0038 begin`);
      const subject: RotateModel = new RotateModel(4320000);
      logInfo(`new RotateModel(4320000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4320000);
      logInfo(`new RotateModel(4320000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4320000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0039
     * @tc.name      ImageViewer_RotateModelCtor_0039
     * @tc.desc      new RotateModel(4500000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0039 begin`);
      const subject: RotateModel = new RotateModel(4500000);
      logInfo(`new RotateModel(4500000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4500000);
      logInfo(`new RotateModel(4500000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4500000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0040
     * @tc.name      ImageViewer_RotateModelCtor_0040
     * @tc.desc      new RotateModel(4680000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0040 begin`);
      const subject: RotateModel = new RotateModel(4680000);
      logInfo(`new RotateModel(4680000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4680000);
      logInfo(`new RotateModel(4680000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4680000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0041
     * @tc.name      ImageViewer_RotateModelCtor_0041
     * @tc.desc      new RotateModel(4860000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0041 begin`);
      const subject: RotateModel = new RotateModel(4860000);
      logInfo(`new RotateModel(4860000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4860000);
      logInfo(`new RotateModel(4860000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4860000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0042
     * @tc.name      ImageViewer_RotateModelCtor_0042
     * @tc.desc      new RotateModel(5040000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0042 begin`);
      const subject: RotateModel = new RotateModel(5040000);
      logInfo(`new RotateModel(5040000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5040000);
      logInfo(`new RotateModel(5040000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5040000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0043
     * @tc.name      ImageViewer_RotateModelCtor_0043
     * @tc.desc      new RotateModel(5220000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0043 begin`);
      const subject: RotateModel = new RotateModel(5220000);
      logInfo(`new RotateModel(5220000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5220000);
      logInfo(`new RotateModel(5220000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5220000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0044
     * @tc.name      ImageViewer_RotateModelCtor_0044
     * @tc.desc      new RotateModel(5400000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0044 begin`);
      const subject: RotateModel = new RotateModel(5400000);
      logInfo(`new RotateModel(5400000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5400000);
      logInfo(`new RotateModel(5400000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5400000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0045
     * @tc.name      ImageViewer_RotateModelCtor_0045
     * @tc.desc      new RotateModel(5580000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0045 begin`);
      const subject: RotateModel = new RotateModel(5580000);
      logInfo(`new RotateModel(5580000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5580000);
      logInfo(`new RotateModel(5580000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5580000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0046
     * @tc.name      ImageViewer_RotateModelCtor_0046
     * @tc.desc      new RotateModel(5760000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0046 begin`);
      const subject: RotateModel = new RotateModel(5760000);
      logInfo(`new RotateModel(5760000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5760000);
      logInfo(`new RotateModel(5760000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5760000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0047
     * @tc.name      ImageViewer_RotateModelCtor_0047
     * @tc.desc      new RotateModel(5940000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0047 begin`);
      const subject: RotateModel = new RotateModel(5940000);
      logInfo(`new RotateModel(5940000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5940000);
      logInfo(`new RotateModel(5940000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5940000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0048
     * @tc.name      ImageViewer_RotateModelCtor_0048
     * @tc.desc      new RotateModel(6120000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0048 begin`);
      const subject: RotateModel = new RotateModel(6120000);
      logInfo(`new RotateModel(6120000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6120000);
      logInfo(`new RotateModel(6120000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6120000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0049
     * @tc.name      ImageViewer_RotateModelCtor_0049
     * @tc.desc      new RotateModel(6300000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0049 begin`);
      const subject: RotateModel = new RotateModel(6300000);
      logInfo(`new RotateModel(6300000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6300000);
      logInfo(`new RotateModel(6300000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6300000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0050
     * @tc.name      ImageViewer_RotateModelCtor_0050
     * @tc.desc      new RotateModel(6480000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0050 begin`);
      const subject: RotateModel = new RotateModel(6480000);
      logInfo(`new RotateModel(6480000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6480000);
      logInfo(`new RotateModel(6480000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6480000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0051
     * @tc.name      ImageViewer_RotateModelCtor_0051
     * @tc.desc      new RotateModel(6660000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0051 begin`);
      const subject: RotateModel = new RotateModel(6660000);
      logInfo(`new RotateModel(6660000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6660000);
      logInfo(`new RotateModel(6660000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6660000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0052
     * @tc.name      ImageViewer_RotateModelCtor_0052
     * @tc.desc      new RotateModel(6840000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0052 begin`);
      const subject: RotateModel = new RotateModel(6840000);
      logInfo(`new RotateModel(6840000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6840000);
      logInfo(`new RotateModel(6840000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6840000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0053
     * @tc.name      ImageViewer_RotateModelCtor_0053
     * @tc.desc      new RotateModel(7020000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0053 begin`);
      const subject: RotateModel = new RotateModel(7020000);
      logInfo(`new RotateModel(7020000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(7020000);
      logInfo(`new RotateModel(7020000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(7020000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0054
     * @tc.name      ImageViewer_RotateModelCtor_0054
     * @tc.desc      new RotateModel(7200000) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0054 begin`);
      const subject: RotateModel = new RotateModel(7200000);
      logInfo(`new RotateModel(7200000): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(7200000);
      logInfo(`new RotateModel(7200000): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(7200000): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0055
     * @tc.name      ImageViewer_RotateModelCtor_0055
     * @tc.desc      new RotateModel(5972579) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0055 begin`);
      const subject: RotateModel = new RotateModel(5972579);
      logInfo(`new RotateModel(5972579): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5972579);
      logInfo(`new RotateModel(5972579): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5972579): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0056
     * @tc.name      ImageViewer_RotateModelCtor_0056
     * @tc.desc      new RotateModel(3788450) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0056 begin`);
      const subject: RotateModel = new RotateModel(3788450);
      logInfo(`new RotateModel(3788450): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3788450);
      logInfo(`new RotateModel(3788450): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3788450): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0057
     * @tc.name      ImageViewer_RotateModelCtor_0057
     * @tc.desc      new RotateModel(7018543) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0057 begin`);
      const subject: RotateModel = new RotateModel(7018543);
      logInfo(`new RotateModel(7018543): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(7018543);
      logInfo(`new RotateModel(7018543): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(7018543): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0058
     * @tc.name      ImageViewer_RotateModelCtor_0058
     * @tc.desc      new RotateModel(1095288.35) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0058 begin`);
      const subject: RotateModel = new RotateModel(1095288.35);
      logInfo(`new RotateModel(1095288.35): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1095288.35, PRECISION);
      logInfo(`new RotateModel(1095288.35): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1095288.35): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0059
     * @tc.name      ImageViewer_RotateModelCtor_0059
     * @tc.desc      new RotateModel(3334805.89) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0059 begin`);
      const subject: RotateModel = new RotateModel(3334805.89);
      logInfo(`new RotateModel(3334805.89): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3334805.89, PRECISION);
      logInfo(`new RotateModel(3334805.89): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3334805.89): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0060
     * @tc.name      ImageViewer_RotateModelCtor_0060
     * @tc.desc      new RotateModel(1309124) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0060 begin`);
      const subject: RotateModel = new RotateModel(1309124);
      logInfo(`new RotateModel(1309124): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1309124);
      logInfo(`new RotateModel(1309124): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1309124): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0061
     * @tc.name      ImageViewer_RotateModelCtor_0061
     * @tc.desc      new RotateModel(2807368.19) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0061 begin`);
      const subject: RotateModel = new RotateModel(2807368.19);
      logInfo(`new RotateModel(2807368.19): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2807368.19, PRECISION);
      logInfo(`new RotateModel(2807368.19): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2807368.19): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0062
     * @tc.name      ImageViewer_RotateModelCtor_0062
     * @tc.desc      new RotateModel(1782214) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0062 begin`);
      const subject: RotateModel = new RotateModel(1782214);
      logInfo(`new RotateModel(1782214): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1782214);
      logInfo(`new RotateModel(1782214): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1782214): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0063
     * @tc.name      ImageViewer_RotateModelCtor_0063
     * @tc.desc      new RotateModel(825320.36) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0063 begin`);
      const subject: RotateModel = new RotateModel(825320.36);
      logInfo(`new RotateModel(825320.36): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(825320.36, PRECISION);
      logInfo(`new RotateModel(825320.36): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(825320.36): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0064
     * @tc.name      ImageViewer_RotateModelCtor_0064
     * @tc.desc      new RotateModel(-2493514) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0064 begin`);
      const subject: RotateModel = new RotateModel(-2493514);
      logInfo(`new RotateModel(-2493514): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2493514);
      logInfo(`new RotateModel(-2493514): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2493514): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0065
     * @tc.name      ImageViewer_RotateModelCtor_0065
     * @tc.desc      new RotateModel(-3190332) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0065 begin`);
      const subject: RotateModel = new RotateModel(-3190332);
      logInfo(`new RotateModel(-3190332): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-3190332);
      logInfo(`new RotateModel(-3190332): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-3190332): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0066
     * @tc.name      ImageViewer_RotateModelCtor_0066
     * @tc.desc      new RotateModel(2959371) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0066 begin`);
      const subject: RotateModel = new RotateModel(2959371);
      logInfo(`new RotateModel(2959371): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2959371);
      logInfo(`new RotateModel(2959371): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2959371): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0067
     * @tc.name      ImageViewer_RotateModelCtor_0067
     * @tc.desc      new RotateModel(2651676.69) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0067 begin`);
      const subject: RotateModel = new RotateModel(2651676.69);
      logInfo(`new RotateModel(2651676.69): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2651676.69, PRECISION);
      logInfo(`new RotateModel(2651676.69): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2651676.69): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0068
     * @tc.name      ImageViewer_RotateModelCtor_0068
     * @tc.desc      new RotateModel(807305.47) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0068 begin`);
      const subject: RotateModel = new RotateModel(807305.47);
      logInfo(`new RotateModel(807305.47): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(807305.47, PRECISION);
      logInfo(`new RotateModel(807305.47): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(807305.47): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0069
     * @tc.name      ImageViewer_RotateModelCtor_0069
     * @tc.desc      new RotateModel(3499685) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0069 begin`);
      const subject: RotateModel = new RotateModel(3499685);
      logInfo(`new RotateModel(3499685): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3499685);
      logInfo(`new RotateModel(3499685): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3499685): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0070
     * @tc.name      ImageViewer_RotateModelCtor_0070
     * @tc.desc      new RotateModel(2268636) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0070 begin`);
      const subject: RotateModel = new RotateModel(2268636);
      logInfo(`new RotateModel(2268636): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2268636);
      logInfo(`new RotateModel(2268636): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2268636): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0071
     * @tc.name      ImageViewer_RotateModelCtor_0071
     * @tc.desc      new RotateModel(1492513) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0071 begin`);
      const subject: RotateModel = new RotateModel(1492513);
      logInfo(`new RotateModel(1492513): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1492513);
      logInfo(`new RotateModel(1492513): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1492513): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0072
     * @tc.name      ImageViewer_RotateModelCtor_0072
     * @tc.desc      new RotateModel(1262336.72) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0072 begin`);
      const subject: RotateModel = new RotateModel(1262336.72);
      logInfo(`new RotateModel(1262336.72): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1262336.72, PRECISION);
      logInfo(`new RotateModel(1262336.72): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1262336.72): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0073
     * @tc.name      ImageViewer_RotateModelCtor_0073
     * @tc.desc      new RotateModel(-855693) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0073 begin`);
      const subject: RotateModel = new RotateModel(-855693);
      logInfo(`new RotateModel(-855693): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-855693);
      logInfo(`new RotateModel(-855693): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-855693): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0074
     * @tc.name      ImageViewer_RotateModelCtor_0074
     * @tc.desc      new RotateModel(3629857) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0074 begin`);
      const subject: RotateModel = new RotateModel(3629857);
      logInfo(`new RotateModel(3629857): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3629857);
      logInfo(`new RotateModel(3629857): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3629857): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0075
     * @tc.name      ImageViewer_RotateModelCtor_0075
     * @tc.desc      new RotateModel(5590492) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0075 begin`);
      const subject: RotateModel = new RotateModel(5590492);
      logInfo(`new RotateModel(5590492): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5590492);
      logInfo(`new RotateModel(5590492): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5590492): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0076
     * @tc.name      ImageViewer_RotateModelCtor_0076
     * @tc.desc      new RotateModel(5066886) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0076 begin`);
      const subject: RotateModel = new RotateModel(5066886);
      logInfo(`new RotateModel(5066886): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5066886);
      logInfo(`new RotateModel(5066886): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5066886): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0077
     * @tc.name      ImageViewer_RotateModelCtor_0077
     * @tc.desc      new RotateModel(4779681) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0077 begin`);
      const subject: RotateModel = new RotateModel(4779681);
      logInfo(`new RotateModel(4779681): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4779681);
      logInfo(`new RotateModel(4779681): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4779681): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0077 end`);
    });
  });
}
