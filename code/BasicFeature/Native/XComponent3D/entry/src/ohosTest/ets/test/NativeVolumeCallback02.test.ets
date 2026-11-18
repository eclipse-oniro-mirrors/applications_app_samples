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

export default function nativeVolumeCallback02Test() {
  resetYieldCounter();
  describe('NativeVolumeCallback02', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeCallback0051
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0051
     * @tc.desc   probeRegisterKeyEventCallbackWithResult stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0051 begin');
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
      const again6: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0051 end');
    })

    /**
     * @tc.name   testVolumeCallback0052
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0052
     * @tc.desc   probeRegisterKeyEventCallbackWithResult stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0052 begin');
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
      const again6: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0052 end');
    })

    /**
     * @tc.name   testVolumeCallback0053
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0053
     * @tc.desc   probeRegisterKeyEventCallbackWithResult stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0053 begin');
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
      const again6: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0053 end');
    })

    /**
     * @tc.name   testVolumeCallback0054
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0054
     * @tc.desc   probeRegisterKeyEventCallbackWithResult stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0054 begin');
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
      const again6: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterKeyEventCallbackWithResult();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0054 end');
    })

    /**
     * @tc.name   testVolumeCallback0055
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0055
     * @tc.desc   probeRegisterOnFrameCallback stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0055 begin');
      const first: ProbeResult = probeRegisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0055 end');
    })

    /**
     * @tc.name   testVolumeCallback0056
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0056
     * @tc.desc   probeRegisterOnFrameCallback stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0056 begin');
      const first: ProbeResult = probeRegisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0056 end');
    })

    /**
     * @tc.name   testVolumeCallback0057
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0057
     * @tc.desc   probeRegisterOnFrameCallback stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0057 begin');
      const first: ProbeResult = probeRegisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0057 end');
    })

    /**
     * @tc.name   testVolumeCallback0058
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0058
     * @tc.desc   probeRegisterOnFrameCallback stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0058 begin');
      const first: ProbeResult = probeRegisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0058 end');
    })

    /**
     * @tc.name   testVolumeCallback0059
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0059
     * @tc.desc   probeRegisterOnFrameCallback stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0059 begin');
      const first: ProbeResult = probeRegisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0059 end');
    })

    /**
     * @tc.name   testVolumeCallback0060
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0060
     * @tc.desc   probeRegisterOnFrameCallback stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0060 begin');
      const first: ProbeResult = probeRegisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0060 end');
    })

    /**
     * @tc.name   testVolumeCallback0061
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0061
     * @tc.desc   probeRegisterOnFrameCallback stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0061 begin');
      const first: ProbeResult = probeRegisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0061 end');
    })

    /**
     * @tc.name   testVolumeCallback0062
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0062
     * @tc.desc   probeRegisterOnFrameCallback stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0062 begin');
      const first: ProbeResult = probeRegisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0062 end');
    })

    /**
     * @tc.name   testVolumeCallback0063
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0063
     * @tc.desc   probeRegisterOnFrameCallback stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0063 begin');
      const first: ProbeResult = probeRegisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0063 end');
    })

    /**
     * @tc.name   testVolumeCallback0064
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0064
     * @tc.desc   probeUnregisterOnFrameCallback stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0064 begin');
      const first: ProbeResult = probeUnregisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0064 end');
    })

    /**
     * @tc.name   testVolumeCallback0065
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0065
     * @tc.desc   probeUnregisterOnFrameCallback stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0065 begin');
      const first: ProbeResult = probeUnregisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0065 end');
    })

    /**
     * @tc.name   testVolumeCallback0066
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0066
     * @tc.desc   probeUnregisterOnFrameCallback stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0066 begin');
      const first: ProbeResult = probeUnregisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0066 end');
    })

    /**
     * @tc.name   testVolumeCallback0067
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0067
     * @tc.desc   probeUnregisterOnFrameCallback stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0067 begin');
      const first: ProbeResult = probeUnregisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0067 end');
    })

    /**
     * @tc.name   testVolumeCallback0068
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0068
     * @tc.desc   probeUnregisterOnFrameCallback stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0068 begin');
      const first: ProbeResult = probeUnregisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0068 end');
    })

    /**
     * @tc.name   testVolumeCallback0069
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0069
     * @tc.desc   probeUnregisterOnFrameCallback stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0069 begin');
      const first: ProbeResult = probeUnregisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0069 end');
    })

    /**
     * @tc.name   testVolumeCallback0070
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0070
     * @tc.desc   probeUnregisterOnFrameCallback stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0070 begin');
      const first: ProbeResult = probeUnregisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0070 end');
    })

    /**
     * @tc.name   testVolumeCallback0071
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0071
     * @tc.desc   probeUnregisterOnFrameCallback stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0071 begin');
      const first: ProbeResult = probeUnregisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0071 end');
    })

    /**
     * @tc.name   testVolumeCallback0072
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0072
     * @tc.desc   probeUnregisterOnFrameCallback stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0072 begin');
      const first: ProbeResult = probeUnregisterOnFrameCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0072 end');
    })

    /**
     * @tc.name   testVolumeCallback0073
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0073
     * @tc.desc   the show-callback probe stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0073 begin');
      const first: ProbeResult = probeRegisterSurfaceShowCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0073 end');
    })

    /**
     * @tc.name   testVolumeCallback0074
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0074
     * @tc.desc   the show-callback probe stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0074 begin');
      const first: ProbeResult = probeRegisterSurfaceShowCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0074 end');
    })

    /**
     * @tc.name   testVolumeCallback0075
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0075
     * @tc.desc   the show-callback probe stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0075 begin');
      const first: ProbeResult = probeRegisterSurfaceShowCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0075 end');
    })

    /**
     * @tc.name   testVolumeCallback0076
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0076
     * @tc.desc   the show-callback probe stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0076 begin');
      const first: ProbeResult = probeRegisterSurfaceShowCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0076 end');
    })

    /**
     * @tc.name   testVolumeCallback0077
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0077
     * @tc.desc   the show-callback probe stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0077 begin');
      const first: ProbeResult = probeRegisterSurfaceShowCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0077 end');
    })

    /**
     * @tc.name   testVolumeCallback0078
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0078
     * @tc.desc   the show-callback probe stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0078 begin');
      const first: ProbeResult = probeRegisterSurfaceShowCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0078 end');
    })

    /**
     * @tc.name   testVolumeCallback0079
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0079
     * @tc.desc   the show-callback probe stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0079 begin');
      const first: ProbeResult = probeRegisterSurfaceShowCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0079 end');
    })

    /**
     * @tc.name   testVolumeCallback0080
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0080
     * @tc.desc   the show-callback probe stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0080 begin');
      const first: ProbeResult = probeRegisterSurfaceShowCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0080 end');
    })

    /**
     * @tc.name   testVolumeCallback0081
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0081
     * @tc.desc   the show-callback probe stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0081 begin');
      const first: ProbeResult = probeRegisterSurfaceShowCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterSurfaceShowCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0081 end');
    })

    /**
     * @tc.name   testVolumeCallback0082
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0082
     * @tc.desc   the hide-callback probe stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0082 begin');
      const first: ProbeResult = probeRegisterSurfaceHideCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0082 end');
    })

    /**
     * @tc.name   testVolumeCallback0083
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0083
     * @tc.desc   the hide-callback probe stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0083 begin');
      const first: ProbeResult = probeRegisterSurfaceHideCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0083 end');
    })

    /**
     * @tc.name   testVolumeCallback0084
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0084
     * @tc.desc   the hide-callback probe stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0084 begin');
      const first: ProbeResult = probeRegisterSurfaceHideCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0084 end');
    })

    /**
     * @tc.name   testVolumeCallback0085
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0085
     * @tc.desc   the hide-callback probe stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0085 begin');
      const first: ProbeResult = probeRegisterSurfaceHideCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0085 end');
    })

    /**
     * @tc.name   testVolumeCallback0086
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0086
     * @tc.desc   the hide-callback probe stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0086 begin');
      const first: ProbeResult = probeRegisterSurfaceHideCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0086 end');
    })

    /**
     * @tc.name   testVolumeCallback0087
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0087
     * @tc.desc   the hide-callback probe stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0087 begin');
      const first: ProbeResult = probeRegisterSurfaceHideCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0087 end');
    })

    /**
     * @tc.name   testVolumeCallback0088
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0088
     * @tc.desc   the hide-callback probe stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0088 begin');
      const first: ProbeResult = probeRegisterSurfaceHideCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0088 end');
    })

    /**
     * @tc.name   testVolumeCallback0089
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0089
     * @tc.desc   the hide-callback probe stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0089 begin');
      const first: ProbeResult = probeRegisterSurfaceHideCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0089 end');
    })

    /**
     * @tc.name   testVolumeCallback0090
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0090
     * @tc.desc   the hide-callback probe stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0090 begin');
      const first: ProbeResult = probeRegisterSurfaceHideCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterSurfaceHideCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0090 end');
    })

    /**
     * @tc.name   testVolumeCallback0091
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0091
     * @tc.desc   probeRegisterOnTouchInterceptCallback stays stable across 1 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0091 begin');
      const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0091 end');
    })

    /**
     * @tc.name   testVolumeCallback0092
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0092
     * @tc.desc   probeRegisterOnTouchInterceptCallback stays stable across 2 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0092 begin');
      const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0092 end');
    })

    /**
     * @tc.name   testVolumeCallback0093
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0093
     * @tc.desc   probeRegisterOnTouchInterceptCallback stays stable across 3 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0093 begin');
      const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0093 end');
    })

    /**
     * @tc.name   testVolumeCallback0094
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0094
     * @tc.desc   probeRegisterOnTouchInterceptCallback stays stable across 4 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0094 begin');
      const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0094 end');
    })

    /**
     * @tc.name   testVolumeCallback0095
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0095
     * @tc.desc   probeRegisterOnTouchInterceptCallback stays stable across 5 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0095 begin');
      const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0095 end');
    })

    /**
     * @tc.name   testVolumeCallback0096
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0096
     * @tc.desc   probeRegisterOnTouchInterceptCallback stays stable across 6 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0096 begin');
      const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0096 end');
    })

    /**
     * @tc.name   testVolumeCallback0097
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0097
     * @tc.desc   probeRegisterOnTouchInterceptCallback stays stable across 7 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0097 begin');
      const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0097 end');
    })

    /**
     * @tc.name   testVolumeCallback0098
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0098
     * @tc.desc   probeRegisterOnTouchInterceptCallback stays stable across 8 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0098 begin');
      const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0098 end');
    })

    /**
     * @tc.name   testVolumeCallback0099
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0099
     * @tc.desc   probeRegisterOnTouchInterceptCallback stays stable across 9 invocation(s)
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0099 begin');
      const first: ProbeResult = probeRegisterOnTouchInterceptCallback();
      const code: number = first.code;
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(code >= -2 && code <= 401));
      expect(code >= -2 && code <= 401).assertTrue();
      const again2: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again2.code), String(code));
      expect(again2.code).assertEqual(code);
      const again3: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again3.code), String(code));
      expect(again3.code).assertEqual(code);
      const again4: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again4.code), String(code));
      expect(again4.code).assertEqual(code);
      const again5: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again5.code), String(code));
      expect(again5.code).assertEqual(code);
      const again6: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again6.code), String(code));
      expect(again6.code).assertEqual(code);
      const again7: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again7.code), String(code));
      expect(again7.code).assertEqual(code);
      const again8: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again8.code), String(code));
      expect(again8.code).assertEqual(code);
      const again9: ProbeResult = probeRegisterOnTouchInterceptCallback();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(again9.code), String(code));
      expect(again9.code).assertEqual(code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value % 1), String(0));
      expect(first.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux % 1), String(0));
      expect(first.aux % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0099 end');
    })

    /**
     * @tc.name   testVolumeCallback0101
     * @tc.number SUB_XCOMPONENT3D_VOLCALLBACK_0101
     * @tc.desc   onFrame unregister keeps the same code domain as its registration
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCallback0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0101 begin');
      const reg: ProbeResult = probeRegisterOnFrameCallback();
      const unreg: ProbeResult = probeUnregisterOnFrameCallback();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(reg.code >= -2 && reg.code <= 401));
      expect(reg.code >= -2 && reg.code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(unreg.code >= -2 && unreg.code <= 401));
      expect(unreg.code >= -2 && unreg.code <= 401).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(unreg.value % 1), String(0));
      expect(unreg.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCallback0101 end');
    })

  })
}
