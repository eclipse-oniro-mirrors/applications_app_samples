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
 
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ColorUtil, ColorRgba, GradientPreset } from '../../../main/ets/model/utils/ColorUtil';

/**
 * ColorUtil 颜色工具类设备侧测试
 * 覆盖：rgba 打包、hex 解析（合法/非法/带 alpha）、hex 生成、rgba 字符串、
 * 两色插值（端点/中点/越界截断）、多段色带插值、clamp。
 */
export default function colorUtilTest() {
  describe('colorUtilTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_0100
     * @tc.name rgbaPacking001
     * @tc.desc Verify rgba packs channels into a 32-bit ARGB integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rgba_packing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(ColorUtil.rgba(255, 0, 0, 255)).assertEqual(0xFF0000FF);
      expect(ColorUtil.rgba(0, 0, 255, 255)).assertEqual(0x0000FFFF);
      expect(ColorUtil.rgba(1, 2, 3, 4)).assertEqual(0x01020304);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_0200
     * @tc.name parseHexRgb6002
     * @tc.desc Verify parseHex accepts 6-digit RGB hex with opaque alpha
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_rgb6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const c: ColorRgba | null = ColorUtil.parseHex('#FF8000');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(128);
        expect(c.b).assertEqual(0);
        expect(c.a).assertEqual(255);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_0300
     * @tc.name parseHexArgb8003
     * @tc.desc Verify parseHex accepts 8-digit ARGB hex and keeps alpha
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_argb8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const c: ColorRgba | null = ColorUtil.parseHex('#80FF0000');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(128);
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(0);
        expect(c.b).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_0400
     * @tc.name parseHexInvalidReturnsNull004
     * @tc.desc Verify parseHex returns null for empty, short, missing-# and non-hex input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_invalid_returnsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(ColorUtil.parseHex('') === null).assertTrue();
      expect(ColorUtil.parseHex('#FFF') === null).assertTrue();
      expect(ColorUtil.parseHex('FF8000') === null).assertTrue();
      expect(ColorUtil.parseHex('#GGHHII') === null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_0500
     * @tc.name toHexRoundtrip005
     * @tc.desc Verify toHex formats RGB bytes as an uppercase hex string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toHex_roundtrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(ColorUtil.toHex(255, 128, 0)).assertEqual('#FF8000');
      expect(ColorUtil.toHex(0, 0, 0)).assertEqual('#000000');
      expect(ColorUtil.toHex(15, 15, 15)).assertEqual('#0F0F0F');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_0600
     * @tc.name toRgbaString006
     * @tc.desc Verify toRgbaString normalizes alpha to the 0-1 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toRgbaString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(ColorUtil.toRgbaString(255, 0, 0, 255)).assertEqual('rgba(255,0,0,1)');
      expect(ColorUtil.toRgbaString(0, 128, 255, 128)).assertEqual('rgba(0,128,255,0.5)');
      expect(ColorUtil.toRgbaString(0, 0, 0, 0)).assertEqual('rgba(0,0,0,0)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_0700
     * @tc.name lerpEndpoints007
     * @tc.desc Verify lerp hits both endpoints exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerp_endpoints', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 } as ColorRgba;
      const c2: ColorRgba = { r: 100, g: 200, b: 50, a: 0 } as ColorRgba;
      const at0: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(at0.r).assertEqual(0);
      expect(at0.a).assertEqual(255);
      const at1: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(at1.r).assertEqual(100);
      expect(at1.g).assertEqual(200);
      expect(at1.a).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_0800
     * @tc.name lerpMidpoint008
     * @tc.desc Verify lerp interpolates every channel at t=0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerp_midpoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 } as ColorRgba;
      const c2: ColorRgba = { r: 100, g: 100, b: 100, a: 255 } as ColorRgba;
      const mid: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(mid.r).assertEqual(50);
      expect(mid.g).assertEqual(50);
      expect(mid.b).assertEqual(50);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_0900
     * @tc.name lerpOutOfRangeClamped009
     * @tc.desc Verify lerp clamps out-of-range t to the endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerp_outOfRange_clamped', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 } as ColorRgba;
      const c2: ColorRgba = { r: 100, g: 0, b: 0, a: 255 } as ColorRgba;
      // t 越界自动截断到 [0,1]
      expect(ColorUtil.lerp(c1, c2, -0.5).r).assertEqual(0);
      expect(ColorUtil.lerp(c1, c2, 1.5).r).assertEqual(100);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_1000
     * @tc.name lerpHexStopsSegments010
     * @tc.desc Verify lerpHexStops resolves both colour stops by position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_segments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const stops: string[] = ['#000000', '#FFFFFF'];
      // t=0 → 第一色，t=1 → 最后一色，t=0.5 → 中点灰
      expect(ColorUtil.lerpHexStops(stops, 0)).assertEqual('rgba(0,0,0,1)');
      expect(ColorUtil.lerpHexStops(stops, 1)).assertEqual('rgba(255,255,255,1)');
      expect(ColorUtil.lerpHexStops(stops, 0.5)).assertEqual('rgba(128,128,128,1)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_1100
     * @tc.name lerpHexStopsMultiSegment011
     * @tc.desc Verify lerpHexStops interpolates inside the correct segment of a multi-stop band
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_multiSegment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 3 色 2 段：t=0.25 落在第一段中点
      const stops: string[] = ['#000000', '#FFFFFF', '#000000'];
      expect(ColorUtil.lerpHexStops(stops, 0.25)).assertEqual('rgba(128,128,128,1)');
      expect(ColorUtil.lerpHexStops(stops, 0.75)).assertEqual('rgba(128,128,128,1)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_1200
     * @tc.name clamp012
     * @tc.desc Verify clamp keeps values inside and bounds values outside the range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(ColorUtil.clamp(5, 0, 10)).assertEqual(5);
      expect(ColorUtil.clamp(-1, 0, 10)).assertEqual(0);
      expect(ColorUtil.clamp(11, 0, 10)).assertEqual(10);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_1300
     * @tc.name presetCountAndNames013
     * @tc.desc Verify the gradient preset library exposes four unique named presets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preset_countAndNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 预设库：4 组，名称唯一
      expect(GradientPreset.count()).assertEqual(4);
      const names: string[] = GradientPreset.getNames();
      expect(names.length).assertEqual(4);
      const seen: Set<string> = new Set();
      for (const nm of names) {
        expect(seen.has(nm)).assertFalse();
        seen.add(nm);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_1400
     * @tc.name presetGetStopsValid014
     * @tc.desc Verify every preset has at least two stops parseable as hex colours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preset_get_stopsValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 每组预设至少 2 色，且均为合法 hex（parseHex 可解析）
      for (const nm of GradientPreset.getNames()) {
        const stops: string[] | null = GradientPreset.get(nm);
        expect(stops !== null).assertTrue();
        if (stops !== null) {
          expect(stops.length >= 2).assertTrue();
          for (const hex of stops) {
            expect(ColorUtil.parseHex(hex) !== null).assertTrue();
          }
        }
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTIL_1500
     * @tc.name presetGetMissReturnsNull015
     * @tc.desc Verify GradientPreset.get returns null for an unknown name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preset_get_miss_returnsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(GradientPreset.get('no_such') === null).assertTrue();
    });
  });
}
