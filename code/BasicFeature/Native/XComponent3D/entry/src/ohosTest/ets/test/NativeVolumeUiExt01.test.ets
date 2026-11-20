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

export default function nativeVolumeUiExt01Test() {
  resetYieldCounter();
  describe('NativeVolumeUiExt01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeUiExt0001
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0001
     * @tc.desc   touch point 16 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0001 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(16);
      const dx: ProbeResult = probeGetTouchPointDisplayX(16);
      const wy: ProbeResult = probeGetTouchPointWindowY(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(16));
      expect(wx.aux).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(16));
      expect(dx.aux).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0001 end');
    })

    /**
     * @tc.name   testVolumeUiExt0002
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0002
     * @tc.desc   touch point 17 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0002 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(17);
      const dx: ProbeResult = probeGetTouchPointDisplayX(17);
      const wy: ProbeResult = probeGetTouchPointWindowY(17);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(17));
      expect(wx.aux).assertEqual(17);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(17));
      expect(dx.aux).assertEqual(17);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0002 end');
    })

    /**
     * @tc.name   testVolumeUiExt0003
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0003
     * @tc.desc   touch point 18 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0003 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(18);
      const dx: ProbeResult = probeGetTouchPointDisplayX(18);
      const wy: ProbeResult = probeGetTouchPointWindowY(18);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(18));
      expect(wx.aux).assertEqual(18);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(18));
      expect(dx.aux).assertEqual(18);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0003 end');
    })

    /**
     * @tc.name   testVolumeUiExt0004
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0004
     * @tc.desc   touch point 19 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0004 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(19);
      const dx: ProbeResult = probeGetTouchPointDisplayX(19);
      const wy: ProbeResult = probeGetTouchPointWindowY(19);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(19));
      expect(wx.aux).assertEqual(19);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(19));
      expect(dx.aux).assertEqual(19);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0004 end');
    })

    /**
     * @tc.name   testVolumeUiExt0005
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0005
     * @tc.desc   touch point 20 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0005 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(20);
      const dx: ProbeResult = probeGetTouchPointDisplayX(20);
      const wy: ProbeResult = probeGetTouchPointWindowY(20);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(20));
      expect(wx.aux).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(20));
      expect(dx.aux).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0005 end');
    })

    /**
     * @tc.name   testVolumeUiExt0006
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0006
     * @tc.desc   touch point 21 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0006 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(21);
      const dx: ProbeResult = probeGetTouchPointDisplayX(21);
      const wy: ProbeResult = probeGetTouchPointWindowY(21);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(21));
      expect(wx.aux).assertEqual(21);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(21));
      expect(dx.aux).assertEqual(21);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0006 end');
    })

    /**
     * @tc.name   testVolumeUiExt0007
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0007
     * @tc.desc   touch point 22 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0007 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(22);
      const dx: ProbeResult = probeGetTouchPointDisplayX(22);
      const wy: ProbeResult = probeGetTouchPointWindowY(22);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(22));
      expect(wx.aux).assertEqual(22);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(22));
      expect(dx.aux).assertEqual(22);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0007 end');
    })

    /**
     * @tc.name   testVolumeUiExt0008
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0008
     * @tc.desc   touch point 23 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0008 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(23);
      const dx: ProbeResult = probeGetTouchPointDisplayX(23);
      const wy: ProbeResult = probeGetTouchPointWindowY(23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(23));
      expect(wx.aux).assertEqual(23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(23));
      expect(dx.aux).assertEqual(23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0008 end');
    })

    /**
     * @tc.name   testVolumeUiExt0009
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0009
     * @tc.desc   touch point 24 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0009 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(24);
      const dx: ProbeResult = probeGetTouchPointDisplayX(24);
      const wy: ProbeResult = probeGetTouchPointWindowY(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(24));
      expect(wx.aux).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(24));
      expect(dx.aux).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0009 end');
    })

    /**
     * @tc.name   testVolumeUiExt0010
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0010
     * @tc.desc   touch point 25 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0010 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(25);
      const dx: ProbeResult = probeGetTouchPointDisplayX(25);
      const wy: ProbeResult = probeGetTouchPointWindowY(25);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(25));
      expect(wx.aux).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(25));
      expect(dx.aux).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0010 end');
    })

    /**
     * @tc.name   testVolumeUiExt0011
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0011
     * @tc.desc   touch point 26 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0011 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(26);
      const dx: ProbeResult = probeGetTouchPointDisplayX(26);
      const wy: ProbeResult = probeGetTouchPointWindowY(26);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(26));
      expect(wx.aux).assertEqual(26);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(26));
      expect(dx.aux).assertEqual(26);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0011 end');
    })

    /**
     * @tc.name   testVolumeUiExt0012
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0012
     * @tc.desc   touch point 27 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0012 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(27);
      const dx: ProbeResult = probeGetTouchPointDisplayX(27);
      const wy: ProbeResult = probeGetTouchPointWindowY(27);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(27));
      expect(wx.aux).assertEqual(27);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(27));
      expect(dx.aux).assertEqual(27);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0012 end');
    })

    /**
     * @tc.name   testVolumeUiExt0013
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0013
     * @tc.desc   touch point 28 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0013 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(28);
      const dx: ProbeResult = probeGetTouchPointDisplayX(28);
      const wy: ProbeResult = probeGetTouchPointWindowY(28);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(28));
      expect(wx.aux).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(28));
      expect(dx.aux).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0013 end');
    })

    /**
     * @tc.name   testVolumeUiExt0014
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0014
     * @tc.desc   touch point 29 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0014 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(29);
      const dx: ProbeResult = probeGetTouchPointDisplayX(29);
      const wy: ProbeResult = probeGetTouchPointWindowY(29);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(29));
      expect(wx.aux).assertEqual(29);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(29));
      expect(dx.aux).assertEqual(29);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0014 end');
    })

    /**
     * @tc.name   testVolumeUiExt0015
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0015
     * @tc.desc   touch point 30 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0015 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(30);
      const dx: ProbeResult = probeGetTouchPointDisplayX(30);
      const wy: ProbeResult = probeGetTouchPointWindowY(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(30));
      expect(wx.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(30));
      expect(dx.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0015 end');
    })

    /**
     * @tc.name   testVolumeUiExt0016
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0016
     * @tc.desc   touch point 31 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0016 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(31);
      const dx: ProbeResult = probeGetTouchPointDisplayX(31);
      const wy: ProbeResult = probeGetTouchPointWindowY(31);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(31));
      expect(wx.aux).assertEqual(31);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(31));
      expect(dx.aux).assertEqual(31);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0016 end');
    })

    /**
     * @tc.name   testVolumeUiExt0017
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0017
     * @tc.desc   touch point 32 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0017 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(32);
      const dx: ProbeResult = probeGetTouchPointDisplayX(32);
      const wy: ProbeResult = probeGetTouchPointWindowY(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(32));
      expect(wx.aux).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(32));
      expect(dx.aux).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0017 end');
    })

    /**
     * @tc.name   testVolumeUiExt0018
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0018
     * @tc.desc   touch point 33 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0018 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(33);
      const dx: ProbeResult = probeGetTouchPointDisplayX(33);
      const wy: ProbeResult = probeGetTouchPointWindowY(33);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(33));
      expect(wx.aux).assertEqual(33);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(33));
      expect(dx.aux).assertEqual(33);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0018 end');
    })

    /**
     * @tc.name   testVolumeUiExt0019
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0019
     * @tc.desc   touch point 34 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0019 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(34);
      const dx: ProbeResult = probeGetTouchPointDisplayX(34);
      const wy: ProbeResult = probeGetTouchPointWindowY(34);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(34));
      expect(wx.aux).assertEqual(34);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(34));
      expect(dx.aux).assertEqual(34);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0019 end');
    })

    /**
     * @tc.name   testVolumeUiExt0020
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0020
     * @tc.desc   touch point 35 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0020 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(35);
      const dx: ProbeResult = probeGetTouchPointDisplayX(35);
      const wy: ProbeResult = probeGetTouchPointWindowY(35);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(35));
      expect(wx.aux).assertEqual(35);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(35));
      expect(dx.aux).assertEqual(35);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0020 end');
    })

    /**
     * @tc.name   testVolumeUiExt0021
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0021
     * @tc.desc   touch point 36 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0021 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(36);
      const dx: ProbeResult = probeGetTouchPointDisplayX(36);
      const wy: ProbeResult = probeGetTouchPointWindowY(36);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(36));
      expect(wx.aux).assertEqual(36);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(36));
      expect(dx.aux).assertEqual(36);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0021 end');
    })

    /**
     * @tc.name   testVolumeUiExt0022
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0022
     * @tc.desc   touch point 37 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0022 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(37);
      const dx: ProbeResult = probeGetTouchPointDisplayX(37);
      const wy: ProbeResult = probeGetTouchPointWindowY(37);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(37));
      expect(wx.aux).assertEqual(37);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(37));
      expect(dx.aux).assertEqual(37);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0022 end');
    })

    /**
     * @tc.name   testVolumeUiExt0023
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0023
     * @tc.desc   touch point 38 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0023 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(38);
      const dx: ProbeResult = probeGetTouchPointDisplayX(38);
      const wy: ProbeResult = probeGetTouchPointWindowY(38);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(38));
      expect(wx.aux).assertEqual(38);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(38));
      expect(dx.aux).assertEqual(38);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0023 end');
    })

    /**
     * @tc.name   testVolumeUiExt0024
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0024
     * @tc.desc   touch point 39 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0024 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(39);
      const dx: ProbeResult = probeGetTouchPointDisplayX(39);
      const wy: ProbeResult = probeGetTouchPointWindowY(39);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(39));
      expect(wx.aux).assertEqual(39);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(39));
      expect(dx.aux).assertEqual(39);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0024 end');
    })

    /**
     * @tc.name   testVolumeUiExt0025
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0025
     * @tc.desc   touch point 40 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0025 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(40);
      const dx: ProbeResult = probeGetTouchPointDisplayX(40);
      const wy: ProbeResult = probeGetTouchPointWindowY(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(40));
      expect(wx.aux).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(40));
      expect(dx.aux).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0025 end');
    })

    /**
     * @tc.name   testVolumeUiExt0026
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0026
     * @tc.desc   touch point 41 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0026 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(41);
      const dx: ProbeResult = probeGetTouchPointDisplayX(41);
      const wy: ProbeResult = probeGetTouchPointWindowY(41);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(41));
      expect(wx.aux).assertEqual(41);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(41));
      expect(dx.aux).assertEqual(41);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0026 end');
    })

    /**
     * @tc.name   testVolumeUiExt0027
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0027
     * @tc.desc   touch point 42 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0027 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(42);
      const dx: ProbeResult = probeGetTouchPointDisplayX(42);
      const wy: ProbeResult = probeGetTouchPointWindowY(42);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(42));
      expect(wx.aux).assertEqual(42);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(42));
      expect(dx.aux).assertEqual(42);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0027 end');
    })

    /**
     * @tc.name   testVolumeUiExt0028
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0028
     * @tc.desc   touch point 43 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0028 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(43);
      const dx: ProbeResult = probeGetTouchPointDisplayX(43);
      const wy: ProbeResult = probeGetTouchPointWindowY(43);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(43));
      expect(wx.aux).assertEqual(43);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(43));
      expect(dx.aux).assertEqual(43);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0028 end');
    })

    /**
     * @tc.name   testVolumeUiExt0029
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0029
     * @tc.desc   touch point 44 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0029 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(44);
      const dx: ProbeResult = probeGetTouchPointDisplayX(44);
      const wy: ProbeResult = probeGetTouchPointWindowY(44);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(44));
      expect(wx.aux).assertEqual(44);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(44));
      expect(dx.aux).assertEqual(44);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0029 end');
    })

    /**
     * @tc.name   testVolumeUiExt0030
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0030
     * @tc.desc   touch point 45 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0030 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(45);
      const dx: ProbeResult = probeGetTouchPointDisplayX(45);
      const wy: ProbeResult = probeGetTouchPointWindowY(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(45));
      expect(wx.aux).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(45));
      expect(dx.aux).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0030 end');
    })

    /**
     * @tc.name   testVolumeUiExt0031
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0031
     * @tc.desc   touch point 46 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0031 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(46);
      const dx: ProbeResult = probeGetTouchPointDisplayX(46);
      const wy: ProbeResult = probeGetTouchPointWindowY(46);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(46));
      expect(wx.aux).assertEqual(46);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(46));
      expect(dx.aux).assertEqual(46);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0031 end');
    })

    /**
     * @tc.name   testVolumeUiExt0032
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0032
     * @tc.desc   touch point 47 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0032 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(47);
      const dx: ProbeResult = probeGetTouchPointDisplayX(47);
      const wy: ProbeResult = probeGetTouchPointWindowY(47);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(47));
      expect(wx.aux).assertEqual(47);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(47));
      expect(dx.aux).assertEqual(47);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0032 end');
    })

    /**
     * @tc.name   testVolumeUiExt0033
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0033
     * @tc.desc   touch point 48 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0033 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(48);
      const dx: ProbeResult = probeGetTouchPointDisplayX(48);
      const wy: ProbeResult = probeGetTouchPointWindowY(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(48));
      expect(wx.aux).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(48));
      expect(dx.aux).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0033 end');
    })

    /**
     * @tc.name   testVolumeUiExt0034
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0034
     * @tc.desc   touch point 49 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0034 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(49);
      const dx: ProbeResult = probeGetTouchPointDisplayX(49);
      const wy: ProbeResult = probeGetTouchPointWindowY(49);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(49));
      expect(wx.aux).assertEqual(49);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(49));
      expect(dx.aux).assertEqual(49);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0034 end');
    })

    /**
     * @tc.name   testVolumeUiExt0035
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0035
     * @tc.desc   touch point 50 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0035 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(50);
      const dx: ProbeResult = probeGetTouchPointDisplayX(50);
      const wy: ProbeResult = probeGetTouchPointWindowY(50);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(50));
      expect(wx.aux).assertEqual(50);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(50));
      expect(dx.aux).assertEqual(50);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0035 end');
    })

    /**
     * @tc.name   testVolumeUiExt0036
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0036
     * @tc.desc   touch point 51 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0036 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(51);
      const dx: ProbeResult = probeGetTouchPointDisplayX(51);
      const wy: ProbeResult = probeGetTouchPointWindowY(51);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(51));
      expect(wx.aux).assertEqual(51);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(51));
      expect(dx.aux).assertEqual(51);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0036 end');
    })

    /**
     * @tc.name   testVolumeUiExt0037
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0037
     * @tc.desc   touch point 52 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0037 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(52);
      const dx: ProbeResult = probeGetTouchPointDisplayX(52);
      const wy: ProbeResult = probeGetTouchPointWindowY(52);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(52));
      expect(wx.aux).assertEqual(52);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(52));
      expect(dx.aux).assertEqual(52);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0037 end');
    })

    /**
     * @tc.name   testVolumeUiExt0038
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0038
     * @tc.desc   touch point 53 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0038 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(53);
      const dx: ProbeResult = probeGetTouchPointDisplayX(53);
      const wy: ProbeResult = probeGetTouchPointWindowY(53);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(53));
      expect(wx.aux).assertEqual(53);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(53));
      expect(dx.aux).assertEqual(53);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0038 end');
    })

    /**
     * @tc.name   testVolumeUiExt0039
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0039
     * @tc.desc   touch point 54 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0039 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(54);
      const dx: ProbeResult = probeGetTouchPointDisplayX(54);
      const wy: ProbeResult = probeGetTouchPointWindowY(54);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(54));
      expect(wx.aux).assertEqual(54);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(54));
      expect(dx.aux).assertEqual(54);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0039 end');
    })

    /**
     * @tc.name   testVolumeUiExt0040
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0040
     * @tc.desc   touch point 55 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0040 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(55);
      const dx: ProbeResult = probeGetTouchPointDisplayX(55);
      const wy: ProbeResult = probeGetTouchPointWindowY(55);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(55));
      expect(wx.aux).assertEqual(55);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(55));
      expect(dx.aux).assertEqual(55);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0040 end');
    })

    /**
     * @tc.name   testVolumeUiExt0041
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0041
     * @tc.desc   touch point 56 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0041 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(56);
      const dx: ProbeResult = probeGetTouchPointDisplayX(56);
      const wy: ProbeResult = probeGetTouchPointWindowY(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(56));
      expect(wx.aux).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(56));
      expect(dx.aux).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0041 end');
    })

    /**
     * @tc.name   testVolumeUiExt0042
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0042
     * @tc.desc   touch point 57 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0042 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(57);
      const dx: ProbeResult = probeGetTouchPointDisplayX(57);
      const wy: ProbeResult = probeGetTouchPointWindowY(57);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(57));
      expect(wx.aux).assertEqual(57);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(57));
      expect(dx.aux).assertEqual(57);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0042 end');
    })

    /**
     * @tc.name   testVolumeUiExt0043
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0043
     * @tc.desc   touch point 58 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0043 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(58);
      const dx: ProbeResult = probeGetTouchPointDisplayX(58);
      const wy: ProbeResult = probeGetTouchPointWindowY(58);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(58));
      expect(wx.aux).assertEqual(58);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(58));
      expect(dx.aux).assertEqual(58);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0043 end');
    })

    /**
     * @tc.name   testVolumeUiExt0044
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0044
     * @tc.desc   touch point 59 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0044 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(59);
      const dx: ProbeResult = probeGetTouchPointDisplayX(59);
      const wy: ProbeResult = probeGetTouchPointWindowY(59);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(59));
      expect(wx.aux).assertEqual(59);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(59));
      expect(dx.aux).assertEqual(59);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0044 end');
    })

    /**
     * @tc.name   testVolumeUiExt0045
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0045
     * @tc.desc   touch point 60 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0045 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(60);
      const dx: ProbeResult = probeGetTouchPointDisplayX(60);
      const wy: ProbeResult = probeGetTouchPointWindowY(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(60));
      expect(wx.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(60));
      expect(dx.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0045 end');
    })

    /**
     * @tc.name   testVolumeUiExt0046
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0046
     * @tc.desc   touch point 61 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0046 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(61);
      const dx: ProbeResult = probeGetTouchPointDisplayX(61);
      const wy: ProbeResult = probeGetTouchPointWindowY(61);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(61));
      expect(wx.aux).assertEqual(61);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(61));
      expect(dx.aux).assertEqual(61);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0046 end');
    })

    /**
     * @tc.name   testVolumeUiExt0047
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0047
     * @tc.desc   touch point 62 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0047 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(62);
      const dx: ProbeResult = probeGetTouchPointDisplayX(62);
      const wy: ProbeResult = probeGetTouchPointWindowY(62);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(62));
      expect(wx.aux).assertEqual(62);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(62));
      expect(dx.aux).assertEqual(62);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0047 end');
    })

    /**
     * @tc.name   testVolumeUiExt0048
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0048
     * @tc.desc   touch point 63 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0048 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(63);
      const dx: ProbeResult = probeGetTouchPointDisplayX(63);
      const wy: ProbeResult = probeGetTouchPointWindowY(63);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(63));
      expect(wx.aux).assertEqual(63);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(63));
      expect(dx.aux).assertEqual(63);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0048 end');
    })

    /**
     * @tc.name   testVolumeUiExt0049
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0049
     * @tc.desc   touch point 64 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0049 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(64);
      const dx: ProbeResult = probeGetTouchPointDisplayX(64);
      const wy: ProbeResult = probeGetTouchPointWindowY(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(64));
      expect(wx.aux).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(64));
      expect(dx.aux).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0049 end');
    })

    /**
     * @tc.name   testVolumeUiExt0050
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0050
     * @tc.desc   touch point 65 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0050 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(65);
      const dx: ProbeResult = probeGetTouchPointDisplayX(65);
      const wy: ProbeResult = probeGetTouchPointWindowY(65);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(65));
      expect(wx.aux).assertEqual(65);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(65));
      expect(dx.aux).assertEqual(65);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0050 end');
    })

    /**
     * @tc.name   testVolumeUiExt0051
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0051
     * @tc.desc   touch point 66 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0051 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(66);
      const dx: ProbeResult = probeGetTouchPointDisplayX(66);
      const wy: ProbeResult = probeGetTouchPointWindowY(66);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(66));
      expect(wx.aux).assertEqual(66);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(66));
      expect(dx.aux).assertEqual(66);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0051 end');
    })

    /**
     * @tc.name   testVolumeUiExt0052
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0052
     * @tc.desc   touch point 67 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0052 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(67);
      const dx: ProbeResult = probeGetTouchPointDisplayX(67);
      const wy: ProbeResult = probeGetTouchPointWindowY(67);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(67));
      expect(wx.aux).assertEqual(67);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(67));
      expect(dx.aux).assertEqual(67);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0052 end');
    })

    /**
     * @tc.name   testVolumeUiExt0053
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0053
     * @tc.desc   touch point 68 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0053 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(68);
      const dx: ProbeResult = probeGetTouchPointDisplayX(68);
      const wy: ProbeResult = probeGetTouchPointWindowY(68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(68));
      expect(wx.aux).assertEqual(68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(68));
      expect(dx.aux).assertEqual(68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0053 end');
    })

    /**
     * @tc.name   testVolumeUiExt0054
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0054
     * @tc.desc   touch point 69 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0054 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(69);
      const dx: ProbeResult = probeGetTouchPointDisplayX(69);
      const wy: ProbeResult = probeGetTouchPointWindowY(69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(69));
      expect(wx.aux).assertEqual(69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(69));
      expect(dx.aux).assertEqual(69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0054 end');
    })

    /**
     * @tc.name   testVolumeUiExt0055
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0055
     * @tc.desc   touch point 70 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0055 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(70);
      const dx: ProbeResult = probeGetTouchPointDisplayX(70);
      const wy: ProbeResult = probeGetTouchPointWindowY(70);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(70));
      expect(wx.aux).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(70));
      expect(dx.aux).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0055 end');
    })

    /**
     * @tc.name   testVolumeUiExt0056
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0056
     * @tc.desc   touch point 71 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0056 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(71);
      const dx: ProbeResult = probeGetTouchPointDisplayX(71);
      const wy: ProbeResult = probeGetTouchPointWindowY(71);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(71));
      expect(wx.aux).assertEqual(71);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(71));
      expect(dx.aux).assertEqual(71);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0056 end');
    })

    /**
     * @tc.name   testVolumeUiExt0057
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0057
     * @tc.desc   touch point 72 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0057 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(72);
      const dx: ProbeResult = probeGetTouchPointDisplayX(72);
      const wy: ProbeResult = probeGetTouchPointWindowY(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(72));
      expect(wx.aux).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(72));
      expect(dx.aux).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0057 end');
    })

    /**
     * @tc.name   testVolumeUiExt0058
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0058
     * @tc.desc   touch point 73 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0058 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(73);
      const dx: ProbeResult = probeGetTouchPointDisplayX(73);
      const wy: ProbeResult = probeGetTouchPointWindowY(73);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(73));
      expect(wx.aux).assertEqual(73);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(73));
      expect(dx.aux).assertEqual(73);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0058 end');
    })

    /**
     * @tc.name   testVolumeUiExt0059
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0059
     * @tc.desc   touch point 74 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0059 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(74);
      const dx: ProbeResult = probeGetTouchPointDisplayX(74);
      const wy: ProbeResult = probeGetTouchPointWindowY(74);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(74));
      expect(wx.aux).assertEqual(74);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(74));
      expect(dx.aux).assertEqual(74);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0059 end');
    })

    /**
     * @tc.name   testVolumeUiExt0060
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0060
     * @tc.desc   touch point 75 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0060 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(75);
      const dx: ProbeResult = probeGetTouchPointDisplayX(75);
      const wy: ProbeResult = probeGetTouchPointWindowY(75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(75));
      expect(wx.aux).assertEqual(75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(75));
      expect(dx.aux).assertEqual(75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0060 end');
    })

    /**
     * @tc.name   testVolumeUiExt0061
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0061
     * @tc.desc   touch point 76 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0061 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(76);
      const dx: ProbeResult = probeGetTouchPointDisplayX(76);
      const wy: ProbeResult = probeGetTouchPointWindowY(76);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(76));
      expect(wx.aux).assertEqual(76);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(76));
      expect(dx.aux).assertEqual(76);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0061 end');
    })

    /**
     * @tc.name   testVolumeUiExt0062
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0062
     * @tc.desc   touch point 77 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0062 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(77);
      const dx: ProbeResult = probeGetTouchPointDisplayX(77);
      const wy: ProbeResult = probeGetTouchPointWindowY(77);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(77));
      expect(wx.aux).assertEqual(77);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(77));
      expect(dx.aux).assertEqual(77);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0062 end');
    })

    /**
     * @tc.name   testVolumeUiExt0063
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0063
     * @tc.desc   touch point 78 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0063 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(78);
      const dx: ProbeResult = probeGetTouchPointDisplayX(78);
      const wy: ProbeResult = probeGetTouchPointWindowY(78);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(78));
      expect(wx.aux).assertEqual(78);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(78));
      expect(dx.aux).assertEqual(78);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0063 end');
    })

    /**
     * @tc.name   testVolumeUiExt0064
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0064
     * @tc.desc   touch point 79 keeps both coordinate probes on one code path
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0064 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(79);
      const dx: ProbeResult = probeGetTouchPointDisplayX(79);
      const wy: ProbeResult = probeGetTouchPointWindowY(79);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(79));
      expect(wx.aux).assertEqual(79);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(dx.aux), String(79));
      expect(dx.aux).assertEqual(79);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.value), String(wy.value));
      expect(wx.value).assertEqual(wy.value);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dx.value >= 0));
      expect(dx.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0064 end');
    })

    /**
     * @tc.name   testVolumeUiExt0065
     * @tc.number SUB_XCOMPONENT3D_VOLUIEXT_0065
     * @tc.desc   point 16 keeps window and display probes aligned on both axes
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeUiExt0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0065 begin');
      const wx: ProbeResult = probeGetTouchPointWindowX(16);
      const dx: ProbeResult = probeGetTouchPointDisplayX(16);
      const wy: ProbeResult = probeGetTouchPointWindowY(16);
      const dy: ProbeResult = probeGetTouchPointDisplayY(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.code), String(dx.code));
      expect(wx.code).assertEqual(dx.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wy.code), String(dy.code));
      expect(wy.code).assertEqual(dy.code);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wx.aux), String(16));
      expect(wx.aux).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(dy.value >= 0));
      expect(dy.value >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeUiExt0065 end');
    })

  })
}
