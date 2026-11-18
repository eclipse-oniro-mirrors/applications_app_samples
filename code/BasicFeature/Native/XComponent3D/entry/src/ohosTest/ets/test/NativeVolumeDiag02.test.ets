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

export default function nativeVolumeDiag02Test() {
  resetYieldCounter();
  describe('NativeVolumeDiag02', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeDiag0066
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0066
     * @tc.desc   red 64 and blue 191 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0066 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(64, 0, 191, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(64));
      expect(result.pixel[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(191));
      expect(result.pixel[2]).assertEqual(191);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0066 end');
    })

    /**
     * @tc.name   testVolumeDiag0067
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0067
     * @tc.desc   red 65 and blue 190 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0067 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(65, 0, 190, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(65));
      expect(result.pixel[0]).assertEqual(65);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(190));
      expect(result.pixel[2]).assertEqual(190);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0067 end');
    })

    /**
     * @tc.name   testVolumeDiag0068
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0068
     * @tc.desc   red 66 and blue 189 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0068 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(66, 0, 189, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(66));
      expect(result.pixel[0]).assertEqual(66);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(189));
      expect(result.pixel[2]).assertEqual(189);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0068 end');
    })

    /**
     * @tc.name   testVolumeDiag0069
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0069
     * @tc.desc   red 67 and blue 188 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0069 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(67, 0, 188, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(67));
      expect(result.pixel[0]).assertEqual(67);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(188));
      expect(result.pixel[2]).assertEqual(188);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0069 end');
    })

    /**
     * @tc.name   testVolumeDiag0070
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0070
     * @tc.desc   red 68 and blue 187 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0070 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(68, 0, 187, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(68));
      expect(result.pixel[0]).assertEqual(68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(187));
      expect(result.pixel[2]).assertEqual(187);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0070 end');
    })

    /**
     * @tc.name   testVolumeDiag0071
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0071
     * @tc.desc   red 69 and blue 186 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0071 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(69, 0, 186, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(69));
      expect(result.pixel[0]).assertEqual(69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(186));
      expect(result.pixel[2]).assertEqual(186);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0071 end');
    })

    /**
     * @tc.name   testVolumeDiag0072
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0072
     * @tc.desc   red 70 and blue 185 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0072 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(70, 0, 185, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(70));
      expect(result.pixel[0]).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(185));
      expect(result.pixel[2]).assertEqual(185);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0072 end');
    })

    /**
     * @tc.name   testVolumeDiag0073
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0073
     * @tc.desc   red 71 and blue 184 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0073 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(71, 0, 184, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(71));
      expect(result.pixel[0]).assertEqual(71);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(184));
      expect(result.pixel[2]).assertEqual(184);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0073 end');
    })

    /**
     * @tc.name   testVolumeDiag0074
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0074
     * @tc.desc   red 72 and blue 183 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0074 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(72, 0, 183, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(72));
      expect(result.pixel[0]).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(183));
      expect(result.pixel[2]).assertEqual(183);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0074 end');
    })

    /**
     * @tc.name   testVolumeDiag0075
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0075
     * @tc.desc   red 73 and blue 182 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0075 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(73, 0, 182, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(73));
      expect(result.pixel[0]).assertEqual(73);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(182));
      expect(result.pixel[2]).assertEqual(182);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0075 end');
    })

    /**
     * @tc.name   testVolumeDiag0076
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0076
     * @tc.desc   red 74 and blue 181 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0076 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(74, 0, 181, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(74));
      expect(result.pixel[0]).assertEqual(74);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(181));
      expect(result.pixel[2]).assertEqual(181);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0076 end');
    })

    /**
     * @tc.name   testVolumeDiag0077
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0077
     * @tc.desc   red 75 and blue 180 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0077 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(75, 0, 180, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(75));
      expect(result.pixel[0]).assertEqual(75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(180));
      expect(result.pixel[2]).assertEqual(180);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0077 end');
    })

    /**
     * @tc.name   testVolumeDiag0078
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0078
     * @tc.desc   red 76 and blue 179 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0078 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(76, 0, 179, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(76));
      expect(result.pixel[0]).assertEqual(76);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(179));
      expect(result.pixel[2]).assertEqual(179);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0078 end');
    })

    /**
     * @tc.name   testVolumeDiag0079
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0079
     * @tc.desc   red 77 and blue 178 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0079 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(77, 0, 178, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(77));
      expect(result.pixel[0]).assertEqual(77);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(178));
      expect(result.pixel[2]).assertEqual(178);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0079 end');
    })

    /**
     * @tc.name   testVolumeDiag0080
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0080
     * @tc.desc   red 78 and blue 177 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0080 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(78, 0, 177, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(78));
      expect(result.pixel[0]).assertEqual(78);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(177));
      expect(result.pixel[2]).assertEqual(177);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0080 end');
    })

    /**
     * @tc.name   testVolumeDiag0081
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0081
     * @tc.desc   red 79 and blue 176 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0081 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(79, 0, 176, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(79));
      expect(result.pixel[0]).assertEqual(79);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(176));
      expect(result.pixel[2]).assertEqual(176);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0081 end');
    })

    /**
     * @tc.name   testVolumeDiag0082
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0082
     * @tc.desc   red 80 and blue 175 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0082 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(80, 0, 175, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(80));
      expect(result.pixel[0]).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(175));
      expect(result.pixel[2]).assertEqual(175);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0082 end');
    })

    /**
     * @tc.name   testVolumeDiag0083
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0083
     * @tc.desc   red 81 and blue 174 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0083 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(81, 0, 174, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(81));
      expect(result.pixel[0]).assertEqual(81);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(174));
      expect(result.pixel[2]).assertEqual(174);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0083 end');
    })

    /**
     * @tc.name   testVolumeDiag0084
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0084
     * @tc.desc   red 82 and blue 173 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0084 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(82, 0, 173, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(82));
      expect(result.pixel[0]).assertEqual(82);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(173));
      expect(result.pixel[2]).assertEqual(173);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0084 end');
    })

    /**
     * @tc.name   testVolumeDiag0085
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0085
     * @tc.desc   red 83 and blue 172 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0085 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(83, 0, 172, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(83));
      expect(result.pixel[0]).assertEqual(83);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(172));
      expect(result.pixel[2]).assertEqual(172);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0085 end');
    })

    /**
     * @tc.name   testVolumeDiag0086
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0086
     * @tc.desc   red 84 and blue 171 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0086 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(84, 0, 171, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(84));
      expect(result.pixel[0]).assertEqual(84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(171));
      expect(result.pixel[2]).assertEqual(171);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0086 end');
    })

    /**
     * @tc.name   testVolumeDiag0087
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0087
     * @tc.desc   red 85 and blue 170 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0087 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(85, 0, 170, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(85));
      expect(result.pixel[0]).assertEqual(85);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(170));
      expect(result.pixel[2]).assertEqual(170);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0087 end');
    })

    /**
     * @tc.name   testVolumeDiag0088
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0088
     * @tc.desc   red 86 and blue 169 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0088 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(86, 0, 169, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(86));
      expect(result.pixel[0]).assertEqual(86);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(169));
      expect(result.pixel[2]).assertEqual(169);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0088 end');
    })

    /**
     * @tc.name   testVolumeDiag0089
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0089
     * @tc.desc   red 87 and blue 168 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0089 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(87, 0, 168, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(87));
      expect(result.pixel[0]).assertEqual(87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(168));
      expect(result.pixel[2]).assertEqual(168);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0089 end');
    })

    /**
     * @tc.name   testVolumeDiag0090
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0090
     * @tc.desc   red 88 and blue 167 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0090 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(88, 0, 167, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(88));
      expect(result.pixel[0]).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(167));
      expect(result.pixel[2]).assertEqual(167);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0090 end');
    })

    /**
     * @tc.name   testVolumeDiag0091
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0091
     * @tc.desc   red 89 and blue 166 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0091 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(89, 0, 166, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(89));
      expect(result.pixel[0]).assertEqual(89);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(166));
      expect(result.pixel[2]).assertEqual(166);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0091 end');
    })

    /**
     * @tc.name   testVolumeDiag0092
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0092
     * @tc.desc   red 90 and blue 165 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0092 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(90, 0, 165, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(90));
      expect(result.pixel[0]).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(165));
      expect(result.pixel[2]).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0092 end');
    })

    /**
     * @tc.name   testVolumeDiag0093
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0093
     * @tc.desc   red 91 and blue 164 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0093 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(91, 0, 164, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(91));
      expect(result.pixel[0]).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(164));
      expect(result.pixel[2]).assertEqual(164);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0093 end');
    })

    /**
     * @tc.name   testVolumeDiag0094
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0094
     * @tc.desc   red 92 and blue 163 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0094 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(92, 0, 163, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(92));
      expect(result.pixel[0]).assertEqual(92);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(163));
      expect(result.pixel[2]).assertEqual(163);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0094 end');
    })

    /**
     * @tc.name   testVolumeDiag0095
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0095
     * @tc.desc   red 93 and blue 162 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0095 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(93, 0, 162, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(93));
      expect(result.pixel[0]).assertEqual(93);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(162));
      expect(result.pixel[2]).assertEqual(162);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0095 end');
    })

    /**
     * @tc.name   testVolumeDiag0096
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0096
     * @tc.desc   red 94 and blue 161 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0096 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(94, 0, 161, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(94));
      expect(result.pixel[0]).assertEqual(94);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(161));
      expect(result.pixel[2]).assertEqual(161);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0096 end');
    })

    /**
     * @tc.name   testVolumeDiag0097
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0097
     * @tc.desc   red 95 and blue 160 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0097 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(95, 0, 160, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(95));
      expect(result.pixel[0]).assertEqual(95);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(160));
      expect(result.pixel[2]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0097 end');
    })

    /**
     * @tc.name   testVolumeDiag0098
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0098
     * @tc.desc   red 96 and blue 159 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0098 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(96, 0, 159, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(96));
      expect(result.pixel[0]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(159));
      expect(result.pixel[2]).assertEqual(159);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0098 end');
    })

    /**
     * @tc.name   testVolumeDiag0099
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0099
     * @tc.desc   red 97 and blue 158 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0099 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(97, 0, 158, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(97));
      expect(result.pixel[0]).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(158));
      expect(result.pixel[2]).assertEqual(158);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0099 end');
    })

    /**
     * @tc.name   testVolumeDiag0100
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0100
     * @tc.desc   red 98 and blue 157 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0100 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(98, 0, 157, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(98));
      expect(result.pixel[0]).assertEqual(98);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(157));
      expect(result.pixel[2]).assertEqual(157);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0100 end');
    })

    /**
     * @tc.name   testVolumeDiag0101
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0101
     * @tc.desc   red 99 and blue 156 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0101 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(99, 0, 156, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(99));
      expect(result.pixel[0]).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(156));
      expect(result.pixel[2]).assertEqual(156);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0101 end');
    })

    /**
     * @tc.name   testVolumeDiag0102
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0102
     * @tc.desc   red 100 and blue 155 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0102 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(100, 0, 155, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(100));
      expect(result.pixel[0]).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(155));
      expect(result.pixel[2]).assertEqual(155);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0102 end');
    })

    /**
     * @tc.name   testVolumeDiag0103
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0103
     * @tc.desc   red 101 and blue 154 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0103 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(101, 0, 154, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(101));
      expect(result.pixel[0]).assertEqual(101);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(154));
      expect(result.pixel[2]).assertEqual(154);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0103 end');
    })

    /**
     * @tc.name   testVolumeDiag0104
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0104
     * @tc.desc   red 102 and blue 153 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0104 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(102, 0, 153, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(102));
      expect(result.pixel[0]).assertEqual(102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(153));
      expect(result.pixel[2]).assertEqual(153);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0104 end');
    })

    /**
     * @tc.name   testVolumeDiag0105
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0105
     * @tc.desc   red 103 and blue 152 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0105 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(103, 0, 152, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(103));
      expect(result.pixel[0]).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(152));
      expect(result.pixel[2]).assertEqual(152);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0105 end');
    })

    /**
     * @tc.name   testVolumeDiag0106
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0106
     * @tc.desc   red 104 and blue 151 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0106 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(104, 0, 151, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(104));
      expect(result.pixel[0]).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(151));
      expect(result.pixel[2]).assertEqual(151);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0106 end');
    })

    /**
     * @tc.name   testVolumeDiag0107
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0107
     * @tc.desc   red 105 and blue 150 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0107 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(105, 0, 150, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(105));
      expect(result.pixel[0]).assertEqual(105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(150));
      expect(result.pixel[2]).assertEqual(150);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0107 end');
    })

    /**
     * @tc.name   testVolumeDiag0108
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0108
     * @tc.desc   red 106 and blue 149 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0108 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(106, 0, 149, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(106));
      expect(result.pixel[0]).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(149));
      expect(result.pixel[2]).assertEqual(149);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0108 end');
    })

    /**
     * @tc.name   testVolumeDiag0109
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0109
     * @tc.desc   red 107 and blue 148 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0109 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(107, 0, 148, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(107));
      expect(result.pixel[0]).assertEqual(107);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(148));
      expect(result.pixel[2]).assertEqual(148);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0109 end');
    })

    /**
     * @tc.name   testVolumeDiag0110
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0110
     * @tc.desc   red 108 and blue 147 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0110 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(108, 0, 147, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(108));
      expect(result.pixel[0]).assertEqual(108);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(147));
      expect(result.pixel[2]).assertEqual(147);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0110 end');
    })

    /**
     * @tc.name   testVolumeDiag0111
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0111
     * @tc.desc   red 109 and blue 146 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0111 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(109, 0, 146, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(109));
      expect(result.pixel[0]).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(146));
      expect(result.pixel[2]).assertEqual(146);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0111 end');
    })

    /**
     * @tc.name   testVolumeDiag0112
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0112
     * @tc.desc   red 110 and blue 145 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0112 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(110, 0, 145, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(110));
      expect(result.pixel[0]).assertEqual(110);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(145));
      expect(result.pixel[2]).assertEqual(145);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0112 end');
    })

    /**
     * @tc.name   testVolumeDiag0113
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0113
     * @tc.desc   red 111 and blue 144 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0113 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(111, 0, 144, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(111));
      expect(result.pixel[0]).assertEqual(111);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(144));
      expect(result.pixel[2]).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0113 end');
    })

    /**
     * @tc.name   testVolumeDiag0114
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0114
     * @tc.desc   red 112 and blue 143 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0114 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(112, 0, 143, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(112));
      expect(result.pixel[0]).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(143));
      expect(result.pixel[2]).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0114 end');
    })

    /**
     * @tc.name   testVolumeDiag0115
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0115
     * @tc.desc   red 113 and blue 142 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0115 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(113, 0, 142, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(113));
      expect(result.pixel[0]).assertEqual(113);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(142));
      expect(result.pixel[2]).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0115 end');
    })

    /**
     * @tc.name   testVolumeDiag0116
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0116
     * @tc.desc   red 114 and blue 141 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0116 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(114, 0, 141, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(114));
      expect(result.pixel[0]).assertEqual(114);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(141));
      expect(result.pixel[2]).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0116 end');
    })

    /**
     * @tc.name   testVolumeDiag0117
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0117
     * @tc.desc   red 115 and blue 140 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0117 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(115, 0, 140, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(115));
      expect(result.pixel[0]).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(140));
      expect(result.pixel[2]).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0117 end');
    })

    /**
     * @tc.name   testVolumeDiag0118
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0118
     * @tc.desc   red 116 and blue 139 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0118 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(116, 0, 139, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(116));
      expect(result.pixel[0]).assertEqual(116);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(139));
      expect(result.pixel[2]).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0118 end');
    })

    /**
     * @tc.name   testVolumeDiag0119
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0119
     * @tc.desc   red 117 and blue 138 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0119 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(117, 0, 138, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(117));
      expect(result.pixel[0]).assertEqual(117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(138));
      expect(result.pixel[2]).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0119 end');
    })

    /**
     * @tc.name   testVolumeDiag0120
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0120
     * @tc.desc   red 118 and blue 137 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0120 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(118, 0, 137, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(118));
      expect(result.pixel[0]).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(137));
      expect(result.pixel[2]).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0120 end');
    })

    /**
     * @tc.name   testVolumeDiag0121
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0121
     * @tc.desc   red 119 and blue 136 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0121 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(119, 0, 136, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(119));
      expect(result.pixel[0]).assertEqual(119);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(136));
      expect(result.pixel[2]).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0121 end');
    })

    /**
     * @tc.name   testVolumeDiag0122
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0122
     * @tc.desc   red 120 and blue 135 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0122 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(120, 0, 135, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(120));
      expect(result.pixel[0]).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(135));
      expect(result.pixel[2]).assertEqual(135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0122 end');
    })

    /**
     * @tc.name   testVolumeDiag0123
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0123
     * @tc.desc   red 121 and blue 134 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0123 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(121, 0, 134, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(121));
      expect(result.pixel[0]).assertEqual(121);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(134));
      expect(result.pixel[2]).assertEqual(134);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0123 end');
    })

    /**
     * @tc.name   testVolumeDiag0124
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0124
     * @tc.desc   red 122 and blue 133 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0124 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(122, 0, 133, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(122));
      expect(result.pixel[0]).assertEqual(122);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(133));
      expect(result.pixel[2]).assertEqual(133);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0124 end');
    })

    /**
     * @tc.name   testVolumeDiag0125
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0125
     * @tc.desc   red 123 and blue 132 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0125 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(123, 0, 132, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(123));
      expect(result.pixel[0]).assertEqual(123);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(132));
      expect(result.pixel[2]).assertEqual(132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0125 end');
    })

    /**
     * @tc.name   testVolumeDiag0126
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0126
     * @tc.desc   red 124 and blue 131 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0126 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(124, 0, 131, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(124));
      expect(result.pixel[0]).assertEqual(124);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(131));
      expect(result.pixel[2]).assertEqual(131);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0126 end');
    })

    /**
     * @tc.name   testVolumeDiag0127
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0127
     * @tc.desc   red 125 and blue 130 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0127 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(125, 0, 130, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(125));
      expect(result.pixel[0]).assertEqual(125);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(130));
      expect(result.pixel[2]).assertEqual(130);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0127 end');
    })

    /**
     * @tc.name   testVolumeDiag0128
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0128
     * @tc.desc   red 126 and blue 129 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0128 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(126, 0, 129, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(126));
      expect(result.pixel[0]).assertEqual(126);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(129));
      expect(result.pixel[2]).assertEqual(129);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0128 end');
    })

    /**
     * @tc.name   testVolumeDiag0129
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0129
     * @tc.desc   red 127 and blue 128 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0129 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(127, 0, 128, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(127));
      expect(result.pixel[0]).assertEqual(127);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(128));
      expect(result.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0129 end');
    })

    /**
     * @tc.name   testVolumeDiag0130
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0130
     * @tc.desc   red 127 and blue 128 are not swapped at the midpoint
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0130 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(127, 0, 128, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(127));
      expect(result.pixel[0]).assertEqual(127);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(128));
      expect(result.pixel[2]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0130 end');
    })

  })
}
