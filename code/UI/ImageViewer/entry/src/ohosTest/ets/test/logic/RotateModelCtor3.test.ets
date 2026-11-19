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
export default function rotateModelCtor3Test(): void {
  describe('RotateModelCtor3Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0155
     * @tc.name      ImageViewer_RotateModelCtor_0155
     * @tc.desc      new RotateModel(2271194.81) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0155 begin`);
      const subject: RotateModel = new RotateModel(2271194.81);
      logInfo(`new RotateModel(2271194.81): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2271194.81, PRECISION);
      logInfo(`new RotateModel(2271194.81): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2271194.81): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0155 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0156
     * @tc.name      ImageViewer_RotateModelCtor_0156
     * @tc.desc      new RotateModel(-2507609) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0156 begin`);
      const subject: RotateModel = new RotateModel(-2507609);
      logInfo(`new RotateModel(-2507609): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2507609);
      logInfo(`new RotateModel(-2507609): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2507609): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0156 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0157
     * @tc.name      ImageViewer_RotateModelCtor_0157
     * @tc.desc      new RotateModel(-583704) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0157 begin`);
      const subject: RotateModel = new RotateModel(-583704);
      logInfo(`new RotateModel(-583704): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-583704);
      logInfo(`new RotateModel(-583704): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-583704): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0157 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0158
     * @tc.name      ImageViewer_RotateModelCtor_0158
     * @tc.desc      new RotateModel(1274342.95) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0158 begin`);
      const subject: RotateModel = new RotateModel(1274342.95);
      logInfo(`new RotateModel(1274342.95): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1274342.95, PRECISION);
      logInfo(`new RotateModel(1274342.95): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1274342.95): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0158 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0159
     * @tc.name      ImageViewer_RotateModelCtor_0159
     * @tc.desc      new RotateModel(3959409) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0159 begin`);
      const subject: RotateModel = new RotateModel(3959409);
      logInfo(`new RotateModel(3959409): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3959409);
      logInfo(`new RotateModel(3959409): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3959409): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0159 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0160
     * @tc.name      ImageViewer_RotateModelCtor_0160
     * @tc.desc      new RotateModel(5630761) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0160 begin`);
      const subject: RotateModel = new RotateModel(5630761);
      logInfo(`new RotateModel(5630761): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5630761);
      logInfo(`new RotateModel(5630761): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5630761): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0160 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0161
     * @tc.name      ImageViewer_RotateModelCtor_0161
     * @tc.desc      new RotateModel(2760990.82) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0161 begin`);
      const subject: RotateModel = new RotateModel(2760990.82);
      logInfo(`new RotateModel(2760990.82): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2760990.82, PRECISION);
      logInfo(`new RotateModel(2760990.82): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2760990.82): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0161 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0162
     * @tc.name      ImageViewer_RotateModelCtor_0162
     * @tc.desc      new RotateModel(3187084.47) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0162 begin`);
      const subject: RotateModel = new RotateModel(3187084.47);
      logInfo(`new RotateModel(3187084.47): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3187084.47, PRECISION);
      logInfo(`new RotateModel(3187084.47): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3187084.47): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0162 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0163
     * @tc.name      ImageViewer_RotateModelCtor_0163
     * @tc.desc      new RotateModel(-1772306) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0163 begin`);
      const subject: RotateModel = new RotateModel(-1772306);
      logInfo(`new RotateModel(-1772306): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1772306);
      logInfo(`new RotateModel(-1772306): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1772306): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0163 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0164
     * @tc.name      ImageViewer_RotateModelCtor_0164
     * @tc.desc      new RotateModel(744721.14) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0164 begin`);
      const subject: RotateModel = new RotateModel(744721.14);
      logInfo(`new RotateModel(744721.14): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(744721.14, PRECISION);
      logInfo(`new RotateModel(744721.14): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(744721.14): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0164 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0165
     * @tc.name      ImageViewer_RotateModelCtor_0165
     * @tc.desc      new RotateModel(1833365.29) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0165 begin`);
      const subject: RotateModel = new RotateModel(1833365.29);
      logInfo(`new RotateModel(1833365.29): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1833365.29, PRECISION);
      logInfo(`new RotateModel(1833365.29): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1833365.29): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0165 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0166
     * @tc.name      ImageViewer_RotateModelCtor_0166
     * @tc.desc      new RotateModel(6067385) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0166 begin`);
      const subject: RotateModel = new RotateModel(6067385);
      logInfo(`new RotateModel(6067385): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6067385);
      logInfo(`new RotateModel(6067385): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6067385): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0166 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0167
     * @tc.name      ImageViewer_RotateModelCtor_0167
     * @tc.desc      new RotateModel(4493647) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0167 begin`);
      const subject: RotateModel = new RotateModel(4493647);
      logInfo(`new RotateModel(4493647): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4493647);
      logInfo(`new RotateModel(4493647): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4493647): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0167 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0168
     * @tc.name      ImageViewer_RotateModelCtor_0168
     * @tc.desc      new RotateModel(937969) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0168 begin`);
      const subject: RotateModel = new RotateModel(937969);
      logInfo(`new RotateModel(937969): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(937969);
      logInfo(`new RotateModel(937969): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(937969): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0168 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0169
     * @tc.name      ImageViewer_RotateModelCtor_0169
     * @tc.desc      new RotateModel(313917) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0169 begin`);
      const subject: RotateModel = new RotateModel(313917);
      logInfo(`new RotateModel(313917): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(313917);
      logInfo(`new RotateModel(313917): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(313917): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0169 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0170
     * @tc.name      ImageViewer_RotateModelCtor_0170
     * @tc.desc      new RotateModel(2995368) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0170 begin`);
      const subject: RotateModel = new RotateModel(2995368);
      logInfo(`new RotateModel(2995368): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2995368);
      logInfo(`new RotateModel(2995368): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2995368): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0170 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0171
     * @tc.name      ImageViewer_RotateModelCtor_0171
     * @tc.desc      new RotateModel(446885) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0171 begin`);
      const subject: RotateModel = new RotateModel(446885);
      logInfo(`new RotateModel(446885): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(446885);
      logInfo(`new RotateModel(446885): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(446885): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0171 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0172
     * @tc.name      ImageViewer_RotateModelCtor_0172
     * @tc.desc      new RotateModel(1545782.92) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0172 begin`);
      const subject: RotateModel = new RotateModel(1545782.92);
      logInfo(`new RotateModel(1545782.92): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1545782.92, PRECISION);
      logInfo(`new RotateModel(1545782.92): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1545782.92): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0172 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0173
     * @tc.name      ImageViewer_RotateModelCtor_0173
     * @tc.desc      new RotateModel(3648705) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0173 begin`);
      const subject: RotateModel = new RotateModel(3648705);
      logInfo(`new RotateModel(3648705): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3648705);
      logInfo(`new RotateModel(3648705): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3648705): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0173 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0174
     * @tc.name      ImageViewer_RotateModelCtor_0174
     * @tc.desc      new RotateModel(3331093.17) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0174 begin`);
      const subject: RotateModel = new RotateModel(3331093.17);
      logInfo(`new RotateModel(3331093.17): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3331093.17, PRECISION);
      logInfo(`new RotateModel(3331093.17): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3331093.17): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0174 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0175
     * @tc.name      ImageViewer_RotateModelCtor_0175
     * @tc.desc      new RotateModel(1488431.36) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0175 begin`);
      const subject: RotateModel = new RotateModel(1488431.36);
      logInfo(`new RotateModel(1488431.36): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1488431.36, PRECISION);
      logInfo(`new RotateModel(1488431.36): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1488431.36): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0175 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0176
     * @tc.name      ImageViewer_RotateModelCtor_0176
     * @tc.desc      new RotateModel(1031546) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0176 begin`);
      const subject: RotateModel = new RotateModel(1031546);
      logInfo(`new RotateModel(1031546): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1031546);
      logInfo(`new RotateModel(1031546): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1031546): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0176 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0177
     * @tc.name      ImageViewer_RotateModelCtor_0177
     * @tc.desc      new RotateModel(-2370542) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0177 begin`);
      const subject: RotateModel = new RotateModel(-2370542);
      logInfo(`new RotateModel(-2370542): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2370542);
      logInfo(`new RotateModel(-2370542): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2370542): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0177 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0178
     * @tc.name      ImageViewer_RotateModelCtor_0178
     * @tc.desc      new RotateModel(1627298.74) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0178 begin`);
      const subject: RotateModel = new RotateModel(1627298.74);
      logInfo(`new RotateModel(1627298.74): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1627298.74, PRECISION);
      logInfo(`new RotateModel(1627298.74): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1627298.74): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0178 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0179
     * @tc.name      ImageViewer_RotateModelCtor_0179
     * @tc.desc      new RotateModel(5313646) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0179 begin`);
      const subject: RotateModel = new RotateModel(5313646);
      logInfo(`new RotateModel(5313646): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5313646);
      logInfo(`new RotateModel(5313646): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5313646): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0179 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0180
     * @tc.name      ImageViewer_RotateModelCtor_0180
     * @tc.desc      new RotateModel(2118925.13) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0180 begin`);
      const subject: RotateModel = new RotateModel(2118925.13);
      logInfo(`new RotateModel(2118925.13): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2118925.13, PRECISION);
      logInfo(`new RotateModel(2118925.13): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2118925.13): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0180 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0181
     * @tc.name      ImageViewer_RotateModelCtor_0181
     * @tc.desc      new RotateModel(739407.31) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0181 begin`);
      const subject: RotateModel = new RotateModel(739407.31);
      logInfo(`new RotateModel(739407.31): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(739407.31, PRECISION);
      logInfo(`new RotateModel(739407.31): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(739407.31): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0181 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0182
     * @tc.name      ImageViewer_RotateModelCtor_0182
     * @tc.desc      new RotateModel(3481684) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0182 begin`);
      const subject: RotateModel = new RotateModel(3481684);
      logInfo(`new RotateModel(3481684): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3481684);
      logInfo(`new RotateModel(3481684): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3481684): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0182 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0183
     * @tc.name      ImageViewer_RotateModelCtor_0183
     * @tc.desc      new RotateModel(5086683) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0183 begin`);
      const subject: RotateModel = new RotateModel(5086683);
      logInfo(`new RotateModel(5086683): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5086683);
      logInfo(`new RotateModel(5086683): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5086683): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0183 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0184
     * @tc.name      ImageViewer_RotateModelCtor_0184
     * @tc.desc      new RotateModel(2455133) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0184 begin`);
      const subject: RotateModel = new RotateModel(2455133);
      logInfo(`new RotateModel(2455133): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2455133);
      logInfo(`new RotateModel(2455133): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2455133): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0184 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0185
     * @tc.name      ImageViewer_RotateModelCtor_0185
     * @tc.desc      new RotateModel(48440) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0185 begin`);
      const subject: RotateModel = new RotateModel(48440);
      logInfo(`new RotateModel(48440): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(48440);
      logInfo(`new RotateModel(48440): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(48440): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0185 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0186
     * @tc.name      ImageViewer_RotateModelCtor_0186
     * @tc.desc      new RotateModel(-1415742) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0186 begin`);
      const subject: RotateModel = new RotateModel(-1415742);
      logInfo(`new RotateModel(-1415742): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1415742);
      logInfo(`new RotateModel(-1415742): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1415742): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0186 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0187
     * @tc.name      ImageViewer_RotateModelCtor_0187
     * @tc.desc      new RotateModel(-1977257) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0187 begin`);
      const subject: RotateModel = new RotateModel(-1977257);
      logInfo(`new RotateModel(-1977257): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1977257);
      logInfo(`new RotateModel(-1977257): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1977257): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0187 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0188
     * @tc.name      ImageViewer_RotateModelCtor_0188
     * @tc.desc      new RotateModel(3243943) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0188 begin`);
      const subject: RotateModel = new RotateModel(3243943);
      logInfo(`new RotateModel(3243943): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3243943);
      logInfo(`new RotateModel(3243943): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3243943): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0188 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0189
     * @tc.name      ImageViewer_RotateModelCtor_0189
     * @tc.desc      new RotateModel(1356653) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0189 begin`);
      const subject: RotateModel = new RotateModel(1356653);
      logInfo(`new RotateModel(1356653): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1356653);
      logInfo(`new RotateModel(1356653): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1356653): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0189 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0190
     * @tc.name      ImageViewer_RotateModelCtor_0190
     * @tc.desc      new RotateModel(1153514.81) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0190 begin`);
      const subject: RotateModel = new RotateModel(1153514.81);
      logInfo(`new RotateModel(1153514.81): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1153514.81, PRECISION);
      logInfo(`new RotateModel(1153514.81): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1153514.81): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0190 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0191
     * @tc.name      ImageViewer_RotateModelCtor_0191
     * @tc.desc      new RotateModel(-266999) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0191 begin`);
      const subject: RotateModel = new RotateModel(-266999);
      logInfo(`new RotateModel(-266999): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-266999);
      logInfo(`new RotateModel(-266999): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-266999): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0191 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0192
     * @tc.name      ImageViewer_RotateModelCtor_0192
     * @tc.desc      new RotateModel(3343604) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0192 begin`);
      const subject: RotateModel = new RotateModel(3343604);
      logInfo(`new RotateModel(3343604): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3343604);
      logInfo(`new RotateModel(3343604): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3343604): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0192 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0193
     * @tc.name      ImageViewer_RotateModelCtor_0193
     * @tc.desc      new RotateModel(5098307) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0193 begin`);
      const subject: RotateModel = new RotateModel(5098307);
      logInfo(`new RotateModel(5098307): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5098307);
      logInfo(`new RotateModel(5098307): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5098307): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0193 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0194
     * @tc.name      ImageViewer_RotateModelCtor_0194
     * @tc.desc      new RotateModel(1852231) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0194 begin`);
      const subject: RotateModel = new RotateModel(1852231);
      logInfo(`new RotateModel(1852231): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1852231);
      logInfo(`new RotateModel(1852231): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1852231): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0194 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0195
     * @tc.name      ImageViewer_RotateModelCtor_0195
     * @tc.desc      new RotateModel(-460335) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0195 begin`);
      const subject: RotateModel = new RotateModel(-460335);
      logInfo(`new RotateModel(-460335): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-460335);
      logInfo(`new RotateModel(-460335): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-460335): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0195 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0196
     * @tc.name      ImageViewer_RotateModelCtor_0196
     * @tc.desc      new RotateModel(6471929) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0196 begin`);
      const subject: RotateModel = new RotateModel(6471929);
      logInfo(`new RotateModel(6471929): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6471929);
      logInfo(`new RotateModel(6471929): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6471929): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0196 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0197
     * @tc.name      ImageViewer_RotateModelCtor_0197
     * @tc.desc      new RotateModel(6799438) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0197 begin`);
      const subject: RotateModel = new RotateModel(6799438);
      logInfo(`new RotateModel(6799438): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6799438);
      logInfo(`new RotateModel(6799438): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6799438): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0197 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0198
     * @tc.name      ImageViewer_RotateModelCtor_0198
     * @tc.desc      new RotateModel(2022340) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0198 begin`);
      const subject: RotateModel = new RotateModel(2022340);
      logInfo(`new RotateModel(2022340): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2022340);
      logInfo(`new RotateModel(2022340): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2022340): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0198 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0199
     * @tc.name      ImageViewer_RotateModelCtor_0199
     * @tc.desc      new RotateModel(-542410) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0199 begin`);
      const subject: RotateModel = new RotateModel(-542410);
      logInfo(`new RotateModel(-542410): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-542410);
      logInfo(`new RotateModel(-542410): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-542410): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0199 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0200
     * @tc.name      ImageViewer_RotateModelCtor_0200
     * @tc.desc      new RotateModel(3125991.55) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0200 begin`);
      const subject: RotateModel = new RotateModel(3125991.55);
      logInfo(`new RotateModel(3125991.55): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3125991.55, PRECISION);
      logInfo(`new RotateModel(3125991.55): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3125991.55): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0200 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0201
     * @tc.name      ImageViewer_RotateModelCtor_0201
     * @tc.desc      new RotateModel(5858147) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0201 begin`);
      const subject: RotateModel = new RotateModel(5858147);
      logInfo(`new RotateModel(5858147): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5858147);
      logInfo(`new RotateModel(5858147): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5858147): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0201 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0202
     * @tc.name      ImageViewer_RotateModelCtor_0202
     * @tc.desc      new RotateModel(6244977) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0202 begin`);
      const subject: RotateModel = new RotateModel(6244977);
      logInfo(`new RotateModel(6244977): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6244977);
      logInfo(`new RotateModel(6244977): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6244977): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0202 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0203
     * @tc.name      ImageViewer_RotateModelCtor_0203
     * @tc.desc      new RotateModel(5821127) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0203 begin`);
      const subject: RotateModel = new RotateModel(5821127);
      logInfo(`new RotateModel(5821127): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5821127);
      logInfo(`new RotateModel(5821127): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5821127): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0203 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0204
     * @tc.name      ImageViewer_RotateModelCtor_0204
     * @tc.desc      new RotateModel(173713.23) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0204 begin`);
      const subject: RotateModel = new RotateModel(173713.23);
      logInfo(`new RotateModel(173713.23): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(173713.23, PRECISION);
      logInfo(`new RotateModel(173713.23): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(173713.23): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0204 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0205
     * @tc.name      ImageViewer_RotateModelCtor_0205
     * @tc.desc      new RotateModel(1171763.76) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0205 begin`);
      const subject: RotateModel = new RotateModel(1171763.76);
      logInfo(`new RotateModel(1171763.76): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1171763.76, PRECISION);
      logInfo(`new RotateModel(1171763.76): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1171763.76): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0205 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0206
     * @tc.name      ImageViewer_RotateModelCtor_0206
     * @tc.desc      new RotateModel(2587344) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0206 begin`);
      const subject: RotateModel = new RotateModel(2587344);
      logInfo(`new RotateModel(2587344): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2587344);
      logInfo(`new RotateModel(2587344): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2587344): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0206 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0207
     * @tc.name      ImageViewer_RotateModelCtor_0207
     * @tc.desc      new RotateModel(3357146) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0207 begin`);
      const subject: RotateModel = new RotateModel(3357146);
      logInfo(`new RotateModel(3357146): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3357146);
      logInfo(`new RotateModel(3357146): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3357146): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0207 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0208
     * @tc.name      ImageViewer_RotateModelCtor_0208
     * @tc.desc      new RotateModel(-1665239) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0208 begin`);
      const subject: RotateModel = new RotateModel(-1665239);
      logInfo(`new RotateModel(-1665239): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1665239);
      logInfo(`new RotateModel(-1665239): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1665239): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0208 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0209
     * @tc.name      ImageViewer_RotateModelCtor_0209
     * @tc.desc      new RotateModel(6337960) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0209 begin`);
      const subject: RotateModel = new RotateModel(6337960);
      logInfo(`new RotateModel(6337960): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6337960);
      logInfo(`new RotateModel(6337960): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6337960): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0209 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0210
     * @tc.name      ImageViewer_RotateModelCtor_0210
     * @tc.desc      new RotateModel(3300433) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0210 begin`);
      const subject: RotateModel = new RotateModel(3300433);
      logInfo(`new RotateModel(3300433): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3300433);
      logInfo(`new RotateModel(3300433): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3300433): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0210 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0211
     * @tc.name      ImageViewer_RotateModelCtor_0211
     * @tc.desc      new RotateModel(2897381) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0211 begin`);
      const subject: RotateModel = new RotateModel(2897381);
      logInfo(`new RotateModel(2897381): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2897381);
      logInfo(`new RotateModel(2897381): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2897381): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0211 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0212
     * @tc.name      ImageViewer_RotateModelCtor_0212
     * @tc.desc      new RotateModel(6763213) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0212 begin`);
      const subject: RotateModel = new RotateModel(6763213);
      logInfo(`new RotateModel(6763213): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6763213);
      logInfo(`new RotateModel(6763213): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6763213): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0212 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0213
     * @tc.name      ImageViewer_RotateModelCtor_0213
     * @tc.desc      new RotateModel(6249463) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0213 begin`);
      const subject: RotateModel = new RotateModel(6249463);
      logInfo(`new RotateModel(6249463): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6249463);
      logInfo(`new RotateModel(6249463): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6249463): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0213 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0214
     * @tc.name      ImageViewer_RotateModelCtor_0214
     * @tc.desc      new RotateModel(-2141156) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0214 begin`);
      const subject: RotateModel = new RotateModel(-2141156);
      logInfo(`new RotateModel(-2141156): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2141156);
      logInfo(`new RotateModel(-2141156): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2141156): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0214 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0215
     * @tc.name      ImageViewer_RotateModelCtor_0215
     * @tc.desc      new RotateModel(2535630.08) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0215 begin`);
      const subject: RotateModel = new RotateModel(2535630.08);
      logInfo(`new RotateModel(2535630.08): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2535630.08, PRECISION);
      logInfo(`new RotateModel(2535630.08): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2535630.08): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0215 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0216
     * @tc.name      ImageViewer_RotateModelCtor_0216
     * @tc.desc      new RotateModel(3367241.41) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0216 begin`);
      const subject: RotateModel = new RotateModel(3367241.41);
      logInfo(`new RotateModel(3367241.41): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3367241.41, PRECISION);
      logInfo(`new RotateModel(3367241.41): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3367241.41): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0216 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0217
     * @tc.name      ImageViewer_RotateModelCtor_0217
     * @tc.desc      new RotateModel(565880) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0217 begin`);
      const subject: RotateModel = new RotateModel(565880);
      logInfo(`new RotateModel(565880): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(565880);
      logInfo(`new RotateModel(565880): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(565880): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0217 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0218
     * @tc.name      ImageViewer_RotateModelCtor_0218
     * @tc.desc      new RotateModel(2207802) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0218 begin`);
      const subject: RotateModel = new RotateModel(2207802);
      logInfo(`new RotateModel(2207802): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2207802);
      logInfo(`new RotateModel(2207802): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2207802): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0218 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0219
     * @tc.name      ImageViewer_RotateModelCtor_0219
     * @tc.desc      new RotateModel(711586.59) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0219 begin`);
      const subject: RotateModel = new RotateModel(711586.59);
      logInfo(`new RotateModel(711586.59): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(711586.59, PRECISION);
      logInfo(`new RotateModel(711586.59): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(711586.59): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0219 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0220
     * @tc.name      ImageViewer_RotateModelCtor_0220
     * @tc.desc      new RotateModel(6402488) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0220 begin`);
      const subject: RotateModel = new RotateModel(6402488);
      logInfo(`new RotateModel(6402488): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6402488);
      logInfo(`new RotateModel(6402488): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6402488): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0220 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0221
     * @tc.name      ImageViewer_RotateModelCtor_0221
     * @tc.desc      new RotateModel(3362355.34) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0221 begin`);
      const subject: RotateModel = new RotateModel(3362355.34);
      logInfo(`new RotateModel(3362355.34): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3362355.34, PRECISION);
      logInfo(`new RotateModel(3362355.34): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3362355.34): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0221 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0222
     * @tc.name      ImageViewer_RotateModelCtor_0222
     * @tc.desc      new RotateModel(2718566.79) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0222 begin`);
      const subject: RotateModel = new RotateModel(2718566.79);
      logInfo(`new RotateModel(2718566.79): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2718566.79, PRECISION);
      logInfo(`new RotateModel(2718566.79): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2718566.79): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0222 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0223
     * @tc.name      ImageViewer_RotateModelCtor_0223
     * @tc.desc      new RotateModel(6796006) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0223 begin`);
      const subject: RotateModel = new RotateModel(6796006);
      logInfo(`new RotateModel(6796006): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6796006);
      logInfo(`new RotateModel(6796006): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6796006): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0223 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0224
     * @tc.name      ImageViewer_RotateModelCtor_0224
     * @tc.desc      new RotateModel(-2941150) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0224 begin`);
      const subject: RotateModel = new RotateModel(-2941150);
      logInfo(`new RotateModel(-2941150): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2941150);
      logInfo(`new RotateModel(-2941150): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2941150): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0224 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0225
     * @tc.name      ImageViewer_RotateModelCtor_0225
     * @tc.desc      new RotateModel(4147612) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0225 begin`);
      const subject: RotateModel = new RotateModel(4147612);
      logInfo(`new RotateModel(4147612): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4147612);
      logInfo(`new RotateModel(4147612): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4147612): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0225 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0226
     * @tc.name      ImageViewer_RotateModelCtor_0226
     * @tc.desc      new RotateModel(-982002) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0226 begin`);
      const subject: RotateModel = new RotateModel(-982002);
      logInfo(`new RotateModel(-982002): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-982002);
      logInfo(`new RotateModel(-982002): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-982002): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0226 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0227
     * @tc.name      ImageViewer_RotateModelCtor_0227
     * @tc.desc      new RotateModel(-1863580) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0227 begin`);
      const subject: RotateModel = new RotateModel(-1863580);
      logInfo(`new RotateModel(-1863580): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1863580);
      logInfo(`new RotateModel(-1863580): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1863580): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0227 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0228
     * @tc.name      ImageViewer_RotateModelCtor_0228
     * @tc.desc      new RotateModel(2699027.37) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0228 begin`);
      const subject: RotateModel = new RotateModel(2699027.37);
      logInfo(`new RotateModel(2699027.37): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2699027.37, PRECISION);
      logInfo(`new RotateModel(2699027.37): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2699027.37): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0228 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0229
     * @tc.name      ImageViewer_RotateModelCtor_0229
     * @tc.desc      new RotateModel(4198928) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0229 begin`);
      const subject: RotateModel = new RotateModel(4198928);
      logInfo(`new RotateModel(4198928): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4198928);
      logInfo(`new RotateModel(4198928): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4198928): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0229 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0230
     * @tc.name      ImageViewer_RotateModelCtor_0230
     * @tc.desc      new RotateModel(5638732) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0230 begin`);
      const subject: RotateModel = new RotateModel(5638732);
      logInfo(`new RotateModel(5638732): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5638732);
      logInfo(`new RotateModel(5638732): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5638732): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0230 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0231
     * @tc.name      ImageViewer_RotateModelCtor_0231
     * @tc.desc      new RotateModel(-2976289) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0231 begin`);
      const subject: RotateModel = new RotateModel(-2976289);
      logInfo(`new RotateModel(-2976289): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2976289);
      logInfo(`new RotateModel(-2976289): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2976289): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0231 end`);
    });
  });
}
