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

export default function nativeVolumeGreen02Test() {
  resetYieldCounter();
  describe('NativeVolumeGreen02', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeGreen0066
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0066
     * @tc.desc   green 64 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0066 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 64, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(64));
      expect(result.pixel[1]).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0066 end');
    })

    /**
     * @tc.name   testVolumeGreen0067
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0067
     * @tc.desc   green 65 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0067 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 65, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(65));
      expect(result.pixel[1]).assertEqual(65);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0067 end');
    })

    /**
     * @tc.name   testVolumeGreen0068
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0068
     * @tc.desc   green 66 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0068 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 66, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(66));
      expect(result.pixel[1]).assertEqual(66);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0068 end');
    })

    /**
     * @tc.name   testVolumeGreen0069
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0069
     * @tc.desc   green 67 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0069 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 67, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(67));
      expect(result.pixel[1]).assertEqual(67);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0069 end');
    })

    /**
     * @tc.name   testVolumeGreen0070
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0070
     * @tc.desc   green 68 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0070 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 68, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(68));
      expect(result.pixel[1]).assertEqual(68);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0070 end');
    })

    /**
     * @tc.name   testVolumeGreen0071
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0071
     * @tc.desc   green 69 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0071 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 69, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(69));
      expect(result.pixel[1]).assertEqual(69);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0071 end');
    })

    /**
     * @tc.name   testVolumeGreen0072
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0072
     * @tc.desc   green 70 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0072 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 70, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(70));
      expect(result.pixel[1]).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0072 end');
    })

    /**
     * @tc.name   testVolumeGreen0073
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0073
     * @tc.desc   green 71 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0073 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 71, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(71));
      expect(result.pixel[1]).assertEqual(71);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0073 end');
    })

    /**
     * @tc.name   testVolumeGreen0074
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0074
     * @tc.desc   green 72 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0074 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 72, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(72));
      expect(result.pixel[1]).assertEqual(72);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0074 end');
    })

    /**
     * @tc.name   testVolumeGreen0075
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0075
     * @tc.desc   green 73 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0075 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 73, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(73));
      expect(result.pixel[1]).assertEqual(73);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0075 end');
    })

    /**
     * @tc.name   testVolumeGreen0076
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0076
     * @tc.desc   green 74 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0076 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 74, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(74));
      expect(result.pixel[1]).assertEqual(74);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0076 end');
    })

    /**
     * @tc.name   testVolumeGreen0077
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0077
     * @tc.desc   green 75 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0077 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 75, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(75));
      expect(result.pixel[1]).assertEqual(75);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0077 end');
    })

    /**
     * @tc.name   testVolumeGreen0078
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0078
     * @tc.desc   green 76 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0078 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 76, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(76));
      expect(result.pixel[1]).assertEqual(76);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0078 end');
    })

    /**
     * @tc.name   testVolumeGreen0079
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0079
     * @tc.desc   green 77 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0079 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 77, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(77));
      expect(result.pixel[1]).assertEqual(77);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0079 end');
    })

    /**
     * @tc.name   testVolumeGreen0080
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0080
     * @tc.desc   green 78 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0080 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 78, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(78));
      expect(result.pixel[1]).assertEqual(78);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0080 end');
    })

    /**
     * @tc.name   testVolumeGreen0081
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0081
     * @tc.desc   green 79 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0081 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 79, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(79));
      expect(result.pixel[1]).assertEqual(79);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0081 end');
    })

    /**
     * @tc.name   testVolumeGreen0082
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0082
     * @tc.desc   green 80 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0082 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 80, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(80));
      expect(result.pixel[1]).assertEqual(80);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0082 end');
    })

    /**
     * @tc.name   testVolumeGreen0083
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0083
     * @tc.desc   green 81 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0083 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 81, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(81));
      expect(result.pixel[1]).assertEqual(81);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0083 end');
    })

    /**
     * @tc.name   testVolumeGreen0084
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0084
     * @tc.desc   green 82 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0084 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 82, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(82));
      expect(result.pixel[1]).assertEqual(82);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0084 end');
    })

    /**
     * @tc.name   testVolumeGreen0085
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0085
     * @tc.desc   green 83 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0085 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 83, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(83));
      expect(result.pixel[1]).assertEqual(83);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0085 end');
    })

    /**
     * @tc.name   testVolumeGreen0086
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0086
     * @tc.desc   green 84 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0086 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 84, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(84));
      expect(result.pixel[1]).assertEqual(84);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0086 end');
    })

    /**
     * @tc.name   testVolumeGreen0087
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0087
     * @tc.desc   green 85 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0087 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 85, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(85));
      expect(result.pixel[1]).assertEqual(85);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0087 end');
    })

    /**
     * @tc.name   testVolumeGreen0088
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0088
     * @tc.desc   green 86 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0088 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 86, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(86));
      expect(result.pixel[1]).assertEqual(86);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0088 end');
    })

    /**
     * @tc.name   testVolumeGreen0089
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0089
     * @tc.desc   green 87 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0089 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 87, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(87));
      expect(result.pixel[1]).assertEqual(87);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0089 end');
    })

    /**
     * @tc.name   testVolumeGreen0090
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0090
     * @tc.desc   green 88 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0090 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 88, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(88));
      expect(result.pixel[1]).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0090 end');
    })

    /**
     * @tc.name   testVolumeGreen0091
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0091
     * @tc.desc   green 89 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0091 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 89, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(89));
      expect(result.pixel[1]).assertEqual(89);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0091 end');
    })

    /**
     * @tc.name   testVolumeGreen0092
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0092
     * @tc.desc   green 90 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0092 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 90, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(90));
      expect(result.pixel[1]).assertEqual(90);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0092 end');
    })

    /**
     * @tc.name   testVolumeGreen0093
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0093
     * @tc.desc   green 91 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0093 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 91, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(91));
      expect(result.pixel[1]).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0093 end');
    })

    /**
     * @tc.name   testVolumeGreen0094
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0094
     * @tc.desc   green 92 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0094 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 92, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(92));
      expect(result.pixel[1]).assertEqual(92);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0094 end');
    })

    /**
     * @tc.name   testVolumeGreen0095
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0095
     * @tc.desc   green 93 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0095 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 93, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(93));
      expect(result.pixel[1]).assertEqual(93);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0095 end');
    })

    /**
     * @tc.name   testVolumeGreen0096
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0096
     * @tc.desc   green 94 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0096 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 94, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(94));
      expect(result.pixel[1]).assertEqual(94);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0096 end');
    })

    /**
     * @tc.name   testVolumeGreen0097
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0097
     * @tc.desc   green 95 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0097 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 95, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(95));
      expect(result.pixel[1]).assertEqual(95);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0097 end');
    })

    /**
     * @tc.name   testVolumeGreen0098
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0098
     * @tc.desc   green 96 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0098 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 96, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(96));
      expect(result.pixel[1]).assertEqual(96);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0098 end');
    })

    /**
     * @tc.name   testVolumeGreen0099
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0099
     * @tc.desc   green 97 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0099 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 97, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(97));
      expect(result.pixel[1]).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0099 end');
    })

    /**
     * @tc.name   testVolumeGreen0100
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0100
     * @tc.desc   green 98 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0100 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 98, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(98));
      expect(result.pixel[1]).assertEqual(98);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0100 end');
    })

    /**
     * @tc.name   testVolumeGreen0101
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0101
     * @tc.desc   green 99 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0101 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 99, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(99));
      expect(result.pixel[1]).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0101 end');
    })

    /**
     * @tc.name   testVolumeGreen0102
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0102
     * @tc.desc   green 100 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0102 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 100, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(100));
      expect(result.pixel[1]).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0102 end');
    })

    /**
     * @tc.name   testVolumeGreen0103
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0103
     * @tc.desc   green 101 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0103 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 101, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(101));
      expect(result.pixel[1]).assertEqual(101);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0103 end');
    })

    /**
     * @tc.name   testVolumeGreen0104
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0104
     * @tc.desc   green 102 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0104 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 102, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(102));
      expect(result.pixel[1]).assertEqual(102);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0104 end');
    })

    /**
     * @tc.name   testVolumeGreen0105
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0105
     * @tc.desc   green 103 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0105 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 103, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(103));
      expect(result.pixel[1]).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0105 end');
    })

    /**
     * @tc.name   testVolumeGreen0106
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0106
     * @tc.desc   green 104 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0106 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 104, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(104));
      expect(result.pixel[1]).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0106 end');
    })

    /**
     * @tc.name   testVolumeGreen0107
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0107
     * @tc.desc   green 105 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0107 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 105, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(105));
      expect(result.pixel[1]).assertEqual(105);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0107 end');
    })

    /**
     * @tc.name   testVolumeGreen0108
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0108
     * @tc.desc   green 106 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0108 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 106, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(106));
      expect(result.pixel[1]).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0108 end');
    })

    /**
     * @tc.name   testVolumeGreen0109
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0109
     * @tc.desc   green 107 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0109 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 107, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(107));
      expect(result.pixel[1]).assertEqual(107);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0109 end');
    })

    /**
     * @tc.name   testVolumeGreen0110
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0110
     * @tc.desc   green 108 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0110 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 108, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(108));
      expect(result.pixel[1]).assertEqual(108);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0110 end');
    })

    /**
     * @tc.name   testVolumeGreen0111
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0111
     * @tc.desc   green 109 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0111 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 109, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(109));
      expect(result.pixel[1]).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0111 end');
    })

    /**
     * @tc.name   testVolumeGreen0112
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0112
     * @tc.desc   green 110 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0112 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 110, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(110));
      expect(result.pixel[1]).assertEqual(110);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0112 end');
    })

    /**
     * @tc.name   testVolumeGreen0113
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0113
     * @tc.desc   green 111 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0113 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 111, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(111));
      expect(result.pixel[1]).assertEqual(111);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0113 end');
    })

    /**
     * @tc.name   testVolumeGreen0114
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0114
     * @tc.desc   green 112 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0114 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 112, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(112));
      expect(result.pixel[1]).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0114 end');
    })

    /**
     * @tc.name   testVolumeGreen0115
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0115
     * @tc.desc   green 113 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0115 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 113, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(113));
      expect(result.pixel[1]).assertEqual(113);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0115 end');
    })

    /**
     * @tc.name   testVolumeGreen0116
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0116
     * @tc.desc   green 114 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0116 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 114, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(114));
      expect(result.pixel[1]).assertEqual(114);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0116 end');
    })

    /**
     * @tc.name   testVolumeGreen0117
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0117
     * @tc.desc   green 115 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0117 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 115, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(115));
      expect(result.pixel[1]).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0117 end');
    })

    /**
     * @tc.name   testVolumeGreen0118
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0118
     * @tc.desc   green 116 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0118 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 116, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(116));
      expect(result.pixel[1]).assertEqual(116);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0118 end');
    })

    /**
     * @tc.name   testVolumeGreen0119
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0119
     * @tc.desc   green 117 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0119 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 117, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(117));
      expect(result.pixel[1]).assertEqual(117);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0119 end');
    })

    /**
     * @tc.name   testVolumeGreen0120
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0120
     * @tc.desc   green 118 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0120 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 118, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(118));
      expect(result.pixel[1]).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0120 end');
    })

    /**
     * @tc.name   testVolumeGreen0121
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0121
     * @tc.desc   green 119 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0121 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 119, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(119));
      expect(result.pixel[1]).assertEqual(119);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0121 end');
    })

    /**
     * @tc.name   testVolumeGreen0122
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0122
     * @tc.desc   green 120 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0122 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 120, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(120));
      expect(result.pixel[1]).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0122 end');
    })

    /**
     * @tc.name   testVolumeGreen0123
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0123
     * @tc.desc   green 121 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0123 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 121, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(121));
      expect(result.pixel[1]).assertEqual(121);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0123 end');
    })

    /**
     * @tc.name   testVolumeGreen0124
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0124
     * @tc.desc   green 122 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0124 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 122, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(122));
      expect(result.pixel[1]).assertEqual(122);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0124 end');
    })

    /**
     * @tc.name   testVolumeGreen0125
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0125
     * @tc.desc   green 123 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0125 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 123, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(123));
      expect(result.pixel[1]).assertEqual(123);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0125 end');
    })

    /**
     * @tc.name   testVolumeGreen0126
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0126
     * @tc.desc   green 124 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0126 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 124, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(124));
      expect(result.pixel[1]).assertEqual(124);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0126 end');
    })

    /**
     * @tc.name   testVolumeGreen0127
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0127
     * @tc.desc   green 125 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0127 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 125, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(125));
      expect(result.pixel[1]).assertEqual(125);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0127 end');
    })

    /**
     * @tc.name   testVolumeGreen0128
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0128
     * @tc.desc   green 126 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0128 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 126, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(126));
      expect(result.pixel[1]).assertEqual(126);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0128 end');
    })

    /**
     * @tc.name   testVolumeGreen0129
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0129
     * @tc.desc   green 127 round-trips while red and blue stay zero
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0129 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 127, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(127));
      expect(result.pixel[1]).assertEqual(127);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0129 end');
    })

    /**
     * @tc.name   testVolumeGreen0130
     * @tc.number SUB_XCOMPONENT3D_VOLGREEN_0130
     * @tc.desc   green -1 is rejected but the probe entry stays usable
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeGreen0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0130 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, -1, 0, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(-2));
      expect(result.code).assertEqual(-2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.aux), String(4));
      expect(result.aux).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[3]), String(0));
      expect(result.pixel[3]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeGreen0130 end');
    })

  })
}
