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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { ColorUtil, ColorRgba, GradientPreset } from '../../../main/ets/model/utils/ColorUtil';

/**
 * ColorUtil 颜色工具类矩阵套件
 * 在 ColorUtil.test 基础上补齐输入/边界矩阵：
 * rgba 位掩码与无符号、parseHex 空白/大小写/长度/非法字符、toHex 补零与越界掩码、
 * toRgbaString alpha 取整与截断、lerp 方向与同色、lerpHexStops 空/单色/非法断点/四段/越界/alpha 保留、
 * clamp 边界与退化区间、四组预设精确色带与明度方向。
 */

/** 相对亮度（sRGB 加权），用于校验预设“深→浅”排序 */
function luminance(hex: string): number {
  const c: ColorRgba | null = ColorUtil.parseHex(hex);
  if (c === null) {
    return -1;
  }
  return 0.299 * c.r + 0.587 * c.g + 0.114 * c.b;
}

export default function colorUtilMatrixTest() {
  describe('colorUtilMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_0100
     * @tc.name rgbaZeroAndMax0100
     * @tc.desc Verify rgba packs the zero and all-ones extremes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rgba_zeroAndMax', 0, () => {
      expect(ColorUtil.rgba(0, 0, 0, 0)).assertEqual(0);
      expect(ColorUtil.rgba(255, 255, 255, 255)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_0200
     * @tc.name rgbaMasksChannelsToByte0200
     * @tc.desc Verify rgba masks every channel to its low 8 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rgba_masksChannelsToByte', 0, () => {
      // 256→0，-1→255，0x1FF→255 → 0x00FFFF00
      expect(ColorUtil.rgba(256, -1, 0x1FF, 256)).assertEqual(0x00FFFF00);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_0300
     * @tc.name rgbaUnsigned32Bit0300
     * @tc.desc Verify rgba always yields a non-negative 32-bit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('rgba_unsigned32Bit', 0, () => {
      // 最高位为 1 时仍为无符号正数（>>>0 生效）
      expect(ColorUtil.rgba(255, 0, 0, 0)).assertEqual(0xFF000000);
      expect(ColorUtil.rgba(255, 0, 0, 0) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_0400
     * @tc.name parseHexTrimsWhitespace0400
     * @tc.desc Verify parseHex trims surrounding spaces and tabs before validating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_trimsWhitespace', 0, () => {
      const a: ColorRgba | null = ColorUtil.parseHex('  #FF8000  ');
      expect(a !== null).assertTrue();
      if (a !== null) {
        expect(a.r).assertEqual(255);
        expect(a.a).assertEqual(255);
      }
      const b: ColorRgba | null = ColorUtil.parseHex('\t#00FF00\n');
      expect(b !== null).assertTrue();
      if (b !== null) {
        expect(b.g).assertEqual(255);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_0500
     * @tc.name parseHexAcceptsLowercase0500
     * @tc.desc Verify parseHex accepts lowercase hex digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_acceptsLowercase', 0, () => {
      const c: ColorRgba | null = ColorUtil.parseHex('#ff8000');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(128);
        expect(c.b).assertEqual(0);
        expect(c.a).assertEqual(255);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_0600
     * @tc.name parseHexArgbAlphaZero0600
     * @tc.desc Verify an 8-digit ARGB value can carry a fully transparent alpha
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_argbAlphaZero', 0, () => {
      const c: ColorRgba | null = ColorUtil.parseHex('#00FFFFFF');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(0);
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(255);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_0700
     * @tc.name parseHexArgbUppercaseChannels0700
     * @tc.desc Verify every ARGB channel is decoded at its own position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_argbUppercaseChannels', 0, () => {
      const c: ColorRgba | null = ColorUtil.parseHex('#AABBCCDD');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(170);
        expect(c.r).assertEqual(187);
        expect(c.g).assertEqual(204);
        expect(c.b).assertEqual(221);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_0800
     * @tc.name parseHexRejectsOffByOneLengths0800
     * @tc.desc Verify lengths adjacent to 7 and 9 are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_rejectsOffByOneLengths', 0, () => {
      expect(ColorUtil.parseHex('#FF80000') === null).assertTrue();
      expect(ColorUtil.parseHex('#FFFFFFF') === null).assertTrue();
      expect(ColorUtil.parseHex('#FF8000000') === null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_0900
     * @tc.name parseHexRejectsNonHexCharacters0900
     * @tc.desc Verify non-hex digits anywhere in the body return null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_rejectsNonHexCharacters', 0, () => {
      expect(ColorUtil.parseHex('#FF80G0') === null).assertTrue();
      expect(ColorUtil.parseHex('#ZZZZZZ') === null).assertTrue();
      expect(ColorUtil.parseHex('#12345G') === null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1000
     * @tc.name parseHexRoundtripToHex1000
     * @tc.desc Verify parseHex followed by toHex reproduces the RGB input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('parseHex_roundtripToHex', 0, () => {
      const c: ColorRgba | null = ColorUtil.parseHex('#123456');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(ColorUtil.toHex(c.r, c.g, c.b)).assertEqual('#123456');
      }
      const lower: ColorRgba | null = ColorUtil.parseHex('#abcdef');
      expect(lower !== null).assertTrue();
      if (lower !== null) {
        expect(ColorUtil.toHex(lower.r, lower.g, lower.b)).assertEqual('#ABCDEF');
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1100
     * @tc.name toHexPadsSingleNibble1100
     * @tc.desc Verify toHex zero-pads channels that encode to a single digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toHex_padsNibbles', 0, () => {
      expect(ColorUtil.toHex(1, 2, 3)).assertEqual('#010203');
      expect(ColorUtil.toHex(10, 11, 12)).assertEqual('#0A0B0C');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1200
     * @tc.name toHexMasksOutOfRange1200
     * @tc.desc Verify toHex masks out-of-range and negative channel values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toHex_masksOutOfRange', 0, () => {
      expect(ColorUtil.toHex(256, 257, 258)).assertEqual('#000102');
      expect(ColorUtil.toHex(-1, -2, -3)).assertEqual('#FFFEFD');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1300
     * @tc.name toRgbaStringAlphaRoundsToHundredths1300
     * @tc.desc Verify alpha 64/127/192 normalize to 0.25/0.5/0.75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toRgbaString_alphaRoundsToHundredths', 0, () => {
      expect(ColorUtil.toRgbaString(0, 0, 0, 64)).assertEqual('rgba(0,0,0,0.25)');
      expect(ColorUtil.toRgbaString(0, 0, 0, 127)).assertEqual('rgba(0,0,0,0.5)');
      expect(ColorUtil.toRgbaString(0, 0, 0, 192)).assertEqual('rgba(0,0,0,0.75)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1400
     * @tc.name toRgbaStringMasksRgbChannels1400
     * @tc.desc Verify toRgbaString masks out-of-range RGB channels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toRgbaString_masksRgbChannels', 0, () => {
      // 300→44，-1→255
      expect(ColorUtil.toRgbaString(300, -1, 0, 255)).assertEqual('rgba(44,255,0,1)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1500
     * @tc.name toRgbaStringClampsAlpha1500
     * @tc.desc Verify alpha below 0 and above 255 clamps to 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toRgbaString_clampsAlpha', 0, () => {
      expect(ColorUtil.toRgbaString(0, 0, 0, -10)).assertEqual('rgba(0,0,0,0)');
      expect(ColorUtil.toRgbaString(0, 0, 0, 300)).assertEqual('rgba(0,0,0,1)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1600
     * @tc.name toRgbaStringOfMatchesChannels1600
     * @tc.desc Verify toRgbaStringOf forwards every channel of a ColorRgba
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toRgbaStringOf_matchesChannels', 0, () => {
      const c: ColorRgba = { r: 255, g: 0, b: 0, a: 128 } as ColorRgba;
      expect(ColorUtil.toRgbaStringOf(c)).assertEqual('rgba(255,0,0,0.5)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1700
     * @tc.name lerpQuarterPoint1700
     * @tc.desc Verify lerp interpolates all four channels at t=0.25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerp_quarterPoint', 0, () => {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 } as ColorRgba;
      const c2: ColorRgba = { r: 200, g: 100, b: 40, a: 255 } as ColorRgba;
      const q: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(q.r).assertEqual(50);
      expect(q.g).assertEqual(25);
      expect(q.b).assertEqual(10);
      expect(q.a).assertEqual(64);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1800
     * @tc.name lerpDescendingDirection1800
     * @tc.desc Verify lerp interpolates correctly when channels decrease
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerp_descendingDirection', 0, () => {
      const c1: ColorRgba = { r: 100, g: 100, b: 100, a: 255 } as ColorRgba;
      const c2: ColorRgba = { r: 0, g: 0, b: 0, a: 0 } as ColorRgba;
      const mid: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(mid.r).assertEqual(50);
      expect(mid.g).assertEqual(50);
      expect(mid.b).assertEqual(50);
      expect(mid.a).assertEqual(128);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_1900
     * @tc.name lerpIdenticalColorsStable1900
     * @tc.desc Verify interpolating identical colours returns the same values at any t
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerp_identicalColorsStable', 0, () => {
      const c: ColorRgba = { r: 12, g: 34, b: 56, a: 78 } as ColorRgba;
      const out: ColorRgba = ColorUtil.lerp(c, c, 0.3);
      expect(out.r).assertEqual(12);
      expect(out.g).assertEqual(34);
      expect(out.b).assertEqual(56);
      expect(out.a).assertEqual(78);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2000
     * @tc.name lerpHexStopsEmptyReturnsBlack2000
     * @tc.desc Verify an empty stop list falls back to black
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_emptyReturnsBlack', 0, () => {
      const empty: string[] = [];
      expect(ColorUtil.lerpHexStops(empty, 0.5)).assertEqual('#000000');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2100
     * @tc.name lerpHexStopsSingleValidColor2100
     * @tc.desc Verify a single valid stop renders that colour at any t
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_singleValidColor', 0, () => {
      const one: string[] = ['#FF0000'];
      expect(ColorUtil.lerpHexStops(one, 0)).assertEqual('rgba(255,0,0,1)');
      expect(ColorUtil.lerpHexStops(one, 0.7)).assertEqual('rgba(255,0,0,1)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2200
     * @tc.name lerpHexStopsSingleInvalidColor2200
     * @tc.desc Verify a single unparseable stop falls back to black
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_singleInvalidColor', 0, () => {
      const bad: string[] = ['#GG0000'];
      expect(ColorUtil.lerpHexStops(bad, 0.5)).assertEqual('#000000');
      const shortBad: string[] = ['#FFF'];
      expect(ColorUtil.lerpHexStops(shortBad, 0.5)).assertEqual('#000000');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2300
     * @tc.name lerpHexStopsMultiInvalidStop2300
     * @tc.desc Verify a bad stop in a multi-stop band falls back to black
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_multiInvalidStop', 0, () => {
      const stops: string[] = ['#000000', '#XYZXYZ'];
      expect(ColorUtil.lerpHexStops(stops, 0.5)).assertEqual('#000000');
      expect(ColorUtil.lerpHexStops(stops, 0.9)).assertEqual('#000000');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2400
     * @tc.name lerpHexStopsFourStopsQuarterPoints2400
     * @tc.desc Verify a four-stop band interpolates the correct segment at each quarter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_fourStopsQuarterPoints', 0, () => {
      // 4 色 3 段：#00 → #33 → #66 → #99
      const stops: string[] = ['#000000', '#333333', '#666666', '#999999'];
      expect(ColorUtil.lerpHexStops(stops, 0.25)).assertEqual('rgba(38,38,38,1)');
      expect(ColorUtil.lerpHexStops(stops, 0.5)).assertEqual('rgba(77,77,77,1)');
      expect(ColorUtil.lerpHexStops(stops, 0.75)).assertEqual('rgba(115,115,115,1)');
      expect(ColorUtil.lerpHexStops(stops, 1)).assertEqual('rgba(153,153,153,1)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2500
     * @tc.name lerpHexStopsClampsOutOfRange2500
     * @tc.desc Verify t below 0 and above 1 clamp to the first and last stop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_clampsOutOfRange', 0, () => {
      const stops: string[] = ['#112233', '#445566', '#778899'];
      expect(ColorUtil.lerpHexStops(stops, -1)).assertEqual('rgba(17,34,51,1)');
      expect(ColorUtil.lerpHexStops(stops, 2)).assertEqual('rgba(119,136,153,1)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2600
     * @tc.name lerpHexStopsEndsOnLastStop2600
     * @tc.desc Verify t=1 resolves to the final stop of a three-colour band
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_endsOnLastStop', 0, () => {
      const stops: string[] = ['#000000', '#FFFFFF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(stops, 1)).assertEqual('rgba(255,0,0,1)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2700
     * @tc.name lerpHexStopsPreservesAlpha2700
     * @tc.desc Verify ARGB stops keep their alpha through interpolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lerpHexStops_preservesAlpha', 0, () => {
      // 两端 alpha 均为 0x80=128 → 0.5
      const stops: string[] = ['#80000000', '#80FFFFFF'];
      expect(ColorUtil.lerpHexStops(stops, 0)).assertEqual('rgba(0,0,0,0.5)');
      expect(ColorUtil.lerpHexStops(stops, 0.5)).assertEqual('rgba(128,128,128,0.5)');
      expect(ColorUtil.lerpHexStops(stops, 1)).assertEqual('rgba(255,255,255,0.5)');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2800
     * @tc.name clampBoundaries2800
     * @tc.desc Verify clamp keeps in-range values and bounds both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clamp_boundaries', 0, () => {
      expect(ColorUtil.clamp(0, 0, 10)).assertEqual(0);
      expect(ColorUtil.clamp(10, 0, 10)).assertEqual(10);
      expect(ColorUtil.clamp(0.5, 0, 10)).assertEqual(0.5);
      expect(ColorUtil.clamp(5, 5, 5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_2900
     * @tc.name presetSkyStopsExact2900
     * @tc.desc Verify the sky preset exposes its four exact stops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preset_skyStopsExact', 0, () => {
      const sky: string[] = GradientPreset.SKY;
      expect(sky.length).assertEqual(4);
      expect(sky[0]).assertEqual('#0D47A1');
      expect(sky[1]).assertEqual('#1976D2');
      expect(sky[2]).assertEqual('#64B5F6');
      expect(sky[3]).assertEqual('#BBDEFB');
      expect(GradientPreset.get('sky') === GradientPreset.SKY).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_3000
     * @tc.name presetSunsetStopsExact3000
     * @tc.desc Verify the sunset preset exposes its four exact stops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preset_sunsetStopsExact', 0, () => {
      const sunset: string[] = GradientPreset.SUNSET;
      expect(sunset.length).assertEqual(4);
      expect(sunset[0]).assertEqual('#FF1744');
      expect(sunset[1]).assertEqual('#FF6D00');
      expect(sunset[2]).assertEqual('#FFD600');
      expect(sunset[3]).assertEqual('#FFF59D');
      expect(GradientPreset.get('sunset') === GradientPreset.SUNSET).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_3100
     * @tc.name presetOceanStopsExact3100
     * @tc.desc Verify the ocean preset exposes its four exact stops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preset_oceanStopsExact', 0, () => {
      const ocean: string[] = GradientPreset.OCEAN;
      expect(ocean.length).assertEqual(4);
      expect(ocean[0]).assertEqual('#004D40');
      expect(ocean[1]).assertEqual('#00897B');
      expect(ocean[2]).assertEqual('#4DB6AC');
      expect(ocean[3]).assertEqual('#B2DFDB');
      expect(GradientPreset.get('ocean') === GradientPreset.OCEAN).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_3200
     * @tc.name presetForestStopsExact3200
     * @tc.desc Verify the forest preset exposes its four exact stops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preset_forestStopsExact', 0, () => {
      const forest: string[] = GradientPreset.FOREST;
      expect(forest.length).assertEqual(4);
      expect(forest[0]).assertEqual('#1B5E20');
      expect(forest[1]).assertEqual('#43A047');
      expect(forest[2]).assertEqual('#9CCC65');
      expect(forest[3]).assertEqual('#DCEDC8');
      expect(GradientPreset.get('forest') === GradientPreset.FOREST).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_3300
     * @tc.name presetGetCaseSensitive3300
     * @tc.desc Verify preset lookup is case- and whitespace-sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preset_getCaseSensitive', 0, () => {
      expect(GradientPreset.get('SKY') === null).assertTrue();
      expect(GradientPreset.get('Sky') === null).assertTrue();
      expect(GradientPreset.get(' sky') === null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_COLORUTILMATRIX_3400
     * @tc.name presetDarkToLight3400
     * @tc.desc Verify every preset orders its stops from dark to light
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('preset_darkToLight', 0, () => {
      // 文档约定“深→浅排列”：首色亮度必须低于末色
      for (const nm of GradientPreset.getNames()) {
        const stops: string[] | null = GradientPreset.get(nm);
        expect(stops !== null).assertTrue();
        if (stops !== null) {
          const first: number = luminance(stops[0]);
          const last: number = luminance(stops[stops.length - 1]);
          expect(first >= 0).assertTrue();
          expect(first < last).assertTrue();
        }
      }
    });
  });
}
