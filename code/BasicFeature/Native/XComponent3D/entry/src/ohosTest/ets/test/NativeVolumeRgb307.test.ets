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

export default function nativeVolumeRgb307Test() {
  resetYieldCounter();
  describe('NativeVolumeRgb307', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeRgb30385
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0385
     * @tc.desc   r=192 g=224 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30385 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 224, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30385 end');
    })

    /**
     * @tc.name   testVolumeRgb30386
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0386
     * @tc.desc   r=192 g=224 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30386 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 224, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30386 end');
    })

    /**
     * @tc.name   testVolumeRgb30387
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0387
     * @tc.desc   r=192 g=224 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30387 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 224, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30387 end');
    })

    /**
     * @tc.name   testVolumeRgb30388
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0388
     * @tc.desc   r=192 g=224 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30388 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 224, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30388 end');
    })

    /**
     * @tc.name   testVolumeRgb30389
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0389
     * @tc.desc   r=192 g=224 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30389 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 224, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30389 end');
    })

    /**
     * @tc.name   testVolumeRgb30390
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0390
     * @tc.desc   r=192 g=224 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30390 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 224, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30390 end');
    })

    /**
     * @tc.name   testVolumeRgb30391
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0391
     * @tc.desc   r=192 g=224 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30391 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 224, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30391 end');
    })

    /**
     * @tc.name   testVolumeRgb30392
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0392
     * @tc.desc   r=192 g=255 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30392 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 255, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30392 end');
    })

    /**
     * @tc.name   testVolumeRgb30393
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0393
     * @tc.desc   r=192 g=255 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30393 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 255, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30393 end');
    })

    /**
     * @tc.name   testVolumeRgb30394
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0394
     * @tc.desc   r=192 g=255 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30394 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 255, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30394 end');
    })

    /**
     * @tc.name   testVolumeRgb30395
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0395
     * @tc.desc   r=192 g=255 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30395 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 255, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30395 end');
    })

    /**
     * @tc.name   testVolumeRgb30396
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0396
     * @tc.desc   r=192 g=255 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30396 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 255, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30396 end');
    })

    /**
     * @tc.name   testVolumeRgb30397
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0397
     * @tc.desc   r=192 g=255 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30397 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 255, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30397 end');
    })

    /**
     * @tc.name   testVolumeRgb30398
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0398
     * @tc.desc   r=192 g=255 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30398 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 255, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(192));
      expect(px[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30398 end');
    })

    /**
     * @tc.name   testVolumeRgb30399
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0399
     * @tc.desc   r=224 g=0 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30399 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 0, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30399 end');
    })

    /**
     * @tc.name   testVolumeRgb30400
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0400
     * @tc.desc   r=224 g=0 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30400 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 0, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30400 end');
    })

    /**
     * @tc.name   testVolumeRgb30401
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0401
     * @tc.desc   r=224 g=0 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30401 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 0, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30401 end');
    })

    /**
     * @tc.name   testVolumeRgb30402
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0402
     * @tc.desc   r=224 g=0 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30402 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 0, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30402 end');
    })

    /**
     * @tc.name   testVolumeRgb30403
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0403
     * @tc.desc   r=224 g=0 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30403 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 0, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30403 end');
    })

    /**
     * @tc.name   testVolumeRgb30404
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0404
     * @tc.desc   r=224 g=0 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30404 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 0, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30404 end');
    })

    /**
     * @tc.name   testVolumeRgb30405
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0405
     * @tc.desc   r=224 g=0 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30405 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 0, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30405 end');
    })

    /**
     * @tc.name   testVolumeRgb30406
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0406
     * @tc.desc   r=224 g=32 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30406 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 32, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30406 end');
    })

    /**
     * @tc.name   testVolumeRgb30407
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0407
     * @tc.desc   r=224 g=32 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30407 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 32, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30407 end');
    })

    /**
     * @tc.name   testVolumeRgb30408
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0408
     * @tc.desc   r=224 g=32 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30408 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 32, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30408 end');
    })

    /**
     * @tc.name   testVolumeRgb30409
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0409
     * @tc.desc   r=224 g=32 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30409 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 32, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30409 end');
    })

    /**
     * @tc.name   testVolumeRgb30410
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0410
     * @tc.desc   r=224 g=32 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30410 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 32, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30410 end');
    })

    /**
     * @tc.name   testVolumeRgb30411
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0411
     * @tc.desc   r=224 g=32 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30411 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 32, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30411 end');
    })

    /**
     * @tc.name   testVolumeRgb30412
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0412
     * @tc.desc   r=224 g=32 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30412 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 32, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30412 end');
    })

    /**
     * @tc.name   testVolumeRgb30413
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0413
     * @tc.desc   r=224 g=64 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30413 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 64, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30413 end');
    })

    /**
     * @tc.name   testVolumeRgb30414
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0414
     * @tc.desc   r=224 g=64 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30414 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 64, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30414 end');
    })

    /**
     * @tc.name   testVolumeRgb30415
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0415
     * @tc.desc   r=224 g=64 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30415 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 64, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30415 end');
    })

    /**
     * @tc.name   testVolumeRgb30416
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0416
     * @tc.desc   r=224 g=64 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30416 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 64, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30416 end');
    })

    /**
     * @tc.name   testVolumeRgb30417
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0417
     * @tc.desc   r=224 g=64 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30417 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 64, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30417 end');
    })

    /**
     * @tc.name   testVolumeRgb30418
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0418
     * @tc.desc   r=224 g=64 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30418 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 64, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30418 end');
    })

    /**
     * @tc.name   testVolumeRgb30419
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0419
     * @tc.desc   r=224 g=64 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30419 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 64, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30419 end');
    })

    /**
     * @tc.name   testVolumeRgb30420
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0420
     * @tc.desc   r=224 g=96 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30420 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 96, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30420 end');
    })

    /**
     * @tc.name   testVolumeRgb30421
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0421
     * @tc.desc   r=224 g=96 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30421 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 96, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30421 end');
    })

    /**
     * @tc.name   testVolumeRgb30422
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0422
     * @tc.desc   r=224 g=96 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30422 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 96, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30422 end');
    })

    /**
     * @tc.name   testVolumeRgb30423
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0423
     * @tc.desc   r=224 g=96 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30423 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 96, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30423 end');
    })

    /**
     * @tc.name   testVolumeRgb30424
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0424
     * @tc.desc   r=224 g=96 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30424 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 96, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30424 end');
    })

    /**
     * @tc.name   testVolumeRgb30425
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0425
     * @tc.desc   r=224 g=96 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30425 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 96, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30425 end');
    })

    /**
     * @tc.name   testVolumeRgb30426
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0426
     * @tc.desc   r=224 g=96 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30426 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 96, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30426 end');
    })

    /**
     * @tc.name   testVolumeRgb30427
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0427
     * @tc.desc   r=224 g=128 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30427 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 128, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30427 end');
    })

    /**
     * @tc.name   testVolumeRgb30428
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0428
     * @tc.desc   r=224 g=128 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30428 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 128, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30428 end');
    })

    /**
     * @tc.name   testVolumeRgb30429
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0429
     * @tc.desc   r=224 g=128 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30429 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 128, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30429 end');
    })

    /**
     * @tc.name   testVolumeRgb30430
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0430
     * @tc.desc   r=224 g=128 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30430 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 128, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30430 end');
    })

    /**
     * @tc.name   testVolumeRgb30431
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0431
     * @tc.desc   r=224 g=128 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30431 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 128, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30431 end');
    })

    /**
     * @tc.name   testVolumeRgb30432
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0432
     * @tc.desc   r=224 g=128 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30432 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 128, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30432 end');
    })

    /**
     * @tc.name   testVolumeRgb30433
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0433
     * @tc.desc   r=224 g=128 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30433 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 128, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30433 end');
    })

    /**
     * @tc.name   testVolumeRgb30434
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0434
     * @tc.desc   r=224 g=160 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30434 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 160, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30434 end');
    })

    /**
     * @tc.name   testVolumeRgb30435
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0435
     * @tc.desc   r=224 g=160 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30435 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 160, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30435 end');
    })

    /**
     * @tc.name   testVolumeRgb30436
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0436
     * @tc.desc   r=224 g=160 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30436 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 160, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30436 end');
    })

    /**
     * @tc.name   testVolumeRgb30437
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0437
     * @tc.desc   r=224 g=160 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30437 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 160, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30437 end');
    })

    /**
     * @tc.name   testVolumeRgb30438
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0438
     * @tc.desc   r=224 g=160 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30438 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 160, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30438 end');
    })

    /**
     * @tc.name   testVolumeRgb30439
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0439
     * @tc.desc   r=224 g=160 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30439 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 160, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30439 end');
    })

    /**
     * @tc.name   testVolumeRgb30440
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0440
     * @tc.desc   r=224 g=160 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30440 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 160, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30440 end');
    })

    /**
     * @tc.name   testVolumeRgb30441
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0441
     * @tc.desc   r=224 g=192 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30441 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 192, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30441 end');
    })

    /**
     * @tc.name   testVolumeRgb30442
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0442
     * @tc.desc   r=224 g=192 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30442 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 192, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30442 end');
    })

    /**
     * @tc.name   testVolumeRgb30443
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0443
     * @tc.desc   r=224 g=192 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30443 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 192, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30443 end');
    })

    /**
     * @tc.name   testVolumeRgb30444
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0444
     * @tc.desc   r=224 g=192 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30444 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 192, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30444 end');
    })

    /**
     * @tc.name   testVolumeRgb30445
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0445
     * @tc.desc   r=224 g=192 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30445 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 192, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30445 end');
    })

    /**
     * @tc.name   testVolumeRgb30446
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0446
     * @tc.desc   r=224 g=192 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30446 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 192, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30446 end');
    })

    /**
     * @tc.name   testVolumeRgb30447
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0447
     * @tc.desc   r=224 g=192 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30447 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(224, 192, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(224));
      expect(px[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(224));
      expect(cn[0]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30447 end');
    })

    /**
     * @tc.name   testVolumeRgb30448
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0448
     * @tc.desc   corner and pixel agree on a full-range triple 192/224/0
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30448 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(192, 224, 0, 255);
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(192));
      expect(cn[0]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[1]), String(224));
      expect(cn[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[2]), String(0));
      expect(cn[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]));
      expect(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30448 end');
    })

  })
}
