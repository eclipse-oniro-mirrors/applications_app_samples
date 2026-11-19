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
import { ScaleModel } from '../../../main/ets/model/ScaleModel';

const DOMAIN: number = 0xF814;
const TAG: string = 'ScaleModelDataTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function scaleModelDataTest(): void {
  describe('ScaleModelDataTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0301
     * @tc.name      testScaleModel0301
     * @tc.desc      Checks default constructor starts scale at one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0301 begin');
      const model: ScaleModel = new ScaleModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=1.0`);
      expect(model.scaleValue).assertEqual(1.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.scaleValue=${typeof model.scaleValue}`);
      expect(typeof model.scaleValue).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger model.scaleValue=${model.scaleValue}, expected=0`);
      expect(model.scaleValue).assertLarger(0);
      log('testScaleModel0301 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0302
     * @tc.name      testScaleModel0302
     * @tc.desc      Checks default constructor starts last value at one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0302 begin');
      const model: ScaleModel = new ScaleModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=1.0`);
      expect(model.lastValue).assertEqual(1.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}`);
      expect(model.lastValue).assertEqual(model.scaleValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.lastValue=${typeof model.lastValue}`);
      expect(typeof model.lastValue).assertEqual('number');
      log('testScaleModel0302 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0303
     * @tc.name      testScaleModel0303
     * @tc.desc      Checks default max scale value is 1.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0303 begin');
      const model: ScaleModel = new ScaleModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.maxScaleValue=${model.maxScaleValue}, expected=1.5`);
      expect(model.maxScaleValue).assertEqual(1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger model.maxScaleValue=${model.maxScaleValue}`);
      expect(model.maxScaleValue).assertLarger(model.scaleValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.maxScaleValue > 1=${model.maxScaleValue > 1}`);
      expect(model.maxScaleValue > 1).assertTrue();
      log('testScaleModel0303 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0304
     * @tc.name      testScaleModel0304
     * @tc.desc      Checks default extra scale value is 0.2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0304 begin');
      const model: ScaleModel = new ScaleModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.extraScaleValue=${model.extraScaleValue}, expected=0.2`);
      expect(model.extraScaleValue).assertEqual(0.2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger model.extraScaleValue=${model.extraScaleValue}, expected=0`);
      expect(model.extraScaleValue).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.extraScaleValue < 1=${model.extraScaleValue < 1}`);
      expect(model.extraScaleValue < 1).assertTrue();
      log('testScaleModel0304 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0305
     * @tc.name      testScaleModel0305
     * @tc.desc      Checks the default scale constant is exactly one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0305 begin');
      const model: ScaleModel = new ScaleModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.defaultScaleValue=${model.defaultScaleValue}`);
      expect(model.defaultScaleValue).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.defaultScaleValue=${model.defaultScaleValue}`);
      expect(model.defaultScaleValue).assertEqual(model.scaleValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof model.defaultScaleValue}, expected='number'`);
      expect(typeof model.defaultScaleValue).assertEqual('number');
      log('testScaleModel0305 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0306
     * @tc.name      testScaleModel0306
     * @tc.desc      Checks constructor stores all four custom scale fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0306 begin');
      const model: ScaleModel = new ScaleModel(2.0, 1.8, 3.0, 0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=2.0`);
      expect(model.scaleValue).assertEqual(2.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=1.8`);
      expect(model.lastValue).assertEqual(1.8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.maxScaleValue=${model.maxScaleValue}, expected=3.0`);
      expect(model.maxScaleValue).assertEqual(3.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.extraScaleValue=${model.extraScaleValue}, expected=0.5`);
      expect(model.extraScaleValue).assertEqual(0.5);
      log('testScaleModel0306 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0307
     * @tc.name      testScaleModel0307
     * @tc.desc      Checks single-argument constructor keeps remaining defaults.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0307 begin');
      const model: ScaleModel = new ScaleModel(2.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=2.0`);
      expect(model.scaleValue).assertEqual(2.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=1.0`);
      expect(model.lastValue).assertEqual(1.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.maxScaleValue=${model.maxScaleValue}, expected=1.5`);
      expect(model.maxScaleValue).assertEqual(1.5);
      log('testScaleModel0307 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0308
     * @tc.name      testScaleModel0308
     * @tc.desc      Checks two-argument constructor keeps max and extra defaults.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0308 begin');
      const model: ScaleModel = new ScaleModel(2.0, 1.8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=2.0`);
      expect(model.scaleValue).assertEqual(2.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=1.8`);
      expect(model.lastValue).assertEqual(1.8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.maxScaleValue=${model.maxScaleValue}, expected=1.5`);
      expect(model.maxScaleValue).assertEqual(1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.extraScaleValue=${model.extraScaleValue}, expected=0.2`);
      expect(model.extraScaleValue).assertEqual(0.2);
      log('testScaleModel0308 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0309
     * @tc.name      testScaleModel0309
     * @tc.desc      Checks three-argument constructor keeps extra default.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0309 begin');
      const model: ScaleModel = new ScaleModel(2.0, 1.8, 3.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.maxScaleValue=${model.maxScaleValue}, expected=3.0`);
      expect(model.maxScaleValue).assertEqual(3.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.extraScaleValue=${model.extraScaleValue}, expected=0.2`);
      expect(model.extraScaleValue).assertEqual(0.2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=2.0`);
      expect(model.scaleValue).assertEqual(2.0);
      log('testScaleModel0309 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0310
     * @tc.name      testScaleModel0310
     * @tc.desc      Checks stash copies scale value into last value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0310 begin');
      const model: ScaleModel = new ScaleModel(1.8, 1.0);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=1.8`);
      expect(model.lastValue).assertEqual(1.8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}`);
      expect(model.lastValue).assertEqual(model.scaleValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=1.8`);
      expect(model.scaleValue).assertEqual(1.8);
      log('testScaleModel0310 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0311
     * @tc.name      testScaleModel0311
     * @tc.desc      Checks repeated stash overwrites the previous last value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0311 begin');
      const model: ScaleModel = new ScaleModel(1.8, 1.0);
      model.stash();
      model.scaleValue = 2.2;
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=2.2`);
      expect(model.lastValue).assertEqual(2.2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.lastValue !== 1.8=${model.lastValue !== 1.8}`);
      expect(model.lastValue !== 1.8).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=2.2`);
      expect(model.scaleValue).assertEqual(2.2);
      log('testScaleModel0311 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0312
     * @tc.name      testScaleModel0312
     * @tc.desc      Checks editing scale after stash keeps last stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0312 begin');
      const model: ScaleModel = new ScaleModel(1.8, 1.0);
      model.stash();
      model.scaleValue = 0.4;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=1.8`);
      expect(model.lastValue).assertEqual(1.8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=0.4`);
      expect(model.scaleValue).assertEqual(0.4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.lastValue !== model.scaleValue}`);
      expect(model.lastValue !== model.scaleValue).assertTrue();
      log('testScaleModel0312 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0313
     * @tc.name      testScaleModel0313
     * @tc.desc      Checks reset restores scale to the default one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0313 begin');
      const model: ScaleModel = new ScaleModel(2.5, 2.0);
      model.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=1`);
      expect(model.scaleValue).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}`);
      expect(model.scaleValue).assertEqual(model.defaultScaleValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess model.scaleValue=${model.scaleValue}, expected=2.5`);
      expect(model.scaleValue).assertLess(2.5);
      log('testScaleModel0313 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0314
     * @tc.name      testScaleModel0314
     * @tc.desc      Checks reset restores last value to the default one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0314 begin');
      const model: ScaleModel = new ScaleModel(2.5, 2.0);
      model.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=1`);
      expect(model.lastValue).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}`);
      expect(model.lastValue).assertEqual(model.scaleValue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess model.lastValue=${model.lastValue}, expected=2.0`);
      expect(model.lastValue).assertLess(2.0);
      log('testScaleModel0314 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0315
     * @tc.name      testScaleModel0315
     * @tc.desc      Checks reset keeps max and extra scale untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0315 begin');
      const model: ScaleModel = new ScaleModel(2.5, 2.0, 3.5, 0.7);
      model.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.maxScaleValue=${model.maxScaleValue}, expected=3.5`);
      expect(model.maxScaleValue).assertEqual(3.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.extraScaleValue=${model.extraScaleValue}, expected=0.7`);
      expect(model.extraScaleValue).assertEqual(0.7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=1`);
      expect(model.scaleValue).assertEqual(1);
      log('testScaleModel0315 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0316
     * @tc.name      testScaleModel0316
     * @tc.desc      Checks stash after reset records the default scale.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0316 begin');
      const model: ScaleModel = new ScaleModel(2.5, 2.0);
      model.reset();
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=1`);
      expect(model.lastValue).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=1`);
      expect(model.scaleValue).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.lastValue === model.scaleValue}`);
      expect(model.lastValue === model.scaleValue).assertTrue();
      log('testScaleModel0316 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0317
     * @tc.name      testScaleModel0317
     * @tc.desc      Checks toString matches the documented default format.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0317 begin');
      const model: ScaleModel = new ScaleModel();
      const text: string = model.toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='[scaleValue: 1 lastValue: 1]'`);
      expect(text).assertEqual('[scaleValue: 1 lastValue: 1]');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.length=${text.length}, expected=0`);
      expect(text.length).assertLarger(0);
      log('testScaleModel0317 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0318
     * @tc.name      testScaleModel0318
     * @tc.desc      Checks toString renders custom scale and last values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0318 begin');
      const model: ScaleModel = new ScaleModel(2.5, 1.25);
      const text: string = model.toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='[scaleValue: 2.5 lastValue...`);
      expect(text).assertEqual('[scaleValue: 2.5 lastValue: 1.25]');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue text.includes('2.5')=${text.includes('2.5')}`);
      expect(text.includes('2.5')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue text.includes('1.25')=${text.includes('1.25')}`);
      expect(text.includes('1.25')).assertTrue();
      log('testScaleModel0318 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0319
     * @tc.name      testScaleModel0319
     * @tc.desc      Checks toString reflects a stashed scale value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0319 begin');
      const model: ScaleModel = new ScaleModel(1.6, 1.0);
      model.stash();
      const text: string = model.toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='[scaleValue: 1.6 lastValue...`);
      expect(text).assertEqual('[scaleValue: 1.6 lastValue: 1.6]');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text !== '[scaleValue: 1.6 lastValue: 1]'}`);
      expect(text !== '[scaleValue: 1.6 lastValue: 1]').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=1.6`);
      expect(model.lastValue).assertEqual(1.6);
      log('testScaleModel0319 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0320
     * @tc.name      testScaleModel0320
     * @tc.desc      Checks constructor accepts a fractional scale below one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0320 begin');
      const model: ScaleModel = new ScaleModel(0.5, 0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.scaleValue=${model.scaleValue}, expected=0.5`);
      expect(model.scaleValue).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastValue=${model.lastValue}, expected=0.5`);
      expect(model.lastValue).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess model.scaleValue=${model.scaleValue}, expected=1`);
      expect(model.scaleValue).assertLess(1);
      log('testScaleModel0320 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0321
     * @tc.name      testScaleModel0321
     * @tc.desc      Checks a custom large max scale value is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0321 begin');
      const model: ScaleModel = new ScaleModel(1.0, 1.0, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.maxScaleValue=${model.maxScaleValue}, expected=10`);
      expect(model.maxScaleValue).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger model.maxScaleValue=${model.maxScaleValue}, expected=5`);
      expect(model.maxScaleValue).assertLarger(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.scaleValue < model.maxScaleValue}`);
      expect(model.scaleValue < model.maxScaleValue).assertTrue();
      log('testScaleModel0321 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_SCALEMODEL_0322
     * @tc.name      testScaleModel0322
     * @tc.desc      Checks two instances keep independent scale state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testScaleModel0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testScaleModel0322 begin');
      const first: ScaleModel = new ScaleModel(2.0, 1.0);
      const second: ScaleModel = new ScaleModel();
      first.stash();
      second.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.lastValue=${first.lastValue}, expected=2.0`);
      expect(first.lastValue).assertEqual(2.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.scaleValue=${second.scaleValue}, expected=1`);
      expect(second.scaleValue).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.lastValue=${second.lastValue}, expected=1`);
      expect(second.lastValue).assertEqual(1);
      log('testScaleModel0322 end');
    })
  })
}
