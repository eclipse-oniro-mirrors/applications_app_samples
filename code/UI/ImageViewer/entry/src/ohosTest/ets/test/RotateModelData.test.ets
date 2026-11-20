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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RotateModel } from '../../../main/ets/model/RotateModel';

const DOMAIN: number = 0xF814;
const TAG: string = 'RotateModelDataTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function rotateModelDataTest(): void {
  describe('RotateModelDataTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0201
     * @tc.name      testRotateModel0201
     * @tc.desc      Checks default constructor produces zero current rotation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0201 begin');
      const model: RotateModel = new RotateModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=0`);
      expect(model.currentRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.currentRotate=${typeof model.currentRotate}`);
      expect(typeof model.currentRotate).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.currentRotate >= 0=${model.currentRotate >= 0}`);
      expect(model.currentRotate >= 0).assertTrue();
      log('testRotateModel0201 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0202
     * @tc.name      testRotateModel0202
     * @tc.desc      Checks default constructor produces zero last rotation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0202 begin');
      const model: RotateModel = new RotateModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.lastRotate=${typeof model.lastRotate}`);
      expect(typeof model.lastRotate).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}`);
      expect(model.lastRotate).assertEqual(model.currentRotate);
      log('testRotateModel0202 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0203
     * @tc.name      testRotateModel0203
     * @tc.desc      Checks default start angle threshold is 20 degrees.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0203 begin');
      const model: RotateModel = new RotateModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.startAngle=${model.startAngle}, expected=20`);
      expect(model.startAngle).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger model.startAngle=${model.startAngle}, expected=0`);
      expect(model.startAngle).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.startAngle < 90=${model.startAngle < 90}`);
      expect(model.startAngle < 90).assertTrue();
      log('testRotateModel0203 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0204
     * @tc.name      testRotateModel0204
     * @tc.desc      Checks constructor stores a custom rotation angle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0204 begin');
      const model: RotateModel = new RotateModel(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=90`);
      expect(model.currentRotate).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.startAngle=${model.startAngle}, expected=20`);
      expect(model.startAngle).assertEqual(20);
      log('testRotateModel0204 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0205
     * @tc.name      testRotateModel0205
     * @tc.desc      Checks constructor keeps last rotation untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0205 begin');
      const model: RotateModel = new RotateModel(135);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=135`);
      expect(model.currentRotate).assertEqual(135);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.currentRotate !== model.lastRotate}`);
      expect(model.currentRotate !== model.lastRotate).assertTrue();
      log('testRotateModel0205 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0206
     * @tc.name      testRotateModel0206
     * @tc.desc      Checks constructor accepts a negative rotation angle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0206 begin');
      const model: RotateModel = new RotateModel(-45);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=-45`);
      expect(model.currentRotate).assertEqual(-45);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess model.currentRotate=${model.currentRotate}, expected=0`);
      expect(model.currentRotate).assertLess(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      log('testRotateModel0206 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0207
     * @tc.name      testRotateModel0207
     * @tc.desc      Checks stash stores a 90 degree rotation as last value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0207 begin');
      const model: RotateModel = new RotateModel(90);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=90`);
      expect(model.lastRotate).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=90`);
      expect(model.currentRotate).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}`);
      expect(model.lastRotate).assertEqual(model.currentRotate);
      log('testRotateModel0207 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0208
     * @tc.name      testRotateModel0208
     * @tc.desc      Checks stash normalizes 450 degrees to 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0208 begin');
      const model: RotateModel = new RotateModel(450);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=90`);
      expect(model.lastRotate).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=450`);
      expect(model.currentRotate).assertEqual(450);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.lastRotate < model.currentRotate}`);
      expect(model.lastRotate < model.currentRotate).assertTrue();
      log('testRotateModel0208 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0209
     * @tc.name      testRotateModel0209
     * @tc.desc      Checks stash preserves the sign of a negative angle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0209 begin');
      const model: RotateModel = new RotateModel(-90);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=-90`);
      expect(model.lastRotate).assertEqual(-90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertLess(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}`);
      expect(model.lastRotate).assertEqual(model.currentRotate);
      log('testRotateModel0209 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0210
     * @tc.name      testRotateModel0210
     * @tc.desc      Checks stash normalizes a full 720 degree turn to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0210 begin');
      const model: RotateModel = new RotateModel(720);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=720`);
      expect(model.currentRotate).assertEqual(720);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.lastRotate !== model.currentRotate}`);
      expect(model.lastRotate !== model.currentRotate).assertTrue();
      log('testRotateModel0210 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0211
     * @tc.name      testRotateModel0211
     * @tc.desc      Checks stash keeps a zero rotation at zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0211 begin');
      const model: RotateModel = new RotateModel(0);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=0`);
      expect(model.currentRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.lastRotate === model.currentRotate}`);
      expect(model.lastRotate === model.currentRotate).assertTrue();
      log('testRotateModel0211 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0212
     * @tc.name      testRotateModel0212
     * @tc.desc      Checks stash keeps 359 degrees unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0212 begin');
      const model: RotateModel = new RotateModel(359);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=359`);
      expect(model.lastRotate).assertEqual(359);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.lastRotate < 360=${model.lastRotate < 360}`);
      expect(model.lastRotate < 360).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger model.lastRotate=${model.lastRotate}, expected=270`);
      expect(model.lastRotate).assertLarger(270);
      log('testRotateModel0212 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0213
     * @tc.name      testRotateModel0213
     * @tc.desc      Checks stash normalizes 361 degrees to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0213 begin');
      const model: RotateModel = new RotateModel(361);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=1`);
      expect(model.lastRotate).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=361`);
      expect(model.currentRotate).assertEqual(361);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess model.lastRotate=${model.lastRotate}, expected=90`);
      expect(model.lastRotate).assertLess(90);
      log('testRotateModel0213 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0214
     * @tc.name      testRotateModel0214
     * @tc.desc      Checks stash leaves the current rotation unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0214 begin');
      const model: RotateModel = new RotateModel(123);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=123`);
      expect(model.currentRotate).assertEqual(123);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=123`);
      expect(model.lastRotate).assertEqual(123);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.startAngle=${model.startAngle}, expected=20`);
      expect(model.startAngle).assertEqual(20);
      log('testRotateModel0214 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0215
     * @tc.name      testRotateModel0215
     * @tc.desc      Checks reset zeroes both current and last rotations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0215 begin');
      const model: RotateModel = new RotateModel(200);
      model.stash();
      model.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=0`);
      expect(model.currentRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.currentRotate === model.lastRotate}`);
      expect(model.currentRotate === model.lastRotate).assertTrue();
      log('testRotateModel0215 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0216
     * @tc.name      testRotateModel0216
     * @tc.desc      Checks reset keeps the start angle threshold.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0216 begin');
      const model: RotateModel = new RotateModel(200);
      model.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.startAngle=${model.startAngle}, expected=20`);
      expect(model.startAngle).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=0`);
      expect(model.currentRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      log('testRotateModel0216 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0217
     * @tc.name      testRotateModel0217
     * @tc.desc      Checks stash after reset records a fresh zero last value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0217 begin');
      const model: RotateModel = new RotateModel(180);
      model.reset();
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=0`);
      expect(model.currentRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.lastRotate === model.currentRotate}`);
      expect(model.lastRotate === model.currentRotate).assertTrue();
      log('testRotateModel0217 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0218
     * @tc.name      testRotateModel0218
     * @tc.desc      Checks repeated stash normalizes the newest angle only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0218 begin');
      const model: RotateModel = new RotateModel(300);
      model.stash();
      model.currentRotate = 400;
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=40`);
      expect(model.lastRotate).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.lastRotate !== 300=${model.lastRotate !== 300}`);
      expect(model.lastRotate !== 300).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=400`);
      expect(model.currentRotate).assertEqual(400);
      log('testRotateModel0218 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0219
     * @tc.name      testRotateModel0219
     * @tc.desc      Checks stash normalizes -450 degrees to -90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0219 begin');
      const model: RotateModel = new RotateModel(-450);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=-90`);
      expect(model.lastRotate).assertEqual(-90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertLess(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=-450`);
      expect(model.currentRotate).assertEqual(-450);
      log('testRotateModel0219 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0220
     * @tc.name      testRotateModel0220
     * @tc.desc      Checks stash normalizes 1080 degrees to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0220 begin');
      const model: RotateModel = new RotateModel(1080);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=1080`);
      expect(model.currentRotate).assertEqual(1080);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.lastRotate < model.currentRotate}`);
      expect(model.lastRotate < model.currentRotate).assertTrue();
      log('testRotateModel0220 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATEMODEL_0221
     * @tc.name      testRotateModel0221
     * @tc.desc      Checks stash normalizes 1081 degrees to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRotateModel0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRotateModel0221 begin');
      const model: RotateModel = new RotateModel(1081);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastRotate=${model.lastRotate}, expected=1`);
      expect(model.lastRotate).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger model.lastRotate=${model.lastRotate}, expected=0`);
      expect(model.lastRotate).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentRotate=${model.currentRotate}, expected=1081`);
      expect(model.currentRotate).assertEqual(1081);
      log('testRotateModel0221 end');
    })
  })
}
