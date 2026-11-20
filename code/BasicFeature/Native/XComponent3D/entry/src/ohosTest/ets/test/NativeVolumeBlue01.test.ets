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
import { PixelProbeResult, probeRenderSolidPixel } from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeBlue01Test() {
  resetYieldCounter();
  describe('NativeVolumeBlue01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeBlue0001
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0001
     * @tc.desc   blue 0 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0001 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0001 end');
    })

    /**
     * @tc.name   testVolumeBlue0002
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0002
     * @tc.desc   blue 1 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0002 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 1, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(1));
      expect(result.pixel[2]).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0002 end');
    })

    /**
     * @tc.name   testVolumeBlue0003
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0003
     * @tc.desc   blue 2 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0003 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 2, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(2));
      expect(result.pixel[2]).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0003 end');
    })

    /**
     * @tc.name   testVolumeBlue0004
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0004
     * @tc.desc   blue 3 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0004 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 3, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(3));
      expect(result.pixel[2]).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0004 end');
    })

    /**
     * @tc.name   testVolumeBlue0005
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0005
     * @tc.desc   blue 4 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0005 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 4, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(4));
      expect(result.pixel[2]).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0005 end');
    })

    /**
     * @tc.name   testVolumeBlue0006
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0006
     * @tc.desc   blue 5 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0006 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 5, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(5));
      expect(result.pixel[2]).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0006 end');
    })

    /**
     * @tc.name   testVolumeBlue0007
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0007
     * @tc.desc   blue 6 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0007 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 6, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(6));
      expect(result.pixel[2]).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0007 end');
    })

    /**
     * @tc.name   testVolumeBlue0008
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0008
     * @tc.desc   blue 7 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0008 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 7, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(7));
      expect(result.pixel[2]).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0008 end');
    })

    /**
     * @tc.name   testVolumeBlue0009
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0009
     * @tc.desc   blue 8 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0009 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 8, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(8));
      expect(result.pixel[2]).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0009 end');
    })

    /**
     * @tc.name   testVolumeBlue0010
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0010
     * @tc.desc   blue 9 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0010 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 9, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(9));
      expect(result.pixel[2]).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0010 end');
    })

    /**
     * @tc.name   testVolumeBlue0011
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0011
     * @tc.desc   blue 10 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0011 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 10, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(10));
      expect(result.pixel[2]).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0011 end');
    })

    /**
     * @tc.name   testVolumeBlue0012
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0012
     * @tc.desc   blue 11 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0012 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 11, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(11));
      expect(result.pixel[2]).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0012 end');
    })

    /**
     * @tc.name   testVolumeBlue0013
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0013
     * @tc.desc   blue 12 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0013 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 12, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(12));
      expect(result.pixel[2]).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0013 end');
    })

    /**
     * @tc.name   testVolumeBlue0014
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0014
     * @tc.desc   blue 13 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0014 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 13, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(13));
      expect(result.pixel[2]).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0014 end');
    })

    /**
     * @tc.name   testVolumeBlue0015
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0015
     * @tc.desc   blue 14 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0015 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 14, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(14));
      expect(result.pixel[2]).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0015 end');
    })

    /**
     * @tc.name   testVolumeBlue0016
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0016
     * @tc.desc   blue 15 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0016 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 15, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(15));
      expect(result.pixel[2]).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0016 end');
    })

    /**
     * @tc.name   testVolumeBlue0017
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0017
     * @tc.desc   blue 16 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0017 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 16, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(16));
      expect(result.pixel[2]).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0017 end');
    })

    /**
     * @tc.name   testVolumeBlue0018
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0018
     * @tc.desc   blue 17 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0018 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 17, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(17));
      expect(result.pixel[2]).assertEqual(17);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0018 end');
    })

    /**
     * @tc.name   testVolumeBlue0019
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0019
     * @tc.desc   blue 18 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0019 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 18, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(18));
      expect(result.pixel[2]).assertEqual(18);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0019 end');
    })

    /**
     * @tc.name   testVolumeBlue0020
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0020
     * @tc.desc   blue 19 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0020 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 19, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(19));
      expect(result.pixel[2]).assertEqual(19);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0020 end');
    })

    /**
     * @tc.name   testVolumeBlue0021
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0021
     * @tc.desc   blue 20 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0021 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 20, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(20));
      expect(result.pixel[2]).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0021 end');
    })

    /**
     * @tc.name   testVolumeBlue0022
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0022
     * @tc.desc   blue 21 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0022 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 21, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(21));
      expect(result.pixel[2]).assertEqual(21);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0022 end');
    })

    /**
     * @tc.name   testVolumeBlue0023
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0023
     * @tc.desc   blue 22 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0023 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 22, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(22));
      expect(result.pixel[2]).assertEqual(22);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0023 end');
    })

    /**
     * @tc.name   testVolumeBlue0024
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0024
     * @tc.desc   blue 23 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0024 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 23, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(23));
      expect(result.pixel[2]).assertEqual(23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0024 end');
    })

    /**
     * @tc.name   testVolumeBlue0025
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0025
     * @tc.desc   blue 24 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0025 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 24, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(24));
      expect(result.pixel[2]).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0025 end');
    })

    /**
     * @tc.name   testVolumeBlue0026
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0026
     * @tc.desc   blue 25 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0026 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 25, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(25));
      expect(result.pixel[2]).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0026 end');
    })

    /**
     * @tc.name   testVolumeBlue0027
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0027
     * @tc.desc   blue 26 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0027 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 26, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(26));
      expect(result.pixel[2]).assertEqual(26);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0027 end');
    })

    /**
     * @tc.name   testVolumeBlue0028
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0028
     * @tc.desc   blue 27 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0028 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 27, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(27));
      expect(result.pixel[2]).assertEqual(27);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0028 end');
    })

    /**
     * @tc.name   testVolumeBlue0029
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0029
     * @tc.desc   blue 28 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0029 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 28, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(28));
      expect(result.pixel[2]).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0029 end');
    })

    /**
     * @tc.name   testVolumeBlue0030
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0030
     * @tc.desc   blue 29 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0030 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 29, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(29));
      expect(result.pixel[2]).assertEqual(29);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0030 end');
    })

    /**
     * @tc.name   testVolumeBlue0031
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0031
     * @tc.desc   blue 30 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0031 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 30, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(30));
      expect(result.pixel[2]).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0031 end');
    })

    /**
     * @tc.name   testVolumeBlue0032
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0032
     * @tc.desc   blue 31 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0032 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 31, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(31));
      expect(result.pixel[2]).assertEqual(31);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0032 end');
    })

    /**
     * @tc.name   testVolumeBlue0033
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0033
     * @tc.desc   blue 32 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0033 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 32, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(32));
      expect(result.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0033 end');
    })

    /**
     * @tc.name   testVolumeBlue0034
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0034
     * @tc.desc   blue 33 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0034 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 33, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(33));
      expect(result.pixel[2]).assertEqual(33);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0034 end');
    })

    /**
     * @tc.name   testVolumeBlue0035
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0035
     * @tc.desc   blue 34 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0035 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 34, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(34));
      expect(result.pixel[2]).assertEqual(34);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0035 end');
    })

    /**
     * @tc.name   testVolumeBlue0036
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0036
     * @tc.desc   blue 35 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0036 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 35, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(35));
      expect(result.pixel[2]).assertEqual(35);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0036 end');
    })

    /**
     * @tc.name   testVolumeBlue0037
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0037
     * @tc.desc   blue 36 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0037 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 36, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(36));
      expect(result.pixel[2]).assertEqual(36);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0037 end');
    })

    /**
     * @tc.name   testVolumeBlue0038
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0038
     * @tc.desc   blue 37 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0038 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 37, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(37));
      expect(result.pixel[2]).assertEqual(37);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0038 end');
    })

    /**
     * @tc.name   testVolumeBlue0039
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0039
     * @tc.desc   blue 38 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0039 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 38, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(38));
      expect(result.pixel[2]).assertEqual(38);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0039 end');
    })

    /**
     * @tc.name   testVolumeBlue0040
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0040
     * @tc.desc   blue 39 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0040 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 39, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(39));
      expect(result.pixel[2]).assertEqual(39);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0040 end');
    })

    /**
     * @tc.name   testVolumeBlue0041
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0041
     * @tc.desc   blue 40 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0041 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 40, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(40));
      expect(result.pixel[2]).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0041 end');
    })

    /**
     * @tc.name   testVolumeBlue0042
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0042
     * @tc.desc   blue 41 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0042 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 41, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(41));
      expect(result.pixel[2]).assertEqual(41);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0042 end');
    })

    /**
     * @tc.name   testVolumeBlue0043
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0043
     * @tc.desc   blue 42 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0043 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 42, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(42));
      expect(result.pixel[2]).assertEqual(42);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0043 end');
    })

    /**
     * @tc.name   testVolumeBlue0044
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0044
     * @tc.desc   blue 43 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0044 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 43, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(43));
      expect(result.pixel[2]).assertEqual(43);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0044 end');
    })

    /**
     * @tc.name   testVolumeBlue0045
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0045
     * @tc.desc   blue 44 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0045 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 44, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(44));
      expect(result.pixel[2]).assertEqual(44);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0045 end');
    })

    /**
     * @tc.name   testVolumeBlue0046
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0046
     * @tc.desc   blue 45 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0046 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 45, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(45));
      expect(result.pixel[2]).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0046 end');
    })

    /**
     * @tc.name   testVolumeBlue0047
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0047
     * @tc.desc   blue 46 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0047 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 46, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(46));
      expect(result.pixel[2]).assertEqual(46);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0047 end');
    })

    /**
     * @tc.name   testVolumeBlue0048
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0048
     * @tc.desc   blue 47 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0048 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 47, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(47));
      expect(result.pixel[2]).assertEqual(47);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0048 end');
    })

    /**
     * @tc.name   testVolumeBlue0049
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0049
     * @tc.desc   blue 48 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0049 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 48, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(48));
      expect(result.pixel[2]).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0049 end');
    })

    /**
     * @tc.name   testVolumeBlue0050
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0050
     * @tc.desc   blue 49 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0050 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 49, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(49));
      expect(result.pixel[2]).assertEqual(49);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0050 end');
    })

    /**
     * @tc.name   testVolumeBlue0051
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0051
     * @tc.desc   blue 50 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0051 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 50, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(50));
      expect(result.pixel[2]).assertEqual(50);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0051 end');
    })

    /**
     * @tc.name   testVolumeBlue0052
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0052
     * @tc.desc   blue 51 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0052 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 51, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(51));
      expect(result.pixel[2]).assertEqual(51);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0052 end');
    })

    /**
     * @tc.name   testVolumeBlue0053
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0053
     * @tc.desc   blue 52 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0053 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 52, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(52));
      expect(result.pixel[2]).assertEqual(52);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0053 end');
    })

    /**
     * @tc.name   testVolumeBlue0054
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0054
     * @tc.desc   blue 53 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0054 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 53, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(53));
      expect(result.pixel[2]).assertEqual(53);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0054 end');
    })

    /**
     * @tc.name   testVolumeBlue0055
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0055
     * @tc.desc   blue 54 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0055 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 54, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(54));
      expect(result.pixel[2]).assertEqual(54);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0055 end');
    })

    /**
     * @tc.name   testVolumeBlue0056
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0056
     * @tc.desc   blue 55 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0056 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 55, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(55));
      expect(result.pixel[2]).assertEqual(55);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0056 end');
    })

    /**
     * @tc.name   testVolumeBlue0057
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0057
     * @tc.desc   blue 56 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0057 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 56, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(56));
      expect(result.pixel[2]).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0057 end');
    })

    /**
     * @tc.name   testVolumeBlue0058
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0058
     * @tc.desc   blue 57 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0058 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 57, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(57));
      expect(result.pixel[2]).assertEqual(57);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0058 end');
    })

    /**
     * @tc.name   testVolumeBlue0059
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0059
     * @tc.desc   blue 58 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0059 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 58, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(58));
      expect(result.pixel[2]).assertEqual(58);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0059 end');
    })

    /**
     * @tc.name   testVolumeBlue0060
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0060
     * @tc.desc   blue 59 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0060 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 59, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(59));
      expect(result.pixel[2]).assertEqual(59);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0060 end');
    })

    /**
     * @tc.name   testVolumeBlue0061
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0061
     * @tc.desc   blue 60 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0061 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 60, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(60));
      expect(result.pixel[2]).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0061 end');
    })

    /**
     * @tc.name   testVolumeBlue0062
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0062
     * @tc.desc   blue 61 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0062 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 61, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(61));
      expect(result.pixel[2]).assertEqual(61);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0062 end');
    })

    /**
     * @tc.name   testVolumeBlue0063
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0063
     * @tc.desc   blue 62 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0063 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 62, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(62));
      expect(result.pixel[2]).assertEqual(62);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0063 end');
    })

    /**
     * @tc.name   testVolumeBlue0064
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0064
     * @tc.desc   blue 63 round-trips while red and green stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0064 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 63, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(63));
      expect(result.pixel[2]).assertEqual(63);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0064 end');
    })

    /**
     * @tc.name   testVolumeBlue0065
     * @tc.number SUB_XCOMPONENT3D_VOLBLUE_0065
     * @tc.desc   blue 256 is out of range, code -2 and readback stays zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeBlue0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0065 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 256, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(-2));
      expect(result.code).assertEqual(-2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[2]), String(0));
      expect(result.corner[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeBlue0065 end');
    })

  })
}
