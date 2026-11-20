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
import { ProbeResult, probeSetExpectedFrameRateRange } from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeFps301Test() {
  resetYieldCounter();
  describe('NativeVolumeFps301', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeFps30001
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0001
     * @tc.desc   range 24/60 with expected 42 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30001 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 60, 42);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-36));
      expect(result.value - result.aux).assertEqual(-36);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30001 end');
    })

    /**
     * @tc.name   testVolumeFps30002
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0002
     * @tc.desc   range 24/90 with expected 57 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30002 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 90, 57);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-66));
      expect(result.value - result.aux).assertEqual(-66);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30002 end');
    })

    /**
     * @tc.name   testVolumeFps30003
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0003
     * @tc.desc   range 24/120 with expected 72 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30003 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 120, 72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-96));
      expect(result.value - result.aux).assertEqual(-96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30003 end');
    })

    /**
     * @tc.name   testVolumeFps30004
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0004
     * @tc.desc   range 24/144 with expected 84 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30004 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 144, 84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-120));
      expect(result.value - result.aux).assertEqual(-120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30004 end');
    })

    /**
     * @tc.name   testVolumeFps30005
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0005
     * @tc.desc   range 24/165 with expected 94 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30005 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 165, 94);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(165));
      expect(result.aux).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-141));
      expect(result.value - result.aux).assertEqual(-141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30005 end');
    })

    /**
     * @tc.name   testVolumeFps30006
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0006
     * @tc.desc   range 24/240 with expected 132 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30006 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 240, 132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-216));
      expect(result.value - result.aux).assertEqual(-216);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30006 end');
    })

    /**
     * @tc.name   testVolumeFps30007
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0007
     * @tc.desc   range 30/60 with expected 45 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30007 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30007 end');
    })

    /**
     * @tc.name   testVolumeFps30008
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0008
     * @tc.desc   range 30/90 with expected 60 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30008 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 90, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-60));
      expect(result.value - result.aux).assertEqual(-60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30008 end');
    })

    /**
     * @tc.name   testVolumeFps30009
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0009
     * @tc.desc   range 30/120 with expected 75 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30009 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-90));
      expect(result.value - result.aux).assertEqual(-90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30009 end');
    })

    /**
     * @tc.name   testVolumeFps30010
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0010
     * @tc.desc   range 30/144 with expected 87 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30010 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 144, 87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-114));
      expect(result.value - result.aux).assertEqual(-114);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30010 end');
    })

    /**
     * @tc.name   testVolumeFps30011
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0011
     * @tc.desc   range 30/165 with expected 97 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30011 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 165, 97);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(165));
      expect(result.aux).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-135));
      expect(result.value - result.aux).assertEqual(-135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30011 end');
    })

    /**
     * @tc.name   testVolumeFps30012
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0012
     * @tc.desc   range 30/240 with expected 135 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30012 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 240, 135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-210));
      expect(result.value - result.aux).assertEqual(-210);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30012 end');
    })

    /**
     * @tc.name   testVolumeFps30013
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0013
     * @tc.desc   range 48/60 with expected 54 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30013 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 60, 54);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-12));
      expect(result.value - result.aux).assertEqual(-12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30013 end');
    })

    /**
     * @tc.name   testVolumeFps30014
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0014
     * @tc.desc   range 48/90 with expected 69 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30014 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 90, 69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-42));
      expect(result.value - result.aux).assertEqual(-42);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30014 end');
    })

    /**
     * @tc.name   testVolumeFps30015
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0015
     * @tc.desc   range 48/120 with expected 84 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30015 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 120, 84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-72));
      expect(result.value - result.aux).assertEqual(-72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30015 end');
    })

    /**
     * @tc.name   testVolumeFps30016
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0016
     * @tc.desc   range 48/144 with expected 96 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30016 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 144, 96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-96));
      expect(result.value - result.aux).assertEqual(-96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30016 end');
    })

    /**
     * @tc.name   testVolumeFps30017
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0017
     * @tc.desc   range 48/165 with expected 106 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30017 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 165, 106);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(165));
      expect(result.aux).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-117));
      expect(result.value - result.aux).assertEqual(-117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30017 end');
    })

    /**
     * @tc.name   testVolumeFps30018
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0018
     * @tc.desc   range 48/240 with expected 144 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30018 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 240, 144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-192));
      expect(result.value - result.aux).assertEqual(-192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30018 end');
    })

    /**
     * @tc.name   testVolumeFps30019
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0019
     * @tc.desc   range 60/90 with expected 75 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30019 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 90, 75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30019 end');
    })

    /**
     * @tc.name   testVolumeFps30020
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0020
     * @tc.desc   range 60/120 with expected 90 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30020 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-60));
      expect(result.value - result.aux).assertEqual(-60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30020 end');
    })

    /**
     * @tc.name   testVolumeFps30021
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0021
     * @tc.desc   range 60/144 with expected 102 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30021 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 144, 102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-84));
      expect(result.value - result.aux).assertEqual(-84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30021 end');
    })

    /**
     * @tc.name   testVolumeFps30022
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0022
     * @tc.desc   range 60/165 with expected 112 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30022 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 165, 112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(165));
      expect(result.aux).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-105));
      expect(result.value - result.aux).assertEqual(-105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30022 end');
    })

    /**
     * @tc.name   testVolumeFps30023
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0023
     * @tc.desc   range 60/240 with expected 150 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30023 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 240, 150);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-180));
      expect(result.value - result.aux).assertEqual(-180);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30023 end');
    })

    /**
     * @tc.name   testVolumeFps30024
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0024
     * @tc.desc   range 90/120 with expected 105 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30024 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 120, 105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30024 end');
    })

    /**
     * @tc.name   testVolumeFps30025
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0025
     * @tc.desc   range 90/144 with expected 117 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30025 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 144, 117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-54));
      expect(result.value - result.aux).assertEqual(-54);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30025 end');
    })

    /**
     * @tc.name   testVolumeFps30026
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0026
     * @tc.desc   range 90/165 with expected 127 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30026 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 165, 127);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(165));
      expect(result.aux).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-75));
      expect(result.value - result.aux).assertEqual(-75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30026 end');
    })

    /**
     * @tc.name   testVolumeFps30027
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0027
     * @tc.desc   range 90/240 with expected 165 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30027 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 240, 165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-150));
      expect(result.value - result.aux).assertEqual(-150);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30027 end');
    })

    /**
     * @tc.name   testVolumeFps30028
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0028
     * @tc.desc   range 120/144 with expected 132 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30028 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 144, 132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-24));
      expect(result.value - result.aux).assertEqual(-24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30028 end');
    })

    /**
     * @tc.name   testVolumeFps30029
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0029
     * @tc.desc   range 120/165 with expected 142 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30029 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 165, 142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(165));
      expect(result.aux).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-45));
      expect(result.value - result.aux).assertEqual(-45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30029 end');
    })

    /**
     * @tc.name   testVolumeFps30030
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0030
     * @tc.desc   range 120/240 with expected 180 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30030 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 240, 180);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-120));
      expect(result.value - result.aux).assertEqual(-120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30030 end');
    })

    /**
     * @tc.name   testVolumeFps30031
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0031
     * @tc.desc   range 30/30 with expected 30 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30031 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 30, 30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(30));
      expect(result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30031 end');
    })

    /**
     * @tc.name   testVolumeFps30032
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0032
     * @tc.desc   range 60/30 with expected 30 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30032 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 30, 30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(30));
      expect(result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(30));
      expect(result.value - result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30032 end');
    })

    /**
     * @tc.name   testVolumeFps30033
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0033
     * @tc.desc   range 60/60 with expected 60 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30033 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 60, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30033 end');
    })

    /**
     * @tc.name   testVolumeFps30034
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0034
     * @tc.desc   range 90/30 with expected 30 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30034 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 30, 30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(30));
      expect(result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(60));
      expect(result.value - result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30034 end');
    })

    /**
     * @tc.name   testVolumeFps30035
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0035
     * @tc.desc   range 90/60 with expected 60 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30035 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 60, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(30));
      expect(result.value - result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30035 end');
    })

    /**
     * @tc.name   testVolumeFps30036
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0036
     * @tc.desc   range 90/90 with expected 90 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30036 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 90, 90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30036 end');
    })

    /**
     * @tc.name   testVolumeFps30037
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0037
     * @tc.desc   range 120/30 with expected 30 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30037 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 30, 30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(30));
      expect(result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(90));
      expect(result.value - result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30037 end');
    })

    /**
     * @tc.name   testVolumeFps30038
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0038
     * @tc.desc   range 120/60 with expected 60 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30038 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 60, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(60));
      expect(result.value - result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30038 end');
    })

    /**
     * @tc.name   testVolumeFps30039
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0039
     * @tc.desc   range 120/90 with expected 90 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30039 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 90, 90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(30));
      expect(result.value - result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30039 end');
    })

    /**
     * @tc.name   testVolumeFps30040
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0040
     * @tc.desc   range 120/120 with expected 120 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30040 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 120, 120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30040 end');
    })

    /**
     * @tc.name   testVolumeFps30041
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0041
     * @tc.desc   range 30/60 with expected 61 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30041 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 61);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30041 end');
    })

    /**
     * @tc.name   testVolumeFps30042
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0042
     * @tc.desc   range 30/60 with expected 29 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30042 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 29);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30042 end');
    })

    /**
     * @tc.name   testVolumeFps30043
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0043
     * @tc.desc   range 30/30 with expected 30 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30043 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 30, 30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(30));
      expect(result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30043 end');
    })

    /**
     * @tc.name   testVolumeFps30044
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0044
     * @tc.desc   range 60/90 with expected 91 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30044 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 90, 91);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30044 end');
    })

    /**
     * @tc.name   testVolumeFps30045
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0045
     * @tc.desc   range 60/90 with expected 59 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30045 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 90, 59);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30045 end');
    })

    /**
     * @tc.name   testVolumeFps30046
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0046
     * @tc.desc   range 60/60 with expected 60 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30046 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 60, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30046 end');
    })

    /**
     * @tc.name   testVolumeFps30047
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0047
     * @tc.desc   range 90/120 with expected 121 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30047 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 120, 121);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30047 end');
    })

    /**
     * @tc.name   testVolumeFps30048
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0048
     * @tc.desc   range 90/120 with expected 89 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30048 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 120, 89);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30048 end');
    })

    /**
     * @tc.name   testVolumeFps30049
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0049
     * @tc.desc   range 90/90 with expected 90 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30049 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 90, 90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30049 end');
    })

    /**
     * @tc.name   testVolumeFps30050
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0050
     * @tc.desc   range 120/150 with expected 151 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30050 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 150, 151);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(150));
      expect(result.aux).assertEqual(150);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30050 end');
    })

    /**
     * @tc.name   testVolumeFps30051
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0051
     * @tc.desc   range 120/150 with expected 119 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30051 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 150, 119);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(150));
      expect(result.aux).assertEqual(150);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-30));
      expect(result.value - result.aux).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30051 end');
    })

    /**
     * @tc.name   testVolumeFps30052
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0052
     * @tc.desc   range 120/120 with expected 120 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30052 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 120, 120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30052 end');
    })

    /**
     * @tc.name   testVolumeFps30053
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0053
     * @tc.desc   range 0/0 with expected 0 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30053 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(0, 0, 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(0));
      expect(result.value).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30053 end');
    })

    /**
     * @tc.name   testVolumeFps30054
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0054
     * @tc.desc   range 1/1 with expected 1 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30054 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(1, 1, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(1));
      expect(result.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30054 end');
    })

    /**
     * @tc.name   testVolumeFps30055
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0055
     * @tc.desc   range 0/1 with expected 1 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30055 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(0, 1, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(0));
      expect(result.value).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-1));
      expect(result.value - result.aux).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30055 end');
    })

    /**
     * @tc.name   testVolumeFps30056
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0056
     * @tc.desc   range 240/240 with expected 240 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30056 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(240, 240, 240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(240));
      expect(result.value).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(0));
      expect(result.value - result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30056 end');
    })

    /**
     * @tc.name   testVolumeFps30057
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0057
     * @tc.desc   range 240/1000 with expected 240 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30057 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(240, 1000, 240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(240));
      expect(result.value).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1000));
      expect(result.aux).assertEqual(1000);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-760));
      expect(result.value - result.aux).assertEqual(-760);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30057 end');
    })

    /**
     * @tc.name   testVolumeFps30058
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0058
     * @tc.desc   range -1/60 with expected 30 echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30058 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(-1, 60, 30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(-1));
      expect(result.value).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value - result.aux), String(-61));
      expect(result.value - result.aux).assertEqual(-61);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30058 end');
    })

    /**
     * @tc.name   testVolumeFps30059
     * @tc.number SUB_XCOMPONENT3D_VOLFPS3_0059
     * @tc.desc   inverted bounds 120/30 are rejected while the echo fields stay self-consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFps30059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30059 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 30, 60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value > result.aux));
      expect(result.value > result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code <= 0));
      expect(result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(30));
      expect(result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFps30059 end');
    })

  })
}
