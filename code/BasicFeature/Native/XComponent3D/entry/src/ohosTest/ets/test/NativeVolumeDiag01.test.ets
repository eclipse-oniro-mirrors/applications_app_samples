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

export default function nativeVolumeDiag01Test() {
  resetYieldCounter();
  describe('NativeVolumeDiag01', () => {

    beforeEach(async () => {
      await yieldToSystem();
    });

    /**
     * @tc.name   testVolumeDiag0001
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0001
     * @tc.desc   red 0 and blue 255 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0001 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(0, 0, 255, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(255));
      expect(result.pixel[2]).assertEqual(255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0001 end');
    })

    /**
     * @tc.name   testVolumeDiag0002
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0002
     * @tc.desc   red 1 and blue 254 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0002 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(1, 0, 254, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(1));
      expect(result.pixel[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(254));
      expect(result.pixel[2]).assertEqual(254);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0002 end');
    })

    /**
     * @tc.name   testVolumeDiag0003
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0003
     * @tc.desc   red 2 and blue 253 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0003 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(2, 0, 253, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(2));
      expect(result.pixel[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(253));
      expect(result.pixel[2]).assertEqual(253);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0003 end');
    })

    /**
     * @tc.name   testVolumeDiag0004
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0004
     * @tc.desc   red 3 and blue 252 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0004 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(3, 0, 252, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(3));
      expect(result.pixel[0]).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(252));
      expect(result.pixel[2]).assertEqual(252);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0004 end');
    })

    /**
     * @tc.name   testVolumeDiag0005
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0005
     * @tc.desc   red 4 and blue 251 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0005 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(4, 0, 251, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(4));
      expect(result.pixel[0]).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(251));
      expect(result.pixel[2]).assertEqual(251);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0005 end');
    })

    /**
     * @tc.name   testVolumeDiag0006
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0006
     * @tc.desc   red 5 and blue 250 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0006 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(5, 0, 250, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(5));
      expect(result.pixel[0]).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(250));
      expect(result.pixel[2]).assertEqual(250);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0006 end');
    })

    /**
     * @tc.name   testVolumeDiag0007
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0007
     * @tc.desc   red 6 and blue 249 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0007 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(6, 0, 249, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(6));
      expect(result.pixel[0]).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(249));
      expect(result.pixel[2]).assertEqual(249);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0007 end');
    })

    /**
     * @tc.name   testVolumeDiag0008
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0008
     * @tc.desc   red 7 and blue 248 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0008 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(7, 0, 248, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(7));
      expect(result.pixel[0]).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(248));
      expect(result.pixel[2]).assertEqual(248);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0008 end');
    })

    /**
     * @tc.name   testVolumeDiag0009
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0009
     * @tc.desc   red 8 and blue 247 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0009 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(8, 0, 247, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(8));
      expect(result.pixel[0]).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(247));
      expect(result.pixel[2]).assertEqual(247);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0009 end');
    })

    /**
     * @tc.name   testVolumeDiag0010
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0010
     * @tc.desc   red 9 and blue 246 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0010 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(9, 0, 246, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(9));
      expect(result.pixel[0]).assertEqual(9);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(246));
      expect(result.pixel[2]).assertEqual(246);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0010 end');
    })

    /**
     * @tc.name   testVolumeDiag0011
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0011
     * @tc.desc   red 10 and blue 245 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0011 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(10, 0, 245, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(10));
      expect(result.pixel[0]).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(245));
      expect(result.pixel[2]).assertEqual(245);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0011 end');
    })

    /**
     * @tc.name   testVolumeDiag0012
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0012
     * @tc.desc   red 11 and blue 244 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0012 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(11, 0, 244, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(11));
      expect(result.pixel[0]).assertEqual(11);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(244));
      expect(result.pixel[2]).assertEqual(244);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0012 end');
    })

    /**
     * @tc.name   testVolumeDiag0013
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0013
     * @tc.desc   red 12 and blue 243 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0013 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(12, 0, 243, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(12));
      expect(result.pixel[0]).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(243));
      expect(result.pixel[2]).assertEqual(243);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0013 end');
    })

    /**
     * @tc.name   testVolumeDiag0014
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0014
     * @tc.desc   red 13 and blue 242 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0014 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(13, 0, 242, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(13));
      expect(result.pixel[0]).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(242));
      expect(result.pixel[2]).assertEqual(242);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0014 end');
    })

    /**
     * @tc.name   testVolumeDiag0015
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0015
     * @tc.desc   red 14 and blue 241 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0015 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(14, 0, 241, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(14));
      expect(result.pixel[0]).assertEqual(14);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(241));
      expect(result.pixel[2]).assertEqual(241);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0015 end');
    })

    /**
     * @tc.name   testVolumeDiag0016
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0016
     * @tc.desc   red 15 and blue 240 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0016 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(15, 0, 240, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(15));
      expect(result.pixel[0]).assertEqual(15);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(240));
      expect(result.pixel[2]).assertEqual(240);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0016 end');
    })

    /**
     * @tc.name   testVolumeDiag0017
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0017
     * @tc.desc   red 16 and blue 239 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0017 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(16, 0, 239, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(16));
      expect(result.pixel[0]).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(239));
      expect(result.pixel[2]).assertEqual(239);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0017 end');
    })

    /**
     * @tc.name   testVolumeDiag0018
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0018
     * @tc.desc   red 17 and blue 238 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0018 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(17, 0, 238, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(17));
      expect(result.pixel[0]).assertEqual(17);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(238));
      expect(result.pixel[2]).assertEqual(238);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0018 end');
    })

    /**
     * @tc.name   testVolumeDiag0019
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0019
     * @tc.desc   red 18 and blue 237 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0019 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(18, 0, 237, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(18));
      expect(result.pixel[0]).assertEqual(18);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(237));
      expect(result.pixel[2]).assertEqual(237);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0019 end');
    })

    /**
     * @tc.name   testVolumeDiag0020
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0020
     * @tc.desc   red 19 and blue 236 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0020 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(19, 0, 236, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(19));
      expect(result.pixel[0]).assertEqual(19);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(236));
      expect(result.pixel[2]).assertEqual(236);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0020 end');
    })

    /**
     * @tc.name   testVolumeDiag0021
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0021
     * @tc.desc   red 20 and blue 235 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0021 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(20, 0, 235, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(20));
      expect(result.pixel[0]).assertEqual(20);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(235));
      expect(result.pixel[2]).assertEqual(235);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0021 end');
    })

    /**
     * @tc.name   testVolumeDiag0022
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0022
     * @tc.desc   red 21 and blue 234 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0022 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(21, 0, 234, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(21));
      expect(result.pixel[0]).assertEqual(21);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(234));
      expect(result.pixel[2]).assertEqual(234);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0022 end');
    })

    /**
     * @tc.name   testVolumeDiag0023
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0023
     * @tc.desc   red 22 and blue 233 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0023 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(22, 0, 233, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(22));
      expect(result.pixel[0]).assertEqual(22);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(233));
      expect(result.pixel[2]).assertEqual(233);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0023 end');
    })

    /**
     * @tc.name   testVolumeDiag0024
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0024
     * @tc.desc   red 23 and blue 232 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0024 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(23, 0, 232, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(23));
      expect(result.pixel[0]).assertEqual(23);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(232));
      expect(result.pixel[2]).assertEqual(232);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0024 end');
    })

    /**
     * @tc.name   testVolumeDiag0025
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0025
     * @tc.desc   red 24 and blue 231 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0025 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(24, 0, 231, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(24));
      expect(result.pixel[0]).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(231));
      expect(result.pixel[2]).assertEqual(231);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0025 end');
    })

    /**
     * @tc.name   testVolumeDiag0026
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0026
     * @tc.desc   red 25 and blue 230 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0026 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(25, 0, 230, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(25));
      expect(result.pixel[0]).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(230));
      expect(result.pixel[2]).assertEqual(230);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0026 end');
    })

    /**
     * @tc.name   testVolumeDiag0027
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0027
     * @tc.desc   red 26 and blue 229 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0027 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(26, 0, 229, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(26));
      expect(result.pixel[0]).assertEqual(26);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(229));
      expect(result.pixel[2]).assertEqual(229);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0027 end');
    })

    /**
     * @tc.name   testVolumeDiag0028
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0028
     * @tc.desc   red 27 and blue 228 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0028 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(27, 0, 228, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(27));
      expect(result.pixel[0]).assertEqual(27);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(228));
      expect(result.pixel[2]).assertEqual(228);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0028 end');
    })

    /**
     * @tc.name   testVolumeDiag0029
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0029
     * @tc.desc   red 28 and blue 227 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0029 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(28, 0, 227, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(28));
      expect(result.pixel[0]).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(227));
      expect(result.pixel[2]).assertEqual(227);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0029 end');
    })

    /**
     * @tc.name   testVolumeDiag0030
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0030
     * @tc.desc   red 29 and blue 226 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0030 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(29, 0, 226, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(29));
      expect(result.pixel[0]).assertEqual(29);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(226));
      expect(result.pixel[2]).assertEqual(226);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0030 end');
    })

    /**
     * @tc.name   testVolumeDiag0031
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0031
     * @tc.desc   red 30 and blue 225 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0031 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(30, 0, 225, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(30));
      expect(result.pixel[0]).assertEqual(30);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(225));
      expect(result.pixel[2]).assertEqual(225);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0031 end');
    })

    /**
     * @tc.name   testVolumeDiag0032
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0032
     * @tc.desc   red 31 and blue 224 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0032 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(31, 0, 224, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(31));
      expect(result.pixel[0]).assertEqual(31);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(224));
      expect(result.pixel[2]).assertEqual(224);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0032 end');
    })

    /**
     * @tc.name   testVolumeDiag0033
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0033
     * @tc.desc   red 32 and blue 223 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0033 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(32, 0, 223, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(32));
      expect(result.pixel[0]).assertEqual(32);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(223));
      expect(result.pixel[2]).assertEqual(223);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0033 end');
    })

    /**
     * @tc.name   testVolumeDiag0034
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0034
     * @tc.desc   red 33 and blue 222 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0034 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(33, 0, 222, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(33));
      expect(result.pixel[0]).assertEqual(33);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(222));
      expect(result.pixel[2]).assertEqual(222);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0034 end');
    })

    /**
     * @tc.name   testVolumeDiag0035
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0035
     * @tc.desc   red 34 and blue 221 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0035 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(34, 0, 221, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(34));
      expect(result.pixel[0]).assertEqual(34);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(221));
      expect(result.pixel[2]).assertEqual(221);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0035 end');
    })

    /**
     * @tc.name   testVolumeDiag0036
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0036
     * @tc.desc   red 35 and blue 220 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0036 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(35, 0, 220, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(35));
      expect(result.pixel[0]).assertEqual(35);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(220));
      expect(result.pixel[2]).assertEqual(220);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0036 end');
    })

    /**
     * @tc.name   testVolumeDiag0037
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0037
     * @tc.desc   red 36 and blue 219 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0037 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(36, 0, 219, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(36));
      expect(result.pixel[0]).assertEqual(36);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(219));
      expect(result.pixel[2]).assertEqual(219);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0037 end');
    })

    /**
     * @tc.name   testVolumeDiag0038
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0038
     * @tc.desc   red 37 and blue 218 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0038 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(37, 0, 218, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(37));
      expect(result.pixel[0]).assertEqual(37);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(218));
      expect(result.pixel[2]).assertEqual(218);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0038 end');
    })

    /**
     * @tc.name   testVolumeDiag0039
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0039
     * @tc.desc   red 38 and blue 217 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0039 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(38, 0, 217, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(38));
      expect(result.pixel[0]).assertEqual(38);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(217));
      expect(result.pixel[2]).assertEqual(217);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0039 end');
    })

    /**
     * @tc.name   testVolumeDiag0040
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0040
     * @tc.desc   red 39 and blue 216 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0040 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(39, 0, 216, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(39));
      expect(result.pixel[0]).assertEqual(39);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(216));
      expect(result.pixel[2]).assertEqual(216);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0040 end');
    })

    /**
     * @tc.name   testVolumeDiag0041
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0041
     * @tc.desc   red 40 and blue 215 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0041 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(40, 0, 215, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(40));
      expect(result.pixel[0]).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(215));
      expect(result.pixel[2]).assertEqual(215);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0041 end');
    })

    /**
     * @tc.name   testVolumeDiag0042
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0042
     * @tc.desc   red 41 and blue 214 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0042 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(41, 0, 214, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(41));
      expect(result.pixel[0]).assertEqual(41);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(214));
      expect(result.pixel[2]).assertEqual(214);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0042 end');
    })

    /**
     * @tc.name   testVolumeDiag0043
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0043
     * @tc.desc   red 42 and blue 213 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0043 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(42, 0, 213, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(42));
      expect(result.pixel[0]).assertEqual(42);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(213));
      expect(result.pixel[2]).assertEqual(213);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0043 end');
    })

    /**
     * @tc.name   testVolumeDiag0044
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0044
     * @tc.desc   red 43 and blue 212 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0044 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(43, 0, 212, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(43));
      expect(result.pixel[0]).assertEqual(43);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(212));
      expect(result.pixel[2]).assertEqual(212);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0044 end');
    })

    /**
     * @tc.name   testVolumeDiag0045
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0045
     * @tc.desc   red 44 and blue 211 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0045 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(44, 0, 211, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(44));
      expect(result.pixel[0]).assertEqual(44);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(211));
      expect(result.pixel[2]).assertEqual(211);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0045 end');
    })

    /**
     * @tc.name   testVolumeDiag0046
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0046
     * @tc.desc   red 45 and blue 210 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0046 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(45, 0, 210, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(45));
      expect(result.pixel[0]).assertEqual(45);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(210));
      expect(result.pixel[2]).assertEqual(210);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0046 end');
    })

    /**
     * @tc.name   testVolumeDiag0047
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0047
     * @tc.desc   red 46 and blue 209 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0047 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(46, 0, 209, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(46));
      expect(result.pixel[0]).assertEqual(46);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(209));
      expect(result.pixel[2]).assertEqual(209);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0047 end');
    })

    /**
     * @tc.name   testVolumeDiag0048
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0048
     * @tc.desc   red 47 and blue 208 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0048 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(47, 0, 208, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(47));
      expect(result.pixel[0]).assertEqual(47);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(208));
      expect(result.pixel[2]).assertEqual(208);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0048 end');
    })

    /**
     * @tc.name   testVolumeDiag0049
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0049
     * @tc.desc   red 48 and blue 207 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0049 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(48, 0, 207, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(48));
      expect(result.pixel[0]).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(207));
      expect(result.pixel[2]).assertEqual(207);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0049 end');
    })

    /**
     * @tc.name   testVolumeDiag0050
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0050
     * @tc.desc   red 49 and blue 206 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0050 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(49, 0, 206, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(49));
      expect(result.pixel[0]).assertEqual(49);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(206));
      expect(result.pixel[2]).assertEqual(206);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0050 end');
    })

    /**
     * @tc.name   testVolumeDiag0051
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0051
     * @tc.desc   red 50 and blue 205 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0051 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(50, 0, 205, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(50));
      expect(result.pixel[0]).assertEqual(50);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(205));
      expect(result.pixel[2]).assertEqual(205);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0051 end');
    })

    /**
     * @tc.name   testVolumeDiag0052
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0052
     * @tc.desc   red 51 and blue 204 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0052 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(51, 0, 204, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(51));
      expect(result.pixel[0]).assertEqual(51);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(204));
      expect(result.pixel[2]).assertEqual(204);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0052 end');
    })

    /**
     * @tc.name   testVolumeDiag0053
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0053
     * @tc.desc   red 52 and blue 203 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0053 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(52, 0, 203, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(52));
      expect(result.pixel[0]).assertEqual(52);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(203));
      expect(result.pixel[2]).assertEqual(203);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0053 end');
    })

    /**
     * @tc.name   testVolumeDiag0054
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0054
     * @tc.desc   red 53 and blue 202 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0054 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(53, 0, 202, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(53));
      expect(result.pixel[0]).assertEqual(53);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(202));
      expect(result.pixel[2]).assertEqual(202);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0054 end');
    })

    /**
     * @tc.name   testVolumeDiag0055
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0055
     * @tc.desc   red 54 and blue 201 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0055 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(54, 0, 201, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(54));
      expect(result.pixel[0]).assertEqual(54);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(201));
      expect(result.pixel[2]).assertEqual(201);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0055 end');
    })

    /**
     * @tc.name   testVolumeDiag0056
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0056
     * @tc.desc   red 55 and blue 200 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0056 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(55, 0, 200, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(55));
      expect(result.pixel[0]).assertEqual(55);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(200));
      expect(result.pixel[2]).assertEqual(200);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0056 end');
    })

    /**
     * @tc.name   testVolumeDiag0057
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0057
     * @tc.desc   red 56 and blue 199 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0057 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(56, 0, 199, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(56));
      expect(result.pixel[0]).assertEqual(56);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(199));
      expect(result.pixel[2]).assertEqual(199);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0057 end');
    })

    /**
     * @tc.name   testVolumeDiag0058
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0058
     * @tc.desc   red 57 and blue 198 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0058 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(57, 0, 198, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(57));
      expect(result.pixel[0]).assertEqual(57);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(198));
      expect(result.pixel[2]).assertEqual(198);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0058 end');
    })

    /**
     * @tc.name   testVolumeDiag0059
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0059
     * @tc.desc   red 58 and blue 197 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0059 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(58, 0, 197, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(58));
      expect(result.pixel[0]).assertEqual(58);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(197));
      expect(result.pixel[2]).assertEqual(197);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0059 end');
    })

    /**
     * @tc.name   testVolumeDiag0060
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0060
     * @tc.desc   red 59 and blue 196 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0060 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(59, 0, 196, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(59));
      expect(result.pixel[0]).assertEqual(59);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(196));
      expect(result.pixel[2]).assertEqual(196);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0060 end');
    })

    /**
     * @tc.name   testVolumeDiag0061
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0061
     * @tc.desc   red 60 and blue 195 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0061 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(60, 0, 195, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(60));
      expect(result.pixel[0]).assertEqual(60);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(195));
      expect(result.pixel[2]).assertEqual(195);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0061 end');
    })

    /**
     * @tc.name   testVolumeDiag0062
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0062
     * @tc.desc   red 61 and blue 194 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0062 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(61, 0, 194, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(61));
      expect(result.pixel[0]).assertEqual(61);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(194));
      expect(result.pixel[2]).assertEqual(194);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0062 end');
    })

    /**
     * @tc.name   testVolumeDiag0063
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0063
     * @tc.desc   red 62 and blue 193 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0063 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(62, 0, 193, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(62));
      expect(result.pixel[0]).assertEqual(62);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(193));
      expect(result.pixel[2]).assertEqual(193);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0063 end');
    })

    /**
     * @tc.name   testVolumeDiag0064
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0064
     * @tc.desc   red 63 and blue 192 do not swap positions
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0064 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(63, 0, 192, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(63));
      expect(result.pixel[0]).assertEqual(63);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(192));
      expect(result.pixel[2]).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[1]), String(0));
      expect(result.pixel[1]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(0));
      expect(result.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0064 end');
    })

    /**
     * @tc.name   testVolumeDiag0065
     * @tc.number SUB_XCOMPONENT3D_VOLDIAG_0065
     * @tc.desc   red over range and blue below zero are both rejected
     * @tc.type   Function
     * @tc.size   SmallTest
     * @tc.level  Level2
     */
    it('testVolumeDiag0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0065 begin');
      const result: PixelProbeResult = probeRenderSolidPixel(256, 0, -1, 255);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.code), String(-2));
      expect(result.code).assertEqual(-2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[0]), String(0));
      expect(result.pixel[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.pixel[2]), String(0));
      expect(result.pixel[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(result.corner[2]), String(0));
      expect(result.corner[2]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVolumeDiag0065 end');
    })

  })
}
