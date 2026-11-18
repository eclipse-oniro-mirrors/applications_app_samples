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

export default function nativeVolumeFrameRateTest() {
  resetYieldCounter();
  describe('NativeVolumeFrameRate01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeFrameRate0001
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0001
     * @tc.desc   frame rate range [1,30] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0001 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(1, 30, 16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(1));
      expect(result.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(30));
      expect(result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0001 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0002
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0002
     * @tc.desc   frame rate range [1,45] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0002 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(1, 45, 23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(1));
      expect(result.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(45));
      expect(result.aux).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0002 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0003
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0003
     * @tc.desc   frame rate range [1,60] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0003 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(1, 60, 31);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(1));
      expect(result.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0003 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0004
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0004
     * @tc.desc   frame rate range [1,90] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0004 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(1, 90, 46);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(1));
      expect(result.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0004 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0005
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0005
     * @tc.desc   frame rate range [1,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0005 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(1, 120, 61);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(1));
      expect(result.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0005 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0006
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0006
     * @tc.desc   frame rate range [1,144] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0006 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(1, 144, 73);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(1));
      expect(result.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0006 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0007
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0007
     * @tc.desc   frame rate range [1,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0007 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(1, 240, 121);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(1));
      expect(result.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0007 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0008
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0008
     * @tc.desc   frame rate range [15,30] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0008 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(15, 30, 23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(15));
      expect(result.value).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(30));
      expect(result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0008 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0009
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0009
     * @tc.desc   frame rate range [15,45] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0009 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(15, 45, 30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(15));
      expect(result.value).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(45));
      expect(result.aux).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0009 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0010
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0010
     * @tc.desc   frame rate range [15,60] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0010 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(15, 60, 38);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(15));
      expect(result.value).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0010 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0011
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0011
     * @tc.desc   frame rate range [15,90] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0011 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(15, 90, 53);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(15));
      expect(result.value).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0011 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0012
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0012
     * @tc.desc   frame rate range [15,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0012 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(15, 120, 68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(15));
      expect(result.value).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0012 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0013
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0013
     * @tc.desc   frame rate range [15,144] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0013 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(15, 144, 80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(15));
      expect(result.value).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0013 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0014
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0014
     * @tc.desc   frame rate range [15,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0014 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(15, 240, 128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(15));
      expect(result.value).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0014 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0015
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0015
     * @tc.desc   frame rate range [24,30] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0015 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 30, 27);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(30));
      expect(result.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0015 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0016
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0016
     * @tc.desc   frame rate range [24,45] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0016 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 45, 35);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(45));
      expect(result.aux).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0016 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0017
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0017
     * @tc.desc   frame rate range [24,60] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0017 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 60, 42);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0017 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0018
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0018
     * @tc.desc   frame rate range [24,90] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0018 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 90, 57);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0018 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0019
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0019
     * @tc.desc   frame rate range [24,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0019 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 120, 72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0019 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0020
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0020
     * @tc.desc   frame rate range [24,144] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0020 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 144, 84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0020 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0021
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0021
     * @tc.desc   frame rate range [24,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0021 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(24, 240, 132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(24));
      expect(result.value).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0021 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0022
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0022
     * @tc.desc   frame rate range [30,45] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0022 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 45, 38);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(45));
      expect(result.aux).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0022 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0023
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0023
     * @tc.desc   frame rate range [30,60] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0023 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0023 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0024
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0024
     * @tc.desc   frame rate range [30,90] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0024 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 90, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0024 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0025
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0025
     * @tc.desc   frame rate range [30,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0025 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0025 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0026
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0026
     * @tc.desc   frame rate range [30,144] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0026 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 144, 87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0026 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0027
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0027
     * @tc.desc   frame rate range [30,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0027 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(30, 240, 135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(30));
      expect(result.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0027 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0028
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0028
     * @tc.desc   frame rate range [45,60] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0028 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(45, 60, 53);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(45));
      expect(result.value).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0028 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0029
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0029
     * @tc.desc   frame rate range [45,90] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0029 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(45, 90, 68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(45));
      expect(result.value).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0029 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0030
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0030
     * @tc.desc   frame rate range [45,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0030 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(45, 120, 83);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(45));
      expect(result.value).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0030 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0031
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0031
     * @tc.desc   frame rate range [45,144] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0031 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(45, 144, 95);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(45));
      expect(result.value).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0031 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0032
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0032
     * @tc.desc   frame rate range [45,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0032 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(45, 240, 143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(45));
      expect(result.value).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0032 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0033
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0033
     * @tc.desc   frame rate range [48,60] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0033 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 60, 54);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(60));
      expect(result.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0033 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0034
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0034
     * @tc.desc   frame rate range [48,90] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0034 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 90, 69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0034 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0035
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0035
     * @tc.desc   frame rate range [48,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0035 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 120, 84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0035 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0036
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0036
     * @tc.desc   frame rate range [48,144] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0036 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 144, 96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0036 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0037
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0037
     * @tc.desc   frame rate range [48,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0037 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(48, 240, 144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(48));
      expect(result.value).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0037 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0038
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0038
     * @tc.desc   frame rate range [60,90] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0038 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 90, 75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(90));
      expect(result.aux).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0038 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0039
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0039
     * @tc.desc   frame rate range [60,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0039 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0039 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0040
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0040
     * @tc.desc   frame rate range [60,144] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0040 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 144, 102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0040 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0041
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0041
     * @tc.desc   frame rate range [60,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0041 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(60, 240, 150);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(60));
      expect(result.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0041 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0042
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0042
     * @tc.desc   frame rate range [90,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0042 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 120, 105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0042 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0043
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0043
     * @tc.desc   frame rate range [90,144] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0043 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 144, 117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0043 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0044
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0044
     * @tc.desc   frame rate range [90,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0044 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(90, 240, 165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(90));
      expect(result.value).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0044 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0045
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0045
     * @tc.desc   frame rate range [120,144] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0045 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 144, 132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(144));
      expect(result.aux).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0045 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0046
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0046
     * @tc.desc   frame rate range [120,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0046 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 240, 180);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0046 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0047
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0047
     * @tc.desc   frame rate range [144,240] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0047 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(144, 240, 192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(144));
      expect(result.value).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(240));
      expect(result.aux).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0047 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0048
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0048
     * @tc.desc   min above max still echoes both bounds without crashing
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0048 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 30, 60);
      expect(result.value).assertEqual(120);
      expect(result.aux).assertEqual(30);
      expect(result.value > result.aux).assertTrue();
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0048 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0049
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0049
     * @tc.desc   Showcase: two consecutive range settings each echo their own bounds
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0049 begin');
      const narrow: ProbeResult = probeSetExpectedFrameRateRange(1, 30, 16);
      const wide: ProbeResult = probeSetExpectedFrameRateRange(30, 60, 30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(narrow.value), String(1));
      expect(narrow.value).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(narrow.aux), String(30));
      expect(narrow.aux).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wide.value), String(30));
      expect(wide.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(wide.aux), String(60));
      expect(wide.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0049 end');
    })

  })
}
