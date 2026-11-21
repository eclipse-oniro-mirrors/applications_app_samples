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

import { beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { resetYieldCounter, yieldToSystem } from './common/TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { changeShape, getShapeIndex } from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeShape03Test() {
  resetYieldCounter();
  describe('NativeVolumeShape03', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeShape0085
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0085
     * @tc.desc   changeShape 32 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0085 begin');
      changeShape(32);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(32));
      expect(result).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0085 end');
    })

    /**
     * @tc.name   testVolumeShape0086
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0086
     * @tc.desc   changeShape 33 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0086 begin');
      changeShape(33);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(33));
      expect(result).assertEqual(33);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0086 end');
    })

    /**
     * @tc.name   testVolumeShape0087
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0087
     * @tc.desc   changeShape 34 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0087 begin');
      changeShape(34);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(34));
      expect(result).assertEqual(34);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0087 end');
    })

    /**
     * @tc.name   testVolumeShape0088
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0088
     * @tc.desc   changeShape 35 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0088 begin');
      changeShape(35);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(35));
      expect(result).assertEqual(35);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0088 end');
    })

    /**
     * @tc.name   testVolumeShape0089
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0089
     * @tc.desc   changeShape 36 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0089 begin');
      changeShape(36);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(36));
      expect(result).assertEqual(36);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0089 end');
    })

    /**
     * @tc.name   testVolumeShape0090
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0090
     * @tc.desc   changeShape 37 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0090 begin');
      changeShape(37);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(37));
      expect(result).assertEqual(37);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0090 end');
    })

    /**
     * @tc.name   testVolumeShape0091
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0091
     * @tc.desc   changeShape 38 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0091 begin');
      changeShape(38);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(38));
      expect(result).assertEqual(38);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0091 end');
    })

    /**
     * @tc.name   testVolumeShape0092
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0092
     * @tc.desc   changeShape 39 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0092 begin');
      changeShape(39);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(39));
      expect(result).assertEqual(39);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0092 end');
    })

    /**
     * @tc.name   testVolumeShape0093
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0093
     * @tc.desc   changeShape 40 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0093 begin');
      changeShape(40);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(40));
      expect(result).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0093 end');
    })

    /**
     * @tc.name   testVolumeShape0094
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0094
     * @tc.desc   changeShape 41 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0094 begin');
      changeShape(41);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(41));
      expect(result).assertEqual(41);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0094 end');
    })

    /**
     * @tc.name   testVolumeShape0095
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0095
     * @tc.desc   changeShape 42 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0095 begin');
      changeShape(42);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(42));
      expect(result).assertEqual(42);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0095 end');
    })

    /**
     * @tc.name   testVolumeShape0096
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0096
     * @tc.desc   changeShape 43 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0096 begin');
      changeShape(43);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(43));
      expect(result).assertEqual(43);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0096 end');
    })

    /**
     * @tc.name   testVolumeShape0097
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0097
     * @tc.desc   changeShape 44 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0097 begin');
      changeShape(44);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(44));
      expect(result).assertEqual(44);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0097 end');
    })

    /**
     * @tc.name   testVolumeShape0098
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0098
     * @tc.desc   changeShape 45 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0098 begin');
      changeShape(45);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(45));
      expect(result).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0098 end');
    })

    /**
     * @tc.name   testVolumeShape0099
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0099
     * @tc.desc   changeShape 46 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0099 begin');
      changeShape(46);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(46));
      expect(result).assertEqual(46);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0099 end');
    })

    /**
     * @tc.name   testVolumeShape0100
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0100
     * @tc.desc   changeShape 47 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0100 begin');
      changeShape(47);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(47));
      expect(result).assertEqual(47);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0100 end');
    })

    /**
     * @tc.name   testVolumeShape0101
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0101
     * @tc.desc   changeShape 48 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0101 begin');
      changeShape(48);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(48));
      expect(result).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0101 end');
    })

    /**
     * @tc.name   testVolumeShape0102
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0102
     * @tc.desc   changeShape 49 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0102 begin');
      changeShape(49);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(49));
      expect(result).assertEqual(49);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0102 end');
    })

    /**
     * @tc.name   testVolumeShape0103
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0103
     * @tc.desc   changeShape 50 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0103 begin');
      changeShape(50);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(50));
      expect(result).assertEqual(50);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0103 end');
    })

    /**
     * @tc.name   testVolumeShape0104
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0104
     * @tc.desc   changeShape 51 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0104 begin');
      changeShape(51);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(51));
      expect(result).assertEqual(51);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0104 end');
    })

    /**
     * @tc.name   testVolumeShape0105
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0105
     * @tc.desc   changeShape 52 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0105 begin');
      changeShape(52);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(52));
      expect(result).assertEqual(52);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0105 end');
    })

    /**
     * @tc.name   testVolumeShape0106
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0106
     * @tc.desc   changeShape 53 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0106 begin');
      changeShape(53);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(53));
      expect(result).assertEqual(53);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0106 end');
    })

    /**
     * @tc.name   testVolumeShape0107
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0107
     * @tc.desc   changeShape 54 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0107 begin');
      changeShape(54);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(54));
      expect(result).assertEqual(54);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0107 end');
    })

    /**
     * @tc.name   testVolumeShape0108
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0108
     * @tc.desc   changeShape 55 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0108 begin');
      changeShape(55);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(55));
      expect(result).assertEqual(55);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0108 end');
    })

    /**
     * @tc.name   testVolumeShape0109
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0109
     * @tc.desc   changeShape 56 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0109 begin');
      changeShape(56);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(56));
      expect(result).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0109 end');
    })

    /**
     * @tc.name   testVolumeShape0110
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0110
     * @tc.desc   changeShape 57 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0110 begin');
      changeShape(57);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(57));
      expect(result).assertEqual(57);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0110 end');
    })

    /**
     * @tc.name   testVolumeShape0111
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0111
     * @tc.desc   changeShape 58 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0111 begin');
      changeShape(58);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(58));
      expect(result).assertEqual(58);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0111 end');
    })

    /**
     * @tc.name   testVolumeShape0112
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0112
     * @tc.desc   changeShape 59 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0112 begin');
      changeShape(59);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(59));
      expect(result).assertEqual(59);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0112 end');
    })

    /**
     * @tc.name   testVolumeShape0113
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0113
     * @tc.desc   changeShape 60 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0113 begin');
      changeShape(60);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(60));
      expect(result).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0113 end');
    })

    /**
     * @tc.name   testVolumeShape0114
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0114
     * @tc.desc   changeShape 61 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0114 begin');
      changeShape(61);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(61));
      expect(result).assertEqual(61);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0114 end');
    })

    /**
     * @tc.name   testVolumeShape0115
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0115
     * @tc.desc   changeShape 62 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0115 begin');
      changeShape(62);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(62));
      expect(result).assertEqual(62);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0115 end');
    })

    /**
     * @tc.name   testVolumeShape0116
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0116
     * @tc.desc   changeShape 65 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0116 begin');
      changeShape(65);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65));
      expect(result).assertEqual(65);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0116 end');
    })

    /**
     * @tc.name   testVolumeShape0117
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0117
     * @tc.desc   changeShape 66 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0117 begin');
      changeShape(66);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(66));
      expect(result).assertEqual(66);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0117 end');
    })

    /**
     * @tc.name   testVolumeShape0118
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0118
     * @tc.desc   changeShape 67 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0118 begin');
      changeShape(67);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(67));
      expect(result).assertEqual(67);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0118 end');
    })

    /**
     * @tc.name   testVolumeShape0119
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0119
     * @tc.desc   changeShape 68 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0119 begin');
      changeShape(68);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(68));
      expect(result).assertEqual(68);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0119 end');
    })

    /**
     * @tc.name   testVolumeShape0120
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0120
     * @tc.desc   changeShape 69 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0120 begin');
      changeShape(69);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(69));
      expect(result).assertEqual(69);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0120 end');
    })

    /**
     * @tc.name   testVolumeShape0121
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0121
     * @tc.desc   changeShape 70 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0121 begin');
      changeShape(70);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(70));
      expect(result).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0121 end');
    })

    /**
     * @tc.name   testVolumeShape0122
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0122
     * @tc.desc   changeShape 71 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0122 begin');
      changeShape(71);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(71));
      expect(result).assertEqual(71);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0122 end');
    })

    /**
     * @tc.name   testVolumeShape0123
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0123
     * @tc.desc   changeShape 72 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0123 begin');
      changeShape(72);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(72));
      expect(result).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0123 end');
    })

    /**
     * @tc.name   testVolumeShape0124
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0124
     * @tc.desc   changeShape 73 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0124 begin');
      changeShape(73);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(73));
      expect(result).assertEqual(73);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0124 end');
    })

    /**
     * @tc.name   testVolumeShape0125
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0125
     * @tc.desc   changeShape 74 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0125 begin');
      changeShape(74);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(74));
      expect(result).assertEqual(74);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0125 end');
    })

    /**
     * @tc.name   testVolumeShape0126
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0126
     * @tc.desc   changeShape 75 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0126 begin');
      changeShape(75);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(75));
      expect(result).assertEqual(75);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0126 end');
    })

    /**
     * @tc.name   testVolumeShape0127
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0127
     * @tc.desc   changeShape 76 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0127 begin');
      changeShape(76);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(76));
      expect(result).assertEqual(76);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0127 end');
    })

    /**
     * @tc.name   testVolumeShape0128
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0128
     * @tc.desc   changeShape 77 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0128 begin');
      changeShape(77);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(77));
      expect(result).assertEqual(77);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0128 end');
    })

    /**
     * @tc.name   testVolumeShape0129
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0129
     * @tc.desc   changeShape 78 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0129 begin');
      changeShape(78);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(78));
      expect(result).assertEqual(78);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0129 end');
    })

    /**
     * @tc.name   testVolumeShape0130
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0130
     * @tc.desc   changeShape 79 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0130 begin');
      changeShape(79);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(79));
      expect(result).assertEqual(79);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0130 end');
    })

    /**
     * @tc.name   testVolumeShape0131
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0131
     * @tc.desc   changeShape 80 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0131 begin');
      changeShape(80);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(80));
      expect(result).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0131 end');
    })

    /**
     * @tc.name   testVolumeShape0132
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0132
     * @tc.desc   the new index segment bounds 32 and 62 both round-trip through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0132 begin');
      changeShape(32);
      const start: number = getShapeIndex();
      expect(start).assertEqual(32);
      changeShape(62);
      const end: number = getShapeIndex();
      expect(end).assertEqual(62);
      expect(end - start).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0132 end');
    })

  })
}
