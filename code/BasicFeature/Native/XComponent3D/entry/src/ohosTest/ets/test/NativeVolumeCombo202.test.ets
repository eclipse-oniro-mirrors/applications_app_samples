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
  PixelProbeResult,
  ProbeResult,
  probeRenderSolidPixel,
  probeSetExpectedFrameRateRange,
  changeShape,
  getShapeIndex,
} from 'libnativerender.so';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';

export default function nativeVolumeCombo202Test() {
  resetYieldCounter();
  describe('NativeVolumeCombo202', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeCombo20066
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0066
     * @tc.desc   shape 136 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20066 begin');
      changeShape(136);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
      expect(idx).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(32));
      expect(px.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(64));
      expect(px.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(96));
      expect(px.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20066 end');
    })

    /**
     * @tc.name   testVolumeCombo20067
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0067
     * @tc.desc   shape 136 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20067 begin');
      changeShape(136);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
      expect(idx).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(64));
      expect(px.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(96));
      expect(px.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(128));
      expect(px.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20067 end');
    })

    /**
     * @tc.name   testVolumeCombo20068
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0068
     * @tc.desc   shape 136 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20068 begin');
      changeShape(136);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
      expect(idx).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(96));
      expect(px.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(128));
      expect(px.pixel[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(160));
      expect(px.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20068 end');
    })

    /**
     * @tc.name   testVolumeCombo20069
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0069
     * @tc.desc   shape 136 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20069 begin');
      changeShape(136);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
      expect(idx).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(128));
      expect(px.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(160));
      expect(px.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(192));
      expect(px.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20069 end');
    })

    /**
     * @tc.name   testVolumeCombo20070
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0070
     * @tc.desc   shape 136 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20070 begin');
      changeShape(136);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
      expect(idx).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(160));
      expect(px.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(192));
      expect(px.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(224));
      expect(px.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20070 end');
    })

    /**
     * @tc.name   testVolumeCombo20071
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0071
     * @tc.desc   shape 136 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20071 begin');
      changeShape(136);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
      expect(idx).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(192));
      expect(px.pixel[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(224));
      expect(px.pixel[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(255));
      expect(px.pixel[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20071 end');
    })

    /**
     * @tc.name   testVolumeCombo20072
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0072
     * @tc.desc   shape 136 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20072 begin');
      changeShape(136);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
      expect(idx).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(224));
      expect(px.pixel[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(255));
      expect(px.pixel[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(32));
      expect(px.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20072 end');
    })

    /**
     * @tc.name   testVolumeCombo20073
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0073
     * @tc.desc   shape 136 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20073 begin');
      changeShape(136);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(136));
      expect(idx).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(255));
      expect(px.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(32));
      expect(px.pixel[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20073 end');
    })

    /**
     * @tc.name   testVolumeCombo20074
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0074
     * @tc.desc   shape 137 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20074 begin');
      changeShape(137);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(137));
      expect(idx).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(32));
      expect(px.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(64));
      expect(px.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(96));
      expect(px.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20074 end');
    })

    /**
     * @tc.name   testVolumeCombo20075
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0075
     * @tc.desc   shape 137 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20075 begin');
      changeShape(137);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(137));
      expect(idx).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(64));
      expect(px.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(96));
      expect(px.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(128));
      expect(px.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20075 end');
    })

    /**
     * @tc.name   testVolumeCombo20076
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0076
     * @tc.desc   shape 137 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20076 begin');
      changeShape(137);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(137));
      expect(idx).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(96));
      expect(px.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(128));
      expect(px.pixel[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(160));
      expect(px.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20076 end');
    })

    /**
     * @tc.name   testVolumeCombo20077
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0077
     * @tc.desc   shape 137 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20077 begin');
      changeShape(137);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(137));
      expect(idx).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(128));
      expect(px.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(160));
      expect(px.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(192));
      expect(px.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20077 end');
    })

    /**
     * @tc.name   testVolumeCombo20078
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0078
     * @tc.desc   shape 137 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20078 begin');
      changeShape(137);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(137));
      expect(idx).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(160));
      expect(px.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(192));
      expect(px.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(224));
      expect(px.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20078 end');
    })

    /**
     * @tc.name   testVolumeCombo20079
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0079
     * @tc.desc   shape 137 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20079 begin');
      changeShape(137);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(137));
      expect(idx).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(192));
      expect(px.pixel[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(224));
      expect(px.pixel[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(255));
      expect(px.pixel[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20079 end');
    })

    /**
     * @tc.name   testVolumeCombo20080
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0080
     * @tc.desc   shape 137 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20080 begin');
      changeShape(137);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(137));
      expect(idx).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(224));
      expect(px.pixel[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(255));
      expect(px.pixel[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(32));
      expect(px.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20080 end');
    })

    /**
     * @tc.name   testVolumeCombo20081
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0081
     * @tc.desc   shape 137 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20081 begin');
      changeShape(137);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(137));
      expect(idx).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(255));
      expect(px.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(32));
      expect(px.pixel[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20081 end');
    })

    /**
     * @tc.name   testVolumeCombo20082
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0082
     * @tc.desc   shape 138 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20082 begin');
      changeShape(138);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(138));
      expect(idx).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(32));
      expect(px.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(64));
      expect(px.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(96));
      expect(px.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20082 end');
    })

    /**
     * @tc.name   testVolumeCombo20083
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0083
     * @tc.desc   shape 138 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20083 begin');
      changeShape(138);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(138));
      expect(idx).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(64));
      expect(px.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(96));
      expect(px.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(128));
      expect(px.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20083 end');
    })

    /**
     * @tc.name   testVolumeCombo20084
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0084
     * @tc.desc   shape 138 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20084 begin');
      changeShape(138);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(138));
      expect(idx).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(96));
      expect(px.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(128));
      expect(px.pixel[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(160));
      expect(px.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20084 end');
    })

    /**
     * @tc.name   testVolumeCombo20085
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0085
     * @tc.desc   shape 138 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20085 begin');
      changeShape(138);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(138));
      expect(idx).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(128));
      expect(px.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(160));
      expect(px.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(192));
      expect(px.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20085 end');
    })

    /**
     * @tc.name   testVolumeCombo20086
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0086
     * @tc.desc   shape 138 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20086 begin');
      changeShape(138);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(138));
      expect(idx).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(160));
      expect(px.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(192));
      expect(px.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(224));
      expect(px.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20086 end');
    })

    /**
     * @tc.name   testVolumeCombo20087
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0087
     * @tc.desc   shape 138 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20087 begin');
      changeShape(138);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(138));
      expect(idx).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(192));
      expect(px.pixel[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(224));
      expect(px.pixel[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(255));
      expect(px.pixel[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20087 end');
    })

    /**
     * @tc.name   testVolumeCombo20088
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0088
     * @tc.desc   shape 138 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20088 begin');
      changeShape(138);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(138));
      expect(idx).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(224));
      expect(px.pixel[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(255));
      expect(px.pixel[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(32));
      expect(px.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20088 end');
    })

    /**
     * @tc.name   testVolumeCombo20089
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0089
     * @tc.desc   shape 138 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20089 begin');
      changeShape(138);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(138));
      expect(idx).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(255));
      expect(px.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(32));
      expect(px.pixel[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20089 end');
    })

    /**
     * @tc.name   testVolumeCombo20090
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0090
     * @tc.desc   shape 139 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20090 begin');
      changeShape(139);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(139));
      expect(idx).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(32));
      expect(px.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(64));
      expect(px.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(96));
      expect(px.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20090 end');
    })

    /**
     * @tc.name   testVolumeCombo20091
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0091
     * @tc.desc   shape 139 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20091 begin');
      changeShape(139);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(139));
      expect(idx).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(64));
      expect(px.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(96));
      expect(px.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(128));
      expect(px.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20091 end');
    })

    /**
     * @tc.name   testVolumeCombo20092
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0092
     * @tc.desc   shape 139 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20092 begin');
      changeShape(139);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(139));
      expect(idx).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(96));
      expect(px.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(128));
      expect(px.pixel[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(160));
      expect(px.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20092 end');
    })

    /**
     * @tc.name   testVolumeCombo20093
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0093
     * @tc.desc   shape 139 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20093 begin');
      changeShape(139);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(139));
      expect(idx).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(128));
      expect(px.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(160));
      expect(px.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(192));
      expect(px.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20093 end');
    })

    /**
     * @tc.name   testVolumeCombo20094
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0094
     * @tc.desc   shape 139 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20094 begin');
      changeShape(139);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(139));
      expect(idx).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(160));
      expect(px.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(192));
      expect(px.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(224));
      expect(px.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20094 end');
    })

    /**
     * @tc.name   testVolumeCombo20095
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0095
     * @tc.desc   shape 139 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20095 begin');
      changeShape(139);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(139));
      expect(idx).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(192));
      expect(px.pixel[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(224));
      expect(px.pixel[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(255));
      expect(px.pixel[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20095 end');
    })

    /**
     * @tc.name   testVolumeCombo20096
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0096
     * @tc.desc   shape 139 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20096 begin');
      changeShape(139);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(139));
      expect(idx).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(224));
      expect(px.pixel[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(255));
      expect(px.pixel[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(32));
      expect(px.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20096 end');
    })

    /**
     * @tc.name   testVolumeCombo20097
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0097
     * @tc.desc   shape 139 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20097 begin');
      changeShape(139);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(139));
      expect(idx).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(255));
      expect(px.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(32));
      expect(px.pixel[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20097 end');
    })

    /**
     * @tc.name   testVolumeCombo20098
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0098
     * @tc.desc   shape 140 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20098 begin');
      changeShape(140);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(140));
      expect(idx).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(32));
      expect(px.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(64));
      expect(px.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(96));
      expect(px.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20098 end');
    })

    /**
     * @tc.name   testVolumeCombo20099
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0099
     * @tc.desc   shape 140 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20099 begin');
      changeShape(140);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(140));
      expect(idx).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(64));
      expect(px.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(96));
      expect(px.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(128));
      expect(px.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20099 end');
    })

    /**
     * @tc.name   testVolumeCombo20100
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0100
     * @tc.desc   shape 140 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20100 begin');
      changeShape(140);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(140));
      expect(idx).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(96));
      expect(px.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(128));
      expect(px.pixel[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(160));
      expect(px.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20100 end');
    })

    /**
     * @tc.name   testVolumeCombo20101
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0101
     * @tc.desc   shape 140 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20101 begin');
      changeShape(140);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(140));
      expect(idx).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(128));
      expect(px.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(160));
      expect(px.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(192));
      expect(px.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20101 end');
    })

    /**
     * @tc.name   testVolumeCombo20102
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0102
     * @tc.desc   shape 140 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20102 begin');
      changeShape(140);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(140));
      expect(idx).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(160));
      expect(px.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(192));
      expect(px.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(224));
      expect(px.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20102 end');
    })

    /**
     * @tc.name   testVolumeCombo20103
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0103
     * @tc.desc   shape 140 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20103 begin');
      changeShape(140);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(140));
      expect(idx).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(192));
      expect(px.pixel[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(224));
      expect(px.pixel[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(255));
      expect(px.pixel[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20103 end');
    })

    /**
     * @tc.name   testVolumeCombo20104
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0104
     * @tc.desc   shape 140 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20104 begin');
      changeShape(140);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(140));
      expect(idx).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(224));
      expect(px.pixel[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(255));
      expect(px.pixel[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(32));
      expect(px.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20104 end');
    })

    /**
     * @tc.name   testVolumeCombo20105
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0105
     * @tc.desc   shape 140 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20105 begin');
      changeShape(140);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(140));
      expect(idx).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(255));
      expect(px.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(32));
      expect(px.pixel[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20105 end');
    })

    /**
     * @tc.name   testVolumeCombo20106
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0106
     * @tc.desc   shape 141 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20106 begin');
      changeShape(141);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(141));
      expect(idx).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(32));
      expect(px.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(64));
      expect(px.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(96));
      expect(px.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20106 end');
    })

    /**
     * @tc.name   testVolumeCombo20107
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0107
     * @tc.desc   shape 141 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20107 begin');
      changeShape(141);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(141));
      expect(idx).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(64));
      expect(px.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(96));
      expect(px.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(128));
      expect(px.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20107 end');
    })

    /**
     * @tc.name   testVolumeCombo20108
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0108
     * @tc.desc   shape 141 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20108 begin');
      changeShape(141);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(141));
      expect(idx).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(96));
      expect(px.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(128));
      expect(px.pixel[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(160));
      expect(px.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20108 end');
    })

    /**
     * @tc.name   testVolumeCombo20109
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0109
     * @tc.desc   shape 141 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20109 begin');
      changeShape(141);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(141));
      expect(idx).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(128));
      expect(px.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(160));
      expect(px.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(192));
      expect(px.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20109 end');
    })

    /**
     * @tc.name   testVolumeCombo20110
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0110
     * @tc.desc   shape 141 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20110 begin');
      changeShape(141);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(141));
      expect(idx).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(160));
      expect(px.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(192));
      expect(px.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(224));
      expect(px.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20110 end');
    })

    /**
     * @tc.name   testVolumeCombo20111
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0111
     * @tc.desc   shape 141 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20111 begin');
      changeShape(141);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(141));
      expect(idx).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(192));
      expect(px.pixel[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(224));
      expect(px.pixel[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(255));
      expect(px.pixel[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20111 end');
    })

    /**
     * @tc.name   testVolumeCombo20112
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0112
     * @tc.desc   shape 141 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20112 begin');
      changeShape(141);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(141));
      expect(idx).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(224));
      expect(px.pixel[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(255));
      expect(px.pixel[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(32));
      expect(px.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20112 end');
    })

    /**
     * @tc.name   testVolumeCombo20113
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0113
     * @tc.desc   shape 141 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20113 begin');
      changeShape(141);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(141));
      expect(idx).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(255));
      expect(px.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(32));
      expect(px.pixel[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20113 end');
    })

    /**
     * @tc.name   testVolumeCombo20114
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0114
     * @tc.desc   shape 142 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20114 begin');
      changeShape(142);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(142));
      expect(idx).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(32));
      expect(px.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(64));
      expect(px.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(96));
      expect(px.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20114 end');
    })

    /**
     * @tc.name   testVolumeCombo20115
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0115
     * @tc.desc   shape 142 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20115 begin');
      changeShape(142);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(142));
      expect(idx).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(64));
      expect(px.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(96));
      expect(px.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(128));
      expect(px.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20115 end');
    })

    /**
     * @tc.name   testVolumeCombo20116
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0116
     * @tc.desc   shape 142 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20116 begin');
      changeShape(142);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(142));
      expect(idx).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(96));
      expect(px.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(128));
      expect(px.pixel[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(160));
      expect(px.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20116 end');
    })

    /**
     * @tc.name   testVolumeCombo20117
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0117
     * @tc.desc   shape 142 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20117 begin');
      changeShape(142);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(142));
      expect(idx).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(128));
      expect(px.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(160));
      expect(px.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(192));
      expect(px.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20117 end');
    })

    /**
     * @tc.name   testVolumeCombo20118
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0118
     * @tc.desc   shape 142 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20118 begin');
      changeShape(142);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(142));
      expect(idx).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(160));
      expect(px.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(192));
      expect(px.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(224));
      expect(px.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20118 end');
    })

    /**
     * @tc.name   testVolumeCombo20119
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0119
     * @tc.desc   shape 142 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20119 begin');
      changeShape(142);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(142));
      expect(idx).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(192));
      expect(px.pixel[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(224));
      expect(px.pixel[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(255));
      expect(px.pixel[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20119 end');
    })

    /**
     * @tc.name   testVolumeCombo20120
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0120
     * @tc.desc   shape 142 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20120 begin');
      changeShape(142);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(142));
      expect(idx).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(224));
      expect(px.pixel[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(255));
      expect(px.pixel[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(32));
      expect(px.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20120 end');
    })

    /**
     * @tc.name   testVolumeCombo20121
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0121
     * @tc.desc   shape 142 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20121 begin');
      changeShape(142);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(142));
      expect(idx).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(255));
      expect(px.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(32));
      expect(px.pixel[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20121 end');
    })

    /**
     * @tc.name   testVolumeCombo20122
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0122
     * @tc.desc   shape 143 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20122 begin');
      changeShape(143);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(32));
      expect(px.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(64));
      expect(px.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(96));
      expect(px.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20122 end');
    })

    /**
     * @tc.name   testVolumeCombo20123
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0123
     * @tc.desc   shape 143 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20123 begin');
      changeShape(143);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(64));
      expect(px.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(96));
      expect(px.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(128));
      expect(px.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20123 end');
    })

    /**
     * @tc.name   testVolumeCombo20124
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0124
     * @tc.desc   shape 143 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20124 begin');
      changeShape(143);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(96));
      expect(px.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(128));
      expect(px.pixel[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(160));
      expect(px.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20124 end');
    })

    /**
     * @tc.name   testVolumeCombo20125
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0125
     * @tc.desc   shape 143 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20125 begin');
      changeShape(143);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(128));
      expect(px.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(160));
      expect(px.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(192));
      expect(px.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20125 end');
    })

    /**
     * @tc.name   testVolumeCombo20126
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0126
     * @tc.desc   shape 143 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20126 begin');
      changeShape(143);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(160));
      expect(px.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(192));
      expect(px.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(224));
      expect(px.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20126 end');
    })

    /**
     * @tc.name   testVolumeCombo20127
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0127
     * @tc.desc   shape 143 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20127 begin');
      changeShape(143);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(192));
      expect(px.pixel[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(224));
      expect(px.pixel[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(255));
      expect(px.pixel[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20127 end');
    })

    /**
     * @tc.name   testVolumeCombo20128
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0128
     * @tc.desc   shape 143 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20128 begin');
      changeShape(143);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(224));
      expect(px.pixel[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(255));
      expect(px.pixel[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(32));
      expect(px.pixel[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20128 end');
    })

    /**
     * @tc.name   testVolumeCombo20129
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0129
     * @tc.desc   shape 143 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20129 begin');
      changeShape(143);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[0]), String(255));
      expect(px.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[1]), String(32));
      expect(px.pixel[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(30));
      expect(fps.value).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.code), String(0));
      expect(px.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20129 end');
    })

    /**
     * @tc.name   testVolumeCombo20130
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0130
     * @tc.desc   shape 143 survives a color render and a frame-rate set in the same case
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20130 begin');
      changeShape(143);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 90);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(143));
      expect(idx).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(60));
      expect(fps.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px.code === 0 && fps.code === 0));
      expect(px.code === 0 && fps.code === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20130 end');
    })

  })
}
