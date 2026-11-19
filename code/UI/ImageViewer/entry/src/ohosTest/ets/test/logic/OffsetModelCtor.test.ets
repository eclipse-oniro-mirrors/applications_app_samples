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

/** Logic checks for new OffsetModel (70 cases). */
export default function offsetModelCtorTest(): void {
  describe('OffsetModelCtorTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0001
     * @tc.name      ImageViewer_OffsetModelCtor_0001
     * @tc.desc      new OffsetModel(0, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_OffsetModelCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0001 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      logInfo(`new OffsetModel(0, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(0, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0002
     * @tc.name      ImageViewer_OffsetModelCtor_0002
     * @tc.desc      new OffsetModel(500, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_OffsetModelCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0002 begin`);
      const subject: OffsetModel = new OffsetModel(500, 0);
      logInfo(`new OffsetModel(500, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(500);
      logInfo(`new OffsetModel(500, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(500, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(500, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0003
     * @tc.name      ImageViewer_OffsetModelCtor_0003
     * @tc.desc      new OffsetModel(999, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0003 begin`);
      const subject: OffsetModel = new OffsetModel(999, 0);
      logInfo(`new OffsetModel(999, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(999);
      logInfo(`new OffsetModel(999, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(999, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(999, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0004
     * @tc.name      ImageViewer_OffsetModelCtor_0004
     * @tc.desc      new OffsetModel(1000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0004 begin`);
      const subject: OffsetModel = new OffsetModel(1000, 0);
      logInfo(`new OffsetModel(1000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1000);
      logInfo(`new OffsetModel(1000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0005
     * @tc.name      ImageViewer_OffsetModelCtor_0005
     * @tc.desc      new OffsetModel(59999, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0005 begin`);
      const subject: OffsetModel = new OffsetModel(59999, 0);
      logInfo(`new OffsetModel(59999, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(59999);
      logInfo(`new OffsetModel(59999, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(59999, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(59999, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0006
     * @tc.name      ImageViewer_OffsetModelCtor_0006
     * @tc.desc      new OffsetModel(60000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0006 begin`);
      const subject: OffsetModel = new OffsetModel(60000, 0);
      logInfo(`new OffsetModel(60000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(60000);
      logInfo(`new OffsetModel(60000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(60000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(60000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0007
     * @tc.name      ImageViewer_OffsetModelCtor_0007
     * @tc.desc      new OffsetModel(61000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0007 begin`);
      const subject: OffsetModel = new OffsetModel(61000, 0);
      logInfo(`new OffsetModel(61000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(61000);
      logInfo(`new OffsetModel(61000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(61000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(61000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0008
     * @tc.name      ImageViewer_OffsetModelCtor_0008
     * @tc.desc      new OffsetModel(3599000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0008 begin`);
      const subject: OffsetModel = new OffsetModel(3599000, 0);
      logInfo(`new OffsetModel(3599000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3599000);
      logInfo(`new OffsetModel(3599000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(3599000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3599000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0009
     * @tc.name      ImageViewer_OffsetModelCtor_0009
     * @tc.desc      new OffsetModel(3600000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0009 begin`);
      const subject: OffsetModel = new OffsetModel(3600000, 0);
      logInfo(`new OffsetModel(3600000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3600000);
      logInfo(`new OffsetModel(3600000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(3600000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3600000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0010
     * @tc.name      ImageViewer_OffsetModelCtor_0010
     * @tc.desc      new OffsetModel(1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0010 begin`);
      const subject: OffsetModel = new OffsetModel(1, 0);
      logInfo(`new OffsetModel(1, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1);
      logInfo(`new OffsetModel(1, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0011
     * @tc.name      ImageViewer_OffsetModelCtor_0011
     * @tc.desc      new OffsetModel(-1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0011 begin`);
      const subject: OffsetModel = new OffsetModel(-1, 0);
      logInfo(`new OffsetModel(-1, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(-1);
      logInfo(`new OffsetModel(-1, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(-1, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(-1, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0012
     * @tc.name      ImageViewer_OffsetModelCtor_0012
     * @tc.desc      new OffsetModel(2, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0012 begin`);
      const subject: OffsetModel = new OffsetModel(2, 0);
      logInfo(`new OffsetModel(2, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2);
      logInfo(`new OffsetModel(2, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(2, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0013
     * @tc.name      ImageViewer_OffsetModelCtor_0013
     * @tc.desc      new OffsetModel(3, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0013 begin`);
      const subject: OffsetModel = new OffsetModel(3, 0);
      logInfo(`new OffsetModel(3, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3);
      logInfo(`new OffsetModel(3, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(3, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0014
     * @tc.name      ImageViewer_OffsetModelCtor_0014
     * @tc.desc      new OffsetModel(10, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0014 begin`);
      const subject: OffsetModel = new OffsetModel(10, 0);
      logInfo(`new OffsetModel(10, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(10);
      logInfo(`new OffsetModel(10, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(10, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(10, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0015
     * @tc.name      ImageViewer_OffsetModelCtor_0015
     * @tc.desc      new OffsetModel(100, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0015 begin`);
      const subject: OffsetModel = new OffsetModel(100, 0);
      logInfo(`new OffsetModel(100, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(100);
      logInfo(`new OffsetModel(100, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(100, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(100, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0016
     * @tc.name      ImageViewer_OffsetModelCtor_0016
     * @tc.desc      new OffsetModel(180000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0016 begin`);
      const subject: OffsetModel = new OffsetModel(180000, 0);
      logInfo(`new OffsetModel(180000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(180000);
      logInfo(`new OffsetModel(180000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(180000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(180000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0017
     * @tc.name      ImageViewer_OffsetModelCtor_0017
     * @tc.desc      new OffsetModel(360000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0017 begin`);
      const subject: OffsetModel = new OffsetModel(360000, 0);
      logInfo(`new OffsetModel(360000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(360000);
      logInfo(`new OffsetModel(360000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(360000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(360000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0018
     * @tc.name      ImageViewer_OffsetModelCtor_0018
     * @tc.desc      new OffsetModel(540000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0018 begin`);
      const subject: OffsetModel = new OffsetModel(540000, 0);
      logInfo(`new OffsetModel(540000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(540000);
      logInfo(`new OffsetModel(540000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(540000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(540000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0019
     * @tc.name      ImageViewer_OffsetModelCtor_0019
     * @tc.desc      new OffsetModel(720000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0019 begin`);
      const subject: OffsetModel = new OffsetModel(720000, 0);
      logInfo(`new OffsetModel(720000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(720000);
      logInfo(`new OffsetModel(720000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(720000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(720000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0020
     * @tc.name      ImageViewer_OffsetModelCtor_0020
     * @tc.desc      new OffsetModel(900000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0020 begin`);
      const subject: OffsetModel = new OffsetModel(900000, 0);
      logInfo(`new OffsetModel(900000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(900000);
      logInfo(`new OffsetModel(900000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(900000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(900000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0021
     * @tc.name      ImageViewer_OffsetModelCtor_0021
     * @tc.desc      new OffsetModel(1080000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0021 begin`);
      const subject: OffsetModel = new OffsetModel(1080000, 0);
      logInfo(`new OffsetModel(1080000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1080000);
      logInfo(`new OffsetModel(1080000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1080000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1080000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0022
     * @tc.name      ImageViewer_OffsetModelCtor_0022
     * @tc.desc      new OffsetModel(1260000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0022 begin`);
      const subject: OffsetModel = new OffsetModel(1260000, 0);
      logInfo(`new OffsetModel(1260000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1260000);
      logInfo(`new OffsetModel(1260000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1260000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1260000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0023
     * @tc.name      ImageViewer_OffsetModelCtor_0023
     * @tc.desc      new OffsetModel(1440000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0023 begin`);
      const subject: OffsetModel = new OffsetModel(1440000, 0);
      logInfo(`new OffsetModel(1440000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1440000);
      logInfo(`new OffsetModel(1440000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1440000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1440000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0024
     * @tc.name      ImageViewer_OffsetModelCtor_0024
     * @tc.desc      new OffsetModel(1620000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0024 begin`);
      const subject: OffsetModel = new OffsetModel(1620000, 0);
      logInfo(`new OffsetModel(1620000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1620000);
      logInfo(`new OffsetModel(1620000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1620000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1620000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0025
     * @tc.name      ImageViewer_OffsetModelCtor_0025
     * @tc.desc      new OffsetModel(1800000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0025 begin`);
      const subject: OffsetModel = new OffsetModel(1800000, 0);
      logInfo(`new OffsetModel(1800000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1800000);
      logInfo(`new OffsetModel(1800000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1800000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1800000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0026
     * @tc.name      ImageViewer_OffsetModelCtor_0026
     * @tc.desc      new OffsetModel(1980000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0026 begin`);
      const subject: OffsetModel = new OffsetModel(1980000, 0);
      logInfo(`new OffsetModel(1980000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1980000);
      logInfo(`new OffsetModel(1980000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1980000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1980000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0027
     * @tc.name      ImageViewer_OffsetModelCtor_0027
     * @tc.desc      new OffsetModel(2160000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0027 begin`);
      const subject: OffsetModel = new OffsetModel(2160000, 0);
      logInfo(`new OffsetModel(2160000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2160000);
      logInfo(`new OffsetModel(2160000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(2160000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2160000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0028
     * @tc.name      ImageViewer_OffsetModelCtor_0028
     * @tc.desc      new OffsetModel(2340000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0028 begin`);
      const subject: OffsetModel = new OffsetModel(2340000, 0);
      logInfo(`new OffsetModel(2340000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2340000);
      logInfo(`new OffsetModel(2340000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(2340000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2340000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0029
     * @tc.name      ImageViewer_OffsetModelCtor_0029
     * @tc.desc      new OffsetModel(2520000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0029 begin`);
      const subject: OffsetModel = new OffsetModel(2520000, 0);
      logInfo(`new OffsetModel(2520000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2520000);
      logInfo(`new OffsetModel(2520000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(2520000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2520000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0030
     * @tc.name      ImageViewer_OffsetModelCtor_0030
     * @tc.desc      new OffsetModel(2700000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0030 begin`);
      const subject: OffsetModel = new OffsetModel(2700000, 0);
      logInfo(`new OffsetModel(2700000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2700000);
      logInfo(`new OffsetModel(2700000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(2700000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2700000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0031
     * @tc.name      ImageViewer_OffsetModelCtor_0031
     * @tc.desc      new OffsetModel(2880000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0031 begin`);
      const subject: OffsetModel = new OffsetModel(2880000, 0);
      logInfo(`new OffsetModel(2880000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(2880000);
      logInfo(`new OffsetModel(2880000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(2880000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(2880000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0032
     * @tc.name      ImageViewer_OffsetModelCtor_0032
     * @tc.desc      new OffsetModel(3060000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0032 begin`);
      const subject: OffsetModel = new OffsetModel(3060000, 0);
      logInfo(`new OffsetModel(3060000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3060000);
      logInfo(`new OffsetModel(3060000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(3060000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3060000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0033
     * @tc.name      ImageViewer_OffsetModelCtor_0033
     * @tc.desc      new OffsetModel(3240000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0033 begin`);
      const subject: OffsetModel = new OffsetModel(3240000, 0);
      logInfo(`new OffsetModel(3240000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3240000);
      logInfo(`new OffsetModel(3240000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(3240000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3240000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0034
     * @tc.name      ImageViewer_OffsetModelCtor_0034
     * @tc.desc      new OffsetModel(3420000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0034 begin`);
      const subject: OffsetModel = new OffsetModel(3420000, 0);
      logInfo(`new OffsetModel(3420000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3420000);
      logInfo(`new OffsetModel(3420000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(3420000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3420000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0035
     * @tc.name      ImageViewer_OffsetModelCtor_0035
     * @tc.desc      new OffsetModel(3780000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0035 begin`);
      const subject: OffsetModel = new OffsetModel(3780000, 0);
      logInfo(`new OffsetModel(3780000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3780000);
      logInfo(`new OffsetModel(3780000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(3780000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3780000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0036
     * @tc.name      ImageViewer_OffsetModelCtor_0036
     * @tc.desc      new OffsetModel(3960000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0036 begin`);
      const subject: OffsetModel = new OffsetModel(3960000, 0);
      logInfo(`new OffsetModel(3960000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(3960000);
      logInfo(`new OffsetModel(3960000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(3960000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(3960000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0037
     * @tc.name      ImageViewer_OffsetModelCtor_0037
     * @tc.desc      new OffsetModel(4140000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0037 begin`);
      const subject: OffsetModel = new OffsetModel(4140000, 0);
      logInfo(`new OffsetModel(4140000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4140000);
      logInfo(`new OffsetModel(4140000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(4140000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4140000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0038
     * @tc.name      ImageViewer_OffsetModelCtor_0038
     * @tc.desc      new OffsetModel(4320000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0038 begin`);
      const subject: OffsetModel = new OffsetModel(4320000, 0);
      logInfo(`new OffsetModel(4320000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4320000);
      logInfo(`new OffsetModel(4320000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(4320000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4320000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0039
     * @tc.name      ImageViewer_OffsetModelCtor_0039
     * @tc.desc      new OffsetModel(4500000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0039 begin`);
      const subject: OffsetModel = new OffsetModel(4500000, 0);
      logInfo(`new OffsetModel(4500000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4500000);
      logInfo(`new OffsetModel(4500000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(4500000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4500000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0040
     * @tc.name      ImageViewer_OffsetModelCtor_0040
     * @tc.desc      new OffsetModel(4680000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0040 begin`);
      const subject: OffsetModel = new OffsetModel(4680000, 0);
      logInfo(`new OffsetModel(4680000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4680000);
      logInfo(`new OffsetModel(4680000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(4680000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4680000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0041
     * @tc.name      ImageViewer_OffsetModelCtor_0041
     * @tc.desc      new OffsetModel(4860000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0041 begin`);
      const subject: OffsetModel = new OffsetModel(4860000, 0);
      logInfo(`new OffsetModel(4860000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(4860000);
      logInfo(`new OffsetModel(4860000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(4860000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(4860000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0042
     * @tc.name      ImageViewer_OffsetModelCtor_0042
     * @tc.desc      new OffsetModel(5040000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0042 begin`);
      const subject: OffsetModel = new OffsetModel(5040000, 0);
      logInfo(`new OffsetModel(5040000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5040000);
      logInfo(`new OffsetModel(5040000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(5040000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5040000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0043
     * @tc.name      ImageViewer_OffsetModelCtor_0043
     * @tc.desc      new OffsetModel(5220000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0043 begin`);
      const subject: OffsetModel = new OffsetModel(5220000, 0);
      logInfo(`new OffsetModel(5220000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5220000);
      logInfo(`new OffsetModel(5220000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(5220000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5220000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0044
     * @tc.name      ImageViewer_OffsetModelCtor_0044
     * @tc.desc      new OffsetModel(5400000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0044 begin`);
      const subject: OffsetModel = new OffsetModel(5400000, 0);
      logInfo(`new OffsetModel(5400000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5400000);
      logInfo(`new OffsetModel(5400000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(5400000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5400000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0045
     * @tc.name      ImageViewer_OffsetModelCtor_0045
     * @tc.desc      new OffsetModel(5580000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0045 begin`);
      const subject: OffsetModel = new OffsetModel(5580000, 0);
      logInfo(`new OffsetModel(5580000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5580000);
      logInfo(`new OffsetModel(5580000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(5580000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5580000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0046
     * @tc.name      ImageViewer_OffsetModelCtor_0046
     * @tc.desc      new OffsetModel(5760000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0046 begin`);
      const subject: OffsetModel = new OffsetModel(5760000, 0);
      logInfo(`new OffsetModel(5760000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5760000);
      logInfo(`new OffsetModel(5760000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(5760000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5760000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0047
     * @tc.name      ImageViewer_OffsetModelCtor_0047
     * @tc.desc      new OffsetModel(5940000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0047 begin`);
      const subject: OffsetModel = new OffsetModel(5940000, 0);
      logInfo(`new OffsetModel(5940000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5940000);
      logInfo(`new OffsetModel(5940000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(5940000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5940000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0048
     * @tc.name      ImageViewer_OffsetModelCtor_0048
     * @tc.desc      new OffsetModel(6120000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0048 begin`);
      const subject: OffsetModel = new OffsetModel(6120000, 0);
      logInfo(`new OffsetModel(6120000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6120000);
      logInfo(`new OffsetModel(6120000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(6120000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6120000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0049
     * @tc.name      ImageViewer_OffsetModelCtor_0049
     * @tc.desc      new OffsetModel(6300000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0049 begin`);
      const subject: OffsetModel = new OffsetModel(6300000, 0);
      logInfo(`new OffsetModel(6300000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6300000);
      logInfo(`new OffsetModel(6300000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(6300000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6300000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0050
     * @tc.name      ImageViewer_OffsetModelCtor_0050
     * @tc.desc      new OffsetModel(6480000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0050 begin`);
      const subject: OffsetModel = new OffsetModel(6480000, 0);
      logInfo(`new OffsetModel(6480000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6480000);
      logInfo(`new OffsetModel(6480000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(6480000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6480000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0051
     * @tc.name      ImageViewer_OffsetModelCtor_0051
     * @tc.desc      new OffsetModel(6660000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0051 begin`);
      const subject: OffsetModel = new OffsetModel(6660000, 0);
      logInfo(`new OffsetModel(6660000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6660000);
      logInfo(`new OffsetModel(6660000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(6660000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6660000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0052
     * @tc.name      ImageViewer_OffsetModelCtor_0052
     * @tc.desc      new OffsetModel(6840000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0052 begin`);
      const subject: OffsetModel = new OffsetModel(6840000, 0);
      logInfo(`new OffsetModel(6840000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6840000);
      logInfo(`new OffsetModel(6840000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(6840000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6840000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0053
     * @tc.name      ImageViewer_OffsetModelCtor_0053
     * @tc.desc      new OffsetModel(7020000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0053 begin`);
      const subject: OffsetModel = new OffsetModel(7020000, 0);
      logInfo(`new OffsetModel(7020000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(7020000);
      logInfo(`new OffsetModel(7020000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(7020000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(7020000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0054
     * @tc.name      ImageViewer_OffsetModelCtor_0054
     * @tc.desc      new OffsetModel(7200000, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0054 begin`);
      const subject: OffsetModel = new OffsetModel(7200000, 0);
      logInfo(`new OffsetModel(7200000, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(7200000);
      logInfo(`new OffsetModel(7200000, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(7200000, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(7200000, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0055
     * @tc.name      ImageViewer_OffsetModelCtor_0055
     * @tc.desc      new OffsetModel(1867463.57, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0055 begin`);
      const subject: OffsetModel = new OffsetModel(1867463.57, 0);
      logInfo(`new OffsetModel(1867463.57, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertClose(1867463.57, PRECISION);
      logInfo(`new OffsetModel(1867463.57, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1867463.57, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1867463.57, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0056
     * @tc.name      ImageViewer_OffsetModelCtor_0056
     * @tc.desc      new OffsetModel(5886866, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0056 begin`);
      const subject: OffsetModel = new OffsetModel(5886866, 0);
      logInfo(`new OffsetModel(5886866, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(5886866);
      logInfo(`new OffsetModel(5886866, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(5886866, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(5886866, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0057
     * @tc.name      ImageViewer_OffsetModelCtor_0057
     * @tc.desc      new OffsetModel(6130914, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0057 begin`);
      const subject: OffsetModel = new OffsetModel(6130914, 0);
      logInfo(`new OffsetModel(6130914, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6130914);
      logInfo(`new OffsetModel(6130914, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(6130914, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6130914, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0058
     * @tc.name      ImageViewer_OffsetModelCtor_0058
     * @tc.desc      new OffsetModel(1754722, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0058 begin`);
      const subject: OffsetModel = new OffsetModel(1754722, 0);
      logInfo(`new OffsetModel(1754722, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(1754722);
      logInfo(`new OffsetModel(1754722, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(1754722, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(1754722, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0059
     * @tc.name      ImageViewer_OffsetModelCtor_0059
     * @tc.desc      new OffsetModel(6673810, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0059 begin`);
      const subject: OffsetModel = new OffsetModel(6673810, 0);
      logInfo(`new OffsetModel(6673810, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(6673810);
      logInfo(`new OffsetModel(6673810, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(6673810, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(6673810, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0060
     * @tc.name      ImageViewer_OffsetModelCtor_0060
     * @tc.desc      new OffsetModel(-513826, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0060 begin`);
      const subject: OffsetModel = new OffsetModel(-513826, 0);
      logInfo(`new OffsetModel(-513826, 0): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(-513826);
      logInfo(`new OffsetModel(-513826, 0): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(0);
      logInfo(`new OffsetModel(-513826, 0): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(-513826, 0): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0061
     * @tc.name      ImageViewer_OffsetModelCtor_0061
     * @tc.desc      new OffsetModel(0, 500) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0061 begin`);
      const subject: OffsetModel = new OffsetModel(0, 500);
      logInfo(`new OffsetModel(0, 500): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 500): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(500);
      logInfo(`new OffsetModel(0, 500): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 500): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0062
     * @tc.name      ImageViewer_OffsetModelCtor_0062
     * @tc.desc      new OffsetModel(0, 999) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0062 begin`);
      const subject: OffsetModel = new OffsetModel(0, 999);
      logInfo(`new OffsetModel(0, 999): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 999): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(999);
      logInfo(`new OffsetModel(0, 999): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 999): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0063
     * @tc.name      ImageViewer_OffsetModelCtor_0063
     * @tc.desc      new OffsetModel(0, 1000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0063 begin`);
      const subject: OffsetModel = new OffsetModel(0, 1000);
      logInfo(`new OffsetModel(0, 1000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1000);
      logInfo(`new OffsetModel(0, 1000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0064
     * @tc.name      ImageViewer_OffsetModelCtor_0064
     * @tc.desc      new OffsetModel(0, 59999) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0064 begin`);
      const subject: OffsetModel = new OffsetModel(0, 59999);
      logInfo(`new OffsetModel(0, 59999): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 59999): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(59999);
      logInfo(`new OffsetModel(0, 59999): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 59999): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0065
     * @tc.name      ImageViewer_OffsetModelCtor_0065
     * @tc.desc      new OffsetModel(0, 60000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0065 begin`);
      const subject: OffsetModel = new OffsetModel(0, 60000);
      logInfo(`new OffsetModel(0, 60000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 60000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(60000);
      logInfo(`new OffsetModel(0, 60000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 60000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0066
     * @tc.name      ImageViewer_OffsetModelCtor_0066
     * @tc.desc      new OffsetModel(0, 61000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0066 begin`);
      const subject: OffsetModel = new OffsetModel(0, 61000);
      logInfo(`new OffsetModel(0, 61000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 61000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(61000);
      logInfo(`new OffsetModel(0, 61000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 61000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0067
     * @tc.name      ImageViewer_OffsetModelCtor_0067
     * @tc.desc      new OffsetModel(0, 3599000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0067 begin`);
      const subject: OffsetModel = new OffsetModel(0, 3599000);
      logInfo(`new OffsetModel(0, 3599000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3599000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3599000);
      logInfo(`new OffsetModel(0, 3599000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3599000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0068
     * @tc.name      ImageViewer_OffsetModelCtor_0068
     * @tc.desc      new OffsetModel(0, 3600000) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0068 begin`);
      const subject: OffsetModel = new OffsetModel(0, 3600000);
      logInfo(`new OffsetModel(0, 3600000): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3600000): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(3600000);
      logInfo(`new OffsetModel(0, 3600000): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 3600000): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0069
     * @tc.name      ImageViewer_OffsetModelCtor_0069
     * @tc.desc      new OffsetModel(0, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0069 begin`);
      const subject: OffsetModel = new OffsetModel(0, 1);
      logInfo(`new OffsetModel(0, 1): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(1);
      logInfo(`new OffsetModel(0, 1): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, 1): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_CTOR_0070
     * @tc.name      ImageViewer_OffsetModelCtor_0070
     * @tc.desc      new OffsetModel(0, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_OffsetModelCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}OffsetModelCtor_0070 begin`);
      const subject: OffsetModel = new OffsetModel(0, -1);
      logInfo(`new OffsetModel(0, -1): subject.currentX=${subject.currentX}`);
      expect(subject.currentX).assertEqual(0);
      logInfo(`new OffsetModel(0, -1): subject.currentY=${subject.currentY}`);
      expect(subject.currentY).assertEqual(-1);
      logInfo(`new OffsetModel(0, -1): subject.lastX=${subject.lastX}`);
      expect(subject.lastX).assertEqual(0);
      logInfo(`new OffsetModel(0, -1): subject.lastY=${subject.lastY}`);
      expect(subject.lastY).assertEqual(0);
      logInfo(`${BUNDLE}OffsetModelCtor_0070 end`);
    });
  });
}
