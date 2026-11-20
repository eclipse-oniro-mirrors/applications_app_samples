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

export default function nativeVolumeRgb306Test() {
  resetYieldCounter();
  describe('NativeVolumeRgb306', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeRgb30321
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0321
     * @tc.desc   r=160 g=192 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30321 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 192, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30321 end');
    })

    /**
     * @tc.name   testVolumeRgb30322
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0322
     * @tc.desc   r=160 g=192 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30322 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 192, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30322 end');
    })

    /**
     * @tc.name   testVolumeRgb30323
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0323
     * @tc.desc   r=160 g=192 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30323 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 192, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30323 end');
    })

    /**
     * @tc.name   testVolumeRgb30324
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0324
     * @tc.desc   r=160 g=192 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30324 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 192, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30324 end');
    })

    /**
     * @tc.name   testVolumeRgb30325
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0325
     * @tc.desc   r=160 g=192 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30325 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 192, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30325 end');
    })

    /**
     * @tc.name   testVolumeRgb30326
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0326
     * @tc.desc   r=160 g=192 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30326 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 192, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30326 end');
    })

    /**
     * @tc.name   testVolumeRgb30327
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0327
     * @tc.desc   r=160 g=192 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30327 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 192, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30327 end');
    })

    /**
     * @tc.name   testVolumeRgb30328
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0328
     * @tc.desc   r=160 g=224 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30328 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 224, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30328 end');
    })

    /**
     * @tc.name   testVolumeRgb30329
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0329
     * @tc.desc   r=160 g=224 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30329 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 224, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30329 end');
    })

    /**
     * @tc.name   testVolumeRgb30330
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0330
     * @tc.desc   r=160 g=224 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30330 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 224, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30330 end');
    })

    /**
     * @tc.name   testVolumeRgb30331
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0331
     * @tc.desc   r=160 g=224 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30331 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 224, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30331 end');
    })

    /**
     * @tc.name   testVolumeRgb30332
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0332
     * @tc.desc   r=160 g=224 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30332 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 224, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30332 end');
    })

    /**
     * @tc.name   testVolumeRgb30333
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0333
     * @tc.desc   r=160 g=224 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30333 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 224, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30333 end');
    })

    /**
     * @tc.name   testVolumeRgb30334
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0334
     * @tc.desc   r=160 g=224 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30334 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 224, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30334 end');
    })

    /**
     * @tc.name   testVolumeRgb30335
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0335
     * @tc.desc   r=160 g=255 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30335 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 255, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30335 end');
    })

    /**
     * @tc.name   testVolumeRgb30336
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0336
     * @tc.desc   r=160 g=255 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30336 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 255, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30336 end');
    })

    /**
     * @tc.name   testVolumeRgb30337
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0337
     * @tc.desc   r=160 g=255 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30337 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 255, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30337 end');
    })

    /**
     * @tc.name   testVolumeRgb30338
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0338
     * @tc.desc   r=160 g=255 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30338 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 255, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30338 end');
    })

    /**
     * @tc.name   testVolumeRgb30339
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0339
     * @tc.desc   r=160 g=255 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30339 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 255, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30339 end');
    })

    /**
     * @tc.name   testVolumeRgb30340
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0340
     * @tc.desc   r=160 g=255 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30340 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 255, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30340 end');
    })

    /**
     * @tc.name   testVolumeRgb30341
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0341
     * @tc.desc   r=160 g=255 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30341 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 255, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30341 end');
    })

    /**
     * @tc.name   testVolumeRgb30342
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0342
     * @tc.desc   r=192 g=0 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30342 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 0, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30342 end');
    })

    /**
     * @tc.name   testVolumeRgb30343
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0343
     * @tc.desc   r=192 g=0 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30343 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 0, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30343 end');
    })

    /**
     * @tc.name   testVolumeRgb30344
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0344
     * @tc.desc   r=192 g=0 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30344 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 0, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30344 end');
    })

    /**
     * @tc.name   testVolumeRgb30345
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0345
     * @tc.desc   r=192 g=0 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30345 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 0, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30345 end');
    })

    /**
     * @tc.name   testVolumeRgb30346
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0346
     * @tc.desc   r=192 g=0 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30346 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 0, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30346 end');
    })

    /**
     * @tc.name   testVolumeRgb30347
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0347
     * @tc.desc   r=192 g=0 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30347 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 0, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30347 end');
    })

    /**
     * @tc.name   testVolumeRgb30348
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0348
     * @tc.desc   r=192 g=0 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30348 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 0, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30348 end');
    })

    /**
     * @tc.name   testVolumeRgb30349
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0349
     * @tc.desc   r=192 g=32 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30349 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 32, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30349 end');
    })

    /**
     * @tc.name   testVolumeRgb30350
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0350
     * @tc.desc   r=192 g=32 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30350 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 32, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30350 end');
    })

    /**
     * @tc.name   testVolumeRgb30351
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0351
     * @tc.desc   r=192 g=32 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30351 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 32, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30351 end');
    })

    /**
     * @tc.name   testVolumeRgb30352
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0352
     * @tc.desc   r=192 g=32 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30352 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 32, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30352 end');
    })

    /**
     * @tc.name   testVolumeRgb30353
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0353
     * @tc.desc   r=192 g=32 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30353 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 32, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30353 end');
    })

    /**
     * @tc.name   testVolumeRgb30354
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0354
     * @tc.desc   r=192 g=32 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30354 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 32, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30354 end');
    })

    /**
     * @tc.name   testVolumeRgb30355
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0355
     * @tc.desc   r=192 g=32 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30355 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 32, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30355 end');
    })

    /**
     * @tc.name   testVolumeRgb30356
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0356
     * @tc.desc   r=192 g=64 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30356 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 64, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30356 end');
    })

    /**
     * @tc.name   testVolumeRgb30357
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0357
     * @tc.desc   r=192 g=64 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30357 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 64, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30357 end');
    })

    /**
     * @tc.name   testVolumeRgb30358
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0358
     * @tc.desc   r=192 g=64 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30358 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 64, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30358 end');
    })

    /**
     * @tc.name   testVolumeRgb30359
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0359
     * @tc.desc   r=192 g=64 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30359 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 64, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30359 end');
    })

    /**
     * @tc.name   testVolumeRgb30360
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0360
     * @tc.desc   r=192 g=64 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30360 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 64, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30360 end');
    })

    /**
     * @tc.name   testVolumeRgb30361
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0361
     * @tc.desc   r=192 g=64 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30361 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 64, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30361 end');
    })

    /**
     * @tc.name   testVolumeRgb30362
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0362
     * @tc.desc   r=192 g=64 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30362 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 64, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30362 end');
    })

    /**
     * @tc.name   testVolumeRgb30363
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0363
     * @tc.desc   r=192 g=96 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30363 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 96, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30363 end');
    })

    /**
     * @tc.name   testVolumeRgb30364
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0364
     * @tc.desc   r=192 g=96 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30364 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 96, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30364 end');
    })

    /**
     * @tc.name   testVolumeRgb30365
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0365
     * @tc.desc   r=192 g=96 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30365 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 96, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30365 end');
    })

    /**
     * @tc.name   testVolumeRgb30366
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0366
     * @tc.desc   r=192 g=96 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30366 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 96, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30366 end');
    })

    /**
     * @tc.name   testVolumeRgb30367
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0367
     * @tc.desc   r=192 g=96 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30367 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 96, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30367 end');
    })

    /**
     * @tc.name   testVolumeRgb30368
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0368
     * @tc.desc   r=192 g=96 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30368 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 96, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30368 end');
    })

    /**
     * @tc.name   testVolumeRgb30369
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0369
     * @tc.desc   r=192 g=96 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30369 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 96, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30369 end');
    })

    /**
     * @tc.name   testVolumeRgb30370
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0370
     * @tc.desc   r=192 g=128 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30370 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 128, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30370 end');
    })

    /**
     * @tc.name   testVolumeRgb30371
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0371
     * @tc.desc   r=192 g=128 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30371 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 128, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30371 end');
    })

    /**
     * @tc.name   testVolumeRgb30372
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0372
     * @tc.desc   r=192 g=128 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30372 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 128, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30372 end');
    })

    /**
     * @tc.name   testVolumeRgb30373
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0373
     * @tc.desc   r=192 g=128 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30373 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 128, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30373 end');
    })

    /**
     * @tc.name   testVolumeRgb30374
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0374
     * @tc.desc   r=192 g=128 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30374 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 128, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30374 end');
    })

    /**
     * @tc.name   testVolumeRgb30375
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0375
     * @tc.desc   r=192 g=128 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30375 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 128, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30375 end');
    })

    /**
     * @tc.name   testVolumeRgb30376
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0376
     * @tc.desc   r=192 g=128 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30376 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 128, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30376 end');
    })

    /**
     * @tc.name   testVolumeRgb30377
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0377
     * @tc.desc   r=192 g=160 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30377 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 160, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30377 end');
    })

    /**
     * @tc.name   testVolumeRgb30378
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0378
     * @tc.desc   r=192 g=160 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30378 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 160, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30378 end');
    })

    /**
     * @tc.name   testVolumeRgb30379
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0379
     * @tc.desc   r=192 g=160 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30379 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 160, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30379 end');
    })

    /**
     * @tc.name   testVolumeRgb30380
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0380
     * @tc.desc   r=192 g=160 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30380 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 160, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30380 end');
    })

    /**
     * @tc.name   testVolumeRgb30381
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0381
     * @tc.desc   r=192 g=160 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30381 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 160, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30381 end');
    })

    /**
     * @tc.name   testVolumeRgb30382
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0382
     * @tc.desc   r=192 g=160 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30382 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 160, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30382 end');
    })

    /**
     * @tc.name   testVolumeRgb30383
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0383
     * @tc.desc   r=192 g=160 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30383 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 160, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30383 end');
    })

    /**
     * @tc.name   testVolumeRgb30384
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0384
     * @tc.desc   corner and pixel agree on a full-range triple 160/192/0
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30384 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 192, 0, 255);
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[1]), String(192));
      expect(cn[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[2]), String(0));
      expect(cn[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]));
      expect(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30384 end');
    })

  })
}
