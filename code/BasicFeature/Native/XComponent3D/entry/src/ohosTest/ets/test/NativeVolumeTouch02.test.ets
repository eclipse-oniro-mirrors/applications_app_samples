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
import { ProbeResult, probeGetTouchPointWindowX, probeGetTouchPointWindowY } from 'libnativerender.so';
import { probeGetTouchPointDisplayX, probeGetTouchPointDisplayY } from 'libnativerender.so';
import { probeGetTouchPointToolType } from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeTouch02Test() {
  resetYieldCounter();
  describe('NativeVolumeTouch02', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeTouch0050
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0050
     * @tc.desc   probeGetTouchPointDisplayY index 0 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0050 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0050 end');
    })

    /**
     * @tc.name   testVolumeTouch0051
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0051
     * @tc.desc   probeGetTouchPointDisplayY index 1 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0051 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0051 end');
    })

    /**
     * @tc.name   testVolumeTouch0052
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0052
     * @tc.desc   probeGetTouchPointDisplayY index 2 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0052 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(2));
      expect(result.aux).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0052 end');
    })

    /**
     * @tc.name   testVolumeTouch0053
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0053
     * @tc.desc   probeGetTouchPointDisplayY index 3 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0053 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(3));
      expect(result.aux).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0053 end');
    })

    /**
     * @tc.name   testVolumeTouch0054
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0054
     * @tc.desc   probeGetTouchPointDisplayY index 4 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0054 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0054 end');
    })

    /**
     * @tc.name   testVolumeTouch0055
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0055
     * @tc.desc   probeGetTouchPointDisplayY index 5 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0055 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(5));
      expect(result.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0055 end');
    })

    /**
     * @tc.name   testVolumeTouch0056
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0056
     * @tc.desc   probeGetTouchPointDisplayY index 6 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0056 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(6));
      expect(result.aux).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0056 end');
    })

    /**
     * @tc.name   testVolumeTouch0057
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0057
     * @tc.desc   probeGetTouchPointDisplayY index 7 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0057 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(7));
      expect(result.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0057 end');
    })

    /**
     * @tc.name   testVolumeTouch0058
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0058
     * @tc.desc   probeGetTouchPointDisplayY index 8 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0058 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(8));
      expect(result.aux).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0058 end');
    })

    /**
     * @tc.name   testVolumeTouch0059
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0059
     * @tc.desc   probeGetTouchPointDisplayY index 9 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0059 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(9));
      expect(result.aux).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0059 end');
    })

    /**
     * @tc.name   testVolumeTouch0060
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0060
     * @tc.desc   probeGetTouchPointDisplayY index 10 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0060 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(10));
      expect(result.aux).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0060 end');
    })

    /**
     * @tc.name   testVolumeTouch0061
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0061
     * @tc.desc   probeGetTouchPointDisplayY index 11 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0061 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(11));
      expect(result.aux).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0061 end');
    })

    /**
     * @tc.name   testVolumeTouch0062
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0062
     * @tc.desc   probeGetTouchPointDisplayY index 12 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0062 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(12));
      expect(result.aux).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0062 end');
    })

    /**
     * @tc.name   testVolumeTouch0063
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0063
     * @tc.desc   probeGetTouchPointDisplayY index 13 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0063 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(13));
      expect(result.aux).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0063 end');
    })

    /**
     * @tc.name   testVolumeTouch0064
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0064
     * @tc.desc   probeGetTouchPointDisplayY index 14 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0064 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(14));
      expect(result.aux).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0064 end');
    })

    /**
     * @tc.name   testVolumeTouch0065
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0065
     * @tc.desc   probeGetTouchPointDisplayY index 15 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0065 begin');
      const result: ProbeResult = probeGetTouchPointDisplayY(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(15));
      expect(result.aux).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0065 end');
    })

    /**
     * @tc.name   testVolumeTouch0066
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0066
     * @tc.desc   probeGetTouchPointToolType index 0 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0066 begin');
      const result: ProbeResult = probeGetTouchPointToolType(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0066 end');
    })

    /**
     * @tc.name   testVolumeTouch0067
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0067
     * @tc.desc   probeGetTouchPointToolType index 1 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0067 begin');
      const result: ProbeResult = probeGetTouchPointToolType(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0067 end');
    })

    /**
     * @tc.name   testVolumeTouch0068
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0068
     * @tc.desc   probeGetTouchPointToolType index 2 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0068 begin');
      const result: ProbeResult = probeGetTouchPointToolType(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(2));
      expect(result.aux).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0068 end');
    })

    /**
     * @tc.name   testVolumeTouch0069
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0069
     * @tc.desc   probeGetTouchPointToolType index 3 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0069 begin');
      const result: ProbeResult = probeGetTouchPointToolType(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(3));
      expect(result.aux).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0069 end');
    })

    /**
     * @tc.name   testVolumeTouch0070
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0070
     * @tc.desc   probeGetTouchPointToolType index 4 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0070 begin');
      const result: ProbeResult = probeGetTouchPointToolType(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0070 end');
    })

    /**
     * @tc.name   testVolumeTouch0071
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0071
     * @tc.desc   probeGetTouchPointToolType index 5 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0071 begin');
      const result: ProbeResult = probeGetTouchPointToolType(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(5));
      expect(result.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0071 end');
    })

    /**
     * @tc.name   testVolumeTouch0072
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0072
     * @tc.desc   probeGetTouchPointToolType index 6 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0072 begin');
      const result: ProbeResult = probeGetTouchPointToolType(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(6));
      expect(result.aux).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0072 end');
    })

    /**
     * @tc.name   testVolumeTouch0073
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0073
     * @tc.desc   probeGetTouchPointToolType index 7 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0073 begin');
      const result: ProbeResult = probeGetTouchPointToolType(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(7));
      expect(result.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0073 end');
    })

    /**
     * @tc.name   testVolumeTouch0074
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0074
     * @tc.desc   probeGetTouchPointToolType index 8 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0074 begin');
      const result: ProbeResult = probeGetTouchPointToolType(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(8));
      expect(result.aux).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0074 end');
    })

    /**
     * @tc.name   testVolumeTouch0075
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0075
     * @tc.desc   probeGetTouchPointToolType index 9 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0075 begin');
      const result: ProbeResult = probeGetTouchPointToolType(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(9));
      expect(result.aux).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0075 end');
    })

    /**
     * @tc.name   testVolumeTouch0076
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0076
     * @tc.desc   probeGetTouchPointToolType index 10 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0076 begin');
      const result: ProbeResult = probeGetTouchPointToolType(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(10));
      expect(result.aux).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0076 end');
    })

    /**
     * @tc.name   testVolumeTouch0077
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0077
     * @tc.desc   probeGetTouchPointToolType index 11 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0077 begin');
      const result: ProbeResult = probeGetTouchPointToolType(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(11));
      expect(result.aux).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0077 end');
    })

    /**
     * @tc.name   testVolumeTouch0078
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0078
     * @tc.desc   probeGetTouchPointToolType index 12 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0078 begin');
      const result: ProbeResult = probeGetTouchPointToolType(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(12));
      expect(result.aux).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0078 end');
    })

    /**
     * @tc.name   testVolumeTouch0079
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0079
     * @tc.desc   probeGetTouchPointToolType index 13 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0079 begin');
      const result: ProbeResult = probeGetTouchPointToolType(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(13));
      expect(result.aux).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0079 end');
    })

    /**
     * @tc.name   testVolumeTouch0080
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0080
     * @tc.desc   probeGetTouchPointToolType index 14 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0080 begin');
      const result: ProbeResult = probeGetTouchPointToolType(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(14));
      expect(result.aux).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0080 end');
    })

    /**
     * @tc.name   testVolumeTouch0081
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0081
     * @tc.desc   probeGetTouchPointToolType index 15 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0081 begin');
      const result: ProbeResult = probeGetTouchPointToolType(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(15));
      expect(result.aux).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0081 end');
    })

    /**
     * @tc.name   testVolumeTouch0082
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0082
     * @tc.desc   tool type index 16 beyond point capacity still echoes index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0082 begin');
      const result: ProbeResult = probeGetTouchPointToolType(16);
      expect(result.aux).assertEqual(16);
      expect(result.value >= 0).assertTrue();
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0082 end');
    })

    /**
     * @tc.name   testVolumeTouch0084
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0084
     * @tc.desc   Showcase: two point indices keep separate echoes on every reader
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0084 begin');
      const first: ProbeResult = probeGetTouchPointWindowY(0);
      const second: ProbeResult = probeGetTouchPointWindowY(7);
      const displaySecond: ProbeResult = probeGetTouchPointDisplayY(7);
      const toolSecond: ProbeResult = probeGetTouchPointToolType(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(first.aux), String(0));
      expect(first.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(second.aux), String(7));
      expect(second.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(displaySecond.aux), String(7));
      expect(displaySecond.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(toolSecond.aux), String(7));
      expect(toolSecond.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0084 end');
    })

  })
}
