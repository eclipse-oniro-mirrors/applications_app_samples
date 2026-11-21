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

export default function nativeVolumeShape01Test() {
  resetYieldCounter();
  describe('NativeVolumeShape01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeShape0001
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0001
     * @tc.desc   changeShape 0 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0001 begin');
      changeShape(0);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0001 end');
    })

    /**
     * @tc.name   testVolumeShape0002
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0002
     * @tc.desc   changeShape 1 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0002 begin');
      changeShape(1);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0002 end');
    })

    /**
     * @tc.name   testVolumeShape0003
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0003
     * @tc.desc   changeShape 2 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0003 begin');
      changeShape(2);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0003 end');
    })

    /**
     * @tc.name   testVolumeShape0004
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0004
     * @tc.desc   changeShape 3 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0004 begin');
      changeShape(3);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0004 end');
    })

    /**
     * @tc.name   testVolumeShape0005
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0005
     * @tc.desc   changeShape 4 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0005 begin');
      changeShape(4);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0005 end');
    })

    /**
     * @tc.name   testVolumeShape0006
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0006
     * @tc.desc   changeShape 5 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0006 begin');
      changeShape(5);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0006 end');
    })

    /**
     * @tc.name   testVolumeShape0007
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0007
     * @tc.desc   changeShape 6 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0007 begin');
      changeShape(6);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6));
      expect(result).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0007 end');
    })

    /**
     * @tc.name   testVolumeShape0008
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0008
     * @tc.desc   changeShape 7 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0008 begin');
      changeShape(7);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(7));
      expect(result).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0008 end');
    })

    /**
     * @tc.name   testVolumeShape0009
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0009
     * @tc.desc   changeShape 8 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0009 begin');
      changeShape(8);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0009 end');
    })

    /**
     * @tc.name   testVolumeShape0010
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0010
     * @tc.desc   changeShape 9 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0010 begin');
      changeShape(9);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(9));
      expect(result).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0010 end');
    })

    /**
     * @tc.name   testVolumeShape0011
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0011
     * @tc.desc   changeShape 10 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0011 begin');
      changeShape(10);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0011 end');
    })

    /**
     * @tc.name   testVolumeShape0012
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0012
     * @tc.desc   changeShape 11 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0012 begin');
      changeShape(11);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(11));
      expect(result).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0012 end');
    })

    /**
     * @tc.name   testVolumeShape0013
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0013
     * @tc.desc   changeShape 12 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0013 begin');
      changeShape(12);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(12));
      expect(result).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0013 end');
    })

    /**
     * @tc.name   testVolumeShape0014
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0014
     * @tc.desc   changeShape 13 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0014 begin');
      changeShape(13);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13));
      expect(result).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0014 end');
    })

    /**
     * @tc.name   testVolumeShape0015
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0015
     * @tc.desc   changeShape 14 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0015 begin');
      changeShape(14);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(14));
      expect(result).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0015 end');
    })

    /**
     * @tc.name   testVolumeShape0016
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0016
     * @tc.desc   changeShape 15 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0016 begin');
      changeShape(15);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(15));
      expect(result).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0016 end');
    })

    /**
     * @tc.name   testVolumeShape0017
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0017
     * @tc.desc   changeShape 16 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0017 begin');
      changeShape(16);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0017 end');
    })

    /**
     * @tc.name   testVolumeShape0018
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0018
     * @tc.desc   changeShape 17 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0018 begin');
      changeShape(17);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(17));
      expect(result).assertEqual(17);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0018 end');
    })

    /**
     * @tc.name   testVolumeShape0019
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0019
     * @tc.desc   changeShape 18 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0019 begin');
      changeShape(18);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(18));
      expect(result).assertEqual(18);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0019 end');
    })

    /**
     * @tc.name   testVolumeShape0020
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0020
     * @tc.desc   changeShape 19 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0020 begin');
      changeShape(19);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(19));
      expect(result).assertEqual(19);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0020 end');
    })

    /**
     * @tc.name   testVolumeShape0021
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0021
     * @tc.desc   changeShape 20 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0021 begin');
      changeShape(20);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0021 end');
    })

    /**
     * @tc.name   testVolumeShape0022
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0022
     * @tc.desc   changeShape 21 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0022 begin');
      changeShape(21);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(21));
      expect(result).assertEqual(21);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0022 end');
    })

    /**
     * @tc.name   testVolumeShape0023
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0023
     * @tc.desc   changeShape 22 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0023 begin');
      changeShape(22);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(22));
      expect(result).assertEqual(22);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0023 end');
    })

    /**
     * @tc.name   testVolumeShape0024
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0024
     * @tc.desc   changeShape 23 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0024 begin');
      changeShape(23);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(23));
      expect(result).assertEqual(23);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0024 end');
    })

    /**
     * @tc.name   testVolumeShape0025
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0025
     * @tc.desc   changeShape 24 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0025 begin');
      changeShape(24);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(24));
      expect(result).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0025 end');
    })

    /**
     * @tc.name   testVolumeShape0026
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0026
     * @tc.desc   changeShape 25 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0026 begin');
      changeShape(25);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(25));
      expect(result).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0026 end');
    })

    /**
     * @tc.name   testVolumeShape0027
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0027
     * @tc.desc   changeShape 26 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0027 begin');
      changeShape(26);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(26));
      expect(result).assertEqual(26);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0027 end');
    })

    /**
     * @tc.name   testVolumeShape0028
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0028
     * @tc.desc   changeShape 27 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0028 begin');
      changeShape(27);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(27));
      expect(result).assertEqual(27);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0028 end');
    })

    /**
     * @tc.name   testVolumeShape0029
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0029
     * @tc.desc   changeShape 28 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0029 begin');
      changeShape(28);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(28));
      expect(result).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0029 end');
    })

    /**
     * @tc.name   testVolumeShape0030
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0030
     * @tc.desc   changeShape 29 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0030 begin');
      changeShape(29);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(29));
      expect(result).assertEqual(29);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0030 end');
    })

    /**
     * @tc.name   testVolumeShape0031
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0031
     * @tc.desc   changeShape 30 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0031 begin');
      changeShape(30);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(30));
      expect(result).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0031 end');
    })

    /**
     * @tc.name   testVolumeShape0032
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0032
     * @tc.desc   changeShape 31 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0032 begin');
      changeShape(31);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(31));
      expect(result).assertEqual(31);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0032 end');
    })

    /**
     * @tc.name   testVolumeShape0033
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0033
     * @tc.desc   changeShape 63 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0033 begin');
      changeShape(63);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(63));
      expect(result).assertEqual(63);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0033 end');
    })

    /**
     * @tc.name   testVolumeShape0034
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0034
     * @tc.desc   changeShape 127 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0034 begin');
      changeShape(127);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(127));
      expect(result).assertEqual(127);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0034 end');
    })

    /**
     * @tc.name   testVolumeShape0035
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0035
     * @tc.desc   changeShape 255 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0035 begin');
      changeShape(255);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(255));
      expect(result).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0035 end');
    })

    /**
     * @tc.name   testVolumeShape0036
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0036
     * @tc.desc   changeShape 511 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0036 begin');
      changeShape(511);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(511));
      expect(result).assertEqual(511);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0036 end');
    })

    /**
     * @tc.name   testVolumeShape0037
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0037
     * @tc.desc   changeShape 1023 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0037 begin');
      changeShape(1023);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1023));
      expect(result).assertEqual(1023);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0037 end');
    })

    /**
     * @tc.name   testVolumeShape0038
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0038
     * @tc.desc   changeShape 2047 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0038 begin');
      changeShape(2047);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2047));
      expect(result).assertEqual(2047);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0038 end');
    })

    /**
     * @tc.name   testVolumeShape0039
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0039
     * @tc.desc   changeShape 4095 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0039 begin');
      changeShape(4095);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4095));
      expect(result).assertEqual(4095);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0039 end');
    })

    /**
     * @tc.name   testVolumeShape0040
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0040
     * @tc.desc   changeShape 8191 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0040 begin');
      changeShape(8191);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8191));
      expect(result).assertEqual(8191);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0040 end');
    })

    /**
     * @tc.name   testVolumeShape0041
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0041
     * @tc.desc   changeShape 2^32 wraps to zero under uint32 normalization
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0041 begin');
      changeShape(4294967296);
      const result: number = getShapeIndex();
      expect(result).assertEqual(0);
      expect(result >= 0).assertTrue();
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0041 end');
    })

    /**
     * @tc.name   testVolumeShape0083
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0083
     * @tc.desc   Showcase: a settled shape stays readable and can be reset to the default
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0083 begin');
      changeShape(16);
      const first: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first), String(16));
      expect(first).assertEqual(16);
      const again: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again), String(16));
      expect(again).assertEqual(16);
      changeShape(0);
      const restored: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(restored), String(0));
      expect(restored).assertEqual(0);
      const restoredAgain: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(restoredAgain), String(0));
      expect(restoredAgain).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0083 end');
    })

  })
}
