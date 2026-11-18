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

export default function nativeVolumeRgb308Test() {
  resetYieldCounter();
  describe('NativeVolumeRgb308', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeRgb30449
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0449
     * @tc.desc   r=224 g=255 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30449 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 255, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30449 end');
    })

    /**
     * @tc.name   testVolumeRgb30450
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0450
     * @tc.desc   r=224 g=255 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30450 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 255, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30450 end');
    })

    /**
     * @tc.name   testVolumeRgb30451
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0451
     * @tc.desc   r=224 g=255 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30451 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 255, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30451 end');
    })

    /**
     * @tc.name   testVolumeRgb30452
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0452
     * @tc.desc   r=224 g=255 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30452 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 255, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30452 end');
    })

    /**
     * @tc.name   testVolumeRgb30453
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0453
     * @tc.desc   r=224 g=255 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30453 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 255, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30453 end');
    })

    /**
     * @tc.name   testVolumeRgb30454
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0454
     * @tc.desc   r=224 g=255 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30454 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 255, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30454 end');
    })

    /**
     * @tc.name   testVolumeRgb30455
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0455
     * @tc.desc   r=224 g=255 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30455 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 255, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30455 end');
    })

    /**
     * @tc.name   testVolumeRgb30456
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0456
     * @tc.desc   r=255 g=0 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30456 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30456 end');
    })

    /**
     * @tc.name   testVolumeRgb30457
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0457
     * @tc.desc   r=255 g=0 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30457 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30457 end');
    })

    /**
     * @tc.name   testVolumeRgb30458
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0458
     * @tc.desc   r=255 g=0 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30458 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30458 end');
    })

    /**
     * @tc.name   testVolumeRgb30459
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0459
     * @tc.desc   r=255 g=0 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30459 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30459 end');
    })

    /**
     * @tc.name   testVolumeRgb30460
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0460
     * @tc.desc   r=255 g=0 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30460 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30460 end');
    })

    /**
     * @tc.name   testVolumeRgb30461
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0461
     * @tc.desc   r=255 g=0 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30461 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30461 end');
    })

    /**
     * @tc.name   testVolumeRgb30462
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0462
     * @tc.desc   r=255 g=0 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30462 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30462 end');
    })

    /**
     * @tc.name   testVolumeRgb30463
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0463
     * @tc.desc   r=255 g=32 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30463 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 32, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30463 end');
    })

    /**
     * @tc.name   testVolumeRgb30464
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0464
     * @tc.desc   r=255 g=32 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30464 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 32, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30464 end');
    })

    /**
     * @tc.name   testVolumeRgb30465
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0465
     * @tc.desc   r=255 g=32 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30465 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 32, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30465 end');
    })

    /**
     * @tc.name   testVolumeRgb30466
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0466
     * @tc.desc   r=255 g=32 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30466 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 32, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30466 end');
    })

    /**
     * @tc.name   testVolumeRgb30467
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0467
     * @tc.desc   r=255 g=32 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30467 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 32, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30467 end');
    })

    /**
     * @tc.name   testVolumeRgb30468
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0468
     * @tc.desc   r=255 g=32 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30468 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 32, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30468 end');
    })

    /**
     * @tc.name   testVolumeRgb30469
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0469
     * @tc.desc   r=255 g=32 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30469 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 32, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30469 end');
    })

    /**
     * @tc.name   testVolumeRgb30470
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0470
     * @tc.desc   r=255 g=64 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30470 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 64, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30470 end');
    })

    /**
     * @tc.name   testVolumeRgb30471
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0471
     * @tc.desc   r=255 g=64 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30471 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 64, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30471 end');
    })

    /**
     * @tc.name   testVolumeRgb30472
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0472
     * @tc.desc   r=255 g=64 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30472 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 64, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30472 end');
    })

    /**
     * @tc.name   testVolumeRgb30473
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0473
     * @tc.desc   r=255 g=64 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30473 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 64, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30473 end');
    })

    /**
     * @tc.name   testVolumeRgb30474
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0474
     * @tc.desc   r=255 g=64 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30474 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 64, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30474 end');
    })

    /**
     * @tc.name   testVolumeRgb30475
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0475
     * @tc.desc   r=255 g=64 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30475 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 64, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30475 end');
    })

    /**
     * @tc.name   testVolumeRgb30476
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0476
     * @tc.desc   r=255 g=64 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30476 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 64, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30476 end');
    })

    /**
     * @tc.name   testVolumeRgb30477
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0477
     * @tc.desc   r=255 g=96 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30477 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 96, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30477 end');
    })

    /**
     * @tc.name   testVolumeRgb30478
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0478
     * @tc.desc   r=255 g=96 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30478 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 96, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30478 end');
    })

    /**
     * @tc.name   testVolumeRgb30479
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0479
     * @tc.desc   r=255 g=96 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30479 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 96, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30479 end');
    })

    /**
     * @tc.name   testVolumeRgb30480
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0480
     * @tc.desc   r=255 g=96 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30480 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 96, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30480 end');
    })

    /**
     * @tc.name   testVolumeRgb30481
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0481
     * @tc.desc   r=255 g=96 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30481 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 96, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30481 end');
    })

    /**
     * @tc.name   testVolumeRgb30482
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0482
     * @tc.desc   r=255 g=96 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30482 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 96, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30482 end');
    })

    /**
     * @tc.name   testVolumeRgb30483
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0483
     * @tc.desc   r=255 g=96 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30483 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 96, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30483 end');
    })

    /**
     * @tc.name   testVolumeRgb30484
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0484
     * @tc.desc   r=255 g=128 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30484 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 128, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30484 end');
    })

    /**
     * @tc.name   testVolumeRgb30485
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0485
     * @tc.desc   r=255 g=128 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30485 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 128, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30485 end');
    })

    /**
     * @tc.name   testVolumeRgb30486
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0486
     * @tc.desc   r=255 g=128 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30486 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 128, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30486 end');
    })

    /**
     * @tc.name   testVolumeRgb30487
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0487
     * @tc.desc   r=255 g=128 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30487 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 128, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30487 end');
    })

    /**
     * @tc.name   testVolumeRgb30488
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0488
     * @tc.desc   r=255 g=128 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30488 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 128, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30488 end');
    })

    /**
     * @tc.name   testVolumeRgb30489
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0489
     * @tc.desc   r=255 g=128 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30489 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 128, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30489 end');
    })

    /**
     * @tc.name   testVolumeRgb30490
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0490
     * @tc.desc   r=255 g=128 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30490 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 128, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30490 end');
    })

    /**
     * @tc.name   testVolumeRgb30491
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0491
     * @tc.desc   r=255 g=160 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30491 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 160, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30491 end');
    })

    /**
     * @tc.name   testVolumeRgb30492
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0492
     * @tc.desc   r=255 g=160 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30492 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 160, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30492 end');
    })

    /**
     * @tc.name   testVolumeRgb30493
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0493
     * @tc.desc   r=255 g=160 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30493 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 160, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30493 end');
    })

    /**
     * @tc.name   testVolumeRgb30494
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0494
     * @tc.desc   r=255 g=160 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30494 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 160, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30494 end');
    })

    /**
     * @tc.name   testVolumeRgb30495
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0495
     * @tc.desc   r=255 g=160 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30495 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 160, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30495 end');
    })

    /**
     * @tc.name   testVolumeRgb30496
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0496
     * @tc.desc   r=255 g=160 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30496 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 160, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30496 end');
    })

    /**
     * @tc.name   testVolumeRgb30497
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0497
     * @tc.desc   r=255 g=160 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30497 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 160, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30497 end');
    })

    /**
     * @tc.name   testVolumeRgb30498
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0498
     * @tc.desc   r=255 g=192 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30498 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 192, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30498 end');
    })

    /**
     * @tc.name   testVolumeRgb30499
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0499
     * @tc.desc   r=255 g=192 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30499 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 192, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30499 end');
    })

    /**
     * @tc.name   testVolumeRgb30500
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0500
     * @tc.desc   r=255 g=192 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30500 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 192, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30500 end');
    })

    /**
     * @tc.name   testVolumeRgb30501
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0501
     * @tc.desc   r=255 g=192 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30501 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 192, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30501 end');
    })

    /**
     * @tc.name   testVolumeRgb30502
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0502
     * @tc.desc   r=255 g=192 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30502 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 192, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30502 end');
    })

    /**
     * @tc.name   testVolumeRgb30503
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0503
     * @tc.desc   r=255 g=192 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30503 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 192, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30503 end');
    })

    /**
     * @tc.name   testVolumeRgb30504
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0504
     * @tc.desc   r=255 g=192 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30504 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 192, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30504 end');
    })

    /**
     * @tc.name   testVolumeRgb30505
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0505
     * @tc.desc   r=255 g=224 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30505 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 224, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30505 end');
    })

    /**
     * @tc.name   testVolumeRgb30506
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0506
     * @tc.desc   r=255 g=224 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30506 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 224, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30506 end');
    })

    /**
     * @tc.name   testVolumeRgb30507
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0507
     * @tc.desc   r=255 g=224 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30507 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 224, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30507 end');
    })

    /**
     * @tc.name   testVolumeRgb30508
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0508
     * @tc.desc   r=255 g=224 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30508 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 224, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30508 end');
    })

    /**
     * @tc.name   testVolumeRgb30509
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0509
     * @tc.desc   r=255 g=224 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30509 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 224, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30509 end');
    })

    /**
     * @tc.name   testVolumeRgb30510
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0510
     * @tc.desc   r=255 g=224 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30510 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 224, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30510 end');
    })

    /**
     * @tc.name   testVolumeRgb30511
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0511
     * @tc.desc   r=255 g=224 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30511 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 224, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(255));
      expect(px[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(255));
      expect(cn[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30511 end');
    })

    /**
     * @tc.name   testVolumeRgb30512
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0512
     * @tc.desc   corner and pixel agree on a full-range triple 224/255/0
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30512 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 255, 0, 255);
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[1]), String(255));
      expect(cn[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[2]), String(0));
      expect(cn[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]));
      expect(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30512 end');
    })

  })
}
