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

/** Logic checks for new RotateModel (9 cases). */
export default function rotateModelCtor4Test(): void {
  describe('RotateModelCtor4Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0232
     * @tc.name      ImageViewer_RotateModelCtor_0232
     * @tc.desc      new RotateModel(-2341150) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0232 begin`);
      const subject: RotateModel = new RotateModel(-2341150);
      logInfo(`new RotateModel(-2341150): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2341150);
      logInfo(`new RotateModel(-2341150): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2341150): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0232 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0233
     * @tc.name      ImageViewer_RotateModelCtor_0233
     * @tc.desc      new RotateModel(-452665) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0233 begin`);
      const subject: RotateModel = new RotateModel(-452665);
      logInfo(`new RotateModel(-452665): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-452665);
      logInfo(`new RotateModel(-452665): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-452665): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0233 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0234
     * @tc.name      ImageViewer_RotateModelCtor_0234
     * @tc.desc      new RotateModel(-459967) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0234 begin`);
      const subject: RotateModel = new RotateModel(-459967);
      logInfo(`new RotateModel(-459967): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-459967);
      logInfo(`new RotateModel(-459967): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-459967): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0234 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0235
     * @tc.name      ImageViewer_RotateModelCtor_0235
     * @tc.desc      new RotateModel(7180046) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0235 begin`);
      const subject: RotateModel = new RotateModel(7180046);
      logInfo(`new RotateModel(7180046): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(7180046);
      logInfo(`new RotateModel(7180046): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(7180046): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0235 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0236
     * @tc.name      ImageViewer_RotateModelCtor_0236
     * @tc.desc      new RotateModel(3133135.34) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0236 begin`);
      const subject: RotateModel = new RotateModel(3133135.34);
      logInfo(`new RotateModel(3133135.34): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3133135.34, PRECISION);
      logInfo(`new RotateModel(3133135.34): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3133135.34): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0236 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0237
     * @tc.name      ImageViewer_RotateModelCtor_0237
     * @tc.desc      new RotateModel(3853518) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0237 begin`);
      const subject: RotateModel = new RotateModel(3853518);
      logInfo(`new RotateModel(3853518): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3853518);
      logInfo(`new RotateModel(3853518): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3853518): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0237 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0238
     * @tc.name      ImageViewer_RotateModelCtor_0238
     * @tc.desc      new RotateModel(2978079.89) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0238 begin`);
      const subject: RotateModel = new RotateModel(2978079.89);
      logInfo(`new RotateModel(2978079.89): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2978079.89, PRECISION);
      logInfo(`new RotateModel(2978079.89): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2978079.89): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0238 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0239
     * @tc.name      ImageViewer_RotateModelCtor_0239
     * @tc.desc      new RotateModel(5385003) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0239 begin`);
      const subject: RotateModel = new RotateModel(5385003);
      logInfo(`new RotateModel(5385003): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5385003);
      logInfo(`new RotateModel(5385003): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5385003): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0239 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0240
     * @tc.name      ImageViewer_RotateModelCtor_0240
     * @tc.desc      new RotateModel(2831525) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0240 begin`);
      const subject: RotateModel = new RotateModel(2831525);
      logInfo(`new RotateModel(2831525): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2831525);
      logInfo(`new RotateModel(2831525): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2831525): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0240 end`);
    });
  });
}
