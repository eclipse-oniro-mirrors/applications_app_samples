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

export default function nativeVolumeFrameRate03Test() {
  resetYieldCounter();
  describe('NativeVolumeFrameRate03', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeFrameRate0108
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0108
     * @tc.desc   frame rate range [64,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0108 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(64, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(64));
      expect(result.value).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0108 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0109
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0109
     * @tc.desc   frame rate range [65,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0109 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(65, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(65));
      expect(result.value).assertEqual(65);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0109 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0110
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0110
     * @tc.desc   frame rate range [66,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0110 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(66, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(66));
      expect(result.value).assertEqual(66);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0110 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0111
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0111
     * @tc.desc   frame rate range [67,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0111 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(67, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(67));
      expect(result.value).assertEqual(67);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0111 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0112
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0112
     * @tc.desc   frame rate range [68,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0112 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(68, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(68));
      expect(result.value).assertEqual(68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0112 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0113
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0113
     * @tc.desc   frame rate range [69,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0113 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(69, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(69));
      expect(result.value).assertEqual(69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0113 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0114
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0114
     * @tc.desc   frame rate range [70,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0114 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(70, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(70));
      expect(result.value).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0114 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0115
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0115
     * @tc.desc   frame rate range [71,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0115 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(71, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(71));
      expect(result.value).assertEqual(71);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0115 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0116
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0116
     * @tc.desc   frame rate range [72,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0116 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(72, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(72));
      expect(result.value).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0116 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0117
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0117
     * @tc.desc   frame rate range [73,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0117 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(73, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(73));
      expect(result.value).assertEqual(73);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0117 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0118
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0118
     * @tc.desc   frame rate range [74,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0118 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(74, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(74));
      expect(result.value).assertEqual(74);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0118 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0119
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0119
     * @tc.desc   frame rate range [75,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0119 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(75, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(75));
      expect(result.value).assertEqual(75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0119 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0120
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0120
     * @tc.desc   frame rate range [76,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0120 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(76, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(76));
      expect(result.value).assertEqual(76);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0120 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0121
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0121
     * @tc.desc   frame rate range [77,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0121 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(77, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(77));
      expect(result.value).assertEqual(77);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0121 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0122
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0122
     * @tc.desc   frame rate range [78,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0122 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(78, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(78));
      expect(result.value).assertEqual(78);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0122 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0123
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0123
     * @tc.desc   frame rate range [79,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0123 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(79, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(79));
      expect(result.value).assertEqual(79);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0123 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0124
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0124
     * @tc.desc   frame rate range [80,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0124 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(80, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(80));
      expect(result.value).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0124 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0125
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0125
     * @tc.desc   frame rate range [81,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0125 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(81, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(81));
      expect(result.value).assertEqual(81);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0125 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0126
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0126
     * @tc.desc   frame rate range [82,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0126 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(82, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(82));
      expect(result.value).assertEqual(82);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0126 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0127
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0127
     * @tc.desc   frame rate range [83,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0127 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(83, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(83));
      expect(result.value).assertEqual(83);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0127 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0128
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0128
     * @tc.desc   frame rate range [84,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0128 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(84, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(84));
      expect(result.value).assertEqual(84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0128 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0129
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0129
     * @tc.desc   frame rate range [85,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0129 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(85, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(85));
      expect(result.value).assertEqual(85);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0129 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0130
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0130
     * @tc.desc   frame rate range [86,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0130 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(86, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(86));
      expect(result.value).assertEqual(86);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0130 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0131
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0131
     * @tc.desc   frame rate range [87,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0131 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(87, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(87));
      expect(result.value).assertEqual(87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0131 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0132
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0132
     * @tc.desc   frame rate range [88,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0132 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(88, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(88));
      expect(result.value).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0132 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0133
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0133
     * @tc.desc   frame rate range [89,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0133 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(89, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(89));
      expect(result.value).assertEqual(89);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0133 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0134
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0134
     * @tc.desc   frame rate range [91,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0134 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(91, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(91));
      expect(result.value).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0134 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0135
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0135
     * @tc.desc   frame rate range [92,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0135 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(92, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(92));
      expect(result.value).assertEqual(92);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0135 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0136
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0136
     * @tc.desc   frame rate range [93,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0136 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(93, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(93));
      expect(result.value).assertEqual(93);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0136 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0137
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0137
     * @tc.desc   frame rate range [94,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0137 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(94, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(94));
      expect(result.value).assertEqual(94);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0137 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0138
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0138
     * @tc.desc   frame rate range [95,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0138 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(95, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(95));
      expect(result.value).assertEqual(95);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0138 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0139
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0139
     * @tc.desc   frame rate range [96,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0139 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(96, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(96));
      expect(result.value).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0139 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0140
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0140
     * @tc.desc   frame rate range [97,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0140 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(97, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(97));
      expect(result.value).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0140 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0141
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0141
     * @tc.desc   frame rate range [98,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0141 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(98, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(98));
      expect(result.value).assertEqual(98);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0141 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0142
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0142
     * @tc.desc   frame rate range [99,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0142 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(99, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(99));
      expect(result.value).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0142 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0143
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0143
     * @tc.desc   frame rate range [100,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0143 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(100, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(100));
      expect(result.value).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0143 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0144
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0144
     * @tc.desc   frame rate range [101,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0144 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(101, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(101));
      expect(result.value).assertEqual(101);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0144 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0145
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0145
     * @tc.desc   frame rate range [102,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0145 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(102, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(102));
      expect(result.value).assertEqual(102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0145 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0146
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0146
     * @tc.desc   frame rate range [103,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0146 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(103, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(103));
      expect(result.value).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0146 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0147
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0147
     * @tc.desc   frame rate range [104,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0147 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(104, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(104));
      expect(result.value).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0147 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0148
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0148
     * @tc.desc   frame rate range [105,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0148 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(105, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(105));
      expect(result.value).assertEqual(105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0148 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0149
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0149
     * @tc.desc   frame rate range [106,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0149 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(106, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(106));
      expect(result.value).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0149 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0150
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0150
     * @tc.desc   frame rate range [107,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0150 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(107, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(107));
      expect(result.value).assertEqual(107);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0150 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0151
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0151
     * @tc.desc   frame rate range [108,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0151 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(108, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(108));
      expect(result.value).assertEqual(108);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0151 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0152
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0152
     * @tc.desc   frame rate range [109,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0152 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(109, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(109));
      expect(result.value).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0152 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0153
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0153
     * @tc.desc   frame rate range [110,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0153 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(110, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(110));
      expect(result.value).assertEqual(110);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0153 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0154
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0154
     * @tc.desc   frame rate range [111,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0154 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(111, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(111));
      expect(result.value).assertEqual(111);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0154 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0155
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0155
     * @tc.desc   frame rate range [112,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0155 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(112, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(112));
      expect(result.value).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0155 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0156
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0156
     * @tc.desc   frame rate range [113,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0156 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(113, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(113));
      expect(result.value).assertEqual(113);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0156 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0157
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0157
     * @tc.desc   frame rate range [114,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0157 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(114, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(114));
      expect(result.value).assertEqual(114);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0157 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0158
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0158
     * @tc.desc   frame rate range [115,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0158 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(115, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(115));
      expect(result.value).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0158 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0159
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0159
     * @tc.desc   frame rate range [116,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0159 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(116, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(116));
      expect(result.value).assertEqual(116);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0159 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0160
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0160
     * @tc.desc   frame rate range [117,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0160 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(117, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(117));
      expect(result.value).assertEqual(117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0160 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0161
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0161
     * @tc.desc   frame rate range [118,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0161 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(118, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(118));
      expect(result.value).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0161 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0162
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0162
     * @tc.desc   frame rate range [119,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0162 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(119, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(119));
      expect(result.value).assertEqual(119);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0162 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0163
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0163
     * @tc.desc   the min=max pair 60 stays equal across repeated calls
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0163 begin');
      const first: ProbeResult = probeSetExpectedFrameRateRange(60, 60, 60);
      const second: ProbeResult = probeSetExpectedFrameRateRange(60, 60, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.value), String(60));
      expect(first.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux), String(60));
      expect(first.aux).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(second.value), String(60));
      expect(second.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(second.code), String(first.code));
      expect(second.code).assertEqual(first.code);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0163 end');
    })

  })
}
