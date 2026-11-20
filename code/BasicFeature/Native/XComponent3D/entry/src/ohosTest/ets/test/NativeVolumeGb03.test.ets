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

export default function nativeVolumeGb03Test() {
  resetYieldCounter();
  describe('NativeVolumeGb03', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeGb0131
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0131
     * @tc.desc   green 129 and blue 126 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0131 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 129, 126, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(129));
      expect(result.pixel[1]).assertEqual(129);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(126));
      expect(result.pixel[2]).assertEqual(126);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0131 end');
    })

    /**
     * @tc.name   testVolumeGb0132
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0132
     * @tc.desc   green 130 and blue 125 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0132 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 130, 125, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(130));
      expect(result.pixel[1]).assertEqual(130);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(125));
      expect(result.pixel[2]).assertEqual(125);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0132 end');
    })

    /**
     * @tc.name   testVolumeGb0133
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0133
     * @tc.desc   green 131 and blue 124 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0133 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 131, 124, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(131));
      expect(result.pixel[1]).assertEqual(131);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(124));
      expect(result.pixel[2]).assertEqual(124);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0133 end');
    })

    /**
     * @tc.name   testVolumeGb0134
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0134
     * @tc.desc   green 132 and blue 123 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0134 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 132, 123, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(132));
      expect(result.pixel[1]).assertEqual(132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(123));
      expect(result.pixel[2]).assertEqual(123);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0134 end');
    })

    /**
     * @tc.name   testVolumeGb0135
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0135
     * @tc.desc   green 133 and blue 122 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0135 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 133, 122, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(133));
      expect(result.pixel[1]).assertEqual(133);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(122));
      expect(result.pixel[2]).assertEqual(122);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0135 end');
    })

    /**
     * @tc.name   testVolumeGb0136
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0136
     * @tc.desc   green 134 and blue 121 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0136 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 134, 121, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(134));
      expect(result.pixel[1]).assertEqual(134);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(121));
      expect(result.pixel[2]).assertEqual(121);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0136 end');
    })

    /**
     * @tc.name   testVolumeGb0137
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0137
     * @tc.desc   green 135 and blue 120 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0137 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 135, 120, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(135));
      expect(result.pixel[1]).assertEqual(135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(120));
      expect(result.pixel[2]).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0137 end');
    })

    /**
     * @tc.name   testVolumeGb0138
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0138
     * @tc.desc   green 136 and blue 119 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0138 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 136, 119, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(136));
      expect(result.pixel[1]).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(119));
      expect(result.pixel[2]).assertEqual(119);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0138 end');
    })

    /**
     * @tc.name   testVolumeGb0139
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0139
     * @tc.desc   green 137 and blue 118 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0139 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 137, 118, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(137));
      expect(result.pixel[1]).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(118));
      expect(result.pixel[2]).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0139 end');
    })

    /**
     * @tc.name   testVolumeGb0140
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0140
     * @tc.desc   green 138 and blue 117 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0140 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 138, 117, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(138));
      expect(result.pixel[1]).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(117));
      expect(result.pixel[2]).assertEqual(117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0140 end');
    })

    /**
     * @tc.name   testVolumeGb0141
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0141
     * @tc.desc   green 139 and blue 116 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0141 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 139, 116, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(139));
      expect(result.pixel[1]).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(116));
      expect(result.pixel[2]).assertEqual(116);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0141 end');
    })

    /**
     * @tc.name   testVolumeGb0142
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0142
     * @tc.desc   green 140 and blue 115 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0142 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 140, 115, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(140));
      expect(result.pixel[1]).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(115));
      expect(result.pixel[2]).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0142 end');
    })

    /**
     * @tc.name   testVolumeGb0143
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0143
     * @tc.desc   green 141 and blue 114 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0143 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 141, 114, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(141));
      expect(result.pixel[1]).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(114));
      expect(result.pixel[2]).assertEqual(114);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0143 end');
    })

    /**
     * @tc.name   testVolumeGb0144
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0144
     * @tc.desc   green 142 and blue 113 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0144 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 142, 113, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(142));
      expect(result.pixel[1]).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(113));
      expect(result.pixel[2]).assertEqual(113);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0144 end');
    })

    /**
     * @tc.name   testVolumeGb0145
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0145
     * @tc.desc   green 143 and blue 112 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0145 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 143, 112, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(143));
      expect(result.pixel[1]).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(112));
      expect(result.pixel[2]).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0145 end');
    })

    /**
     * @tc.name   testVolumeGb0146
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0146
     * @tc.desc   green 144 and blue 111 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0146 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 144, 111, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(144));
      expect(result.pixel[1]).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(111));
      expect(result.pixel[2]).assertEqual(111);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0146 end');
    })

    /**
     * @tc.name   testVolumeGb0147
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0147
     * @tc.desc   green 145 and blue 110 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0147 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 145, 110, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(145));
      expect(result.pixel[1]).assertEqual(145);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(110));
      expect(result.pixel[2]).assertEqual(110);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0147 end');
    })

    /**
     * @tc.name   testVolumeGb0148
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0148
     * @tc.desc   green 146 and blue 109 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0148 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 146, 109, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(146));
      expect(result.pixel[1]).assertEqual(146);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(109));
      expect(result.pixel[2]).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0148 end');
    })

    /**
     * @tc.name   testVolumeGb0149
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0149
     * @tc.desc   green 147 and blue 108 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0149 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 147, 108, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(147));
      expect(result.pixel[1]).assertEqual(147);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(108));
      expect(result.pixel[2]).assertEqual(108);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0149 end');
    })

    /**
     * @tc.name   testVolumeGb0150
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0150
     * @tc.desc   green 148 and blue 107 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0150 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 148, 107, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(148));
      expect(result.pixel[1]).assertEqual(148);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(107));
      expect(result.pixel[2]).assertEqual(107);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0150 end');
    })

    /**
     * @tc.name   testVolumeGb0151
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0151
     * @tc.desc   green 149 and blue 106 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0151 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 149, 106, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(149));
      expect(result.pixel[1]).assertEqual(149);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(106));
      expect(result.pixel[2]).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0151 end');
    })

    /**
     * @tc.name   testVolumeGb0152
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0152
     * @tc.desc   green 150 and blue 105 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0152 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 150, 105, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(150));
      expect(result.pixel[1]).assertEqual(150);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(105));
      expect(result.pixel[2]).assertEqual(105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0152 end');
    })

    /**
     * @tc.name   testVolumeGb0153
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0153
     * @tc.desc   green 151 and blue 104 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0153 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 151, 104, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(151));
      expect(result.pixel[1]).assertEqual(151);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(104));
      expect(result.pixel[2]).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0153 end');
    })

    /**
     * @tc.name   testVolumeGb0154
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0154
     * @tc.desc   green 152 and blue 103 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0154 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 152, 103, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(152));
      expect(result.pixel[1]).assertEqual(152);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(103));
      expect(result.pixel[2]).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0154 end');
    })

    /**
     * @tc.name   testVolumeGb0155
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0155
     * @tc.desc   green 153 and blue 102 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0155 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 153, 102, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(153));
      expect(result.pixel[1]).assertEqual(153);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(102));
      expect(result.pixel[2]).assertEqual(102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0155 end');
    })

    /**
     * @tc.name   testVolumeGb0156
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0156
     * @tc.desc   green 154 and blue 101 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0156 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 154, 101, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(154));
      expect(result.pixel[1]).assertEqual(154);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(101));
      expect(result.pixel[2]).assertEqual(101);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0156 end');
    })

    /**
     * @tc.name   testVolumeGb0157
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0157
     * @tc.desc   green 155 and blue 100 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0157 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 155, 100, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(155));
      expect(result.pixel[1]).assertEqual(155);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(100));
      expect(result.pixel[2]).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0157 end');
    })

    /**
     * @tc.name   testVolumeGb0158
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0158
     * @tc.desc   green 156 and blue 99 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0158 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 156, 99, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(156));
      expect(result.pixel[1]).assertEqual(156);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(99));
      expect(result.pixel[2]).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0158 end');
    })

    /**
     * @tc.name   testVolumeGb0159
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0159
     * @tc.desc   green 157 and blue 98 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0159 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 157, 98, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(157));
      expect(result.pixel[1]).assertEqual(157);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(98));
      expect(result.pixel[2]).assertEqual(98);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0159 end');
    })

    /**
     * @tc.name   testVolumeGb0160
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0160
     * @tc.desc   green 158 and blue 97 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0160 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 158, 97, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(158));
      expect(result.pixel[1]).assertEqual(158);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(97));
      expect(result.pixel[2]).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0160 end');
    })

    /**
     * @tc.name   testVolumeGb0161
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0161
     * @tc.desc   green 159 and blue 96 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0161 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 159, 96, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(159));
      expect(result.pixel[1]).assertEqual(159);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(96));
      expect(result.pixel[2]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0161 end');
    })

    /**
     * @tc.name   testVolumeGb0162
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0162
     * @tc.desc   green 160 and blue 95 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0162 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 160, 95, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(160));
      expect(result.pixel[1]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(95));
      expect(result.pixel[2]).assertEqual(95);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0162 end');
    })

    /**
     * @tc.name   testVolumeGb0163
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0163
     * @tc.desc   green 161 and blue 94 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0163 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 161, 94, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(161));
      expect(result.pixel[1]).assertEqual(161);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(94));
      expect(result.pixel[2]).assertEqual(94);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0163 end');
    })

    /**
     * @tc.name   testVolumeGb0164
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0164
     * @tc.desc   green 162 and blue 93 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0164 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 162, 93, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(162));
      expect(result.pixel[1]).assertEqual(162);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(93));
      expect(result.pixel[2]).assertEqual(93);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0164 end');
    })

    /**
     * @tc.name   testVolumeGb0165
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0165
     * @tc.desc   green 163 and blue 92 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0165 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 163, 92, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(163));
      expect(result.pixel[1]).assertEqual(163);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(92));
      expect(result.pixel[2]).assertEqual(92);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0165 end');
    })

    /**
     * @tc.name   testVolumeGb0166
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0166
     * @tc.desc   green 164 and blue 91 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0166 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 164, 91, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(164));
      expect(result.pixel[1]).assertEqual(164);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(91));
      expect(result.pixel[2]).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0166 end');
    })

    /**
     * @tc.name   testVolumeGb0167
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0167
     * @tc.desc   green 165 and blue 90 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0167 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 165, 90, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(165));
      expect(result.pixel[1]).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(90));
      expect(result.pixel[2]).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0167 end');
    })

    /**
     * @tc.name   testVolumeGb0168
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0168
     * @tc.desc   green 166 and blue 89 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0168 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 166, 89, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(166));
      expect(result.pixel[1]).assertEqual(166);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(89));
      expect(result.pixel[2]).assertEqual(89);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0168 end');
    })

    /**
     * @tc.name   testVolumeGb0169
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0169
     * @tc.desc   green 167 and blue 88 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0169 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 167, 88, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(167));
      expect(result.pixel[1]).assertEqual(167);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(88));
      expect(result.pixel[2]).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0169 end');
    })

    /**
     * @tc.name   testVolumeGb0170
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0170
     * @tc.desc   green 168 and blue 87 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0170 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 168, 87, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(168));
      expect(result.pixel[1]).assertEqual(168);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(87));
      expect(result.pixel[2]).assertEqual(87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0170 end');
    })

    /**
     * @tc.name   testVolumeGb0171
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0171
     * @tc.desc   green 169 and blue 86 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0171 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 169, 86, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(169));
      expect(result.pixel[1]).assertEqual(169);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(86));
      expect(result.pixel[2]).assertEqual(86);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0171 end');
    })

    /**
     * @tc.name   testVolumeGb0172
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0172
     * @tc.desc   green 170 and blue 85 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0172 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 170, 85, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(170));
      expect(result.pixel[1]).assertEqual(170);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(85));
      expect(result.pixel[2]).assertEqual(85);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0172 end');
    })

    /**
     * @tc.name   testVolumeGb0173
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0173
     * @tc.desc   green 171 and blue 84 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0173 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 171, 84, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(171));
      expect(result.pixel[1]).assertEqual(171);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(84));
      expect(result.pixel[2]).assertEqual(84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0173 end');
    })

    /**
     * @tc.name   testVolumeGb0174
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0174
     * @tc.desc   green 172 and blue 83 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0174 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 172, 83, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(172));
      expect(result.pixel[1]).assertEqual(172);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(83));
      expect(result.pixel[2]).assertEqual(83);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0174 end');
    })

    /**
     * @tc.name   testVolumeGb0175
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0175
     * @tc.desc   green 173 and blue 82 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0175 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 173, 82, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(173));
      expect(result.pixel[1]).assertEqual(173);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(82));
      expect(result.pixel[2]).assertEqual(82);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0175 end');
    })

    /**
     * @tc.name   testVolumeGb0176
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0176
     * @tc.desc   green 174 and blue 81 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0176 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 174, 81, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(174));
      expect(result.pixel[1]).assertEqual(174);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(81));
      expect(result.pixel[2]).assertEqual(81);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0176 end');
    })

    /**
     * @tc.name   testVolumeGb0177
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0177
     * @tc.desc   green 175 and blue 80 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0177 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 175, 80, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(175));
      expect(result.pixel[1]).assertEqual(175);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(80));
      expect(result.pixel[2]).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0177 end');
    })

    /**
     * @tc.name   testVolumeGb0178
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0178
     * @tc.desc   green 176 and blue 79 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0178 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 176, 79, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(176));
      expect(result.pixel[1]).assertEqual(176);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(79));
      expect(result.pixel[2]).assertEqual(79);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0178 end');
    })

    /**
     * @tc.name   testVolumeGb0179
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0179
     * @tc.desc   green 177 and blue 78 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0179 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 177, 78, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(177));
      expect(result.pixel[1]).assertEqual(177);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(78));
      expect(result.pixel[2]).assertEqual(78);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0179 end');
    })

    /**
     * @tc.name   testVolumeGb0180
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0180
     * @tc.desc   green 178 and blue 77 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0180 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 178, 77, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(178));
      expect(result.pixel[1]).assertEqual(178);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(77));
      expect(result.pixel[2]).assertEqual(77);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0180 end');
    })

    /**
     * @tc.name   testVolumeGb0181
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0181
     * @tc.desc   green 179 and blue 76 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0181 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 179, 76, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(179));
      expect(result.pixel[1]).assertEqual(179);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(76));
      expect(result.pixel[2]).assertEqual(76);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0181 end');
    })

    /**
     * @tc.name   testVolumeGb0182
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0182
     * @tc.desc   green 180 and blue 75 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0182 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 180, 75, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(180));
      expect(result.pixel[1]).assertEqual(180);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(75));
      expect(result.pixel[2]).assertEqual(75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0182 end');
    })

    /**
     * @tc.name   testVolumeGb0183
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0183
     * @tc.desc   green 181 and blue 74 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0183 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 181, 74, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(181));
      expect(result.pixel[1]).assertEqual(181);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(74));
      expect(result.pixel[2]).assertEqual(74);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0183 end');
    })

    /**
     * @tc.name   testVolumeGb0184
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0184
     * @tc.desc   green 182 and blue 73 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0184 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 182, 73, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(182));
      expect(result.pixel[1]).assertEqual(182);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(73));
      expect(result.pixel[2]).assertEqual(73);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0184 end');
    })

    /**
     * @tc.name   testVolumeGb0185
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0185
     * @tc.desc   green 183 and blue 72 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0185 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 183, 72, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(183));
      expect(result.pixel[1]).assertEqual(183);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(72));
      expect(result.pixel[2]).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0185 end');
    })

    /**
     * @tc.name   testVolumeGb0186
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0186
     * @tc.desc   green 184 and blue 71 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0186 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 184, 71, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(184));
      expect(result.pixel[1]).assertEqual(184);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(71));
      expect(result.pixel[2]).assertEqual(71);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0186 end');
    })

    /**
     * @tc.name   testVolumeGb0187
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0187
     * @tc.desc   green 185 and blue 70 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0187 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 185, 70, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(185));
      expect(result.pixel[1]).assertEqual(185);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(70));
      expect(result.pixel[2]).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0187 end');
    })

    /**
     * @tc.name   testVolumeGb0188
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0188
     * @tc.desc   green 186 and blue 69 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0188 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 186, 69, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(186));
      expect(result.pixel[1]).assertEqual(186);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(69));
      expect(result.pixel[2]).assertEqual(69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0188 end');
    })

    /**
     * @tc.name   testVolumeGb0189
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0189
     * @tc.desc   green 187 and blue 68 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0189 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 187, 68, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(187));
      expect(result.pixel[1]).assertEqual(187);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(68));
      expect(result.pixel[2]).assertEqual(68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0189 end');
    })

    /**
     * @tc.name   testVolumeGb0190
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0190
     * @tc.desc   green 188 and blue 67 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0190 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 188, 67, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(188));
      expect(result.pixel[1]).assertEqual(188);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(67));
      expect(result.pixel[2]).assertEqual(67);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0190 end');
    })

    /**
     * @tc.name   testVolumeGb0191
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0191
     * @tc.desc   green 189 and blue 66 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0191 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 189, 66, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(189));
      expect(result.pixel[1]).assertEqual(189);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(66));
      expect(result.pixel[2]).assertEqual(66);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0191 end');
    })

    /**
     * @tc.name   testVolumeGb0192
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0192
     * @tc.desc   green 190 and blue 65 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0192 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 190, 65, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(190));
      expect(result.pixel[1]).assertEqual(190);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(65));
      expect(result.pixel[2]).assertEqual(65);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0192 end');
    })

    /**
     * @tc.name   testVolumeGb0193
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0193
     * @tc.desc   green 191 and blue 64 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0193 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 191, 64, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(191));
      expect(result.pixel[1]).assertEqual(191);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(64));
      expect(result.pixel[2]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0193 end');
    })

    /**
     * @tc.name   testVolumeGb0194
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0194
     * @tc.desc   green 192 and blue 63 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0194 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 192, 63, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(192));
      expect(result.pixel[1]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(63));
      expect(result.pixel[2]).assertEqual(63);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0194 end');
    })

    /**
     * @tc.name   testVolumeGb0195
     * @tc.number SUB_XCOMPONENT3D_VOLGB_0195
     * @tc.desc   the pair sums to 255 and the larger channel keeps its own slot
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGb0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0195 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 192, 63, 255);
      expect(result.pixel[1] + result.pixel[2]).assertEqual(255);
      expect(result.pixel[1]).assertEqual(192);
      expect(result.pixel[2] < result.pixel[1]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGb0195 end');
    })

  })
}
