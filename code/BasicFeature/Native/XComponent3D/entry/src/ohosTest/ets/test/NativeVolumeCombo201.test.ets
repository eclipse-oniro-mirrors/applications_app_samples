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

export default function nativeVolumeCombo201Test() {
  resetYieldCounter();
  describe('NativeVolumeCombo201', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeCombo20001
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0001
     * @tc.desc   shape 128 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20001 begin');
      changeShape(128);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
      expect(idx).assertEqual(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20001 end');
    })

    /**
     * @tc.name   testVolumeCombo20002
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0002
     * @tc.desc   shape 128 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20002 begin');
      changeShape(128);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
      expect(idx).assertEqual(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20002 end');
    })

    /**
     * @tc.name   testVolumeCombo20003
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0003
     * @tc.desc   shape 128 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20003 begin');
      changeShape(128);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
      expect(idx).assertEqual(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20003 end');
    })

    /**
     * @tc.name   testVolumeCombo20004
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0004
     * @tc.desc   shape 128 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20004 begin');
      changeShape(128);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
      expect(idx).assertEqual(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20004 end');
    })

    /**
     * @tc.name   testVolumeCombo20005
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0005
     * @tc.desc   shape 128 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20005 begin');
      changeShape(128);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
      expect(idx).assertEqual(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20005 end');
    })

    /**
     * @tc.name   testVolumeCombo20006
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0006
     * @tc.desc   shape 128 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20006 begin');
      changeShape(128);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
      expect(idx).assertEqual(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20006 end');
    })

    /**
     * @tc.name   testVolumeCombo20007
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0007
     * @tc.desc   shape 128 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20007 begin');
      changeShape(128);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
      expect(idx).assertEqual(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20007 end');
    })

    /**
     * @tc.name   testVolumeCombo20008
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0008
     * @tc.desc   shape 128 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20008 begin');
      changeShape(128);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(128));
      expect(idx).assertEqual(128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20008 end');
    })

    /**
     * @tc.name   testVolumeCombo20009
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0009
     * @tc.desc   shape 129 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20009 begin');
      changeShape(129);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(129));
      expect(idx).assertEqual(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20009 end');
    })

    /**
     * @tc.name   testVolumeCombo20010
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0010
     * @tc.desc   shape 129 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20010 begin');
      changeShape(129);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(129));
      expect(idx).assertEqual(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20010 end');
    })

    /**
     * @tc.name   testVolumeCombo20011
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0011
     * @tc.desc   shape 129 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20011 begin');
      changeShape(129);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(129));
      expect(idx).assertEqual(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20011 end');
    })

    /**
     * @tc.name   testVolumeCombo20012
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0012
     * @tc.desc   shape 129 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20012 begin');
      changeShape(129);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(129));
      expect(idx).assertEqual(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20012 end');
    })

    /**
     * @tc.name   testVolumeCombo20013
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0013
     * @tc.desc   shape 129 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20013 begin');
      changeShape(129);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(129));
      expect(idx).assertEqual(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20013 end');
    })

    /**
     * @tc.name   testVolumeCombo20014
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0014
     * @tc.desc   shape 129 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20014 begin');
      changeShape(129);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(129));
      expect(idx).assertEqual(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20014 end');
    })

    /**
     * @tc.name   testVolumeCombo20015
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0015
     * @tc.desc   shape 129 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20015 begin');
      changeShape(129);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(129));
      expect(idx).assertEqual(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20015 end');
    })

    /**
     * @tc.name   testVolumeCombo20016
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0016
     * @tc.desc   shape 129 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20016 begin');
      changeShape(129);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(129));
      expect(idx).assertEqual(129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20016 end');
    })

    /**
     * @tc.name   testVolumeCombo20017
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0017
     * @tc.desc   shape 130 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20017 begin');
      changeShape(130);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(130));
      expect(idx).assertEqual(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20017 end');
    })

    /**
     * @tc.name   testVolumeCombo20018
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0018
     * @tc.desc   shape 130 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20018 begin');
      changeShape(130);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(130));
      expect(idx).assertEqual(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20018 end');
    })

    /**
     * @tc.name   testVolumeCombo20019
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0019
     * @tc.desc   shape 130 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20019 begin');
      changeShape(130);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(130));
      expect(idx).assertEqual(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20019 end');
    })

    /**
     * @tc.name   testVolumeCombo20020
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0020
     * @tc.desc   shape 130 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20020 begin');
      changeShape(130);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(130));
      expect(idx).assertEqual(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20020 end');
    })

    /**
     * @tc.name   testVolumeCombo20021
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0021
     * @tc.desc   shape 130 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20021 begin');
      changeShape(130);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(130));
      expect(idx).assertEqual(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20021 end');
    })

    /**
     * @tc.name   testVolumeCombo20022
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0022
     * @tc.desc   shape 130 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20022 begin');
      changeShape(130);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(130));
      expect(idx).assertEqual(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20022 end');
    })

    /**
     * @tc.name   testVolumeCombo20023
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0023
     * @tc.desc   shape 130 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20023 begin');
      changeShape(130);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(130));
      expect(idx).assertEqual(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20023 end');
    })

    /**
     * @tc.name   testVolumeCombo20024
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0024
     * @tc.desc   shape 130 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20024 begin');
      changeShape(130);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(130));
      expect(idx).assertEqual(130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20024 end');
    })

    /**
     * @tc.name   testVolumeCombo20025
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0025
     * @tc.desc   shape 131 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20025 begin');
      changeShape(131);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(131));
      expect(idx).assertEqual(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20025 end');
    })

    /**
     * @tc.name   testVolumeCombo20026
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0026
     * @tc.desc   shape 131 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20026 begin');
      changeShape(131);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(131));
      expect(idx).assertEqual(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20026 end');
    })

    /**
     * @tc.name   testVolumeCombo20027
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0027
     * @tc.desc   shape 131 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20027 begin');
      changeShape(131);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(131));
      expect(idx).assertEqual(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20027 end');
    })

    /**
     * @tc.name   testVolumeCombo20028
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0028
     * @tc.desc   shape 131 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20028 begin');
      changeShape(131);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(131));
      expect(idx).assertEqual(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20028 end');
    })

    /**
     * @tc.name   testVolumeCombo20029
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0029
     * @tc.desc   shape 131 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20029 begin');
      changeShape(131);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(131));
      expect(idx).assertEqual(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20029 end');
    })

    /**
     * @tc.name   testVolumeCombo20030
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0030
     * @tc.desc   shape 131 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20030 begin');
      changeShape(131);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(131));
      expect(idx).assertEqual(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20030 end');
    })

    /**
     * @tc.name   testVolumeCombo20031
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0031
     * @tc.desc   shape 131 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20031 begin');
      changeShape(131);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(131));
      expect(idx).assertEqual(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20031 end');
    })

    /**
     * @tc.name   testVolumeCombo20032
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0032
     * @tc.desc   shape 131 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20032 begin');
      changeShape(131);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(131));
      expect(idx).assertEqual(131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20032 end');
    })

    /**
     * @tc.name   testVolumeCombo20033
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0033
     * @tc.desc   shape 132 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20033 begin');
      changeShape(132);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(132));
      expect(idx).assertEqual(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20033 end');
    })

    /**
     * @tc.name   testVolumeCombo20034
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0034
     * @tc.desc   shape 132 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20034 begin');
      changeShape(132);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(132));
      expect(idx).assertEqual(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20034 end');
    })

    /**
     * @tc.name   testVolumeCombo20035
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0035
     * @tc.desc   shape 132 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20035 begin');
      changeShape(132);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(132));
      expect(idx).assertEqual(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20035 end');
    })

    /**
     * @tc.name   testVolumeCombo20036
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0036
     * @tc.desc   shape 132 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20036 begin');
      changeShape(132);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(132));
      expect(idx).assertEqual(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20036 end');
    })

    /**
     * @tc.name   testVolumeCombo20037
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0037
     * @tc.desc   shape 132 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20037 begin');
      changeShape(132);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(132));
      expect(idx).assertEqual(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20037 end');
    })

    /**
     * @tc.name   testVolumeCombo20038
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0038
     * @tc.desc   shape 132 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20038 begin');
      changeShape(132);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(132));
      expect(idx).assertEqual(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20038 end');
    })

    /**
     * @tc.name   testVolumeCombo20039
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0039
     * @tc.desc   shape 132 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20039 begin');
      changeShape(132);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(132));
      expect(idx).assertEqual(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20039 end');
    })

    /**
     * @tc.name   testVolumeCombo20040
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0040
     * @tc.desc   shape 132 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20040 begin');
      changeShape(132);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(132));
      expect(idx).assertEqual(132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20040 end');
    })

    /**
     * @tc.name   testVolumeCombo20041
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0041
     * @tc.desc   shape 133 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20041 begin');
      changeShape(133);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(133));
      expect(idx).assertEqual(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20041 end');
    })

    /**
     * @tc.name   testVolumeCombo20042
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0042
     * @tc.desc   shape 133 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20042 begin');
      changeShape(133);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(133));
      expect(idx).assertEqual(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20042 end');
    })

    /**
     * @tc.name   testVolumeCombo20043
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0043
     * @tc.desc   shape 133 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20043 begin');
      changeShape(133);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(133));
      expect(idx).assertEqual(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20043 end');
    })

    /**
     * @tc.name   testVolumeCombo20044
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0044
     * @tc.desc   shape 133 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20044 begin');
      changeShape(133);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(133));
      expect(idx).assertEqual(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20044 end');
    })

    /**
     * @tc.name   testVolumeCombo20045
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0045
     * @tc.desc   shape 133 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20045 begin');
      changeShape(133);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(133));
      expect(idx).assertEqual(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20045 end');
    })

    /**
     * @tc.name   testVolumeCombo20046
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0046
     * @tc.desc   shape 133 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20046 begin');
      changeShape(133);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(133));
      expect(idx).assertEqual(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20046 end');
    })

    /**
     * @tc.name   testVolumeCombo20047
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0047
     * @tc.desc   shape 133 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20047 begin');
      changeShape(133);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(133));
      expect(idx).assertEqual(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20047 end');
    })

    /**
     * @tc.name   testVolumeCombo20048
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0048
     * @tc.desc   shape 133 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20048 begin');
      changeShape(133);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(133));
      expect(idx).assertEqual(133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20048 end');
    })

    /**
     * @tc.name   testVolumeCombo20049
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0049
     * @tc.desc   shape 134 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20049 begin');
      changeShape(134);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(134));
      expect(idx).assertEqual(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20049 end');
    })

    /**
     * @tc.name   testVolumeCombo20050
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0050
     * @tc.desc   shape 134 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20050 begin');
      changeShape(134);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(134));
      expect(idx).assertEqual(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20050 end');
    })

    /**
     * @tc.name   testVolumeCombo20051
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0051
     * @tc.desc   shape 134 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20051 begin');
      changeShape(134);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(134));
      expect(idx).assertEqual(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20051 end');
    })

    /**
     * @tc.name   testVolumeCombo20052
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0052
     * @tc.desc   shape 134 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20052 begin');
      changeShape(134);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(134));
      expect(idx).assertEqual(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20052 end');
    })

    /**
     * @tc.name   testVolumeCombo20053
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0053
     * @tc.desc   shape 134 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20053 begin');
      changeShape(134);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(134));
      expect(idx).assertEqual(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20053 end');
    })

    /**
     * @tc.name   testVolumeCombo20054
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0054
     * @tc.desc   shape 134 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20054 begin');
      changeShape(134);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(134));
      expect(idx).assertEqual(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20054 end');
    })

    /**
     * @tc.name   testVolumeCombo20055
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0055
     * @tc.desc   shape 134 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20055 begin');
      changeShape(134);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(134));
      expect(idx).assertEqual(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20055 end');
    })

    /**
     * @tc.name   testVolumeCombo20056
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0056
     * @tc.desc   shape 134 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20056 begin');
      changeShape(134);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(134));
      expect(idx).assertEqual(134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20056 end');
    })

    /**
     * @tc.name   testVolumeCombo20057
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0057
     * @tc.desc   shape 135 with rgb 32/64/96 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20057 begin');
      changeShape(135);
      const px: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20057 end');
    })

    /**
     * @tc.name   testVolumeCombo20058
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0058
     * @tc.desc   shape 135 with rgb 64/96/128 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20058 begin');
      changeShape(135);
      const px: PixelProbeResult = probeRenderSolidPixel(64, 96, 128, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20058 end');
    })

    /**
     * @tc.name   testVolumeCombo20059
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0059
     * @tc.desc   shape 135 with rgb 96/128/160 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20059 begin');
      changeShape(135);
      const px: PixelProbeResult = probeRenderSolidPixel(96, 128, 160, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20059 end');
    })

    /**
     * @tc.name   testVolumeCombo20060
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0060
     * @tc.desc   shape 135 with rgb 128/160/192 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20060 begin');
      changeShape(135);
      const px: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20060 end');
    })

    /**
     * @tc.name   testVolumeCombo20061
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0061
     * @tc.desc   shape 135 with rgb 160/192/224 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20061 begin');
      changeShape(135);
      const px: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20061 end');
    })

    /**
     * @tc.name   testVolumeCombo20062
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0062
     * @tc.desc   shape 135 with rgb 192/224/255 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20062 begin');
      changeShape(135);
      const px: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20062 end');
    })

    /**
     * @tc.name   testVolumeCombo20063
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0063
     * @tc.desc   shape 135 with rgb 224/255/32 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20063 begin');
      changeShape(135);
      const px: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20063 end');
    })

    /**
     * @tc.name   testVolumeCombo20064
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0064
     * @tc.desc   shape 135 with rgb 255/32/64 keeps the chained state consistent
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20064 begin');
      changeShape(135);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(30, 120, 60);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20064 end');
    })

    /**
     * @tc.name   testVolumeCombo20065
     * @tc.number SUB_XCOMPONENT3D_VOLCOMBO2_0065
     * @tc.desc   shape 135 survives a color render and a frame-rate set in the same case
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeCombo20065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20065 begin');
      changeShape(135);
      const px: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const fps: ProbeResult = probeSetExpectedFrameRateRange(60, 120, 90);
      const idx: number = getShapeIndex();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(idx), String(135));
      expect(idx).assertEqual(135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px.pixel[2]), String(64));
      expect(px.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(fps.value), String(60));
      expect(fps.value).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px.code === 0 && fps.code === 0));
      expect(px.code === 0 && fps.code === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeCombo20065 end');
    })

  })
}
