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

export default function nativeVolumeTouch01Test() {
  resetYieldCounter();
  describe('NativeVolumeTouch01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeTouch0001
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0001
     * @tc.desc   probeGetTouchPointWindowX index 0 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0001 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0001 end');
    })

    /**
     * @tc.name   testVolumeTouch0002
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0002
     * @tc.desc   probeGetTouchPointWindowX index 1 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0002 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0002 end');
    })

    /**
     * @tc.name   testVolumeTouch0003
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0003
     * @tc.desc   probeGetTouchPointWindowX index 2 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0003 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(2));
      expect(result.aux).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0003 end');
    })

    /**
     * @tc.name   testVolumeTouch0004
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0004
     * @tc.desc   probeGetTouchPointWindowX index 3 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0004 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(3));
      expect(result.aux).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0004 end');
    })

    /**
     * @tc.name   testVolumeTouch0005
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0005
     * @tc.desc   probeGetTouchPointWindowX index 4 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0005 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0005 end');
    })

    /**
     * @tc.name   testVolumeTouch0006
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0006
     * @tc.desc   probeGetTouchPointWindowX index 5 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0006 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(5));
      expect(result.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0006 end');
    })

    /**
     * @tc.name   testVolumeTouch0007
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0007
     * @tc.desc   probeGetTouchPointWindowX index 6 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0007 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(6));
      expect(result.aux).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0007 end');
    })

    /**
     * @tc.name   testVolumeTouch0008
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0008
     * @tc.desc   probeGetTouchPointWindowX index 7 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0008 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(7));
      expect(result.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0008 end');
    })

    /**
     * @tc.name   testVolumeTouch0009
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0009
     * @tc.desc   probeGetTouchPointWindowX index 8 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0009 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(8));
      expect(result.aux).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0009 end');
    })

    /**
     * @tc.name   testVolumeTouch0010
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0010
     * @tc.desc   probeGetTouchPointWindowX index 9 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0010 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(9));
      expect(result.aux).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0010 end');
    })

    /**
     * @tc.name   testVolumeTouch0011
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0011
     * @tc.desc   probeGetTouchPointWindowX index 10 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0011 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(10));
      expect(result.aux).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0011 end');
    })

    /**
     * @tc.name   testVolumeTouch0012
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0012
     * @tc.desc   probeGetTouchPointWindowX index 11 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0012 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(11));
      expect(result.aux).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0012 end');
    })

    /**
     * @tc.name   testVolumeTouch0013
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0013
     * @tc.desc   probeGetTouchPointWindowX index 12 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0013 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(12));
      expect(result.aux).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0013 end');
    })

    /**
     * @tc.name   testVolumeTouch0014
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0014
     * @tc.desc   probeGetTouchPointWindowX index 13 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0014 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(13));
      expect(result.aux).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0014 end');
    })

    /**
     * @tc.name   testVolumeTouch0015
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0015
     * @tc.desc   probeGetTouchPointWindowX index 14 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0015 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(14));
      expect(result.aux).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0015 end');
    })

    /**
     * @tc.name   testVolumeTouch0016
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0016
     * @tc.desc   probeGetTouchPointWindowX index 15 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0016 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(15));
      expect(result.aux).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0016 end');
    })

    /**
     * @tc.name   testVolumeTouch0017
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0017
     * @tc.desc   probeGetTouchPointWindowY index 0 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0017 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0017 end');
    })

    /**
     * @tc.name   testVolumeTouch0018
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0018
     * @tc.desc   probeGetTouchPointWindowY index 1 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0018 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0018 end');
    })

    /**
     * @tc.name   testVolumeTouch0019
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0019
     * @tc.desc   probeGetTouchPointWindowY index 2 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0019 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(2));
      expect(result.aux).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0019 end');
    })

    /**
     * @tc.name   testVolumeTouch0020
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0020
     * @tc.desc   probeGetTouchPointWindowY index 3 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0020 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(3));
      expect(result.aux).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0020 end');
    })

    /**
     * @tc.name   testVolumeTouch0021
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0021
     * @tc.desc   probeGetTouchPointWindowY index 4 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0021 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0021 end');
    })

    /**
     * @tc.name   testVolumeTouch0022
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0022
     * @tc.desc   probeGetTouchPointWindowY index 5 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0022 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(5));
      expect(result.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0022 end');
    })

    /**
     * @tc.name   testVolumeTouch0023
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0023
     * @tc.desc   probeGetTouchPointWindowY index 6 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0023 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(6));
      expect(result.aux).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0023 end');
    })

    /**
     * @tc.name   testVolumeTouch0024
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0024
     * @tc.desc   probeGetTouchPointWindowY index 7 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0024 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(7));
      expect(result.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0024 end');
    })

    /**
     * @tc.name   testVolumeTouch0025
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0025
     * @tc.desc   probeGetTouchPointWindowY index 8 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0025 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(8));
      expect(result.aux).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0025 end');
    })

    /**
     * @tc.name   testVolumeTouch0026
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0026
     * @tc.desc   probeGetTouchPointWindowY index 9 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0026 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(9));
      expect(result.aux).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0026 end');
    })

    /**
     * @tc.name   testVolumeTouch0027
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0027
     * @tc.desc   probeGetTouchPointWindowY index 10 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0027 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(10));
      expect(result.aux).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0027 end');
    })

    /**
     * @tc.name   testVolumeTouch0028
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0028
     * @tc.desc   probeGetTouchPointWindowY index 11 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0028 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(11));
      expect(result.aux).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0028 end');
    })

    /**
     * @tc.name   testVolumeTouch0029
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0029
     * @tc.desc   probeGetTouchPointWindowY index 12 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0029 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(12));
      expect(result.aux).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0029 end');
    })

    /**
     * @tc.name   testVolumeTouch0030
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0030
     * @tc.desc   probeGetTouchPointWindowY index 13 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0030 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(13));
      expect(result.aux).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0030 end');
    })

    /**
     * @tc.name   testVolumeTouch0031
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0031
     * @tc.desc   probeGetTouchPointWindowY index 14 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0031 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(14));
      expect(result.aux).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0031 end');
    })

    /**
     * @tc.name   testVolumeTouch0032
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0032
     * @tc.desc   probeGetTouchPointWindowY index 15 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0032 begin');
      const result: ProbeResult = probeGetTouchPointWindowY(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(15));
      expect(result.aux).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0032 end');
    })

    /**
     * @tc.name   testVolumeTouch0033
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0033
     * @tc.desc   probeGetTouchPointDisplayX index 0 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0033 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(0));
      expect(result.aux).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0033 end');
    })

    /**
     * @tc.name   testVolumeTouch0034
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0034
     * @tc.desc   probeGetTouchPointDisplayX index 1 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0034 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(1));
      expect(result.aux).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0034 end');
    })

    /**
     * @tc.name   testVolumeTouch0035
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0035
     * @tc.desc   probeGetTouchPointDisplayX index 2 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0035 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(2));
      expect(result.aux).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0035 end');
    })

    /**
     * @tc.name   testVolumeTouch0036
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0036
     * @tc.desc   probeGetTouchPointDisplayX index 3 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0036 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(3));
      expect(result.aux).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0036 end');
    })

    /**
     * @tc.name   testVolumeTouch0037
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0037
     * @tc.desc   probeGetTouchPointDisplayX index 4 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0037 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0037 end');
    })

    /**
     * @tc.name   testVolumeTouch0038
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0038
     * @tc.desc   probeGetTouchPointDisplayX index 5 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0038 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(5));
      expect(result.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0038 end');
    })

    /**
     * @tc.name   testVolumeTouch0039
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0039
     * @tc.desc   probeGetTouchPointDisplayX index 6 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0039 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(6));
      expect(result.aux).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0039 end');
    })

    /**
     * @tc.name   testVolumeTouch0040
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0040
     * @tc.desc   probeGetTouchPointDisplayX index 7 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0040 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(7));
      expect(result.aux).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0040 end');
    })

    /**
     * @tc.name   testVolumeTouch0041
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0041
     * @tc.desc   probeGetTouchPointDisplayX index 8 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0041 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(8));
      expect(result.aux).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0041 end');
    })

    /**
     * @tc.name   testVolumeTouch0042
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0042
     * @tc.desc   probeGetTouchPointDisplayX index 9 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0042 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(9));
      expect(result.aux).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0042 end');
    })

    /**
     * @tc.name   testVolumeTouch0043
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0043
     * @tc.desc   probeGetTouchPointDisplayX index 10 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0043 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(10));
      expect(result.aux).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0043 end');
    })

    /**
     * @tc.name   testVolumeTouch0044
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0044
     * @tc.desc   probeGetTouchPointDisplayX index 11 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0044 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(11));
      expect(result.aux).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0044 end');
    })

    /**
     * @tc.name   testVolumeTouch0045
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0045
     * @tc.desc   probeGetTouchPointDisplayX index 12 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0045 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(12));
      expect(result.aux).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0045 end');
    })

    /**
     * @tc.name   testVolumeTouch0046
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0046
     * @tc.desc   probeGetTouchPointDisplayX index 13 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0046 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(13));
      expect(result.aux).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0046 end');
    })

    /**
     * @tc.name   testVolumeTouch0047
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0047
     * @tc.desc   probeGetTouchPointDisplayX index 14 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0047 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(14));
      expect(result.aux).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0047 end');
    })

    /**
     * @tc.name   testVolumeTouch0048
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0048
     * @tc.desc   probeGetTouchPointDisplayX index 15 echoes point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0048 begin');
      const result: ProbeResult = probeGetTouchPointDisplayX(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(15));
      expect(result.aux).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.value >= -1));
      expect(result.value >= -1).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.value % 1), String(0));
      expect(result.value % 1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(result.code >= -2 && result.code <= 0));
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0048 end');
    })

    /**
     * @tc.name   testVolumeTouch0049
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0049
     * @tc.desc   negative point index is echoed back as aux without crashing
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0049 begin');
      const result: ProbeResult = probeGetTouchPointWindowX(-1);
      expect(result.aux).assertEqual(-1);
      expect(result.value >= -1).assertTrue();
      expect(result.code >= -2 && result.code <= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0049 end');
    })

    /**
     * @tc.name   testVolumeTouch0083
     * @tc.number SUB_XCOMPONENT3D_VOLTOUCH_0083
     * @tc.desc   Showcase: all four coordinate readers echo the same point index
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeTouch0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0083 begin');
      const windowX: ProbeResult = probeGetTouchPointWindowX(5);
      const windowY: ProbeResult = probeGetTouchPointWindowY(5);
      const displayX: ProbeResult = probeGetTouchPointDisplayX(5);
      const displayY: ProbeResult = probeGetTouchPointDisplayY(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(windowX.aux), String(5));
      expect(windowX.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(windowY.aux), String(5));
      expect(windowY.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(displayX.aux), String(5));
      expect(displayX.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(displayY.aux), String(5));
      expect(displayY.aux).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeTouch0083 end');
    })

  })
}
