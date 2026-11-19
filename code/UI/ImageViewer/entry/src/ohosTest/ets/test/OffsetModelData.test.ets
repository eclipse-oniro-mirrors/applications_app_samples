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
import { OffsetModel } from '../../../main/ets/model/OffsetModel';

const DOMAIN: number = 0xF814;
const TAG: string = 'OffsetModelDataTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function offsetModelDataTest(): void {
  describe('OffsetModelDataTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0101
     * @tc.name      testOffsetModel0101
     * @tc.desc      Checks default constructor produces zero current offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0101 begin');
      const model: OffsetModel = new OffsetModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=0`);
      expect(model.currentX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentY=${model.currentY}, expected=0`);
      expect(model.currentY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.currentX=${typeof model.currentX}`);
      expect(typeof model.currentX).assertEqual('number');
      log('testOffsetModel0101 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0102
     * @tc.name      testOffsetModel0102
     * @tc.desc      Checks default constructor produces zero last offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0102 begin');
      const model: OffsetModel = new OffsetModel();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=0`);
      expect(model.lastX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastY=${model.lastY}, expected=0`);
      expect(model.lastY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.lastY=${typeof model.lastY}, expected='number'`);
      expect(typeof model.lastY).assertEqual('number');
      log('testOffsetModel0102 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0103
     * @tc.name      testOffsetModel0103
     * @tc.desc      Checks constructor stores custom current offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0103 begin');
      const model: OffsetModel = new OffsetModel(10, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=10`);
      expect(model.currentX).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentY=${model.currentY}, expected=20`);
      expect(model.currentY).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${model.currentX + model.currentY}, expected=30`);
      expect(model.currentX + model.currentY).assertEqual(30);
      log('testOffsetModel0103 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0104
     * @tc.name      testOffsetModel0104
     * @tc.desc      Checks custom constructor keeps last offsets at zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0104 begin');
      const model: OffsetModel = new OffsetModel(10, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=0`);
      expect(model.lastX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastY=${model.lastY}, expected=0`);
      expect(model.lastY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=10`);
      expect(model.currentX).assertEqual(10);
      log('testOffsetModel0104 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0105
     * @tc.name      testOffsetModel0105
     * @tc.desc      Checks constructor accepts negative offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0105 begin');
      const model: OffsetModel = new OffsetModel(-30, -40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=-30`);
      expect(model.currentX).assertEqual(-30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentY=${model.currentY}, expected=-40`);
      expect(model.currentY).assertEqual(-40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess model.currentX=${model.currentX}, expected=0`);
      expect(model.currentX).assertLess(0);
      log('testOffsetModel0105 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0106
     * @tc.name      testOffsetModel0106
     * @tc.desc      Checks single-argument constructor defaults currentY to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0106 begin');
      const model: OffsetModel = new OffsetModel(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=5`);
      expect(model.currentX).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentY=${model.currentY}, expected=0`);
      expect(model.currentY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=0`);
      expect(model.lastX).assertEqual(0);
      log('testOffsetModel0106 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0107
     * @tc.name      testOffsetModel0107
     * @tc.desc      Checks constructor keeps fractional offset values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0107 begin');
      const model: OffsetModel = new OffsetModel(1.5, 2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=1.5`);
      expect(model.currentX).assertEqual(1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentY=${model.currentY}, expected=2.5`);
      expect(model.currentY).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${model.currentX + model.currentY}, expected=4`);
      expect(model.currentX + model.currentY).assertEqual(4);
      log('testOffsetModel0107 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0108
     * @tc.name      testOffsetModel0108
     * @tc.desc      Checks stash copies both current offsets into last offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0108 begin');
      const model: OffsetModel = new OffsetModel(15, 7);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=15`);
      expect(model.lastX).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastY=${model.lastY}, expected=7`);
      expect(model.lastY).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=model.currentX`);
      expect(model.lastX).assertEqual(model.currentX);
      log('testOffsetModel0108 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0109
     * @tc.name      testOffsetModel0109
     * @tc.desc      Checks stash leaves current offsets unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0109 begin');
      const model: OffsetModel = new OffsetModel(15, 7);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=15`);
      expect(model.currentX).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentY=${model.currentY}, expected=7`);
      expect(model.currentY).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=model.lastX`);
      expect(model.currentX).assertEqual(model.lastX);
      log('testOffsetModel0109 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0110
     * @tc.name      testOffsetModel0110
     * @tc.desc      Checks stash handles differing X and Y values independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0110 begin');
      const model: OffsetModel = new OffsetModel(-8, 3);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=-8`);
      expect(model.lastX).assertEqual(-8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastY=${model.lastY}, expected=3`);
      expect(model.lastY).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.lastX !== model.lastY=${model.lastX !== model.lastY}`);
      expect(model.lastX !== model.lastY).assertTrue();
      log('testOffsetModel0110 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0111
     * @tc.name      testOffsetModel0111
     * @tc.desc      Checks repeated stash overwrites previous last offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0111 begin');
      const model: OffsetModel = new OffsetModel(15, 7);
      model.stash();
      model.currentX = 25;
      model.currentY = 9;
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=25`);
      expect(model.lastX).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastY=${model.lastY}, expected=9`);
      expect(model.lastY).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.lastX !== 15=${model.lastX !== 15}`);
      expect(model.lastX !== 15).assertTrue();
      log('testOffsetModel0111 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0112
     * @tc.name      testOffsetModel0112
     * @tc.desc      Checks editing current offsets after stash keeps last stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0112 begin');
      const model: OffsetModel = new OffsetModel(15, 7);
      model.stash();
      model.currentX = 99;
      model.currentY = -99;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=15`);
      expect(model.lastX).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastY=${model.lastY}, expected=7`);
      expect(model.lastY).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=99`);
      expect(model.currentX).assertEqual(99);
      log('testOffsetModel0112 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0113
     * @tc.name      testOffsetModel0113
     * @tc.desc      Checks reset zeroes current offsets from a dirty state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0113 begin');
      const model: OffsetModel = new OffsetModel(12, -34);
      model.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=0`);
      expect(model.currentX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentY=${model.currentY}, expected=0`);
      expect(model.currentY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.currentX === model.currentY}`);
      expect(model.currentX === model.currentY).assertTrue();
      log('testOffsetModel0113 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0114
     * @tc.name      testOffsetModel0114
     * @tc.desc      Checks reset zeroes last offsets after a stash.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0114 begin');
      const model: OffsetModel = new OffsetModel(12, -34);
      model.stash();
      model.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=0`);
      expect(model.lastX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastY=${model.lastY}, expected=0`);
      expect(model.lastY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=0`);
      expect(model.currentX).assertEqual(0);
      log('testOffsetModel0114 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0115
     * @tc.name      testOffsetModel0115
     * @tc.desc      Checks stash after reset restores zero last offsets only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0115 begin');
      const model: OffsetModel = new OffsetModel(50, 60);
      model.reset();
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=0`);
      expect(model.lastX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastY=${model.lastY}, expected=0`);
      expect(model.lastY).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.currentX=${model.currentX}, expected=0`);
      expect(model.currentX).assertEqual(0);
      log('testOffsetModel0115 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0116
     * @tc.name      testOffsetModel0116
     * @tc.desc      Checks toString default instance matches the documented format.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0116 begin');
      const model: OffsetModel = new OffsetModel();
      const text: string = model.toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='[currentX: 0 currentY: 0 l...`);
      expect(text).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.length=${text.length}, expected=0`);
      expect(text.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      log('testOffsetModel0116 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0117
     * @tc.name      testOffsetModel0117
     * @tc.desc      Checks toString renders every field with custom values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0117 begin');
      const model: OffsetModel = new OffsetModel(1, 2);
      model.lastX = 3;
      model.lastY = 4;
      const text: string = model.toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='[currentX: 1 currentY: 2 l...`);
      expect(text).assertEqual('[currentX: 1 currentY: 2 lastX: 3 lastY: 4]');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue text.includes('1')=${text.includes('1')}`);
      expect(text.includes('1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue text.includes('4')=${text.includes('4')}`);
      expect(text.includes('4')).assertTrue();
      log('testOffsetModel0117 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0118
     * @tc.name      testOffsetModel0118
     * @tc.desc      Checks toString reflects stashed offsets.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0118 begin');
      const model: OffsetModel = new OffsetModel(7, 8);
      model.stash();
      const text: string = model.toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='[currentX: 7 currentY: 8 l...`);
      expect(text).assertEqual('[currentX: 7 currentY: 8 lastX: 7 lastY: 8]');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue text !== '[currentX: 7 currentY: 8 lastX: 0 lastY: 0]'`);
      expect(text !== '[currentX: 7 currentY: 8 lastX: 0 lastY: 0]').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=7`);
      expect(model.lastX).assertEqual(7);
      log('testOffsetModel0118 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0119
     * @tc.name      testOffsetModel0119
     * @tc.desc      Checks two model instances keep independent state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0119 begin');
      const first: OffsetModel = new OffsetModel(11, 22);
      const second: OffsetModel = new OffsetModel(33, 44);
      first.stash();
      second.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.lastX=${first.lastX}, expected=11`);
      expect(first.lastX).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.currentX=${second.currentX}, expected=0`);
      expect(second.currentX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.currentY=${second.currentY}, expected=0`);
      expect(second.currentY).assertEqual(0);
      log('testOffsetModel0119 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSETMODEL_0120
     * @tc.name      testOffsetModel0120
     * @tc.desc      Checks stash round-trips large offset magnitudes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOffsetModel0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOffsetModel0120 begin');
      const model: OffsetModel = new OffsetModel(100000, -100000);
      model.stash();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastX=${model.lastX}, expected=100000`);
      expect(model.lastX).assertEqual(100000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.lastY=${model.lastY}, expected=-100000`);
      expect(model.lastY).assertEqual(-100000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Math.abs(model.lastX)=${Math.abs(model.lastX)}`);
      expect(Math.abs(model.lastX)).assertEqual(Math.abs(model.lastY));
      log('testOffsetModel0120 end');
    })
  })
}
