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

export default function nativeVolumeShape04Test() {
  resetYieldCounter();
  describe('NativeVolumeShape04', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeShape0133
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0133
     * @tc.desc   changeShape 81 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0133 begin');
      changeShape(81);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(81));
      expect(result).assertEqual(81);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0133 end');
    })

    /**
     * @tc.name   testVolumeShape0134
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0134
     * @tc.desc   changeShape 82 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0134 begin');
      changeShape(82);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(82));
      expect(result).assertEqual(82);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0134 end');
    })

    /**
     * @tc.name   testVolumeShape0135
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0135
     * @tc.desc   changeShape 83 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0135 begin');
      changeShape(83);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(83));
      expect(result).assertEqual(83);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0135 end');
    })

    /**
     * @tc.name   testVolumeShape0136
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0136
     * @tc.desc   changeShape 84 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0136 begin');
      changeShape(84);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(84));
      expect(result).assertEqual(84);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0136 end');
    })

    /**
     * @tc.name   testVolumeShape0137
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0137
     * @tc.desc   changeShape 85 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0137 begin');
      changeShape(85);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(85));
      expect(result).assertEqual(85);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0137 end');
    })

    /**
     * @tc.name   testVolumeShape0138
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0138
     * @tc.desc   changeShape 86 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0138 begin');
      changeShape(86);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(86));
      expect(result).assertEqual(86);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0138 end');
    })

    /**
     * @tc.name   testVolumeShape0139
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0139
     * @tc.desc   changeShape 87 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0139 begin');
      changeShape(87);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(87));
      expect(result).assertEqual(87);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0139 end');
    })

    /**
     * @tc.name   testVolumeShape0140
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0140
     * @tc.desc   changeShape 88 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0140 begin');
      changeShape(88);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(88));
      expect(result).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0140 end');
    })

    /**
     * @tc.name   testVolumeShape0141
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0141
     * @tc.desc   changeShape 89 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0141 begin');
      changeShape(89);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(89));
      expect(result).assertEqual(89);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0141 end');
    })

    /**
     * @tc.name   testVolumeShape0142
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0142
     * @tc.desc   changeShape 90 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0142 begin');
      changeShape(90);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(90));
      expect(result).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0142 end');
    })

    /**
     * @tc.name   testVolumeShape0143
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0143
     * @tc.desc   changeShape 91 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0143 begin');
      changeShape(91);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(91));
      expect(result).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0143 end');
    })

    /**
     * @tc.name   testVolumeShape0144
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0144
     * @tc.desc   changeShape 92 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0144 begin');
      changeShape(92);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(92));
      expect(result).assertEqual(92);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0144 end');
    })

    /**
     * @tc.name   testVolumeShape0145
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0145
     * @tc.desc   changeShape 93 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0145 begin');
      changeShape(93);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(93));
      expect(result).assertEqual(93);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0145 end');
    })

    /**
     * @tc.name   testVolumeShape0146
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0146
     * @tc.desc   changeShape 94 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0146 begin');
      changeShape(94);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(94));
      expect(result).assertEqual(94);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0146 end');
    })

    /**
     * @tc.name   testVolumeShape0147
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0147
     * @tc.desc   changeShape 95 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0147 begin');
      changeShape(95);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(95));
      expect(result).assertEqual(95);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0147 end');
    })

    /**
     * @tc.name   testVolumeShape0148
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0148
     * @tc.desc   changeShape 96 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0148 begin');
      changeShape(96);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(96));
      expect(result).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0148 end');
    })

    /**
     * @tc.name   testVolumeShape0149
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0149
     * @tc.desc   changeShape 97 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0149 begin');
      changeShape(97);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(97));
      expect(result).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0149 end');
    })

    /**
     * @tc.name   testVolumeShape0150
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0150
     * @tc.desc   changeShape 98 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0150 begin');
      changeShape(98);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(98));
      expect(result).assertEqual(98);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0150 end');
    })

    /**
     * @tc.name   testVolumeShape0151
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0151
     * @tc.desc   changeShape 99 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0151 begin');
      changeShape(99);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(99));
      expect(result).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0151 end');
    })

    /**
     * @tc.name   testVolumeShape0152
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0152
     * @tc.desc   changeShape 100 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0152 begin');
      changeShape(100);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(100));
      expect(result).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0152 end');
    })

    /**
     * @tc.name   testVolumeShape0153
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0153
     * @tc.desc   changeShape 101 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0153 begin');
      changeShape(101);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(101));
      expect(result).assertEqual(101);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0153 end');
    })

    /**
     * @tc.name   testVolumeShape0154
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0154
     * @tc.desc   changeShape 102 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0154 begin');
      changeShape(102);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(102));
      expect(result).assertEqual(102);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0154 end');
    })

    /**
     * @tc.name   testVolumeShape0155
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0155
     * @tc.desc   changeShape 103 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0155 begin');
      changeShape(103);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(103));
      expect(result).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0155 end');
    })

    /**
     * @tc.name   testVolumeShape0156
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0156
     * @tc.desc   changeShape 104 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0156 begin');
      changeShape(104);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(104));
      expect(result).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0156 end');
    })

    /**
     * @tc.name   testVolumeShape0157
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0157
     * @tc.desc   changeShape 105 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0157 begin');
      changeShape(105);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(105));
      expect(result).assertEqual(105);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0157 end');
    })

    /**
     * @tc.name   testVolumeShape0158
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0158
     * @tc.desc   changeShape 106 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0158 begin');
      changeShape(106);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(106));
      expect(result).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0158 end');
    })

    /**
     * @tc.name   testVolumeShape0159
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0159
     * @tc.desc   changeShape 107 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0159 begin');
      changeShape(107);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(107));
      expect(result).assertEqual(107);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0159 end');
    })

    /**
     * @tc.name   testVolumeShape0160
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0160
     * @tc.desc   changeShape 108 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0160 begin');
      changeShape(108);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(108));
      expect(result).assertEqual(108);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0160 end');
    })

    /**
     * @tc.name   testVolumeShape0161
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0161
     * @tc.desc   changeShape 109 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0161 begin');
      changeShape(109);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(109));
      expect(result).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0161 end');
    })

    /**
     * @tc.name   testVolumeShape0162
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0162
     * @tc.desc   changeShape 110 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0162 begin');
      changeShape(110);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(110));
      expect(result).assertEqual(110);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0162 end');
    })

    /**
     * @tc.name   testVolumeShape0163
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0163
     * @tc.desc   changeShape 111 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0163 begin');
      changeShape(111);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(111));
      expect(result).assertEqual(111);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0163 end');
    })

    /**
     * @tc.name   testVolumeShape0164
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0164
     * @tc.desc   changeShape 112 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0164 begin');
      changeShape(112);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(112));
      expect(result).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0164 end');
    })

    /**
     * @tc.name   testVolumeShape0165
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0165
     * @tc.desc   changeShape 113 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0165 begin');
      changeShape(113);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(113));
      expect(result).assertEqual(113);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0165 end');
    })

    /**
     * @tc.name   testVolumeShape0166
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0166
     * @tc.desc   changeShape 114 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0166 begin');
      changeShape(114);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(114));
      expect(result).assertEqual(114);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0166 end');
    })

    /**
     * @tc.name   testVolumeShape0167
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0167
     * @tc.desc   changeShape 115 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0167 begin');
      changeShape(115);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(115));
      expect(result).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0167 end');
    })

    /**
     * @tc.name   testVolumeShape0168
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0168
     * @tc.desc   changeShape 116 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0168 begin');
      changeShape(116);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(116));
      expect(result).assertEqual(116);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0168 end');
    })

    /**
     * @tc.name   testVolumeShape0169
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0169
     * @tc.desc   changeShape 117 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0169 begin');
      changeShape(117);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(117));
      expect(result).assertEqual(117);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0169 end');
    })

    /**
     * @tc.name   testVolumeShape0170
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0170
     * @tc.desc   changeShape 118 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0170 begin');
      changeShape(118);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(118));
      expect(result).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0170 end');
    })

    /**
     * @tc.name   testVolumeShape0171
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0171
     * @tc.desc   changeShape 119 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0171 begin');
      changeShape(119);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(119));
      expect(result).assertEqual(119);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0171 end');
    })

    /**
     * @tc.name   testVolumeShape0172
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0172
     * @tc.desc   changeShape 120 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0172 begin');
      changeShape(120);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0172 end');
    })

    /**
     * @tc.name   testVolumeShape0173
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0173
     * @tc.desc   changeShape 121 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0173 begin');
      changeShape(121);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(121));
      expect(result).assertEqual(121);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0173 end');
    })

    /**
     * @tc.name   testVolumeShape0174
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0174
     * @tc.desc   changeShape 122 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0174 begin');
      changeShape(122);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(122));
      expect(result).assertEqual(122);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0174 end');
    })

    /**
     * @tc.name   testVolumeShape0175
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0175
     * @tc.desc   changeShape 123 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0175 begin');
      changeShape(123);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(123));
      expect(result).assertEqual(123);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0175 end');
    })

    /**
     * @tc.name   testVolumeShape0176
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0176
     * @tc.desc   changeShape 124 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0176 begin');
      changeShape(124);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(124));
      expect(result).assertEqual(124);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0176 end');
    })

    /**
     * @tc.name   testVolumeShape0177
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0177
     * @tc.desc   changeShape 125 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0177 begin');
      changeShape(125);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(125));
      expect(result).assertEqual(125);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0177 end');
    })

    /**
     * @tc.name   testVolumeShape0178
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0178
     * @tc.desc   changeShape 126 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0178 begin');
      changeShape(126);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(126));
      expect(result).assertEqual(126);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0178 end');
    })

    /**
     * @tc.name   testVolumeShape0179
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0179
     * @tc.desc   indices 126 and 127 stay independent and switch back cleanly
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0179 begin');
      changeShape(126);
      const before: number = getShapeIndex();
      expect(before).assertEqual(126);
      changeShape(127);
      const boundary: number = getShapeIndex();
      expect(boundary).assertEqual(127);
      changeShape(126);
      const restored: number = getShapeIndex();
      expect(restored).assertEqual(before);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0179 end');
    })

  })
}
