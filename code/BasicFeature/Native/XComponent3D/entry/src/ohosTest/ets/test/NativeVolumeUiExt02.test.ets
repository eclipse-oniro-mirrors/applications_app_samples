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
  probeGetTouchPointWindowX,
  probeGetTouchPointWindowY,
  probeGetTouchPointDisplayX,
  probeGetTouchPointDisplayY,
} from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeUiExt02Test() {
  resetYieldCounter();
  describe('NativeVolumeUiExt02', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeUiExt0066
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0066
     * @tc.desc   touch point 80 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0066 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(80);
      const dx: ProbeResult = probeGetTouchPointDisplayX(80);
      const wy: ProbeResult = probeGetTouchPointWindowY(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(80));
      expect(wx.aux).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(80));
      expect(dx.aux).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0066 end');
    })

    /**
     * @tc.name   testVolumeUiExt0067
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0067
     * @tc.desc   touch point 81 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0067 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(81);
      const dx: ProbeResult = probeGetTouchPointDisplayX(81);
      const wy: ProbeResult = probeGetTouchPointWindowY(81);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(81));
      expect(wx.aux).assertEqual(81);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(81));
      expect(dx.aux).assertEqual(81);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0067 end');
    })

    /**
     * @tc.name   testVolumeUiExt0068
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0068
     * @tc.desc   touch point 82 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0068 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(82);
      const dx: ProbeResult = probeGetTouchPointDisplayX(82);
      const wy: ProbeResult = probeGetTouchPointWindowY(82);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(82));
      expect(wx.aux).assertEqual(82);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(82));
      expect(dx.aux).assertEqual(82);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0068 end');
    })

    /**
     * @tc.name   testVolumeUiExt0069
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0069
     * @tc.desc   touch point 83 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0069 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(83);
      const dx: ProbeResult = probeGetTouchPointDisplayX(83);
      const wy: ProbeResult = probeGetTouchPointWindowY(83);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(83));
      expect(wx.aux).assertEqual(83);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(83));
      expect(dx.aux).assertEqual(83);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0069 end');
    })

    /**
     * @tc.name   testVolumeUiExt0070
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0070
     * @tc.desc   touch point 84 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0070 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(84);
      const dx: ProbeResult = probeGetTouchPointDisplayX(84);
      const wy: ProbeResult = probeGetTouchPointWindowY(84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(84));
      expect(wx.aux).assertEqual(84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(84));
      expect(dx.aux).assertEqual(84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0070 end');
    })

    /**
     * @tc.name   testVolumeUiExt0071
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0071
     * @tc.desc   touch point 85 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0071 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(85);
      const dx: ProbeResult = probeGetTouchPointDisplayX(85);
      const wy: ProbeResult = probeGetTouchPointWindowY(85);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(85));
      expect(wx.aux).assertEqual(85);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(85));
      expect(dx.aux).assertEqual(85);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0071 end');
    })

    /**
     * @tc.name   testVolumeUiExt0072
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0072
     * @tc.desc   touch point 86 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0072 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(86);
      const dx: ProbeResult = probeGetTouchPointDisplayX(86);
      const wy: ProbeResult = probeGetTouchPointWindowY(86);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(86));
      expect(wx.aux).assertEqual(86);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(86));
      expect(dx.aux).assertEqual(86);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0072 end');
    })

    /**
     * @tc.name   testVolumeUiExt0073
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0073
     * @tc.desc   touch point 87 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0073 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(87);
      const dx: ProbeResult = probeGetTouchPointDisplayX(87);
      const wy: ProbeResult = probeGetTouchPointWindowY(87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(87));
      expect(wx.aux).assertEqual(87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(87));
      expect(dx.aux).assertEqual(87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0073 end');
    })

    /**
     * @tc.name   testVolumeUiExt0074
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0074
     * @tc.desc   touch point 88 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0074 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(88);
      const dx: ProbeResult = probeGetTouchPointDisplayX(88);
      const wy: ProbeResult = probeGetTouchPointWindowY(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(88));
      expect(wx.aux).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(88));
      expect(dx.aux).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0074 end');
    })

    /**
     * @tc.name   testVolumeUiExt0075
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0075
     * @tc.desc   touch point 89 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0075 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(89);
      const dx: ProbeResult = probeGetTouchPointDisplayX(89);
      const wy: ProbeResult = probeGetTouchPointWindowY(89);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(89));
      expect(wx.aux).assertEqual(89);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(89));
      expect(dx.aux).assertEqual(89);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0075 end');
    })

    /**
     * @tc.name   testVolumeUiExt0076
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0076
     * @tc.desc   touch point 90 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0076 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(90);
      const dx: ProbeResult = probeGetTouchPointDisplayX(90);
      const wy: ProbeResult = probeGetTouchPointWindowY(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(90));
      expect(wx.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(90));
      expect(dx.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0076 end');
    })

    /**
     * @tc.name   testVolumeUiExt0077
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0077
     * @tc.desc   touch point 91 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0077 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(91);
      const dx: ProbeResult = probeGetTouchPointDisplayX(91);
      const wy: ProbeResult = probeGetTouchPointWindowY(91);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(91));
      expect(wx.aux).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(91));
      expect(dx.aux).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0077 end');
    })

    /**
     * @tc.name   testVolumeUiExt0078
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0078
     * @tc.desc   touch point 92 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0078 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(92);
      const dx: ProbeResult = probeGetTouchPointDisplayX(92);
      const wy: ProbeResult = probeGetTouchPointWindowY(92);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(92));
      expect(wx.aux).assertEqual(92);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(92));
      expect(dx.aux).assertEqual(92);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0078 end');
    })

    /**
     * @tc.name   testVolumeUiExt0079
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0079
     * @tc.desc   touch point 93 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0079 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(93);
      const dx: ProbeResult = probeGetTouchPointDisplayX(93);
      const wy: ProbeResult = probeGetTouchPointWindowY(93);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(93));
      expect(wx.aux).assertEqual(93);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(93));
      expect(dx.aux).assertEqual(93);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0079 end');
    })

    /**
     * @tc.name   testVolumeUiExt0080
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0080
     * @tc.desc   touch point 94 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0080 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(94);
      const dx: ProbeResult = probeGetTouchPointDisplayX(94);
      const wy: ProbeResult = probeGetTouchPointWindowY(94);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(94));
      expect(wx.aux).assertEqual(94);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(94));
      expect(dx.aux).assertEqual(94);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0080 end');
    })

    /**
     * @tc.name   testVolumeUiExt0081
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0081
     * @tc.desc   touch point 95 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0081 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(95);
      const dx: ProbeResult = probeGetTouchPointDisplayX(95);
      const wy: ProbeResult = probeGetTouchPointWindowY(95);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(95));
      expect(wx.aux).assertEqual(95);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(95));
      expect(dx.aux).assertEqual(95);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0081 end');
    })

    /**
     * @tc.name   testVolumeUiExt0082
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0082
     * @tc.desc   touch point 96 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0082 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(96);
      const dx: ProbeResult = probeGetTouchPointDisplayX(96);
      const wy: ProbeResult = probeGetTouchPointWindowY(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(96));
      expect(wx.aux).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(96));
      expect(dx.aux).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0082 end');
    })

    /**
     * @tc.name   testVolumeUiExt0083
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0083
     * @tc.desc   touch point 97 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0083 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(97);
      const dx: ProbeResult = probeGetTouchPointDisplayX(97);
      const wy: ProbeResult = probeGetTouchPointWindowY(97);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(97));
      expect(wx.aux).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(97));
      expect(dx.aux).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0083 end');
    })

    /**
     * @tc.name   testVolumeUiExt0084
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0084
     * @tc.desc   touch point 98 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0084 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(98);
      const dx: ProbeResult = probeGetTouchPointDisplayX(98);
      const wy: ProbeResult = probeGetTouchPointWindowY(98);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(98));
      expect(wx.aux).assertEqual(98);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(98));
      expect(dx.aux).assertEqual(98);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0084 end');
    })

    /**
     * @tc.name   testVolumeUiExt0085
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0085
     * @tc.desc   touch point 99 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0085 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(99);
      const dx: ProbeResult = probeGetTouchPointDisplayX(99);
      const wy: ProbeResult = probeGetTouchPointWindowY(99);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(99));
      expect(wx.aux).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(99));
      expect(dx.aux).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0085 end');
    })

    /**
     * @tc.name   testVolumeUiExt0086
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0086
     * @tc.desc   touch point 100 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0086 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(100);
      const dx: ProbeResult = probeGetTouchPointDisplayX(100);
      const wy: ProbeResult = probeGetTouchPointWindowY(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(100));
      expect(wx.aux).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(100));
      expect(dx.aux).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0086 end');
    })

    /**
     * @tc.name   testVolumeUiExt0087
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0087
     * @tc.desc   touch point 101 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0087 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(101);
      const dx: ProbeResult = probeGetTouchPointDisplayX(101);
      const wy: ProbeResult = probeGetTouchPointWindowY(101);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(101));
      expect(wx.aux).assertEqual(101);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(101));
      expect(dx.aux).assertEqual(101);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0087 end');
    })

    /**
     * @tc.name   testVolumeUiExt0088
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0088
     * @tc.desc   touch point 102 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0088 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(102);
      const dx: ProbeResult = probeGetTouchPointDisplayX(102);
      const wy: ProbeResult = probeGetTouchPointWindowY(102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(102));
      expect(wx.aux).assertEqual(102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(102));
      expect(dx.aux).assertEqual(102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0088 end');
    })

    /**
     * @tc.name   testVolumeUiExt0089
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0089
     * @tc.desc   touch point 103 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0089 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(103);
      const dx: ProbeResult = probeGetTouchPointDisplayX(103);
      const wy: ProbeResult = probeGetTouchPointWindowY(103);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(103));
      expect(wx.aux).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(103));
      expect(dx.aux).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0089 end');
    })

    /**
     * @tc.name   testVolumeUiExt0090
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0090
     * @tc.desc   touch point 104 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0090 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(104);
      const dx: ProbeResult = probeGetTouchPointDisplayX(104);
      const wy: ProbeResult = probeGetTouchPointWindowY(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(104));
      expect(wx.aux).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(104));
      expect(dx.aux).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0090 end');
    })

    /**
     * @tc.name   testVolumeUiExt0091
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0091
     * @tc.desc   touch point 105 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0091 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(105);
      const dx: ProbeResult = probeGetTouchPointDisplayX(105);
      const wy: ProbeResult = probeGetTouchPointWindowY(105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(105));
      expect(wx.aux).assertEqual(105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(105));
      expect(dx.aux).assertEqual(105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0091 end');
    })

    /**
     * @tc.name   testVolumeUiExt0092
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0092
     * @tc.desc   touch point 106 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0092 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(106);
      const dx: ProbeResult = probeGetTouchPointDisplayX(106);
      const wy: ProbeResult = probeGetTouchPointWindowY(106);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(106));
      expect(wx.aux).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(106));
      expect(dx.aux).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0092 end');
    })

    /**
     * @tc.name   testVolumeUiExt0093
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0093
     * @tc.desc   touch point 107 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0093 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(107);
      const dx: ProbeResult = probeGetTouchPointDisplayX(107);
      const wy: ProbeResult = probeGetTouchPointWindowY(107);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(107));
      expect(wx.aux).assertEqual(107);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(107));
      expect(dx.aux).assertEqual(107);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0093 end');
    })

    /**
     * @tc.name   testVolumeUiExt0094
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0094
     * @tc.desc   touch point 108 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0094 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(108);
      const dx: ProbeResult = probeGetTouchPointDisplayX(108);
      const wy: ProbeResult = probeGetTouchPointWindowY(108);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(108));
      expect(wx.aux).assertEqual(108);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(108));
      expect(dx.aux).assertEqual(108);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0094 end');
    })

    /**
     * @tc.name   testVolumeUiExt0095
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0095
     * @tc.desc   touch point 109 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0095 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(109);
      const dx: ProbeResult = probeGetTouchPointDisplayX(109);
      const wy: ProbeResult = probeGetTouchPointWindowY(109);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(109));
      expect(wx.aux).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(109));
      expect(dx.aux).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0095 end');
    })

    /**
     * @tc.name   testVolumeUiExt0096
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0096
     * @tc.desc   touch point 110 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0096 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(110);
      const dx: ProbeResult = probeGetTouchPointDisplayX(110);
      const wy: ProbeResult = probeGetTouchPointWindowY(110);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(110));
      expect(wx.aux).assertEqual(110);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(110));
      expect(dx.aux).assertEqual(110);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0096 end');
    })

    /**
     * @tc.name   testVolumeUiExt0097
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0097
     * @tc.desc   touch point 111 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0097 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(111);
      const dx: ProbeResult = probeGetTouchPointDisplayX(111);
      const wy: ProbeResult = probeGetTouchPointWindowY(111);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(111));
      expect(wx.aux).assertEqual(111);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(111));
      expect(dx.aux).assertEqual(111);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0097 end');
    })

    /**
     * @tc.name   testVolumeUiExt0098
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0098
     * @tc.desc   touch point 112 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0098 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(112);
      const dx: ProbeResult = probeGetTouchPointDisplayX(112);
      const wy: ProbeResult = probeGetTouchPointWindowY(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(112));
      expect(wx.aux).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(112));
      expect(dx.aux).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0098 end');
    })

    /**
     * @tc.name   testVolumeUiExt0099
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0099
     * @tc.desc   touch point 113 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0099 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(113);
      const dx: ProbeResult = probeGetTouchPointDisplayX(113);
      const wy: ProbeResult = probeGetTouchPointWindowY(113);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(113));
      expect(wx.aux).assertEqual(113);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(113));
      expect(dx.aux).assertEqual(113);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0099 end');
    })

    /**
     * @tc.name   testVolumeUiExt0100
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0100
     * @tc.desc   touch point 114 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0100 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(114);
      const dx: ProbeResult = probeGetTouchPointDisplayX(114);
      const wy: ProbeResult = probeGetTouchPointWindowY(114);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(114));
      expect(wx.aux).assertEqual(114);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(114));
      expect(dx.aux).assertEqual(114);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0100 end');
    })

    /**
     * @tc.name   testVolumeUiExt0101
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0101
     * @tc.desc   touch point 115 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0101 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(115);
      const dx: ProbeResult = probeGetTouchPointDisplayX(115);
      const wy: ProbeResult = probeGetTouchPointWindowY(115);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(115));
      expect(wx.aux).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(115));
      expect(dx.aux).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0101 end');
    })

    /**
     * @tc.name   testVolumeUiExt0102
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0102
     * @tc.desc   touch point 116 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0102 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(116);
      const dx: ProbeResult = probeGetTouchPointDisplayX(116);
      const wy: ProbeResult = probeGetTouchPointWindowY(116);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(116));
      expect(wx.aux).assertEqual(116);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(116));
      expect(dx.aux).assertEqual(116);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0102 end');
    })

    /**
     * @tc.name   testVolumeUiExt0103
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0103
     * @tc.desc   touch point 117 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0103 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(117);
      const dx: ProbeResult = probeGetTouchPointDisplayX(117);
      const wy: ProbeResult = probeGetTouchPointWindowY(117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(117));
      expect(wx.aux).assertEqual(117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(117));
      expect(dx.aux).assertEqual(117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0103 end');
    })

    /**
     * @tc.name   testVolumeUiExt0104
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0104
     * @tc.desc   touch point 118 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0104 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(118);
      const dx: ProbeResult = probeGetTouchPointDisplayX(118);
      const wy: ProbeResult = probeGetTouchPointWindowY(118);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(118));
      expect(wx.aux).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(118));
      expect(dx.aux).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0104 end');
    })

    /**
     * @tc.name   testVolumeUiExt0105
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0105
     * @tc.desc   touch point 119 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0105 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(119);
      const dx: ProbeResult = probeGetTouchPointDisplayX(119);
      const wy: ProbeResult = probeGetTouchPointWindowY(119);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(119));
      expect(wx.aux).assertEqual(119);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(119));
      expect(dx.aux).assertEqual(119);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0105 end');
    })

    /**
     * @tc.name   testVolumeUiExt0106
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0106
     * @tc.desc   touch point 120 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0106 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(120);
      const dx: ProbeResult = probeGetTouchPointDisplayX(120);
      const wy: ProbeResult = probeGetTouchPointWindowY(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(120));
      expect(wx.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(120));
      expect(dx.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0106 end');
    })

    /**
     * @tc.name   testVolumeUiExt0107
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0107
     * @tc.desc   touch point 121 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0107 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(121);
      const dx: ProbeResult = probeGetTouchPointDisplayX(121);
      const wy: ProbeResult = probeGetTouchPointWindowY(121);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(121));
      expect(wx.aux).assertEqual(121);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(121));
      expect(dx.aux).assertEqual(121);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0107 end');
    })

    /**
     * @tc.name   testVolumeUiExt0108
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0108
     * @tc.desc   touch point 122 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0108 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(122);
      const dx: ProbeResult = probeGetTouchPointDisplayX(122);
      const wy: ProbeResult = probeGetTouchPointWindowY(122);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(122));
      expect(wx.aux).assertEqual(122);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(122));
      expect(dx.aux).assertEqual(122);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0108 end');
    })

    /**
     * @tc.name   testVolumeUiExt0109
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0109
     * @tc.desc   touch point 123 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0109 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(123);
      const dx: ProbeResult = probeGetTouchPointDisplayX(123);
      const wy: ProbeResult = probeGetTouchPointWindowY(123);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(123));
      expect(wx.aux).assertEqual(123);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(123));
      expect(dx.aux).assertEqual(123);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0109 end');
    })

    /**
     * @tc.name   testVolumeUiExt0110
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0110
     * @tc.desc   touch point 124 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0110 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(124);
      const dx: ProbeResult = probeGetTouchPointDisplayX(124);
      const wy: ProbeResult = probeGetTouchPointWindowY(124);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(124));
      expect(wx.aux).assertEqual(124);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(124));
      expect(dx.aux).assertEqual(124);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0110 end');
    })

    /**
     * @tc.name   testVolumeUiExt0111
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0111
     * @tc.desc   touch point 125 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0111 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(125);
      const dx: ProbeResult = probeGetTouchPointDisplayX(125);
      const wy: ProbeResult = probeGetTouchPointWindowY(125);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(125));
      expect(wx.aux).assertEqual(125);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(125));
      expect(dx.aux).assertEqual(125);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0111 end');
    })

    /**
     * @tc.name   testVolumeUiExt0112
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0112
     * @tc.desc   touch point 126 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0112 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(126);
      const dx: ProbeResult = probeGetTouchPointDisplayX(126);
      const wy: ProbeResult = probeGetTouchPointWindowY(126);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(126));
      expect(wx.aux).assertEqual(126);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(126));
      expect(dx.aux).assertEqual(126);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0112 end');
    })

    /**
     * @tc.name   testVolumeUiExt0113
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0113
     * @tc.desc   touch point 127 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0113 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(127);
      const dx: ProbeResult = probeGetTouchPointDisplayX(127);
      const wy: ProbeResult = probeGetTouchPointWindowY(127);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(127));
      expect(wx.aux).assertEqual(127);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(127));
      expect(dx.aux).assertEqual(127);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0113 end');
    })

    /**
     * @tc.name   testVolumeUiExt0114
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0114
     * @tc.desc   touch point 128 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0114 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(128);
      const dx: ProbeResult = probeGetTouchPointDisplayX(128);
      const wy: ProbeResult = probeGetTouchPointWindowY(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(128));
      expect(wx.aux).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(128));
      expect(dx.aux).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0114 end');
    })

    /**
     * @tc.name   testVolumeUiExt0115
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0115
     * @tc.desc   touch point 129 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0115 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(129);
      const dx: ProbeResult = probeGetTouchPointDisplayX(129);
      const wy: ProbeResult = probeGetTouchPointWindowY(129);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(129));
      expect(wx.aux).assertEqual(129);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(129));
      expect(dx.aux).assertEqual(129);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0115 end');
    })

    /**
     * @tc.name   testVolumeUiExt0116
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0116
     * @tc.desc   touch point 130 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0116 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(130);
      const dx: ProbeResult = probeGetTouchPointDisplayX(130);
      const wy: ProbeResult = probeGetTouchPointWindowY(130);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(130));
      expect(wx.aux).assertEqual(130);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(130));
      expect(dx.aux).assertEqual(130);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0116 end');
    })

    /**
     * @tc.name   testVolumeUiExt0117
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0117
     * @tc.desc   touch point 131 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0117 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(131);
      const dx: ProbeResult = probeGetTouchPointDisplayX(131);
      const wy: ProbeResult = probeGetTouchPointWindowY(131);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(131));
      expect(wx.aux).assertEqual(131);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(131));
      expect(dx.aux).assertEqual(131);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0117 end');
    })

    /**
     * @tc.name   testVolumeUiExt0118
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0118
     * @tc.desc   touch point 132 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0118 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(132);
      const dx: ProbeResult = probeGetTouchPointDisplayX(132);
      const wy: ProbeResult = probeGetTouchPointWindowY(132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(132));
      expect(wx.aux).assertEqual(132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(132));
      expect(dx.aux).assertEqual(132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0118 end');
    })

    /**
     * @tc.name   testVolumeUiExt0119
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0119
     * @tc.desc   touch point 133 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0119 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(133);
      const dx: ProbeResult = probeGetTouchPointDisplayX(133);
      const wy: ProbeResult = probeGetTouchPointWindowY(133);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(133));
      expect(wx.aux).assertEqual(133);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(133));
      expect(dx.aux).assertEqual(133);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0119 end');
    })

    /**
     * @tc.name   testVolumeUiExt0120
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0120
     * @tc.desc   touch point 134 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0120 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(134);
      const dx: ProbeResult = probeGetTouchPointDisplayX(134);
      const wy: ProbeResult = probeGetTouchPointWindowY(134);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(134));
      expect(wx.aux).assertEqual(134);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(134));
      expect(dx.aux).assertEqual(134);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0120 end');
    })

    /**
     * @tc.name   testVolumeUiExt0121
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0121
     * @tc.desc   touch point 135 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0121 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(135);
      const dx: ProbeResult = probeGetTouchPointDisplayX(135);
      const wy: ProbeResult = probeGetTouchPointWindowY(135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(135));
      expect(wx.aux).assertEqual(135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(135));
      expect(dx.aux).assertEqual(135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0121 end');
    })

    /**
     * @tc.name   testVolumeUiExt0122
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0122
     * @tc.desc   touch point 136 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0122 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(136);
      const dx: ProbeResult = probeGetTouchPointDisplayX(136);
      const wy: ProbeResult = probeGetTouchPointWindowY(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(136));
      expect(wx.aux).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(136));
      expect(dx.aux).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0122 end');
    })

    /**
     * @tc.name   testVolumeUiExt0123
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0123
     * @tc.desc   touch point 137 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0123 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(137);
      const dx: ProbeResult = probeGetTouchPointDisplayX(137);
      const wy: ProbeResult = probeGetTouchPointWindowY(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(137));
      expect(wx.aux).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(137));
      expect(dx.aux).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0123 end');
    })

    /**
     * @tc.name   testVolumeUiExt0124
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0124
     * @tc.desc   touch point 138 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0124 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(138);
      const dx: ProbeResult = probeGetTouchPointDisplayX(138);
      const wy: ProbeResult = probeGetTouchPointWindowY(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(138));
      expect(wx.aux).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(138));
      expect(dx.aux).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0124 end');
    })

    /**
     * @tc.name   testVolumeUiExt0125
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0125
     * @tc.desc   touch point 139 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0125 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(139);
      const dx: ProbeResult = probeGetTouchPointDisplayX(139);
      const wy: ProbeResult = probeGetTouchPointWindowY(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(139));
      expect(wx.aux).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(139));
      expect(dx.aux).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0125 end');
    })

    /**
     * @tc.name   testVolumeUiExt0126
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0126
     * @tc.desc   touch point 140 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0126 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(140);
      const dx: ProbeResult = probeGetTouchPointDisplayX(140);
      const wy: ProbeResult = probeGetTouchPointWindowY(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(140));
      expect(wx.aux).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(140));
      expect(dx.aux).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0126 end');
    })

    /**
     * @tc.name   testVolumeUiExt0127
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0127
     * @tc.desc   touch point 141 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0127 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(141);
      const dx: ProbeResult = probeGetTouchPointDisplayX(141);
      const wy: ProbeResult = probeGetTouchPointWindowY(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(141));
      expect(wx.aux).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(141));
      expect(dx.aux).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0127 end');
    })

    /**
     * @tc.name   testVolumeUiExt0128
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0128
     * @tc.desc   touch point 142 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0128 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(142);
      const dx: ProbeResult = probeGetTouchPointDisplayX(142);
      const wy: ProbeResult = probeGetTouchPointWindowY(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(142));
      expect(wx.aux).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(142));
      expect(dx.aux).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0128 end');
    })

    /**
     * @tc.name   testVolumeUiExt0129
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0129
     * @tc.desc   touch point 143 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0129 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(143);
      const dx: ProbeResult = probeGetTouchPointDisplayX(143);
      const wy: ProbeResult = probeGetTouchPointWindowY(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(143));
      expect(wx.aux).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(143));
      expect(dx.aux).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0129 end');
    })

    /**
     * @tc.name   testVolumeUiExt0130
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0130
     * @tc.desc   point 80 keeps window and display probes aligned on both axes
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0130 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(80);
      const dx: ProbeResult = probeGetTouchPointDisplayX(80);
      const wy: ProbeResult = probeGetTouchPointWindowY(80);
      const dy: ProbeResult = probeGetTouchPointDisplayY(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wy.code), String(dy.code));
      expect(wy.code).assertEqual(dy.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(80));
      expect(wx.aux).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dy.value >= 0));
      expect(dy.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0130 end');
    })

  })
}
