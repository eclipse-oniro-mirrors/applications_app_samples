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

export default function nativeVolumeRgb302Test() {
  resetYieldCounter();
  describe('NativeVolumeRgb302', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeRgb30065
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0065
     * @tc.desc   r=32 g=64 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30065 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 64, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30065 end');
    })

    /**
     * @tc.name   testVolumeRgb30066
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0066
     * @tc.desc   r=32 g=64 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30066 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 64, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30066 end');
    })

    /**
     * @tc.name   testVolumeRgb30067
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0067
     * @tc.desc   r=32 g=64 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30067 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 64, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30067 end');
    })

    /**
     * @tc.name   testVolumeRgb30068
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0068
     * @tc.desc   r=32 g=64 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30068 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 64, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30068 end');
    })

    /**
     * @tc.name   testVolumeRgb30069
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0069
     * @tc.desc   r=32 g=64 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30069 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 64, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30069 end');
    })

    /**
     * @tc.name   testVolumeRgb30070
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0070
     * @tc.desc   r=32 g=64 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30070 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 64, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30070 end');
    })

    /**
     * @tc.name   testVolumeRgb30071
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0071
     * @tc.desc   r=32 g=64 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30071 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 64, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30071 end');
    })

    /**
     * @tc.name   testVolumeRgb30072
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0072
     * @tc.desc   r=32 g=96 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30072 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 96, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30072 end');
    })

    /**
     * @tc.name   testVolumeRgb30073
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0073
     * @tc.desc   r=32 g=96 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30073 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 96, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30073 end');
    })

    /**
     * @tc.name   testVolumeRgb30074
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0074
     * @tc.desc   r=32 g=96 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30074 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 96, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30074 end');
    })

    /**
     * @tc.name   testVolumeRgb30075
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0075
     * @tc.desc   r=32 g=96 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30075 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 96, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30075 end');
    })

    /**
     * @tc.name   testVolumeRgb30076
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0076
     * @tc.desc   r=32 g=96 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30076 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 96, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30076 end');
    })

    /**
     * @tc.name   testVolumeRgb30077
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0077
     * @tc.desc   r=32 g=96 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30077 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 96, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30077 end');
    })

    /**
     * @tc.name   testVolumeRgb30078
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0078
     * @tc.desc   r=32 g=96 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30078 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 96, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30078 end');
    })

    /**
     * @tc.name   testVolumeRgb30079
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0079
     * @tc.desc   r=32 g=128 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30079 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 128, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30079 end');
    })

    /**
     * @tc.name   testVolumeRgb30080
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0080
     * @tc.desc   r=32 g=128 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30080 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 128, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30080 end');
    })

    /**
     * @tc.name   testVolumeRgb30081
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0081
     * @tc.desc   r=32 g=128 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30081 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 128, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30081 end');
    })

    /**
     * @tc.name   testVolumeRgb30082
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0082
     * @tc.desc   r=32 g=128 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30082 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 128, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30082 end');
    })

    /**
     * @tc.name   testVolumeRgb30083
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0083
     * @tc.desc   r=32 g=128 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30083 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 128, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30083 end');
    })

    /**
     * @tc.name   testVolumeRgb30084
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0084
     * @tc.desc   r=32 g=128 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30084 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 128, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30084 end');
    })

    /**
     * @tc.name   testVolumeRgb30085
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0085
     * @tc.desc   r=32 g=128 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30085 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 128, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30085 end');
    })

    /**
     * @tc.name   testVolumeRgb30086
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0086
     * @tc.desc   r=32 g=160 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30086 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 160, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30086 end');
    })

    /**
     * @tc.name   testVolumeRgb30087
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0087
     * @tc.desc   r=32 g=160 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30087 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 160, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30087 end');
    })

    /**
     * @tc.name   testVolumeRgb30088
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0088
     * @tc.desc   r=32 g=160 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30088 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 160, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30088 end');
    })

    /**
     * @tc.name   testVolumeRgb30089
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0089
     * @tc.desc   r=32 g=160 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30089 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 160, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30089 end');
    })

    /**
     * @tc.name   testVolumeRgb30090
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0090
     * @tc.desc   r=32 g=160 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30090 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 160, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30090 end');
    })

    /**
     * @tc.name   testVolumeRgb30091
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0091
     * @tc.desc   r=32 g=160 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30091 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 160, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30091 end');
    })

    /**
     * @tc.name   testVolumeRgb30092
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0092
     * @tc.desc   r=32 g=160 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30092 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 160, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30092 end');
    })

    /**
     * @tc.name   testVolumeRgb30093
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0093
     * @tc.desc   r=32 g=192 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30093 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 192, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30093 end');
    })

    /**
     * @tc.name   testVolumeRgb30094
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0094
     * @tc.desc   r=32 g=192 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30094 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 192, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30094 end');
    })

    /**
     * @tc.name   testVolumeRgb30095
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0095
     * @tc.desc   r=32 g=192 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30095 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 192, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30095 end');
    })

    /**
     * @tc.name   testVolumeRgb30096
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0096
     * @tc.desc   r=32 g=192 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30096 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 192, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30096 end');
    })

    /**
     * @tc.name   testVolumeRgb30097
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0097
     * @tc.desc   r=32 g=192 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30097 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 192, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30097 end');
    })

    /**
     * @tc.name   testVolumeRgb30098
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0098
     * @tc.desc   r=32 g=192 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30098 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 192, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30098 end');
    })

    /**
     * @tc.name   testVolumeRgb30099
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0099
     * @tc.desc   r=32 g=192 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30099 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 192, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30099 end');
    })

    /**
     * @tc.name   testVolumeRgb30100
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0100
     * @tc.desc   r=32 g=224 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30100 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 224, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30100 end');
    })

    /**
     * @tc.name   testVolumeRgb30101
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0101
     * @tc.desc   r=32 g=224 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30101 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 224, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30101 end');
    })

    /**
     * @tc.name   testVolumeRgb30102
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0102
     * @tc.desc   r=32 g=224 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30102 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 224, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30102 end');
    })

    /**
     * @tc.name   testVolumeRgb30103
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0103
     * @tc.desc   r=32 g=224 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30103 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 224, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30103 end');
    })

    /**
     * @tc.name   testVolumeRgb30104
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0104
     * @tc.desc   r=32 g=224 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30104 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 224, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30104 end');
    })

    /**
     * @tc.name   testVolumeRgb30105
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0105
     * @tc.desc   r=32 g=224 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30105 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 224, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30105 end');
    })

    /**
     * @tc.name   testVolumeRgb30106
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0106
     * @tc.desc   r=32 g=224 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30106 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 224, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30106 end');
    })

    /**
     * @tc.name   testVolumeRgb30107
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0107
     * @tc.desc   r=32 g=255 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30107 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 255, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30107 end');
    })

    /**
     * @tc.name   testVolumeRgb30108
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0108
     * @tc.desc   r=32 g=255 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30108 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 255, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30108 end');
    })

    /**
     * @tc.name   testVolumeRgb30109
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0109
     * @tc.desc   r=32 g=255 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30109 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 255, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30109 end');
    })

    /**
     * @tc.name   testVolumeRgb30110
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0110
     * @tc.desc   r=32 g=255 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30110 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 255, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30110 end');
    })

    /**
     * @tc.name   testVolumeRgb30111
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0111
     * @tc.desc   r=32 g=255 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30111 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 255, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30111 end');
    })

    /**
     * @tc.name   testVolumeRgb30112
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0112
     * @tc.desc   r=32 g=255 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30112 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 255, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30112 end');
    })

    /**
     * @tc.name   testVolumeRgb30113
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0113
     * @tc.desc   r=32 g=255 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30113 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 255, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(32));
      expect(px[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30113 end');
    })

    /**
     * @tc.name   testVolumeRgb30114
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0114
     * @tc.desc   r=64 g=0 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30114 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 0, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30114 end');
    })

    /**
     * @tc.name   testVolumeRgb30115
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0115
     * @tc.desc   r=64 g=0 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30115 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 0, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30115 end');
    })

    /**
     * @tc.name   testVolumeRgb30116
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0116
     * @tc.desc   r=64 g=0 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30116 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 0, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30116 end');
    })

    /**
     * @tc.name   testVolumeRgb30117
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0117
     * @tc.desc   r=64 g=0 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30117 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 0, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30117 end');
    })

    /**
     * @tc.name   testVolumeRgb30118
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0118
     * @tc.desc   r=64 g=0 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30118 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 0, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30118 end');
    })

    /**
     * @tc.name   testVolumeRgb30119
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0119
     * @tc.desc   r=64 g=0 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30119 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 0, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30119 end');
    })

    /**
     * @tc.name   testVolumeRgb30120
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0120
     * @tc.desc   r=64 g=0 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30120 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 0, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30120 end');
    })

    /**
     * @tc.name   testVolumeRgb30121
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0121
     * @tc.desc   r=64 g=32 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30121 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 32, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30121 end');
    })

    /**
     * @tc.name   testVolumeRgb30122
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0122
     * @tc.desc   r=64 g=32 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30122 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 32, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30122 end');
    })

    /**
     * @tc.name   testVolumeRgb30123
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0123
     * @tc.desc   r=64 g=32 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30123 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 32, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30123 end');
    })

    /**
     * @tc.name   testVolumeRgb30124
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0124
     * @tc.desc   r=64 g=32 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30124 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 32, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30124 end');
    })

    /**
     * @tc.name   testVolumeRgb30125
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0125
     * @tc.desc   r=64 g=32 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30125 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 32, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30125 end');
    })

    /**
     * @tc.name   testVolumeRgb30126
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0126
     * @tc.desc   r=64 g=32 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30126 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 32, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30126 end');
    })

    /**
     * @tc.name   testVolumeRgb30127
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0127
     * @tc.desc   r=64 g=32 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30127 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 32, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(64));
      expect(px[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(64));
      expect(cn[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30127 end');
    })

    /**
     * @tc.name   testVolumeRgb30128
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0128
     * @tc.desc   corner and pixel agree on a full-range triple 32/64/0
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30128 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 64, 0, 255);
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(32));
      expect(cn[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[1]), String(64));
      expect(cn[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[2]), String(0));
      expect(cn[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]));
      expect(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30128 end');
    })

  })
}
