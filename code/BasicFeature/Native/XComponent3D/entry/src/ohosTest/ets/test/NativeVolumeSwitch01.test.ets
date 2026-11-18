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
import { ProbeResult, probeSetNeedSoftKeyboard } from 'libnativerender.so';
import { probeRegisterUIInputEventCallback } from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeSwitch01Test() {
  resetYieldCounter();
  describe('NativeVolumeSwitch01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeSwitch0001
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0001
     * @tc.desc   probeSetNeedSoftKeyboard(-3) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0001 begin');
      const result: ProbeResult = probeSetNeedSoftKeyboard(-3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(-3));
      expect(result.value).assertEqual(-3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0001 end');
    })

    /**
     * @tc.name   testVolumeSwitch0002
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0002
     * @tc.desc   probeSetNeedSoftKeyboard(-2) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0002 begin');
      const result: ProbeResult = probeSetNeedSoftKeyboard(-2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(-2));
      expect(result.value).assertEqual(-2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0002 end');
    })

    /**
     * @tc.name   testVolumeSwitch0003
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0003
     * @tc.desc   probeSetNeedSoftKeyboard(3) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0003 begin');
      const result: ProbeResult = probeSetNeedSoftKeyboard(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(3));
      expect(result.value).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0003 end');
    })

    /**
     * @tc.name   testVolumeSwitch0004
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0004
     * @tc.desc   probeSetNeedSoftKeyboard(7) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0004 begin');
      const result: ProbeResult = probeSetNeedSoftKeyboard(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(7));
      expect(result.value).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0004 end');
    })

    /**
     * @tc.name   testVolumeSwitch0005
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0005
     * @tc.desc   probeSetNeedSoftKeyboard(100) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0005 begin');
      const result: ProbeResult = probeSetNeedSoftKeyboard(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(100));
      expect(result.value).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0005 end');
    })

    /**
     * @tc.name   testVolumeSwitch0006
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0006
     * @tc.desc   probeSetNeedSoftKeyboard(65536) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0006 begin');
      const result: ProbeResult = probeSetNeedSoftKeyboard(65536);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(65536));
      expect(result.value).assertEqual(65536);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0006 end');
    })

    /**
     * @tc.name   testVolumeSwitch0007
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0007
     * @tc.desc   probeSetNeedSoftKeyboard(2147483647) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0007 begin');
      const result: ProbeResult = probeSetNeedSoftKeyboard(2147483647);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(2147483647));
      expect(result.value).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0007 end');
    })

    /**
     * @tc.name   testVolumeSwitch0008
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0008
     * @tc.desc   probeSetNeedSoftKeyboard(-2147483648) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0008 begin');
      const result: ProbeResult = probeSetNeedSoftKeyboard(-2147483648);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(-2147483648));
      expect(result.value).assertEqual(-2147483648);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0008 end');
    })

    /**
     * @tc.name   testVolumeSwitch0009
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0009
     * @tc.desc   probeRegisterUIInputEventCallback(0) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0009 begin');
      const result: ProbeResult = probeRegisterUIInputEventCallback(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(0));
      expect(result.value).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 0 || result.code === 401));
      expect(result.code === 0 || result.code === 401).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0009 end');
    })

    /**
     * @tc.name   testVolumeSwitch0010
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0010
     * @tc.desc   probeRegisterUIInputEventCallback(2) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0010 begin');
      const result: ProbeResult = probeRegisterUIInputEventCallback(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(2));
      expect(result.value).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 0 || result.code === 401));
      expect(result.code === 0 || result.code === 401).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0010 end');
    })

    /**
     * @tc.name   testVolumeSwitch0011
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0011
     * @tc.desc   probeRegisterUIInputEventCallback(5) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0011 begin');
      const result: ProbeResult = probeRegisterUIInputEventCallback(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(5));
      expect(result.value).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 0 || result.code === 401));
      expect(result.code === 0 || result.code === 401).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0011 end');
    })

    /**
     * @tc.name   testVolumeSwitch0012
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0012
     * @tc.desc   probeRegisterUIInputEventCallback(6) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0012 begin');
      const result: ProbeResult = probeRegisterUIInputEventCallback(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(6));
      expect(result.value).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 0 || result.code === 401));
      expect(result.code === 0 || result.code === 401).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0012 end');
    })

    /**
     * @tc.name   testVolumeSwitch0013
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0013
     * @tc.desc   probeRegisterUIInputEventCallback(7) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0013 begin');
      const result: ProbeResult = probeRegisterUIInputEventCallback(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(7));
      expect(result.value).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 0 || result.code === 401));
      expect(result.code === 0 || result.code === 401).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0013 end');
    })

    /**
     * @tc.name   testVolumeSwitch0014
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0014
     * @tc.desc   probeRegisterUIInputEventCallback(8) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0014 begin');
      const result: ProbeResult = probeRegisterUIInputEventCallback(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(8));
      expect(result.value).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 0 || result.code === 401));
      expect(result.code === 0 || result.code === 401).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0014 end');
    })

    /**
     * @tc.name   testVolumeSwitch0015
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0015
     * @tc.desc   probeRegisterUIInputEventCallback(-1) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0015 begin');
      const result: ProbeResult = probeRegisterUIInputEventCallback(-1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(-1));
      expect(result.value).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 0 || result.code === 401));
      expect(result.code === 0 || result.code === 401).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0015 end');
    })

    /**
     * @tc.name   testVolumeSwitch0016
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0016
     * @tc.desc   probeRegisterUIInputEventCallback(1000) echoes the raw input
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0016 begin');
      const result: ProbeResult = probeRegisterUIInputEventCallback(1000);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(1000));
      expect(result.value).assertEqual(1000);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code === 0 || result.code === 401));
      expect(result.code === 0 || result.code === 401).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0016 end');
    })

    /**
     * @tc.name   testVolumeSwitch0017
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0017
     * @tc.desc   need=2 toggles an already-tested non-zero state and stays idempotent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0017 begin');
      const on: ProbeResult = probeSetNeedSoftKeyboard(2);
      const off: ProbeResult = probeSetNeedSoftKeyboard(0);
      const again: ProbeResult = probeSetNeedSoftKeyboard(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(on.value), String(2));
      expect(on.value).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(off.value), String(0));
      expect(off.value).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again.value), String(on.value));
      expect(again.value).assertEqual(on.value);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again.code), String(on.code));
      expect(again.code).assertEqual(on.code);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0017 end');
    })

    /**
     * @tc.name   testVolumeSwitch0018
     * @tc.number SUB_XCOMPONENT3D_VOLSWITCH_0018
     * @tc.desc   Showcase: keyboard and UI input registration interleave without clobbering each other
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeSwitch0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0018 begin');
      const enable: ProbeResult = probeSetNeedSoftKeyboard(1);
      const touch: ProbeResult = probeRegisterUIInputEventCallback(1);
      const disable: ProbeResult = probeSetNeedSoftKeyboard(0);
      const key: ProbeResult = probeRegisterUIInputEventCallback(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(enable.value), String(1));
      expect(enable.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(disable.value), String(0));
      expect(disable.value).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(touch.value), String(1));
      expect(touch.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(key.value), String(4));
      expect(key.value).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(touch.code), String(key.code));
      expect(touch.code).assertEqual(key.code);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(touch.code === 0 || touch.code === 401));
      expect(touch.code === 0 || touch.code === 401).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeSwitch0018 end');
    })

  })
}
