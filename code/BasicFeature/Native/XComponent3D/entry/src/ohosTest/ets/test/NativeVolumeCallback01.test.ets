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
import {
  ProbeResult,
  probeRegisterCallback,
  probeRegisterMouseEventCallback,
  probeRegisterFocusEventCallback,
  probeRegisterBlurEventCallback,
  probeRegisterKeyEventCallback,
  probeRegisterKeyEventCallbackWithResult,
  probeRegisterOnFrameCallback,
  probeUnregisterOnFrameCallback,
  probeRegisterSurfaceShowCallback,
  probeRegisterSurfaceHideCallback,
  probeRegisterOnTouchInterceptCallback,
} from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeCallback01Test() {
  resetYieldCounter();
  describe('NativeVolumeCallback01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeCallback0001
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0001
     * @tc.desc   probeRegisterCallback stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0001 begin');
      const first: ProbeResult = probeRegisterCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0001 end');
    })

    /**
     * @tc.name   testVolumeCallback0002
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0002
     * @tc.desc   probeRegisterCallback stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0002 begin');
      const first: ProbeResult = probeRegisterCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0002 end');
    })

    /**
     * @tc.name   testVolumeCallback0003
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0003
     * @tc.desc   probeRegisterCallback stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0003 begin');
      const first: ProbeResult = probeRegisterCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0003 end');
    })

    /**
     * @tc.name   testVolumeCallback0004
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0004
     * @tc.desc   probeRegisterCallback stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0004 begin');
      const first: ProbeResult = probeRegisterCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0004 end');
    })

    /**
     * @tc.name   testVolumeCallback0005
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0005
     * @tc.desc   probeRegisterCallback stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0005 begin');
      const first: ProbeResult = probeRegisterCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0005 end');
    })

    /**
     * @tc.name   testVolumeCallback0006
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0006
     * @tc.desc   probeRegisterCallback stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0006 begin');
      const first: ProbeResult = probeRegisterCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0006 end');
    })

    /**
     * @tc.name   testVolumeCallback0007
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0007
     * @tc.desc   probeRegisterCallback stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0007 begin');
      const first: ProbeResult = probeRegisterCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0007 end');
    })

    /**
     * @tc.name   testVolumeCallback0008
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0008
     * @tc.desc   probeRegisterCallback stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0008 begin');
      const first: ProbeResult = probeRegisterCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0008 end');
    })

    /**
     * @tc.name   testVolumeCallback0009
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0009
     * @tc.desc   probeRegisterCallback stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0009 begin');
      const first: ProbeResult = probeRegisterCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0009 end');
    })

    /**
     * @tc.name   testVolumeCallback0010
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0010
     * @tc.desc   probeRegisterMouseEventCallback stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0010 begin');
      const first: ProbeResult = probeRegisterMouseEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0010 end');
    })

    /**
     * @tc.name   testVolumeCallback0011
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0011
     * @tc.desc   probeRegisterMouseEventCallback stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0011 begin');
      const first: ProbeResult = probeRegisterMouseEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0011 end');
    })

    /**
     * @tc.name   testVolumeCallback0012
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0012
     * @tc.desc   probeRegisterMouseEventCallback stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0012 begin');
      const first: ProbeResult = probeRegisterMouseEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0012 end');
    })

    /**
     * @tc.name   testVolumeCallback0013
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0013
     * @tc.desc   probeRegisterMouseEventCallback stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0013 begin');
      const first: ProbeResult = probeRegisterMouseEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0013 end');
    })

    /**
     * @tc.name   testVolumeCallback0014
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0014
     * @tc.desc   probeRegisterMouseEventCallback stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0014 begin');
      const first: ProbeResult = probeRegisterMouseEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0014 end');
    })

    /**
     * @tc.name   testVolumeCallback0015
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0015
     * @tc.desc   probeRegisterMouseEventCallback stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0015 begin');
      const first: ProbeResult = probeRegisterMouseEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0015 end');
    })

    /**
     * @tc.name   testVolumeCallback0016
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0016
     * @tc.desc   probeRegisterMouseEventCallback stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0016 begin');
      const first: ProbeResult = probeRegisterMouseEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0016 end');
    })

    /**
     * @tc.name   testVolumeCallback0017
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0017
     * @tc.desc   probeRegisterMouseEventCallback stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0017 begin');
      const first: ProbeResult = probeRegisterMouseEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0017 end');
    })

    /**
     * @tc.name   testVolumeCallback0018
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0018
     * @tc.desc   probeRegisterMouseEventCallback stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0018 begin');
      const first: ProbeResult = probeRegisterMouseEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterMouseEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0018 end');
    })

    /**
     * @tc.name   testVolumeCallback0019
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0019
     * @tc.desc   probeRegisterFocusEventCallback stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0019 begin');
      const first: ProbeResult = probeRegisterFocusEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0019 end');
    })

    /**
     * @tc.name   testVolumeCallback0020
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0020
     * @tc.desc   probeRegisterFocusEventCallback stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0020 begin');
      const first: ProbeResult = probeRegisterFocusEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0020 end');
    })

    /**
     * @tc.name   testVolumeCallback0021
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0021
     * @tc.desc   probeRegisterFocusEventCallback stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0021 begin');
      const first: ProbeResult = probeRegisterFocusEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0021 end');
    })

    /**
     * @tc.name   testVolumeCallback0022
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0022
     * @tc.desc   probeRegisterFocusEventCallback stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0022 begin');
      const first: ProbeResult = probeRegisterFocusEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0022 end');
    })

    /**
     * @tc.name   testVolumeCallback0023
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0023
     * @tc.desc   probeRegisterFocusEventCallback stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0023 begin');
      const first: ProbeResult = probeRegisterFocusEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0023 end');
    })

    /**
     * @tc.name   testVolumeCallback0024
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0024
     * @tc.desc   probeRegisterFocusEventCallback stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0024 begin');
      const first: ProbeResult = probeRegisterFocusEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0024 end');
    })

    /**
     * @tc.name   testVolumeCallback0025
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0025
     * @tc.desc   probeRegisterFocusEventCallback stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0025 begin');
      const first: ProbeResult = probeRegisterFocusEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0025 end');
    })

    /**
     * @tc.name   testVolumeCallback0026
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0026
     * @tc.desc   probeRegisterFocusEventCallback stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0026 begin');
      const first: ProbeResult = probeRegisterFocusEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0026 end');
    })

    /**
     * @tc.name   testVolumeCallback0027
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0027
     * @tc.desc   probeRegisterFocusEventCallback stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0027 begin');
      const first: ProbeResult = probeRegisterFocusEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterFocusEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0027 end');
    })

    /**
     * @tc.name   testVolumeCallback0028
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0028
     * @tc.desc   probeRegisterBlurEventCallback stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0028 begin');
      const first: ProbeResult = probeRegisterBlurEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0028 end');
    })

    /**
     * @tc.name   testVolumeCallback0029
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0029
     * @tc.desc   probeRegisterBlurEventCallback stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0029 begin');
      const first: ProbeResult = probeRegisterBlurEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0029 end');
    })

    /**
     * @tc.name   testVolumeCallback0030
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0030
     * @tc.desc   probeRegisterBlurEventCallback stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0030 begin');
      const first: ProbeResult = probeRegisterBlurEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0030 end');
    })

    /**
     * @tc.name   testVolumeCallback0031
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0031
     * @tc.desc   probeRegisterBlurEventCallback stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0031 begin');
      const first: ProbeResult = probeRegisterBlurEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0031 end');
    })

    /**
     * @tc.name   testVolumeCallback0032
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0032
     * @tc.desc   probeRegisterBlurEventCallback stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0032 begin');
      const first: ProbeResult = probeRegisterBlurEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0032 end');
    })

    /**
     * @tc.name   testVolumeCallback0033
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0033
     * @tc.desc   probeRegisterBlurEventCallback stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0033 begin');
      const first: ProbeResult = probeRegisterBlurEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0033 end');
    })

    /**
     * @tc.name   testVolumeCallback0034
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0034
     * @tc.desc   probeRegisterBlurEventCallback stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0034 begin');
      const first: ProbeResult = probeRegisterBlurEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0034 end');
    })

    /**
     * @tc.name   testVolumeCallback0035
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0035
     * @tc.desc   probeRegisterBlurEventCallback stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0035 begin');
      const first: ProbeResult = probeRegisterBlurEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0035 end');
    })

    /**
     * @tc.name   testVolumeCallback0036
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0036
     * @tc.desc   probeRegisterBlurEventCallback stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0036 begin');
      const first: ProbeResult = probeRegisterBlurEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterBlurEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0036 end');
    })

    /**
     * @tc.name   testVolumeCallback0037
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0037
     * @tc.desc   probeRegisterKeyEventCallback stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0037 begin');
      const first: ProbeResult = probeRegisterKeyEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0037 end');
    })

    /**
     * @tc.name   testVolumeCallback0038
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0038
     * @tc.desc   probeRegisterKeyEventCallback stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0038 begin');
      const first: ProbeResult = probeRegisterKeyEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0038 end');
    })

    /**
     * @tc.name   testVolumeCallback0039
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0039
     * @tc.desc   probeRegisterKeyEventCallback stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0039 begin');
      const first: ProbeResult = probeRegisterKeyEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0039 end');
    })

    /**
     * @tc.name   testVolumeCallback0040
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0040
     * @tc.desc   probeRegisterKeyEventCallback stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0040 begin');
      const first: ProbeResult = probeRegisterKeyEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0040 end');
    })

    /**
     * @tc.name   testVolumeCallback0041
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0041
     * @tc.desc   probeRegisterKeyEventCallback stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0041 begin');
      const first: ProbeResult = probeRegisterKeyEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0041 end');
    })

    /**
     * @tc.name   testVolumeCallback0042
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0042
     * @tc.desc   probeRegisterKeyEventCallback stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0042 begin');
      const first: ProbeResult = probeRegisterKeyEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0042 end');
    })

    /**
     * @tc.name   testVolumeCallback0043
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0043
     * @tc.desc   probeRegisterKeyEventCallback stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0043 begin');
      const first: ProbeResult = probeRegisterKeyEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0043 end');
    })

    /**
     * @tc.name   testVolumeCallback0044
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0044
     * @tc.desc   probeRegisterKeyEventCallback stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0044 begin');
      const first: ProbeResult = probeRegisterKeyEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0044 end');
    })

    /**
     * @tc.name   testVolumeCallback0045
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0045
     * @tc.desc   probeRegisterKeyEventCallback stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0045 begin');
      const first: ProbeResult = probeRegisterKeyEventCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterKeyEventCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0045 end');
    })

    /**
     * @tc.name   testVolumeCallback0046
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0046
     * @tc.desc   probeRegisterKeyEventCallbackWithResult stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0046 begin');
      const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0046 end');
    })

    /**
     * @tc.name   testVolumeCallback0047
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0047
     * @tc.desc   probeRegisterKeyEventCallbackWithResult stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0047 begin');
      const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0047 end');
    })

    /**
     * @tc.name   testVolumeCallback0048
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0048
     * @tc.desc   probeRegisterKeyEventCallbackWithResult stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0048 begin');
      const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0048 end');
    })

    /**
     * @tc.name   testVolumeCallback0049
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0049
     * @tc.desc   probeRegisterKeyEventCallbackWithResult stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0049 begin');
      const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0049 end');
    })

    /**
     * @tc.name   testVolumeCallback0050
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0050
     * @tc.desc   probeRegisterKeyEventCallbackWithResult stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0050 begin');
      const first: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0050 end');
    })

    /**
     * @tc.name   testVolumeCallback0100
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0100
     * @tc.desc   repeated touch-intercept registration keeps its dedicated code domain
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0100 begin');
      const a: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const b: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(a.code), String(b.code));
      expect(a.code).assertEqual(b.code);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(a.code >= -2 && a.code <= 401));
      expect(a.code >= -2 && a.code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(a.aux % 1), String(0));
      expect(a.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0100 end');
    })

  })
}
