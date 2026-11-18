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

export default function nativeVolumeRgb305Test() {
  resetYieldCounter();
  describe('NativeVolumeRgb305', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeRgb30257
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0257
     * @tc.desc   r=128 g=160 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30257 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 160, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30257 end');
    })

    /**
     * @tc.name   testVolumeRgb30258
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0258
     * @tc.desc   r=128 g=160 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30258 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 160, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30258 end');
    })

    /**
     * @tc.name   testVolumeRgb30259
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0259
     * @tc.desc   r=128 g=160 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30259 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 160, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30259 end');
    })

    /**
     * @tc.name   testVolumeRgb30260
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0260
     * @tc.desc   r=128 g=160 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30260 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 160, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30260 end');
    })

    /**
     * @tc.name   testVolumeRgb30261
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0261
     * @tc.desc   r=128 g=160 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30261 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 160, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30261 end');
    })

    /**
     * @tc.name   testVolumeRgb30262
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0262
     * @tc.desc   r=128 g=160 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30262 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 160, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30262 end');
    })

    /**
     * @tc.name   testVolumeRgb30263
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0263
     * @tc.desc   r=128 g=160 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30263 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 160, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(160));
      expect(px[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30263 end');
    })

    /**
     * @tc.name   testVolumeRgb30264
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0264
     * @tc.desc   r=128 g=192 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30264 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 192, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30264 end');
    })

    /**
     * @tc.name   testVolumeRgb30265
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0265
     * @tc.desc   r=128 g=192 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30265 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 192, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30265 end');
    })

    /**
     * @tc.name   testVolumeRgb30266
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0266
     * @tc.desc   r=128 g=192 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30266 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 192, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30266 end');
    })

    /**
     * @tc.name   testVolumeRgb30267
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0267
     * @tc.desc   r=128 g=192 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30267 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 192, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30267 end');
    })

    /**
     * @tc.name   testVolumeRgb30268
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0268
     * @tc.desc   r=128 g=192 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30268 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 192, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30268 end');
    })

    /**
     * @tc.name   testVolumeRgb30269
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0269
     * @tc.desc   r=128 g=192 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30269 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 192, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30269 end');
    })

    /**
     * @tc.name   testVolumeRgb30270
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0270
     * @tc.desc   r=128 g=192 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30270 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 192, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(192));
      expect(px[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30270 end');
    })

    /**
     * @tc.name   testVolumeRgb30271
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0271
     * @tc.desc   r=128 g=224 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30271 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 224, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30271 end');
    })

    /**
     * @tc.name   testVolumeRgb30272
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0272
     * @tc.desc   r=128 g=224 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30272 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 224, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30272 end');
    })

    /**
     * @tc.name   testVolumeRgb30273
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0273
     * @tc.desc   r=128 g=224 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30273 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 224, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30273 end');
    })

    /**
     * @tc.name   testVolumeRgb30274
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0274
     * @tc.desc   r=128 g=224 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30274 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 224, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30274 end');
    })

    /**
     * @tc.name   testVolumeRgb30275
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0275
     * @tc.desc   r=128 g=224 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30275 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 224, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30275 end');
    })

    /**
     * @tc.name   testVolumeRgb30276
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0276
     * @tc.desc   r=128 g=224 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30276 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 224, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30276 end');
    })

    /**
     * @tc.name   testVolumeRgb30277
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0277
     * @tc.desc   r=128 g=224 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30277 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 224, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(224));
      expect(px[1]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30277 end');
    })

    /**
     * @tc.name   testVolumeRgb30278
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0278
     * @tc.desc   r=128 g=255 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30278 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 255, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30278 end');
    })

    /**
     * @tc.name   testVolumeRgb30279
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0279
     * @tc.desc   r=128 g=255 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30279 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 255, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30279 end');
    })

    /**
     * @tc.name   testVolumeRgb30280
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0280
     * @tc.desc   r=128 g=255 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30280 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 255, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30280 end');
    })

    /**
     * @tc.name   testVolumeRgb30281
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0281
     * @tc.desc   r=128 g=255 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30281 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 255, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30281 end');
    })

    /**
     * @tc.name   testVolumeRgb30282
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0282
     * @tc.desc   r=128 g=255 b=160 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30282 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 255, 160, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(160));
      expect(px[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30282 end');
    })

    /**
     * @tc.name   testVolumeRgb30283
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0283
     * @tc.desc   r=128 g=255 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30283 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 255, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30283 end');
    })

    /**
     * @tc.name   testVolumeRgb30284
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0284
     * @tc.desc   r=128 g=255 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30284 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 255, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(128));
      expect(px[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(255));
      expect(px[1]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30284 end');
    })

    /**
     * @tc.name   testVolumeRgb30285
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0285
     * @tc.desc   r=160 g=0 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30285 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 0, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30285 end');
    })

    /**
     * @tc.name   testVolumeRgb30286
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0286
     * @tc.desc   r=160 g=0 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30286 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 0, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30286 end');
    })

    /**
     * @tc.name   testVolumeRgb30287
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0287
     * @tc.desc   r=160 g=0 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30287 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 0, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30287 end');
    })

    /**
     * @tc.name   testVolumeRgb30288
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0288
     * @tc.desc   r=160 g=0 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30288 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 0, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30288 end');
    })

    /**
     * @tc.name   testVolumeRgb30289
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0289
     * @tc.desc   r=160 g=0 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30289 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 0, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30289 end');
    })

    /**
     * @tc.name   testVolumeRgb30290
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0290
     * @tc.desc   r=160 g=0 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30290 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 0, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30290 end');
    })

    /**
     * @tc.name   testVolumeRgb30291
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0291
     * @tc.desc   r=160 g=0 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30291 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 0, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(0));
      expect(px[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30291 end');
    })

    /**
     * @tc.name   testVolumeRgb30292
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0292
     * @tc.desc   r=160 g=32 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30292 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 32, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30292 end');
    })

    /**
     * @tc.name   testVolumeRgb30293
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0293
     * @tc.desc   r=160 g=32 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30293 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 32, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30293 end');
    })

    /**
     * @tc.name   testVolumeRgb30294
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0294
     * @tc.desc   r=160 g=32 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30294 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 32, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30294 end');
    })

    /**
     * @tc.name   testVolumeRgb30295
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0295
     * @tc.desc   r=160 g=32 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30295 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 32, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30295 end');
    })

    /**
     * @tc.name   testVolumeRgb30296
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0296
     * @tc.desc   r=160 g=32 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30296 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 32, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30296 end');
    })

    /**
     * @tc.name   testVolumeRgb30297
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0297
     * @tc.desc   r=160 g=32 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30297 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 32, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30297 end');
    })

    /**
     * @tc.name   testVolumeRgb30298
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0298
     * @tc.desc   r=160 g=32 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30298 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 32, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(32));
      expect(px[1]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30298 end');
    })

    /**
     * @tc.name   testVolumeRgb30299
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0299
     * @tc.desc   r=160 g=64 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30299 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 64, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30299 end');
    })

    /**
     * @tc.name   testVolumeRgb30300
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0300
     * @tc.desc   r=160 g=64 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30300 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 64, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30300 end');
    })

    /**
     * @tc.name   testVolumeRgb30301
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0301
     * @tc.desc   r=160 g=64 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30301 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 64, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30301 end');
    })

    /**
     * @tc.name   testVolumeRgb30302
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0302
     * @tc.desc   r=160 g=64 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30302 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 64, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30302 end');
    })

    /**
     * @tc.name   testVolumeRgb30303
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0303
     * @tc.desc   r=160 g=64 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30303 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 64, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30303 end');
    })

    /**
     * @tc.name   testVolumeRgb30304
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0304
     * @tc.desc   r=160 g=64 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30304 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 64, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30304 end');
    })

    /**
     * @tc.name   testVolumeRgb30305
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0305
     * @tc.desc   r=160 g=64 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30305 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 64, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(64));
      expect(px[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30305 end');
    })

    /**
     * @tc.name   testVolumeRgb30306
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0306
     * @tc.desc   r=160 g=96 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30306 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 96, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30306 end');
    })

    /**
     * @tc.name   testVolumeRgb30307
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0307
     * @tc.desc   r=160 g=96 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30307 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 96, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30307 end');
    })

    /**
     * @tc.name   testVolumeRgb30308
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0308
     * @tc.desc   r=160 g=96 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30308 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 96, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30308 end');
    })

    /**
     * @tc.name   testVolumeRgb30309
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0309
     * @tc.desc   r=160 g=96 b=128 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30309 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 96, 128, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(128));
      expect(px[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30309 end');
    })

    /**
     * @tc.name   testVolumeRgb30310
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0310
     * @tc.desc   r=160 g=96 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30310 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 96, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30310 end');
    })

    /**
     * @tc.name   testVolumeRgb30311
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0311
     * @tc.desc   r=160 g=96 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30311 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 96, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30311 end');
    })

    /**
     * @tc.name   testVolumeRgb30312
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0312
     * @tc.desc   r=160 g=96 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30312 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 96, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(96));
      expect(px[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30312 end');
    })

    /**
     * @tc.name   testVolumeRgb30313
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0313
     * @tc.desc   r=160 g=128 b=0 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30313 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 128, 0, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(0));
      expect(px[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30313 end');
    })

    /**
     * @tc.name   testVolumeRgb30314
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0314
     * @tc.desc   r=160 g=128 b=32 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30314 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 128, 32, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(32));
      expect(px[2]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30314 end');
    })

    /**
     * @tc.name   testVolumeRgb30315
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0315
     * @tc.desc   r=160 g=128 b=64 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30315 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 128, 64, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(64));
      expect(px[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30315 end');
    })

    /**
     * @tc.name   testVolumeRgb30316
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0316
     * @tc.desc   r=160 g=128 b=96 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30316 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 128, 96, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(96));
      expect(px[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30316 end');
    })

    /**
     * @tc.name   testVolumeRgb30317
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0317
     * @tc.desc   r=160 g=128 b=192 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30317 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 128, 192, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(192));
      expect(px[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30317 end');
    })

    /**
     * @tc.name   testVolumeRgb30318
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0318
     * @tc.desc   r=160 g=128 b=224 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30318 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 128, 224, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(224));
      expect(px[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30318 end');
    })

    /**
     * @tc.name   testVolumeRgb30319
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0319
     * @tc.desc   r=160 g=128 b=255 keeps all channels distinct on readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30319 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 128, 255, 255);
      const px: number[] = result.pixel;
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[0]), String(160));
      expect(px[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[1]), String(128));
      expect(px[1]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(px[2]), String(255));
      expect(px[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(160));
      expect(cn[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]));
      expect(px[0] !== px[1] && px[1] !== px[2] && px[0] !== px[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30319 end');
    })

    /**
     * @tc.name   testVolumeRgb30320
     * @tc.number SUB_XCOMPONENT3D_VOLRGB3_0320
     * @tc.desc   corner and pixel agree on a full-range triple 128/160/0
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeRgb30320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30320 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 160, 0, 255);
      const cn: number[] = result.corner;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[0]), String(128));
      expect(cn[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[1]), String(160));
      expect(cn[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(cn[2]), String(0));
      expect(cn[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]));
      expect(cn[0] !== cn[1] && cn[1] !== cn[2] && cn[0] !== cn[2]).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeRgb30320 end');
    })

  })
}
