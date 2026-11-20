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

export default function nativeVolumeAlpha04Test() {
  resetYieldCounter();
  describe('NativeVolumeAlpha04', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeAlpha0196
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0196
     * @tc.desc   alpha 192 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0196 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0196 end');
    })

    /**
     * @tc.name   testVolumeAlpha0197
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0197
     * @tc.desc   alpha 193 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0197 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 193);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0197 end');
    })

    /**
     * @tc.name   testVolumeAlpha0198
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0198
     * @tc.desc   alpha 194 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0198 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 194);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0198 end');
    })

    /**
     * @tc.name   testVolumeAlpha0199
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0199
     * @tc.desc   alpha 195 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0199 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 195);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0199 end');
    })

    /**
     * @tc.name   testVolumeAlpha0200
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0200
     * @tc.desc   alpha 196 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0200 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 196);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0200 end');
    })

    /**
     * @tc.name   testVolumeAlpha0201
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0201
     * @tc.desc   alpha 197 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0201 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 197);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0201 end');
    })

    /**
     * @tc.name   testVolumeAlpha0202
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0202
     * @tc.desc   alpha 198 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0202 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 198);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0202 end');
    })

    /**
     * @tc.name   testVolumeAlpha0203
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0203
     * @tc.desc   alpha 199 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0203 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 199);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0203 end');
    })

    /**
     * @tc.name   testVolumeAlpha0204
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0204
     * @tc.desc   alpha 200 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0204 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0204 end');
    })

    /**
     * @tc.name   testVolumeAlpha0205
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0205
     * @tc.desc   alpha 201 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0205 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 201);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0205 end');
    })

    /**
     * @tc.name   testVolumeAlpha0206
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0206
     * @tc.desc   alpha 202 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0206 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 202);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0206 end');
    })

    /**
     * @tc.name   testVolumeAlpha0207
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0207
     * @tc.desc   alpha 203 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0207 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 203);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0207 end');
    })

    /**
     * @tc.name   testVolumeAlpha0208
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0208
     * @tc.desc   alpha 204 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0208 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 204);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0208 end');
    })

    /**
     * @tc.name   testVolumeAlpha0209
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0209
     * @tc.desc   alpha 205 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0209 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 205);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0209 end');
    })

    /**
     * @tc.name   testVolumeAlpha0210
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0210
     * @tc.desc   alpha 206 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0210 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 206);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0210 end');
    })

    /**
     * @tc.name   testVolumeAlpha0211
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0211
     * @tc.desc   alpha 207 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0211 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 207);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0211 end');
    })

    /**
     * @tc.name   testVolumeAlpha0212
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0212
     * @tc.desc   alpha 208 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0212 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 208);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0212 end');
    })

    /**
     * @tc.name   testVolumeAlpha0213
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0213
     * @tc.desc   alpha 209 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0213 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 209);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0213 end');
    })

    /**
     * @tc.name   testVolumeAlpha0214
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0214
     * @tc.desc   alpha 210 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0214 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 210);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0214 end');
    })

    /**
     * @tc.name   testVolumeAlpha0215
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0215
     * @tc.desc   alpha 211 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0215 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 211);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0215 end');
    })

    /**
     * @tc.name   testVolumeAlpha0216
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0216
     * @tc.desc   alpha 212 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0216 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 212);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0216 end');
    })

    /**
     * @tc.name   testVolumeAlpha0217
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0217
     * @tc.desc   alpha 213 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0217 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 213);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0217 end');
    })

    /**
     * @tc.name   testVolumeAlpha0218
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0218
     * @tc.desc   alpha 214 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0218 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 214);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0218 end');
    })

    /**
     * @tc.name   testVolumeAlpha0219
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0219
     * @tc.desc   alpha 215 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0219 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 215);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0219 end');
    })

    /**
     * @tc.name   testVolumeAlpha0220
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0220
     * @tc.desc   alpha 216 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0220 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 216);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0220 end');
    })

    /**
     * @tc.name   testVolumeAlpha0221
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0221
     * @tc.desc   alpha 217 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0221 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 217);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0221 end');
    })

    /**
     * @tc.name   testVolumeAlpha0222
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0222
     * @tc.desc   alpha 218 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0222 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 218);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0222 end');
    })

    /**
     * @tc.name   testVolumeAlpha0223
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0223
     * @tc.desc   alpha 219 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0223 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 219);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0223 end');
    })

    /**
     * @tc.name   testVolumeAlpha0224
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0224
     * @tc.desc   alpha 220 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0224 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 220);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0224 end');
    })

    /**
     * @tc.name   testVolumeAlpha0225
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0225
     * @tc.desc   alpha 221 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0225 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 221);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0225 end');
    })

    /**
     * @tc.name   testVolumeAlpha0226
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0226
     * @tc.desc   alpha 222 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0226 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 222);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0226 end');
    })

    /**
     * @tc.name   testVolumeAlpha0227
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0227
     * @tc.desc   alpha 223 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0227 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 223);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0227 end');
    })

    /**
     * @tc.name   testVolumeAlpha0228
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0228
     * @tc.desc   alpha 224 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0228 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0228 end');
    })

    /**
     * @tc.name   testVolumeAlpha0229
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0229
     * @tc.desc   alpha 225 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0229 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 225);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0229 end');
    })

    /**
     * @tc.name   testVolumeAlpha0230
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0230
     * @tc.desc   alpha 226 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0230 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 226);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0230 end');
    })

    /**
     * @tc.name   testVolumeAlpha0231
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0231
     * @tc.desc   alpha 227 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0231 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 227);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0231 end');
    })

    /**
     * @tc.name   testVolumeAlpha0232
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0232
     * @tc.desc   alpha 228 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0232 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 228);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0232 end');
    })

    /**
     * @tc.name   testVolumeAlpha0233
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0233
     * @tc.desc   alpha 229 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0233 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 229);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0233 end');
    })

    /**
     * @tc.name   testVolumeAlpha0234
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0234
     * @tc.desc   alpha 230 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0234 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 230);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0234 end');
    })

    /**
     * @tc.name   testVolumeAlpha0235
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0235
     * @tc.desc   alpha 231 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0235 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 231);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0235 end');
    })

    /**
     * @tc.name   testVolumeAlpha0236
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0236
     * @tc.desc   alpha 232 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0236 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 232);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0236 end');
    })

    /**
     * @tc.name   testVolumeAlpha0237
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0237
     * @tc.desc   alpha 233 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0237 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 233);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0237 end');
    })

    /**
     * @tc.name   testVolumeAlpha0238
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0238
     * @tc.desc   alpha 234 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0238 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 234);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0238 end');
    })

    /**
     * @tc.name   testVolumeAlpha0239
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0239
     * @tc.desc   alpha 235 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0239 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 235);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0239 end');
    })

    /**
     * @tc.name   testVolumeAlpha0240
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0240
     * @tc.desc   alpha 236 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0240 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 236);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0240 end');
    })

    /**
     * @tc.name   testVolumeAlpha0241
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0241
     * @tc.desc   alpha 237 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0241 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 237);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0241 end');
    })

    /**
     * @tc.name   testVolumeAlpha0242
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0242
     * @tc.desc   alpha 238 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0242 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 238);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0242 end');
    })

    /**
     * @tc.name   testVolumeAlpha0243
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0243
     * @tc.desc   alpha 239 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0243 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 239);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0243 end');
    })

    /**
     * @tc.name   testVolumeAlpha0244
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0244
     * @tc.desc   alpha 240 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0244 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0244 end');
    })

    /**
     * @tc.name   testVolumeAlpha0245
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0245
     * @tc.desc   alpha 241 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0245 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 241);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0245 end');
    })

    /**
     * @tc.name   testVolumeAlpha0246
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0246
     * @tc.desc   alpha 242 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0246 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 242);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0246 end');
    })

    /**
     * @tc.name   testVolumeAlpha0247
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0247
     * @tc.desc   alpha 243 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0247 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 243);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0247 end');
    })

    /**
     * @tc.name   testVolumeAlpha0248
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0248
     * @tc.desc   alpha 244 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0248 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 244);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0248 end');
    })

    /**
     * @tc.name   testVolumeAlpha0249
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0249
     * @tc.desc   alpha 245 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0249 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 245);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0249 end');
    })

    /**
     * @tc.name   testVolumeAlpha0250
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0250
     * @tc.desc   alpha 246 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0250 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 246);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0250 end');
    })

    /**
     * @tc.name   testVolumeAlpha0251
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0251
     * @tc.desc   alpha 247 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0251 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 247);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0251 end');
    })

    /**
     * @tc.name   testVolumeAlpha0252
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0252
     * @tc.desc   alpha 248 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0252 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 248);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0252 end');
    })

    /**
     * @tc.name   testVolumeAlpha0253
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0253
     * @tc.desc   alpha 249 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0253 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 249);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0253 end');
    })

    /**
     * @tc.name   testVolumeAlpha0254
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0254
     * @tc.desc   alpha 250 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0254 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 250);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0254 end');
    })

    /**
     * @tc.name   testVolumeAlpha0255
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0255
     * @tc.desc   alpha 251 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0255 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 251);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0255 end');
    })

    /**
     * @tc.name   testVolumeAlpha0256
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0256
     * @tc.desc   alpha 252 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0256 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 252);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0256 end');
    })

    /**
     * @tc.name   testVolumeAlpha0257
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0257
     * @tc.desc   alpha 253 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0257 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 253);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0257 end');
    })

    /**
     * @tc.name   testVolumeAlpha0258
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0258
     * @tc.desc   alpha 254 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0258 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 254);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0258 end');
    })

    /**
     * @tc.name   testVolumeAlpha0259
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0259
     * @tc.desc   alpha 255 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0259 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel.length), String(4));
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0259 end');
    })

    /**
     * @tc.name   testVolumeAlpha0260
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0260
     * @tc.desc   opaque clear fills alpha channel on both sampled corners
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0260 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
      expect(result.pixel[3]).assertEqual(255);
      expect(result.corner[3]).assertEqual(255);
      expect(result.pixel.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0260 end');
    })

    /**
     * @tc.name   testVolumeAlpha0264
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0264
     * @tc.desc   Showcase: opaque alpha keeps all four channels on their own input values
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0264 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(12, 34, 56, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(12));
      expect(result.pixel[0]).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(34));
      expect(result.pixel[1]).assertEqual(34);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(56));
      expect(result.pixel[2]).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[3]), String(255));
      expect(result.pixel[3]).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0264 end');
    })

  })
}
