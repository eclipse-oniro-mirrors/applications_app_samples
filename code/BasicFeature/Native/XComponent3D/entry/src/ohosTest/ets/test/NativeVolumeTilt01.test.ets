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
import { ProbeResult, probeGetTouchPointTiltX, probeGetTouchPointTiltY } from 'libnativerender.so';
import { probeGetTouchEventSourceType } from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeTilt01Test() {
  resetYieldCounter();
  describe('NativeVolumeTilt01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeTilt0001
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0001
     * @tc.desc   probeGetTouchPointTiltX index 0 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0001 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0001 end');
    })

    /**
     * @tc.name   testVolumeTilt0002
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0002
     * @tc.desc   probeGetTouchPointTiltX index 1 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0002 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0002 end');
    })

    /**
     * @tc.name   testVolumeTilt0003
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0003
     * @tc.desc   probeGetTouchPointTiltX index 2 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0003 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(2));
      expect(result.aux).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0003 end');
    })

    /**
     * @tc.name   testVolumeTilt0004
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0004
     * @tc.desc   probeGetTouchPointTiltX index 3 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0004 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(3));
      expect(result.aux).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0004 end');
    })

    /**
     * @tc.name   testVolumeTilt0005
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0005
     * @tc.desc   probeGetTouchPointTiltX index 4 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0005 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0005 end');
    })

    /**
     * @tc.name   testVolumeTilt0006
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0006
     * @tc.desc   probeGetTouchPointTiltX index 5 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0006 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(5));
      expect(result.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0006 end');
    })

    /**
     * @tc.name   testVolumeTilt0007
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0007
     * @tc.desc   probeGetTouchPointTiltX index 6 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0007 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(6));
      expect(result.aux).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0007 end');
    })

    /**
     * @tc.name   testVolumeTilt0008
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0008
     * @tc.desc   probeGetTouchPointTiltX index 7 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0008 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(7));
      expect(result.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0008 end');
    })

    /**
     * @tc.name   testVolumeTilt0009
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0009
     * @tc.desc   probeGetTouchPointTiltX index 8 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0009 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(8));
      expect(result.aux).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0009 end');
    })

    /**
     * @tc.name   testVolumeTilt0010
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0010
     * @tc.desc   probeGetTouchPointTiltX index 9 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0010 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(9));
      expect(result.aux).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0010 end');
    })

    /**
     * @tc.name   testVolumeTilt0011
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0011
     * @tc.desc   probeGetTouchPointTiltX index 10 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0011 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(10));
      expect(result.aux).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0011 end');
    })

    /**
     * @tc.name   testVolumeTilt0012
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0012
     * @tc.desc   probeGetTouchPointTiltX index 11 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0012 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(11));
      expect(result.aux).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0012 end');
    })

    /**
     * @tc.name   testVolumeTilt0013
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0013
     * @tc.desc   probeGetTouchPointTiltX index 12 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0013 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(12));
      expect(result.aux).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0013 end');
    })

    /**
     * @tc.name   testVolumeTilt0014
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0014
     * @tc.desc   probeGetTouchPointTiltX index 13 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0014 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(13));
      expect(result.aux).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0014 end');
    })

    /**
     * @tc.name   testVolumeTilt0015
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0015
     * @tc.desc   probeGetTouchPointTiltX index 14 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0015 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(14));
      expect(result.aux).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0015 end');
    })

    /**
     * @tc.name   testVolumeTilt0016
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0016
     * @tc.desc   probeGetTouchPointTiltX index 15 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0016 begin');
      const result: ProbeResult = probeGetTouchPointTiltX(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(15));
      expect(result.aux).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0016 end');
    })

    /**
     * @tc.name   testVolumeTilt0017
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0017
     * @tc.desc   probeGetTouchPointTiltY index 0 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0017 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0017 end');
    })

    /**
     * @tc.name   testVolumeTilt0018
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0018
     * @tc.desc   probeGetTouchPointTiltY index 1 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0018 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0018 end');
    })

    /**
     * @tc.name   testVolumeTilt0019
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0019
     * @tc.desc   probeGetTouchPointTiltY index 2 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0019 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(2));
      expect(result.aux).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0019 end');
    })

    /**
     * @tc.name   testVolumeTilt0020
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0020
     * @tc.desc   probeGetTouchPointTiltY index 3 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0020 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(3));
      expect(result.aux).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0020 end');
    })

    /**
     * @tc.name   testVolumeTilt0021
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0021
     * @tc.desc   probeGetTouchPointTiltY index 4 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0021 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0021 end');
    })

    /**
     * @tc.name   testVolumeTilt0022
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0022
     * @tc.desc   probeGetTouchPointTiltY index 5 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0022 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(5));
      expect(result.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0022 end');
    })

    /**
     * @tc.name   testVolumeTilt0023
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0023
     * @tc.desc   probeGetTouchPointTiltY index 6 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0023 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(6));
      expect(result.aux).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0023 end');
    })

    /**
     * @tc.name   testVolumeTilt0024
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0024
     * @tc.desc   probeGetTouchPointTiltY index 7 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0024 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(7));
      expect(result.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0024 end');
    })

    /**
     * @tc.name   testVolumeTilt0025
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0025
     * @tc.desc   probeGetTouchPointTiltY index 8 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0025 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(8));
      expect(result.aux).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0025 end');
    })

    /**
     * @tc.name   testVolumeTilt0026
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0026
     * @tc.desc   probeGetTouchPointTiltY index 9 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0026 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(9));
      expect(result.aux).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0026 end');
    })

    /**
     * @tc.name   testVolumeTilt0027
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0027
     * @tc.desc   probeGetTouchPointTiltY index 10 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0027 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(10));
      expect(result.aux).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0027 end');
    })

    /**
     * @tc.name   testVolumeTilt0028
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0028
     * @tc.desc   probeGetTouchPointTiltY index 11 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0028 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(11));
      expect(result.aux).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0028 end');
    })

    /**
     * @tc.name   testVolumeTilt0029
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0029
     * @tc.desc   probeGetTouchPointTiltY index 12 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0029 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(12));
      expect(result.aux).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0029 end');
    })

    /**
     * @tc.name   testVolumeTilt0030
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0030
     * @tc.desc   probeGetTouchPointTiltY index 13 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0030 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(13));
      expect(result.aux).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0030 end');
    })

    /**
     * @tc.name   testVolumeTilt0031
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0031
     * @tc.desc   probeGetTouchPointTiltY index 14 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0031 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(14));
      expect(result.aux).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0031 end');
    })

    /**
     * @tc.name   testVolumeTilt0032
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0032
     * @tc.desc   probeGetTouchPointTiltY index 15 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0032 begin');
      const result: ProbeResult = probeGetTouchPointTiltY(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(15));
      expect(result.aux).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0032 end');
    })

    /**
     * @tc.name   testVolumeTilt0033
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0033
     * @tc.desc   probeGetTouchEventSourceType index 0 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0033 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0033 end');
    })

    /**
     * @tc.name   testVolumeTilt0034
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0034
     * @tc.desc   probeGetTouchEventSourceType index 1 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0034 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0034 end');
    })

    /**
     * @tc.name   testVolumeTilt0035
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0035
     * @tc.desc   probeGetTouchEventSourceType index 2 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0035 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(2));
      expect(result.aux).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0035 end');
    })

    /**
     * @tc.name   testVolumeTilt0036
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0036
     * @tc.desc   probeGetTouchEventSourceType index 3 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0036 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(3));
      expect(result.aux).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0036 end');
    })

    /**
     * @tc.name   testVolumeTilt0037
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0037
     * @tc.desc   probeGetTouchEventSourceType index 4 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0037 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0037 end');
    })

    /**
     * @tc.name   testVolumeTilt0038
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0038
     * @tc.desc   probeGetTouchEventSourceType index 5 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0038 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(5));
      expect(result.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0038 end');
    })

    /**
     * @tc.name   testVolumeTilt0039
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0039
     * @tc.desc   probeGetTouchEventSourceType index 6 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0039 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(6));
      expect(result.aux).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0039 end');
    })

    /**
     * @tc.name   testVolumeTilt0040
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0040
     * @tc.desc   probeGetTouchEventSourceType index 7 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0040 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(7));
      expect(result.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0040 end');
    })

    /**
     * @tc.name   testVolumeTilt0041
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0041
     * @tc.desc   probeGetTouchEventSourceType index 8 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0041 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(8));
      expect(result.aux).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0041 end');
    })

    /**
     * @tc.name   testVolumeTilt0042
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0042
     * @tc.desc   probeGetTouchEventSourceType index 9 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0042 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(9));
      expect(result.aux).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0042 end');
    })

    /**
     * @tc.name   testVolumeTilt0043
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0043
     * @tc.desc   probeGetTouchEventSourceType index 10 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0043 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(10));
      expect(result.aux).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0043 end');
    })

    /**
     * @tc.name   testVolumeTilt0044
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0044
     * @tc.desc   probeGetTouchEventSourceType index 11 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0044 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(11));
      expect(result.aux).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0044 end');
    })

    /**
     * @tc.name   testVolumeTilt0045
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0045
     * @tc.desc   probeGetTouchEventSourceType index 12 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0045 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(12));
      expect(result.aux).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0045 end');
    })

    /**
     * @tc.name   testVolumeTilt0046
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0046
     * @tc.desc   probeGetTouchEventSourceType index 13 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0046 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(13));
      expect(result.aux).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0046 end');
    })

    /**
     * @tc.name   testVolumeTilt0047
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0047
     * @tc.desc   probeGetTouchEventSourceType index 14 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0047 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(14));
      expect(result.aux).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0047 end');
    })

    /**
     * @tc.name   testVolumeTilt0048
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0048
     * @tc.desc   probeGetTouchEventSourceType index 15 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0048 begin');
      const result: ProbeResult = probeGetTouchEventSourceType(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(15));
      expect(result.aux).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0048 end');
    })

    /**
     * @tc.name   testVolumeTilt0049
     * @tc.number SUB_XCOMPONENT3D_VOLTILT_0049
     * @tc.desc   an out-of-range index echoes back unchanged on all three interfaces
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTilt0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0049 begin');
      const tiltX: ProbeResult = probeGetTouchPointTiltX(16);
      const tiltY: ProbeResult = probeGetTouchPointTiltY(16);
      const source: ProbeResult = probeGetTouchEventSourceType(16);
      expect(tiltX.aux).assertEqual(16);
      expect(tiltY.aux).assertEqual(16);
      expect(source.aux).assertEqual(16);
      expect(tiltX.code).assertEqual(tiltY.code);
      expect(source.code >= -2 && source.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTilt0049 end');
    })

  })
}
