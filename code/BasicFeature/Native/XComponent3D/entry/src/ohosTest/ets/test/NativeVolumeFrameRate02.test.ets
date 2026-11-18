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

export default function nativeVolumeFrameRate02Test() {
  resetYieldCounter();
  describe('NativeVolumeFrameRate02', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeFrameRate0050
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0050
     * @tc.desc   frame rate range [0,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0050 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(0, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(0));
      expect(result.value).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0050 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0051
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0051
     * @tc.desc   frame rate range [2,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0051 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(2, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(2));
      expect(result.value).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0051 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0052
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0052
     * @tc.desc   frame rate range [3,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0052 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(3, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(3));
      expect(result.value).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0052 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0053
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0053
     * @tc.desc   frame rate range [4,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0053 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(4, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(4));
      expect(result.value).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0053 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0054
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0054
     * @tc.desc   frame rate range [5,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0054 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(5, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(5));
      expect(result.value).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0054 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0055
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0055
     * @tc.desc   frame rate range [6,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0055 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(6, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(6));
      expect(result.value).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0055 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0056
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0056
     * @tc.desc   frame rate range [7,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0056 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(7, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(7));
      expect(result.value).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0056 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0057
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0057
     * @tc.desc   frame rate range [8,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0057 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(8, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(8));
      expect(result.value).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0057 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0058
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0058
     * @tc.desc   frame rate range [9,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0058 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(9, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(9));
      expect(result.value).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0058 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0059
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0059
     * @tc.desc   frame rate range [10,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0059 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(10, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(10));
      expect(result.value).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0059 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0060
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0060
     * @tc.desc   frame rate range [11,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0060 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(11, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(11));
      expect(result.value).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0060 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0061
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0061
     * @tc.desc   frame rate range [12,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0061 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(12, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(12));
      expect(result.value).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0061 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0062
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0062
     * @tc.desc   frame rate range [13,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0062 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(13, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(13));
      expect(result.value).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0062 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0063
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0063
     * @tc.desc   frame rate range [14,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0063 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(14, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(14));
      expect(result.value).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0063 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0064
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0064
     * @tc.desc   frame rate range [16,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0064 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(16, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(16));
      expect(result.value).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0064 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0065
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0065
     * @tc.desc   frame rate range [17,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0065 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(17, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(17));
      expect(result.value).assertEqual(17);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0065 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0066
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0066
     * @tc.desc   frame rate range [18,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0066 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(18, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(18));
      expect(result.value).assertEqual(18);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0066 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0067
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0067
     * @tc.desc   frame rate range [19,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0067 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(19, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(19));
      expect(result.value).assertEqual(19);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0067 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0068
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0068
     * @tc.desc   frame rate range [20,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0068 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(20, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(20));
      expect(result.value).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0068 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0069
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0069
     * @tc.desc   frame rate range [21,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0069 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(21, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(21));
      expect(result.value).assertEqual(21);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0069 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0070
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0070
     * @tc.desc   frame rate range [22,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0070 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(22, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(22));
      expect(result.value).assertEqual(22);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0070 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0071
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0071
     * @tc.desc   frame rate range [23,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0071 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(23, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(23));
      expect(result.value).assertEqual(23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0071 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0072
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0072
     * @tc.desc   frame rate range [25,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0072 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(25, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(25));
      expect(result.value).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0072 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0073
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0073
     * @tc.desc   frame rate range [26,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0073 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(26, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(26));
      expect(result.value).assertEqual(26);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0073 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0074
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0074
     * @tc.desc   frame rate range [27,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0074 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(27, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(27));
      expect(result.value).assertEqual(27);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0074 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0075
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0075
     * @tc.desc   frame rate range [28,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0075 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(28, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(28));
      expect(result.value).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0075 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0076
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0076
     * @tc.desc   frame rate range [29,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0076 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(29, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(29));
      expect(result.value).assertEqual(29);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0076 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0077
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0077
     * @tc.desc   frame rate range [31,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0077 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(31, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(31));
      expect(result.value).assertEqual(31);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0077 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0078
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0078
     * @tc.desc   frame rate range [32,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0078 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(32, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(32));
      expect(result.value).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0078 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0079
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0079
     * @tc.desc   frame rate range [33,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0079 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(33, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(33));
      expect(result.value).assertEqual(33);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0079 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0080
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0080
     * @tc.desc   frame rate range [34,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0080 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(34, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(34));
      expect(result.value).assertEqual(34);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0080 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0081
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0081
     * @tc.desc   frame rate range [35,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0081 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(35, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(35));
      expect(result.value).assertEqual(35);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0081 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0082
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0082
     * @tc.desc   frame rate range [36,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0082 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(36, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(36));
      expect(result.value).assertEqual(36);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0082 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0083
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0083
     * @tc.desc   frame rate range [37,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0083 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(37, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(37));
      expect(result.value).assertEqual(37);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0083 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0084
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0084
     * @tc.desc   frame rate range [38,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0084 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(38, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(38));
      expect(result.value).assertEqual(38);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0084 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0085
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0085
     * @tc.desc   frame rate range [39,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0085 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(39, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(39));
      expect(result.value).assertEqual(39);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0085 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0086
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0086
     * @tc.desc   frame rate range [40,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0086 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(40, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(40));
      expect(result.value).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0086 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0087
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0087
     * @tc.desc   frame rate range [41,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0087 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(41, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(41));
      expect(result.value).assertEqual(41);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0087 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0088
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0088
     * @tc.desc   frame rate range [42,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0088 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(42, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(42));
      expect(result.value).assertEqual(42);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0088 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0089
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0089
     * @tc.desc   frame rate range [43,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0089 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(43, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(43));
      expect(result.value).assertEqual(43);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0089 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0090
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0090
     * @tc.desc   frame rate range [44,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0090 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(44, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(44));
      expect(result.value).assertEqual(44);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0090 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0091
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0091
     * @tc.desc   frame rate range [46,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0091 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(46, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(46));
      expect(result.value).assertEqual(46);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0091 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0092
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0092
     * @tc.desc   frame rate range [47,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0092 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(47, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(47));
      expect(result.value).assertEqual(47);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0092 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0093
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0093
     * @tc.desc   frame rate range [49,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0093 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(49, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(49));
      expect(result.value).assertEqual(49);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0093 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0094
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0094
     * @tc.desc   frame rate range [50,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0094 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(50, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(50));
      expect(result.value).assertEqual(50);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0094 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0095
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0095
     * @tc.desc   frame rate range [51,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0095 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(51, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(51));
      expect(result.value).assertEqual(51);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0095 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0096
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0096
     * @tc.desc   frame rate range [52,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0096 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(52, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(52));
      expect(result.value).assertEqual(52);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0096 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0097
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0097
     * @tc.desc   frame rate range [53,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0097 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(53, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(53));
      expect(result.value).assertEqual(53);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0097 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0098
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0098
     * @tc.desc   frame rate range [54,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0098 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(54, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(54));
      expect(result.value).assertEqual(54);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0098 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0099
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0099
     * @tc.desc   frame rate range [55,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0099 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(55, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(55));
      expect(result.value).assertEqual(55);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0099 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0100
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0100
     * @tc.desc   frame rate range [56,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0100 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(56, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(56));
      expect(result.value).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0100 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0101
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0101
     * @tc.desc   frame rate range [57,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0101 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(57, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(57));
      expect(result.value).assertEqual(57);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0101 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0102
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0102
     * @tc.desc   frame rate range [58,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0102 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(58, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(58));
      expect(result.value).assertEqual(58);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0102 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0103
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0103
     * @tc.desc   frame rate range [59,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0103 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(59, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(59));
      expect(result.value).assertEqual(59);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0103 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0104
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0104
     * @tc.desc   frame rate range [61,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0104 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(61, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(61));
      expect(result.value).assertEqual(61);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0104 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0105
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0105
     * @tc.desc   frame rate range [62,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0105 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(62, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(62));
      expect(result.value).assertEqual(62);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0105 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0106
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0106
     * @tc.desc   frame rate range [63,120] echoes min and max
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0106 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(63, 120, 60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(63));
      expect(result.value).assertEqual(63);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value <= result.aux));
      expect(result.value <= result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0106 end');
    })

    /**
     * @tc.name   testVolumeFrameRate0107
     * @tc.number SUB_XCOMPONENT3D_VOLFPS_0107
     * @tc.desc   the min=max upper bound 120 keeps value and aux equal
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeFrameRate0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0107 begin');
      const result: ProbeResult = probeSetExpectedFrameRateRange(120, 120, 120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value), String(120));
      expect(result.value).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(120));
      expect(result.aux).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value === result.aux));
      expect(result.value === result.aux).assertTrue();
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeFrameRate0107 end');
    })

  })
}
