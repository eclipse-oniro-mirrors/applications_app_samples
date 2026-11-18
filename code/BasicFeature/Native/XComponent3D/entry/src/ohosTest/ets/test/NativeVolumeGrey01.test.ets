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

export default function nativeVolumeGreyTest() {
  resetYieldCounter();
  describe('NativeVolumeGrey01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeGrey0001
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0001
     * @tc.desc   grey level 0 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0001 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(0));
      expect(result.corner[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0001 end');
    })

    /**
     * @tc.name   testVolumeGrey0002
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0002
     * @tc.desc   grey level 8 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0002 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(8, 8, 8, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(8));
      expect(result.pixel[0]).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(8));
      expect(result.pixel[1]).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(8));
      expect(result.pixel[2]).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(8));
      expect(result.corner[0]).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0002 end');
    })

    /**
     * @tc.name   testVolumeGrey0003
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0003
     * @tc.desc   grey level 16 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0003 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(16, 16, 16, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(16));
      expect(result.pixel[0]).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(16));
      expect(result.pixel[1]).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(16));
      expect(result.pixel[2]).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(16));
      expect(result.corner[0]).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0003 end');
    })

    /**
     * @tc.name   testVolumeGrey0004
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0004
     * @tc.desc   grey level 24 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0004 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(24, 24, 24, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(24));
      expect(result.pixel[0]).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(24));
      expect(result.pixel[1]).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(24));
      expect(result.pixel[2]).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(24));
      expect(result.corner[0]).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0004 end');
    })

    /**
     * @tc.name   testVolumeGrey0005
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0005
     * @tc.desc   grey level 32 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0005 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 32, 32, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(32));
      expect(result.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(32));
      expect(result.pixel[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(32));
      expect(result.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(32));
      expect(result.corner[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0005 end');
    })

    /**
     * @tc.name   testVolumeGrey0006
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0006
     * @tc.desc   grey level 40 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0006 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(40, 40, 40, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(40));
      expect(result.pixel[0]).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(40));
      expect(result.pixel[1]).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(40));
      expect(result.pixel[2]).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(40));
      expect(result.corner[0]).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0006 end');
    })

    /**
     * @tc.name   testVolumeGrey0007
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0007
     * @tc.desc   grey level 48 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0007 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(48, 48, 48, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(48));
      expect(result.pixel[0]).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(48));
      expect(result.pixel[1]).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(48));
      expect(result.pixel[2]).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(48));
      expect(result.corner[0]).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0007 end');
    })

    /**
     * @tc.name   testVolumeGrey0008
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0008
     * @tc.desc   grey level 56 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0008 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(56, 56, 56, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(56));
      expect(result.pixel[0]).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(56));
      expect(result.pixel[1]).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(56));
      expect(result.pixel[2]).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(56));
      expect(result.corner[0]).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0008 end');
    })

    /**
     * @tc.name   testVolumeGrey0009
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0009
     * @tc.desc   grey level 64 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0009 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 64, 64, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(64));
      expect(result.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(64));
      expect(result.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(64));
      expect(result.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(64));
      expect(result.corner[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0009 end');
    })

    /**
     * @tc.name   testVolumeGrey0010
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0010
     * @tc.desc   grey level 72 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0010 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(72, 72, 72, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(72));
      expect(result.pixel[0]).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(72));
      expect(result.pixel[1]).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(72));
      expect(result.pixel[2]).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(72));
      expect(result.corner[0]).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0010 end');
    })

    /**
     * @tc.name   testVolumeGrey0011
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0011
     * @tc.desc   grey level 80 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0011 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(80, 80, 80, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(80));
      expect(result.pixel[0]).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(80));
      expect(result.pixel[1]).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(80));
      expect(result.pixel[2]).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(80));
      expect(result.corner[0]).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0011 end');
    })

    /**
     * @tc.name   testVolumeGrey0012
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0012
     * @tc.desc   grey level 88 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0012 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(88, 88, 88, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(88));
      expect(result.pixel[0]).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(88));
      expect(result.pixel[1]).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(88));
      expect(result.pixel[2]).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(88));
      expect(result.corner[0]).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0012 end');
    })

    /**
     * @tc.name   testVolumeGrey0013
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0013
     * @tc.desc   grey level 96 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0013 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(96, 96, 96, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(96));
      expect(result.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(96));
      expect(result.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(96));
      expect(result.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(96));
      expect(result.corner[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0013 end');
    })

    /**
     * @tc.name   testVolumeGrey0014
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0014
     * @tc.desc   grey level 104 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0014 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(104, 104, 104, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(104));
      expect(result.pixel[0]).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(104));
      expect(result.pixel[1]).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(104));
      expect(result.pixel[2]).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(104));
      expect(result.corner[0]).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0014 end');
    })

    /**
     * @tc.name   testVolumeGrey0015
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0015
     * @tc.desc   grey level 112 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0015 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(112, 112, 112, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(112));
      expect(result.pixel[0]).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(112));
      expect(result.pixel[1]).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(112));
      expect(result.pixel[2]).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(112));
      expect(result.corner[0]).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0015 end');
    })

    /**
     * @tc.name   testVolumeGrey0016
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0016
     * @tc.desc   grey level 120 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0016 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(120, 120, 120, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(120));
      expect(result.pixel[0]).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(120));
      expect(result.pixel[1]).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(120));
      expect(result.pixel[2]).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(120));
      expect(result.corner[0]).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0016 end');
    })

    /**
     * @tc.name   testVolumeGrey0017
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0017
     * @tc.desc   grey level 128 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0017 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 128, 128, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(128));
      expect(result.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(128));
      expect(result.pixel[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(128));
      expect(result.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(128));
      expect(result.corner[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0017 end');
    })

    /**
     * @tc.name   testVolumeGrey0018
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0018
     * @tc.desc   grey level 136 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0018 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(136, 136, 136, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(136));
      expect(result.pixel[0]).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(136));
      expect(result.pixel[1]).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(136));
      expect(result.pixel[2]).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(136));
      expect(result.corner[0]).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0018 end');
    })

    /**
     * @tc.name   testVolumeGrey0019
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0019
     * @tc.desc   grey level 144 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0019 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(144, 144, 144, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(144));
      expect(result.pixel[0]).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(144));
      expect(result.pixel[1]).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(144));
      expect(result.pixel[2]).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(144));
      expect(result.corner[0]).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0019 end');
    })

    /**
     * @tc.name   testVolumeGrey0020
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0020
     * @tc.desc   grey level 152 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0020 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(152, 152, 152, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(152));
      expect(result.pixel[0]).assertEqual(152);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(152));
      expect(result.pixel[1]).assertEqual(152);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(152));
      expect(result.pixel[2]).assertEqual(152);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(152));
      expect(result.corner[0]).assertEqual(152);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0020 end');
    })

    /**
     * @tc.name   testVolumeGrey0021
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0021
     * @tc.desc   grey level 160 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0021 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 160, 160, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(160));
      expect(result.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(160));
      expect(result.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(160));
      expect(result.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(160));
      expect(result.corner[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0021 end');
    })

    /**
     * @tc.name   testVolumeGrey0022
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0022
     * @tc.desc   grey level 168 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0022 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(168, 168, 168, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(168));
      expect(result.pixel[0]).assertEqual(168);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(168));
      expect(result.pixel[1]).assertEqual(168);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(168));
      expect(result.pixel[2]).assertEqual(168);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(168));
      expect(result.corner[0]).assertEqual(168);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0022 end');
    })

    /**
     * @tc.name   testVolumeGrey0023
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0023
     * @tc.desc   grey level 176 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0023 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(176, 176, 176, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(176));
      expect(result.pixel[0]).assertEqual(176);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(176));
      expect(result.pixel[1]).assertEqual(176);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(176));
      expect(result.pixel[2]).assertEqual(176);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(176));
      expect(result.corner[0]).assertEqual(176);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0023 end');
    })

    /**
     * @tc.name   testVolumeGrey0024
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0024
     * @tc.desc   grey level 184 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0024 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(184, 184, 184, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(184));
      expect(result.pixel[0]).assertEqual(184);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(184));
      expect(result.pixel[1]).assertEqual(184);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(184));
      expect(result.pixel[2]).assertEqual(184);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(184));
      expect(result.corner[0]).assertEqual(184);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0024 end');
    })

    /**
     * @tc.name   testVolumeGrey0025
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0025
     * @tc.desc   grey level 192 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0025 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 192, 192, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(192));
      expect(result.pixel[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(192));
      expect(result.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(192));
      expect(result.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(192));
      expect(result.corner[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0025 end');
    })

    /**
     * @tc.name   testVolumeGrey0026
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0026
     * @tc.desc   grey level 200 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0026 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(200, 200, 200, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(200));
      expect(result.pixel[0]).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(200));
      expect(result.pixel[1]).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(200));
      expect(result.pixel[2]).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(200));
      expect(result.corner[0]).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0026 end');
    })

    /**
     * @tc.name   testVolumeGrey0027
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0027
     * @tc.desc   grey level 208 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0027 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(208, 208, 208, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(208));
      expect(result.pixel[0]).assertEqual(208);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(208));
      expect(result.pixel[1]).assertEqual(208);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(208));
      expect(result.pixel[2]).assertEqual(208);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(208));
      expect(result.corner[0]).assertEqual(208);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0027 end');
    })

    /**
     * @tc.name   testVolumeGrey0028
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0028
     * @tc.desc   grey level 216 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0028 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(216, 216, 216, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(216));
      expect(result.pixel[0]).assertEqual(216);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(216));
      expect(result.pixel[1]).assertEqual(216);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(216));
      expect(result.pixel[2]).assertEqual(216);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(216));
      expect(result.corner[0]).assertEqual(216);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0028 end');
    })

    /**
     * @tc.name   testVolumeGrey0029
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0029
     * @tc.desc   grey level 224 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0029 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 224, 224, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(224));
      expect(result.pixel[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(224));
      expect(result.pixel[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(224));
      expect(result.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(224));
      expect(result.corner[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0029 end');
    })

    /**
     * @tc.name   testVolumeGrey0030
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0030
     * @tc.desc   grey level 232 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0030 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(232, 232, 232, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(232));
      expect(result.pixel[0]).assertEqual(232);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(232));
      expect(result.pixel[1]).assertEqual(232);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(232));
      expect(result.pixel[2]).assertEqual(232);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(232));
      expect(result.corner[0]).assertEqual(232);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0030 end');
    })

    /**
     * @tc.name   testVolumeGrey0031
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0031
     * @tc.desc   grey level 240 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0031 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(240, 240, 240, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(240));
      expect(result.pixel[0]).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(240));
      expect(result.pixel[1]).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(240));
      expect(result.pixel[2]).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(240));
      expect(result.corner[0]).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0031 end');
    })

    /**
     * @tc.name   testVolumeGrey0032
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0032
     * @tc.desc   grey level 248 round-trips on all three channels
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0032 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(248, 248, 248, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(248));
      expect(result.pixel[0]).assertEqual(248);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(248));
      expect(result.pixel[1]).assertEqual(248);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(248));
      expect(result.pixel[2]).assertEqual(248);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(248));
      expect(result.corner[0]).assertEqual(248);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0032 end');
    })

    /**
     * @tc.name   testVolumeGrey0033
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0033
     * @tc.desc   white level fills every channel and both sampled corners
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0033 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
      expect(result.pixel[0]).assertEqual(255);
      expect(result.pixel[1]).assertEqual(255);
      expect(result.pixel[2]).assertEqual(255);
      expect(result.corner[0]).assertEqual(255);
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0033 end');
    })

    /**
     * @tc.name   testVolumeGrey0034
     * @tc.number SUB_XCOMPONENT3D_VOLGREY_0034
     * @tc.desc   Showcase: both grey endpoints stay uniform on both sample points
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGrey0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0034 begin');
      const white: PixelProbeResult = probeRenderSolidPixel(255, 255, 255, 255);
      const black: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(white.pixel[0]), String(255));
      expect(white.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(white.corner[1]), String(255));
      expect(white.corner[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(black.pixel[0]), String(0));
      expect(black.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(black.corner[2]), String(0));
      expect(black.corner[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGrey0034 end');
    })

  })
}
