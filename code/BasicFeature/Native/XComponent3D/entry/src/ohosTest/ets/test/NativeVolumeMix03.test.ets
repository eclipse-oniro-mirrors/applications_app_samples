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

export default function nativeVolumeMix03Test() {
  resetYieldCounter();
  describe('NativeVolumeMix03', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeMix0131
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0131
     * @tc.desc   red 128 and green 127 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0131 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(128, 127, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(128));
      expect(result.pixel[0]).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(127));
      expect(result.pixel[1]).assertEqual(127);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0131 end');
    })

    /**
     * @tc.name   testVolumeMix0132
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0132
     * @tc.desc   red 129 and green 126 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0132 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(129, 126, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(129));
      expect(result.pixel[0]).assertEqual(129);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(126));
      expect(result.pixel[1]).assertEqual(126);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0132 end');
    })

    /**
     * @tc.name   testVolumeMix0133
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0133
     * @tc.desc   red 130 and green 125 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0133 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(130, 125, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(130));
      expect(result.pixel[0]).assertEqual(130);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(125));
      expect(result.pixel[1]).assertEqual(125);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0133 end');
    })

    /**
     * @tc.name   testVolumeMix0134
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0134
     * @tc.desc   red 131 and green 124 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0134 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(131, 124, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(131));
      expect(result.pixel[0]).assertEqual(131);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(124));
      expect(result.pixel[1]).assertEqual(124);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0134 end');
    })

    /**
     * @tc.name   testVolumeMix0135
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0135
     * @tc.desc   red 132 and green 123 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0135 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(132, 123, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(132));
      expect(result.pixel[0]).assertEqual(132);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(123));
      expect(result.pixel[1]).assertEqual(123);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0135 end');
    })

    /**
     * @tc.name   testVolumeMix0136
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0136
     * @tc.desc   red 133 and green 122 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0136 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(133, 122, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(133));
      expect(result.pixel[0]).assertEqual(133);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(122));
      expect(result.pixel[1]).assertEqual(122);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0136 end');
    })

    /**
     * @tc.name   testVolumeMix0137
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0137
     * @tc.desc   red 134 and green 121 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0137 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(134, 121, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(134));
      expect(result.pixel[0]).assertEqual(134);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(121));
      expect(result.pixel[1]).assertEqual(121);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0137 end');
    })

    /**
     * @tc.name   testVolumeMix0138
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0138
     * @tc.desc   red 135 and green 120 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0138 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(135, 120, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(135));
      expect(result.pixel[0]).assertEqual(135);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(120));
      expect(result.pixel[1]).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0138 end');
    })

    /**
     * @tc.name   testVolumeMix0139
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0139
     * @tc.desc   red 136 and green 119 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0139 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(136, 119, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(136));
      expect(result.pixel[0]).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(119));
      expect(result.pixel[1]).assertEqual(119);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0139 end');
    })

    /**
     * @tc.name   testVolumeMix0140
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0140
     * @tc.desc   red 137 and green 118 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0140 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(137, 118, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(137));
      expect(result.pixel[0]).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(118));
      expect(result.pixel[1]).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0140 end');
    })

    /**
     * @tc.name   testVolumeMix0141
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0141
     * @tc.desc   red 138 and green 117 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0141 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(138, 117, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(138));
      expect(result.pixel[0]).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(117));
      expect(result.pixel[1]).assertEqual(117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0141 end');
    })

    /**
     * @tc.name   testVolumeMix0142
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0142
     * @tc.desc   red 139 and green 116 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0142 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(139, 116, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(139));
      expect(result.pixel[0]).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(116));
      expect(result.pixel[1]).assertEqual(116);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0142 end');
    })

    /**
     * @tc.name   testVolumeMix0143
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0143
     * @tc.desc   red 140 and green 115 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0143 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(140, 115, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(140));
      expect(result.pixel[0]).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(115));
      expect(result.pixel[1]).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0143 end');
    })

    /**
     * @tc.name   testVolumeMix0144
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0144
     * @tc.desc   red 141 and green 114 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0144 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(141, 114, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(141));
      expect(result.pixel[0]).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(114));
      expect(result.pixel[1]).assertEqual(114);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0144 end');
    })

    /**
     * @tc.name   testVolumeMix0145
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0145
     * @tc.desc   red 142 and green 113 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0145 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(142, 113, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(142));
      expect(result.pixel[0]).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(113));
      expect(result.pixel[1]).assertEqual(113);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0145 end');
    })

    /**
     * @tc.name   testVolumeMix0146
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0146
     * @tc.desc   red 143 and green 112 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0146 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(143, 112, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(143));
      expect(result.pixel[0]).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(112));
      expect(result.pixel[1]).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0146 end');
    })

    /**
     * @tc.name   testVolumeMix0147
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0147
     * @tc.desc   red 144 and green 111 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0147 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(144, 111, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(144));
      expect(result.pixel[0]).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(111));
      expect(result.pixel[1]).assertEqual(111);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0147 end');
    })

    /**
     * @tc.name   testVolumeMix0148
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0148
     * @tc.desc   red 145 and green 110 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0148 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(145, 110, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(145));
      expect(result.pixel[0]).assertEqual(145);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(110));
      expect(result.pixel[1]).assertEqual(110);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0148 end');
    })

    /**
     * @tc.name   testVolumeMix0149
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0149
     * @tc.desc   red 146 and green 109 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0149 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(146, 109, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(146));
      expect(result.pixel[0]).assertEqual(146);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(109));
      expect(result.pixel[1]).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0149 end');
    })

    /**
     * @tc.name   testVolumeMix0150
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0150
     * @tc.desc   red 147 and green 108 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0150 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(147, 108, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(147));
      expect(result.pixel[0]).assertEqual(147);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(108));
      expect(result.pixel[1]).assertEqual(108);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0150 end');
    })

    /**
     * @tc.name   testVolumeMix0151
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0151
     * @tc.desc   red 148 and green 107 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0151 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(148, 107, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(148));
      expect(result.pixel[0]).assertEqual(148);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(107));
      expect(result.pixel[1]).assertEqual(107);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0151 end');
    })

    /**
     * @tc.name   testVolumeMix0152
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0152
     * @tc.desc   red 149 and green 106 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0152 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(149, 106, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(149));
      expect(result.pixel[0]).assertEqual(149);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(106));
      expect(result.pixel[1]).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0152 end');
    })

    /**
     * @tc.name   testVolumeMix0153
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0153
     * @tc.desc   red 150 and green 105 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0153 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(150, 105, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(150));
      expect(result.pixel[0]).assertEqual(150);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(105));
      expect(result.pixel[1]).assertEqual(105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0153 end');
    })

    /**
     * @tc.name   testVolumeMix0154
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0154
     * @tc.desc   red 151 and green 104 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0154 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(151, 104, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(151));
      expect(result.pixel[0]).assertEqual(151);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(104));
      expect(result.pixel[1]).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0154 end');
    })

    /**
     * @tc.name   testVolumeMix0155
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0155
     * @tc.desc   red 152 and green 103 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0155 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(152, 103, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(152));
      expect(result.pixel[0]).assertEqual(152);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(103));
      expect(result.pixel[1]).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0155 end');
    })

    /**
     * @tc.name   testVolumeMix0156
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0156
     * @tc.desc   red 153 and green 102 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0156 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(153, 102, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(153));
      expect(result.pixel[0]).assertEqual(153);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(102));
      expect(result.pixel[1]).assertEqual(102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0156 end');
    })

    /**
     * @tc.name   testVolumeMix0157
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0157
     * @tc.desc   red 154 and green 101 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0157 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(154, 101, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(154));
      expect(result.pixel[0]).assertEqual(154);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(101));
      expect(result.pixel[1]).assertEqual(101);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0157 end');
    })

    /**
     * @tc.name   testVolumeMix0158
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0158
     * @tc.desc   red 155 and green 100 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0158 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(155, 100, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(155));
      expect(result.pixel[0]).assertEqual(155);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(100));
      expect(result.pixel[1]).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0158 end');
    })

    /**
     * @tc.name   testVolumeMix0159
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0159
     * @tc.desc   red 156 and green 99 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0159 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(156, 99, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(156));
      expect(result.pixel[0]).assertEqual(156);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(99));
      expect(result.pixel[1]).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0159 end');
    })

    /**
     * @tc.name   testVolumeMix0160
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0160
     * @tc.desc   red 157 and green 98 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0160 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(157, 98, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(157));
      expect(result.pixel[0]).assertEqual(157);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(98));
      expect(result.pixel[1]).assertEqual(98);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0160 end');
    })

    /**
     * @tc.name   testVolumeMix0161
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0161
     * @tc.desc   red 158 and green 97 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0161 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(158, 97, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(158));
      expect(result.pixel[0]).assertEqual(158);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(97));
      expect(result.pixel[1]).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0161 end');
    })

    /**
     * @tc.name   testVolumeMix0162
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0162
     * @tc.desc   red 159 and green 96 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0162 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(159, 96, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(159));
      expect(result.pixel[0]).assertEqual(159);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(96));
      expect(result.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0162 end');
    })

    /**
     * @tc.name   testVolumeMix0163
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0163
     * @tc.desc   red 160 and green 95 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0163 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(160, 95, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(160));
      expect(result.pixel[0]).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(95));
      expect(result.pixel[1]).assertEqual(95);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0163 end');
    })

    /**
     * @tc.name   testVolumeMix0164
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0164
     * @tc.desc   red 161 and green 94 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0164 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(161, 94, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(161));
      expect(result.pixel[0]).assertEqual(161);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(94));
      expect(result.pixel[1]).assertEqual(94);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0164 end');
    })

    /**
     * @tc.name   testVolumeMix0165
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0165
     * @tc.desc   red 162 and green 93 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0165 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(162, 93, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(162));
      expect(result.pixel[0]).assertEqual(162);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(93));
      expect(result.pixel[1]).assertEqual(93);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0165 end');
    })

    /**
     * @tc.name   testVolumeMix0166
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0166
     * @tc.desc   red 163 and green 92 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0166 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(163, 92, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(163));
      expect(result.pixel[0]).assertEqual(163);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(92));
      expect(result.pixel[1]).assertEqual(92);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0166 end');
    })

    /**
     * @tc.name   testVolumeMix0167
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0167
     * @tc.desc   red 164 and green 91 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0167 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(164, 91, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(164));
      expect(result.pixel[0]).assertEqual(164);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(91));
      expect(result.pixel[1]).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0167 end');
    })

    /**
     * @tc.name   testVolumeMix0168
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0168
     * @tc.desc   red 165 and green 90 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0168 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(165, 90, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(165));
      expect(result.pixel[0]).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(90));
      expect(result.pixel[1]).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0168 end');
    })

    /**
     * @tc.name   testVolumeMix0169
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0169
     * @tc.desc   red 166 and green 89 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0169 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(166, 89, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(166));
      expect(result.pixel[0]).assertEqual(166);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(89));
      expect(result.pixel[1]).assertEqual(89);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0169 end');
    })

    /**
     * @tc.name   testVolumeMix0170
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0170
     * @tc.desc   red 167 and green 88 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0170 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(167, 88, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(167));
      expect(result.pixel[0]).assertEqual(167);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(88));
      expect(result.pixel[1]).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0170 end');
    })

    /**
     * @tc.name   testVolumeMix0171
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0171
     * @tc.desc   red 168 and green 87 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0171 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(168, 87, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(168));
      expect(result.pixel[0]).assertEqual(168);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(87));
      expect(result.pixel[1]).assertEqual(87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0171 end');
    })

    /**
     * @tc.name   testVolumeMix0172
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0172
     * @tc.desc   red 169 and green 86 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0172 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(169, 86, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(169));
      expect(result.pixel[0]).assertEqual(169);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(86));
      expect(result.pixel[1]).assertEqual(86);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0172 end');
    })

    /**
     * @tc.name   testVolumeMix0173
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0173
     * @tc.desc   red 170 and green 85 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0173 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(170, 85, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(170));
      expect(result.pixel[0]).assertEqual(170);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(85));
      expect(result.pixel[1]).assertEqual(85);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0173 end');
    })

    /**
     * @tc.name   testVolumeMix0174
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0174
     * @tc.desc   red 171 and green 84 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0174 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(171, 84, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(171));
      expect(result.pixel[0]).assertEqual(171);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(84));
      expect(result.pixel[1]).assertEqual(84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0174 end');
    })

    /**
     * @tc.name   testVolumeMix0175
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0175
     * @tc.desc   red 172 and green 83 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0175 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(172, 83, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(172));
      expect(result.pixel[0]).assertEqual(172);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(83));
      expect(result.pixel[1]).assertEqual(83);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0175 end');
    })

    /**
     * @tc.name   testVolumeMix0176
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0176
     * @tc.desc   red 173 and green 82 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0176 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(173, 82, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(173));
      expect(result.pixel[0]).assertEqual(173);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(82));
      expect(result.pixel[1]).assertEqual(82);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0176 end');
    })

    /**
     * @tc.name   testVolumeMix0177
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0177
     * @tc.desc   red 174 and green 81 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0177 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(174, 81, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(174));
      expect(result.pixel[0]).assertEqual(174);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(81));
      expect(result.pixel[1]).assertEqual(81);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0177 end');
    })

    /**
     * @tc.name   testVolumeMix0178
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0178
     * @tc.desc   red 175 and green 80 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0178 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(175, 80, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(175));
      expect(result.pixel[0]).assertEqual(175);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(80));
      expect(result.pixel[1]).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0178 end');
    })

    /**
     * @tc.name   testVolumeMix0179
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0179
     * @tc.desc   red 176 and green 79 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0179 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(176, 79, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(176));
      expect(result.pixel[0]).assertEqual(176);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(79));
      expect(result.pixel[1]).assertEqual(79);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0179 end');
    })

    /**
     * @tc.name   testVolumeMix0180
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0180
     * @tc.desc   red 177 and green 78 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0180 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(177, 78, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(177));
      expect(result.pixel[0]).assertEqual(177);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(78));
      expect(result.pixel[1]).assertEqual(78);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0180 end');
    })

    /**
     * @tc.name   testVolumeMix0181
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0181
     * @tc.desc   red 178 and green 77 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0181 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(178, 77, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(178));
      expect(result.pixel[0]).assertEqual(178);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(77));
      expect(result.pixel[1]).assertEqual(77);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0181 end');
    })

    /**
     * @tc.name   testVolumeMix0182
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0182
     * @tc.desc   red 179 and green 76 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0182 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(179, 76, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(179));
      expect(result.pixel[0]).assertEqual(179);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(76));
      expect(result.pixel[1]).assertEqual(76);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0182 end');
    })

    /**
     * @tc.name   testVolumeMix0183
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0183
     * @tc.desc   red 180 and green 75 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0183 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(180, 75, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(180));
      expect(result.pixel[0]).assertEqual(180);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(75));
      expect(result.pixel[1]).assertEqual(75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0183 end');
    })

    /**
     * @tc.name   testVolumeMix0184
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0184
     * @tc.desc   red 181 and green 74 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0184 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(181, 74, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(181));
      expect(result.pixel[0]).assertEqual(181);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(74));
      expect(result.pixel[1]).assertEqual(74);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0184 end');
    })

    /**
     * @tc.name   testVolumeMix0185
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0185
     * @tc.desc   red 182 and green 73 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0185 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(182, 73, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(182));
      expect(result.pixel[0]).assertEqual(182);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(73));
      expect(result.pixel[1]).assertEqual(73);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0185 end');
    })

    /**
     * @tc.name   testVolumeMix0186
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0186
     * @tc.desc   red 183 and green 72 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0186 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(183, 72, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(183));
      expect(result.pixel[0]).assertEqual(183);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(72));
      expect(result.pixel[1]).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0186 end');
    })

    /**
     * @tc.name   testVolumeMix0187
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0187
     * @tc.desc   red 184 and green 71 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0187 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(184, 71, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(184));
      expect(result.pixel[0]).assertEqual(184);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(71));
      expect(result.pixel[1]).assertEqual(71);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0187 end');
    })

    /**
     * @tc.name   testVolumeMix0188
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0188
     * @tc.desc   red 185 and green 70 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0188 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(185, 70, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(185));
      expect(result.pixel[0]).assertEqual(185);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(70));
      expect(result.pixel[1]).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0188 end');
    })

    /**
     * @tc.name   testVolumeMix0189
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0189
     * @tc.desc   red 186 and green 69 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0189 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(186, 69, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(186));
      expect(result.pixel[0]).assertEqual(186);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(69));
      expect(result.pixel[1]).assertEqual(69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0189 end');
    })

    /**
     * @tc.name   testVolumeMix0190
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0190
     * @tc.desc   red 187 and green 68 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0190 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(187, 68, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(187));
      expect(result.pixel[0]).assertEqual(187);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(68));
      expect(result.pixel[1]).assertEqual(68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0190 end');
    })

    /**
     * @tc.name   testVolumeMix0191
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0191
     * @tc.desc   red 188 and green 67 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0191 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(188, 67, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(188));
      expect(result.pixel[0]).assertEqual(188);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(67));
      expect(result.pixel[1]).assertEqual(67);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0191 end');
    })

    /**
     * @tc.name   testVolumeMix0192
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0192
     * @tc.desc   red 189 and green 66 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0192 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(189, 66, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(189));
      expect(result.pixel[0]).assertEqual(189);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(66));
      expect(result.pixel[1]).assertEqual(66);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0192 end');
    })

    /**
     * @tc.name   testVolumeMix0193
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0193
     * @tc.desc   red 190 and green 65 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0193 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(190, 65, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(190));
      expect(result.pixel[0]).assertEqual(190);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(65));
      expect(result.pixel[1]).assertEqual(65);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0193 end');
    })

    /**
     * @tc.name   testVolumeMix0194
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0194
     * @tc.desc   red 191 and green 64 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0194 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(191, 64, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(191));
      expect(result.pixel[0]).assertEqual(191);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(64));
      expect(result.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0194 end');
    })

    /**
     * @tc.name   testVolumeMix0195
     * @tc.number SUB_XCOMPONENT3D_VOLMIX_0195
     * @tc.desc   one saturated channel leaves the neighbouring slot untouched
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeMix0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0195 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(255, 0, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(255));
      expect(result.pixel[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[0]), String(255));
      expect(result.corner[0]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeMix0195 end');
    })

  })
}
