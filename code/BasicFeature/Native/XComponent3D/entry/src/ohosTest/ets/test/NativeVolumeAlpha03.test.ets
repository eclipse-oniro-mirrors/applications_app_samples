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

export default function nativeVolumeAlpha03Test() {
  resetYieldCounter();
  describe('NativeVolumeAlpha03', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeAlpha0131
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0131
     * @tc.desc   alpha 128 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0131 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 128);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0131 end');
    })

    /**
     * @tc.name   testVolumeAlpha0132
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0132
     * @tc.desc   alpha 129 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0132 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 129);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0132 end');
    })

    /**
     * @tc.name   testVolumeAlpha0133
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0133
     * @tc.desc   alpha 130 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0133 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 130);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0133 end');
    })

    /**
     * @tc.name   testVolumeAlpha0134
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0134
     * @tc.desc   alpha 131 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0134 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 131);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0134 end');
    })

    /**
     * @tc.name   testVolumeAlpha0135
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0135
     * @tc.desc   alpha 132 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0135 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 132);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0135 end');
    })

    /**
     * @tc.name   testVolumeAlpha0136
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0136
     * @tc.desc   alpha 133 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0136 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 133);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0136 end');
    })

    /**
     * @tc.name   testVolumeAlpha0137
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0137
     * @tc.desc   alpha 134 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0137 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 134);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0137 end');
    })

    /**
     * @tc.name   testVolumeAlpha0138
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0138
     * @tc.desc   alpha 135 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0138 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 135);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0138 end');
    })

    /**
     * @tc.name   testVolumeAlpha0139
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0139
     * @tc.desc   alpha 136 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0139 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 136);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0139 end');
    })

    /**
     * @tc.name   testVolumeAlpha0140
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0140
     * @tc.desc   alpha 137 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0140 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 137);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0140 end');
    })

    /**
     * @tc.name   testVolumeAlpha0141
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0141
     * @tc.desc   alpha 138 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0141 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 138);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0141 end');
    })

    /**
     * @tc.name   testVolumeAlpha0142
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0142
     * @tc.desc   alpha 139 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0142 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 139);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0142 end');
    })

    /**
     * @tc.name   testVolumeAlpha0143
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0143
     * @tc.desc   alpha 140 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0143 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 140);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0143 end');
    })

    /**
     * @tc.name   testVolumeAlpha0144
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0144
     * @tc.desc   alpha 141 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0144 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 141);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0144 end');
    })

    /**
     * @tc.name   testVolumeAlpha0145
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0145
     * @tc.desc   alpha 142 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0145 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 142);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0145 end');
    })

    /**
     * @tc.name   testVolumeAlpha0146
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0146
     * @tc.desc   alpha 143 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0146 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 143);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0146 end');
    })

    /**
     * @tc.name   testVolumeAlpha0147
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0147
     * @tc.desc   alpha 144 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0147 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 144);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0147 end');
    })

    /**
     * @tc.name   testVolumeAlpha0148
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0148
     * @tc.desc   alpha 145 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0148 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 145);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0148 end');
    })

    /**
     * @tc.name   testVolumeAlpha0149
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0149
     * @tc.desc   alpha 146 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0149 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 146);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0149 end');
    })

    /**
     * @tc.name   testVolumeAlpha0150
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0150
     * @tc.desc   alpha 147 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0150 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 147);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0150 end');
    })

    /**
     * @tc.name   testVolumeAlpha0151
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0151
     * @tc.desc   alpha 148 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0151 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 148);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0151 end');
    })

    /**
     * @tc.name   testVolumeAlpha0152
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0152
     * @tc.desc   alpha 149 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0152 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 149);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0152 end');
    })

    /**
     * @tc.name   testVolumeAlpha0153
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0153
     * @tc.desc   alpha 150 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0153 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 150);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0153 end');
    })

    /**
     * @tc.name   testVolumeAlpha0154
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0154
     * @tc.desc   alpha 151 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0154 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 151);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0154 end');
    })

    /**
     * @tc.name   testVolumeAlpha0155
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0155
     * @tc.desc   alpha 152 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0155 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 152);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0155 end');
    })

    /**
     * @tc.name   testVolumeAlpha0156
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0156
     * @tc.desc   alpha 153 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0156 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 153);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0156 end');
    })

    /**
     * @tc.name   testVolumeAlpha0157
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0157
     * @tc.desc   alpha 154 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0157 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 154);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0157 end');
    })

    /**
     * @tc.name   testVolumeAlpha0158
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0158
     * @tc.desc   alpha 155 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0158 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 155);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0158 end');
    })

    /**
     * @tc.name   testVolumeAlpha0159
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0159
     * @tc.desc   alpha 156 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0159 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 156);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0159 end');
    })

    /**
     * @tc.name   testVolumeAlpha0160
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0160
     * @tc.desc   alpha 157 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0160 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 157);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0160 end');
    })

    /**
     * @tc.name   testVolumeAlpha0161
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0161
     * @tc.desc   alpha 158 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0161 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 158);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0161 end');
    })

    /**
     * @tc.name   testVolumeAlpha0162
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0162
     * @tc.desc   alpha 159 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0162 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 159);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0162 end');
    })

    /**
     * @tc.name   testVolumeAlpha0163
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0163
     * @tc.desc   alpha 160 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0163 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 160);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0163 end');
    })

    /**
     * @tc.name   testVolumeAlpha0164
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0164
     * @tc.desc   alpha 161 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0164 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 161);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0164 end');
    })

    /**
     * @tc.name   testVolumeAlpha0165
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0165
     * @tc.desc   alpha 162 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0165 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 162);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0165 end');
    })

    /**
     * @tc.name   testVolumeAlpha0166
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0166
     * @tc.desc   alpha 163 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0166 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 163);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0166 end');
    })

    /**
     * @tc.name   testVolumeAlpha0167
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0167
     * @tc.desc   alpha 164 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0167 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 164);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0167 end');
    })

    /**
     * @tc.name   testVolumeAlpha0168
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0168
     * @tc.desc   alpha 165 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0168 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 165);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0168 end');
    })

    /**
     * @tc.name   testVolumeAlpha0169
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0169
     * @tc.desc   alpha 166 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0169 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 166);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0169 end');
    })

    /**
     * @tc.name   testVolumeAlpha0170
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0170
     * @tc.desc   alpha 167 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0170 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 167);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0170 end');
    })

    /**
     * @tc.name   testVolumeAlpha0171
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0171
     * @tc.desc   alpha 168 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0171 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 168);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0171 end');
    })

    /**
     * @tc.name   testVolumeAlpha0172
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0172
     * @tc.desc   alpha 169 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0172 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 169);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0172 end');
    })

    /**
     * @tc.name   testVolumeAlpha0173
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0173
     * @tc.desc   alpha 170 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0173 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 170);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0173 end');
    })

    /**
     * @tc.name   testVolumeAlpha0174
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0174
     * @tc.desc   alpha 171 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0174 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 171);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0174 end');
    })

    /**
     * @tc.name   testVolumeAlpha0175
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0175
     * @tc.desc   alpha 172 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0175 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 172);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0175 end');
    })

    /**
     * @tc.name   testVolumeAlpha0176
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0176
     * @tc.desc   alpha 173 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0176 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 173);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0176 end');
    })

    /**
     * @tc.name   testVolumeAlpha0177
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0177
     * @tc.desc   alpha 174 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0177 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 174);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0177 end');
    })

    /**
     * @tc.name   testVolumeAlpha0178
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0178
     * @tc.desc   alpha 175 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0178 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 175);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0178 end');
    })

    /**
     * @tc.name   testVolumeAlpha0179
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0179
     * @tc.desc   alpha 176 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0179 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 176);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0179 end');
    })

    /**
     * @tc.name   testVolumeAlpha0180
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0180
     * @tc.desc   alpha 177 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0180 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 177);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0180 end');
    })

    /**
     * @tc.name   testVolumeAlpha0181
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0181
     * @tc.desc   alpha 178 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0181 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 178);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0181 end');
    })

    /**
     * @tc.name   testVolumeAlpha0182
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0182
     * @tc.desc   alpha 179 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0182 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 179);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0182 end');
    })

    /**
     * @tc.name   testVolumeAlpha0183
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0183
     * @tc.desc   alpha 180 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0183 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 180);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0183 end');
    })

    /**
     * @tc.name   testVolumeAlpha0184
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0184
     * @tc.desc   alpha 181 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0184 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 181);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0184 end');
    })

    /**
     * @tc.name   testVolumeAlpha0185
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0185
     * @tc.desc   alpha 182 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0185 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 182);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0185 end');
    })

    /**
     * @tc.name   testVolumeAlpha0186
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0186
     * @tc.desc   alpha 183 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0186 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 183);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0186 end');
    })

    /**
     * @tc.name   testVolumeAlpha0187
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0187
     * @tc.desc   alpha 184 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0187 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 184);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0187 end');
    })

    /**
     * @tc.name   testVolumeAlpha0188
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0188
     * @tc.desc   alpha 185 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0188 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 185);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0188 end');
    })

    /**
     * @tc.name   testVolumeAlpha0189
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0189
     * @tc.desc   alpha 186 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0189 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 186);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0189 end');
    })

    /**
     * @tc.name   testVolumeAlpha0190
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0190
     * @tc.desc   alpha 187 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0190 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 187);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0190 end');
    })

    /**
     * @tc.name   testVolumeAlpha0191
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0191
     * @tc.desc   alpha 188 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0191 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 188);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0191 end');
    })

    /**
     * @tc.name   testVolumeAlpha0192
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0192
     * @tc.desc   alpha 189 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0192 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 189);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0192 end');
    })

    /**
     * @tc.name   testVolumeAlpha0193
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0193
     * @tc.desc   alpha 190 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0193 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 190);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0193 end');
    })

    /**
     * @tc.name   testVolumeAlpha0194
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0194
     * @tc.desc   alpha 191 keeps cleared RGB at zero with success code
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0194 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 191);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0194 end');
    })

    /**
     * @tc.name   testVolumeAlpha0195
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0195
     * @tc.desc   transparent then opaque clear keeps alpha channel value in readback
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0195 begin');
      const transparent: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 0);
      const opaque: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
      expect(transparent.pixel[3]).assertEqual(0);
      expect(opaque.pixel[3]).assertEqual(255);
      expect(transparent.code).assertEqual(0);
      expect(opaque.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0195 end');
    })

    /**
     * @tc.name   testVolumeAlpha0263
     * @tc.number SUB_XCOMPONENT3D_VOLALPHA_0263
     * @tc.desc   Showcase: a rejected alpha does not break the following valid render
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeAlpha0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0263 begin');
      const rejected: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 256);
      const accepted: PixelProbeResult = probeRenderSolidPixel(0, 0, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(rejected.code), String(-2));
      expect(rejected.code).assertEqual(-2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(accepted.pixel[3]), String(255));
      expect(accepted.pixel[3]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(accepted.code), String(0));
      expect(accepted.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(rejected.pixel[3]), String(0));
      expect(rejected.pixel[3]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeAlpha0263 end');
    })

  })
}
