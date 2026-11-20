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

export default function nativeVolumeShape02Test() {
  resetYieldCounter();
  describe('NativeVolumeShape02', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeShape0042
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0042
     * @tc.desc   changeShape 16383 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0042 begin');
      changeShape(16383);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16383));
      expect(result).assertEqual(16383);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0042 end');
    })

    /**
     * @tc.name   testVolumeShape0043
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0043
     * @tc.desc   changeShape 32767 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0043 begin');
      changeShape(32767);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(32767));
      expect(result).assertEqual(32767);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0043 end');
    })

    /**
     * @tc.name   testVolumeShape0044
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0044
     * @tc.desc   changeShape 65535 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0044 begin');
      changeShape(65535);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65535));
      expect(result).assertEqual(65535);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0044 end');
    })

    /**
     * @tc.name   testVolumeShape0045
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0045
     * @tc.desc   changeShape 131071 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0045 begin');
      changeShape(131071);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(131071));
      expect(result).assertEqual(131071);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0045 end');
    })

    /**
     * @tc.name   testVolumeShape0046
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0046
     * @tc.desc   changeShape 262143 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0046 begin');
      changeShape(262143);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(262143));
      expect(result).assertEqual(262143);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0046 end');
    })

    /**
     * @tc.name   testVolumeShape0047
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0047
     * @tc.desc   changeShape 524287 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0047 begin');
      changeShape(524287);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(524287));
      expect(result).assertEqual(524287);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0047 end');
    })

    /**
     * @tc.name   testVolumeShape0048
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0048
     * @tc.desc   changeShape 1048575 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0048 begin');
      changeShape(1048575);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1048575));
      expect(result).assertEqual(1048575);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0048 end');
    })

    /**
     * @tc.name   testVolumeShape0049
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0049
     * @tc.desc   changeShape 2097151 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0049 begin');
      changeShape(2097151);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2097151));
      expect(result).assertEqual(2097151);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0049 end');
    })

    /**
     * @tc.name   testVolumeShape0050
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0050
     * @tc.desc   changeShape 4194303 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0050 begin');
      changeShape(4194303);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4194303));
      expect(result).assertEqual(4194303);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0050 end');
    })

    /**
     * @tc.name   testVolumeShape0051
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0051
     * @tc.desc   changeShape 8388607 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0051 begin');
      changeShape(8388607);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8388607));
      expect(result).assertEqual(8388607);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0051 end');
    })

    /**
     * @tc.name   testVolumeShape0052
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0052
     * @tc.desc   changeShape 16777215 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0052 begin');
      changeShape(16777215);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16777215));
      expect(result).assertEqual(16777215);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0052 end');
    })

    /**
     * @tc.name   testVolumeShape0053
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0053
     * @tc.desc   changeShape 33554431 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0053 begin');
      changeShape(33554431);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(33554431));
      expect(result).assertEqual(33554431);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0053 end');
    })

    /**
     * @tc.name   testVolumeShape0054
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0054
     * @tc.desc   changeShape 67108863 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0054 begin');
      changeShape(67108863);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(67108863));
      expect(result).assertEqual(67108863);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0054 end');
    })

    /**
     * @tc.name   testVolumeShape0055
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0055
     * @tc.desc   changeShape 134217727 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0055 begin');
      changeShape(134217727);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(134217727));
      expect(result).assertEqual(134217727);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0055 end');
    })

    /**
     * @tc.name   testVolumeShape0056
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0056
     * @tc.desc   changeShape 268435455 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0056 begin');
      changeShape(268435455);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(268435455));
      expect(result).assertEqual(268435455);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0056 end');
    })

    /**
     * @tc.name   testVolumeShape0057
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0057
     * @tc.desc   changeShape 64 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0057 begin');
      changeShape(64);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(64));
      expect(result).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0057 end');
    })

    /**
     * @tc.name   testVolumeShape0058
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0058
     * @tc.desc   changeShape 128 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0058 begin');
      changeShape(128);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(128));
      expect(result).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0058 end');
    })

    /**
     * @tc.name   testVolumeShape0059
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0059
     * @tc.desc   changeShape 256 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0059 begin');
      changeShape(256);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(256));
      expect(result).assertEqual(256);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0059 end');
    })

    /**
     * @tc.name   testVolumeShape0060
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0060
     * @tc.desc   changeShape 512 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0060 begin');
      changeShape(512);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(512));
      expect(result).assertEqual(512);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0060 end');
    })

    /**
     * @tc.name   testVolumeShape0061
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0061
     * @tc.desc   changeShape 1024 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0061 begin');
      changeShape(1024);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1024));
      expect(result).assertEqual(1024);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0061 end');
    })

    /**
     * @tc.name   testVolumeShape0062
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0062
     * @tc.desc   changeShape 2048 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0062 begin');
      changeShape(2048);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2048));
      expect(result).assertEqual(2048);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0062 end');
    })

    /**
     * @tc.name   testVolumeShape0063
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0063
     * @tc.desc   changeShape 4096 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0063 begin');
      changeShape(4096);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4096));
      expect(result).assertEqual(4096);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0063 end');
    })

    /**
     * @tc.name   testVolumeShape0064
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0064
     * @tc.desc   changeShape 8192 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0064 begin');
      changeShape(8192);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8192));
      expect(result).assertEqual(8192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0064 end');
    })

    /**
     * @tc.name   testVolumeShape0065
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0065
     * @tc.desc   changeShape 16384 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0065 begin');
      changeShape(16384);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16384));
      expect(result).assertEqual(16384);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0065 end');
    })

    /**
     * @tc.name   testVolumeShape0066
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0066
     * @tc.desc   changeShape 32768 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0066 begin');
      changeShape(32768);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(32768));
      expect(result).assertEqual(32768);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0066 end');
    })

    /**
     * @tc.name   testVolumeShape0067
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0067
     * @tc.desc   changeShape 65536 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0067 begin');
      changeShape(65536);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(65536));
      expect(result).assertEqual(65536);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0067 end');
    })

    /**
     * @tc.name   testVolumeShape0068
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0068
     * @tc.desc   changeShape 131072 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0068 begin');
      changeShape(131072);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(131072));
      expect(result).assertEqual(131072);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0068 end');
    })

    /**
     * @tc.name   testVolumeShape0069
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0069
     * @tc.desc   changeShape 262144 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0069 begin');
      changeShape(262144);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(262144));
      expect(result).assertEqual(262144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0069 end');
    })

    /**
     * @tc.name   testVolumeShape0070
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0070
     * @tc.desc   changeShape 524288 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0070 begin');
      changeShape(524288);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(524288));
      expect(result).assertEqual(524288);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0070 end');
    })

    /**
     * @tc.name   testVolumeShape0071
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0071
     * @tc.desc   changeShape 1048576 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0071 begin');
      changeShape(1048576);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1048576));
      expect(result).assertEqual(1048576);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0071 end');
    })

    /**
     * @tc.name   testVolumeShape0072
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0072
     * @tc.desc   changeShape 2097152 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0072 begin');
      changeShape(2097152);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2097152));
      expect(result).assertEqual(2097152);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0072 end');
    })

    /**
     * @tc.name   testVolumeShape0073
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0073
     * @tc.desc   changeShape 4194304 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0073 begin');
      changeShape(4194304);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4194304));
      expect(result).assertEqual(4194304);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0073 end');
    })

    /**
     * @tc.name   testVolumeShape0074
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0074
     * @tc.desc   changeShape 8388608 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0074 begin');
      changeShape(8388608);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8388608));
      expect(result).assertEqual(8388608);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0074 end');
    })

    /**
     * @tc.name   testVolumeShape0075
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0075
     * @tc.desc   changeShape 16777216 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0075 begin');
      changeShape(16777216);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16777216));
      expect(result).assertEqual(16777216);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0075 end');
    })

    /**
     * @tc.name   testVolumeShape0076
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0076
     * @tc.desc   changeShape 33554432 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0076 begin');
      changeShape(33554432);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(33554432));
      expect(result).assertEqual(33554432);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0076 end');
    })

    /**
     * @tc.name   testVolumeShape0077
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0077
     * @tc.desc   changeShape 67108864 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0077 begin');
      changeShape(67108864);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(67108864));
      expect(result).assertEqual(67108864);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0077 end');
    })

    /**
     * @tc.name   testVolumeShape0078
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0078
     * @tc.desc   changeShape 134217728 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0078 begin');
      changeShape(134217728);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(134217728));
      expect(result).assertEqual(134217728);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0078 end');
    })

    /**
     * @tc.name   testVolumeShape0079
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0079
     * @tc.desc   changeShape 268435456 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0079 begin');
      changeShape(268435456);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(268435456));
      expect(result).assertEqual(268435456);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0079 end');
    })

    /**
     * @tc.name   testVolumeShape0080
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0080
     * @tc.desc   changeShape 2147483647 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0080 begin');
      changeShape(2147483647);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2147483647));
      expect(result).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0080 end');
    })

    /**
     * @tc.name   testVolumeShape0081
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0081
     * @tc.desc   changeShape 2147483648 round-trips through getShapeIndex
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0081 begin');
      changeShape(2147483648);
      const result: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2147483648));
      expect(result).assertEqual(2147483648);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result >= 0));
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result <= 4294967295));
      expect(result <= 4294967295).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0081 end');
    })

    /**
     * @tc.name   testVolumeShape0082
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0082
     * @tc.desc   changeShape -1 normalizes to uint32 max instead of failing
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0082 begin');
      changeShape(-1);
      const result: number = getShapeIndex();
      expect(result).assertEqual(4294967295);
      expect(result > 2147483647).assertTrue();
      expect(result % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0082 end');
    })

    /**
     * @tc.name   testVolumeShape0084
     * @tc.number SUB_XCOMPONENT3D_VOLSHAPE_0084
     * @tc.desc   Showcase: alternating steps between small and large shapes keep the readback in sync
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeShape0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0084 begin');
      changeShape(2);
      const small: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(small), String(2));
      expect(small).assertEqual(2);
      changeShape(1024);
      const large: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(large), String(1024));
      expect(large).assertEqual(1024);
      changeShape(2);
      const backToSmall: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(backToSmall), String(2));
      expect(backToSmall).assertEqual(2);
      changeShape(0);
      const restored: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(restored), String(0));
      expect(restored).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeShape0084 end');
    })

  })
}
