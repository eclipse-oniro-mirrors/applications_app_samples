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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { ColorUtil, ColorRgba, GradientPreset } from '../../../main/ets/model/utils/ColorUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function ColorUtilExhaustiveMatrixPart2Test(): void {
  describe('ColorUtilExhaustiveMatrixPart2', () => {

    /**
     * @tc.number    SUB_CANVAS_CEXP2_4100
     * @tc.name      testToHex0041
     * @tc.desc      Verify toHex masks channel value 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0041 begin');
      await delayTick();
      expect(ColorUtil.toHex(16, 23, 29)).assertEqual('#10171D');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0041 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_4200
     * @tc.name      testToHex0042
     * @tc.desc      Verify toHex masks channel value 127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0042 begin');
      await delayTick();
      expect(ColorUtil.toHex(127, 134, 140)).assertEqual('#7F868C');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0042 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_4300
     * @tc.name      testToHex0043
     * @tc.desc      Verify toHex masks channel value 128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0043 begin');
      await delayTick();
      expect(ColorUtil.toHex(128, 135, 141)).assertEqual('#80878D');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0043 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_4400
     * @tc.name      testToHex0044
     * @tc.desc      Verify toHex masks channel value 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0044 begin');
      await delayTick();
      expect(ColorUtil.toHex(255, 262, 268)).assertEqual('#FF060C');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0044 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_4500
     * @tc.name      testToHex0045
     * @tc.desc      Verify toHex masks channel value 256.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0045 begin');
      await delayTick();
      expect(ColorUtil.toHex(256, 263, 269)).assertEqual('#00070D');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0045 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_4600
     * @tc.name      testToHex0046
     * @tc.desc      Verify toHex masks channel value -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0046 begin');
      await delayTick();
      expect(ColorUtil.toHex(-1, 6, 12)).assertEqual('#FF060C');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0046 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_4700
     * @tc.name      testRgbaPack0047
     * @tc.desc      Verify rgba packs channel value 0 into 32 bits.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaPack0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0047 begin');
      await delayTick();
      expect(ColorUtil.rgba(0, 1, 2, 3)).assertEqual(66051);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0047 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_4800
     * @tc.name      testRgbaPack0048
     * @tc.desc      Verify rgba packs channel value 1 into 32 bits.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaPack0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0048 begin');
      await delayTick();
      expect(ColorUtil.rgba(1, 2, 3, 4)).assertEqual(16909060);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0048 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_4900
     * @tc.name      testRgbaPack0049
     * @tc.desc      Verify rgba packs channel value 127 into 32 bits.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaPack0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0049 begin');
      await delayTick();
      expect(ColorUtil.rgba(127, 128, 129, 130)).assertEqual(2139128194);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0049 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5000
     * @tc.name      testRgbaPack0050
     * @tc.desc      Verify rgba packs channel value 128 into 32 bits.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaPack0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0050 begin');
      await delayTick();
      expect(ColorUtil.rgba(128, 129, 130, 131)).assertEqual(2155971203);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0050 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5100
     * @tc.name      testRgbaPack0051
     * @tc.desc      Verify rgba packs channel value 255 into 32 bits.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaPack0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0051 begin');
      await delayTick();
      expect(ColorUtil.rgba(255, 256, 257, 258)).assertEqual(4278190338);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0051 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5200
     * @tc.name      testRgbaPack0052
     * @tc.desc      Verify rgba packs channel value 256 into 32 bits.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaPack0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0052 begin');
      await delayTick();
      expect(ColorUtil.rgba(256, 257, 258, 259)).assertEqual(66051);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0052 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5300
     * @tc.name      testRgbaPack0053
     * @tc.desc      Verify rgba packs channel value -1 into 32 bits.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaPack0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0053 begin');
      await delayTick();
      expect(ColorUtil.rgba(-1, 0, 1, 2)).assertEqual(4278190338);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaPack0053 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5400
     * @tc.name      testRgbaString0054
     * @tc.desc      Verify toRgbaString normalizes alpha 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaString0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0054 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(10, 20, 30, 0)).assertEqual('rgba(10,20,30,0)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0054 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5500
     * @tc.name      testRgbaString0055
     * @tc.desc      Verify toRgbaString normalizes alpha 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaString0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0055 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(10, 20, 30, 1)).assertEqual('rgba(10,20,30,0)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0055 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5600
     * @tc.name      testRgbaString0056
     * @tc.desc      Verify toRgbaString normalizes alpha 127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaString0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0056 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(10, 20, 30, 127)).assertEqual('rgba(10,20,30,0.5)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0056 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5700
     * @tc.name      testRgbaString0057
     * @tc.desc      Verify toRgbaString normalizes alpha 128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaString0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0057 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(10, 20, 30, 128)).assertEqual('rgba(10,20,30,0.5)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0057 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5800
     * @tc.name      testRgbaString0058
     * @tc.desc      Verify toRgbaString normalizes alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaString0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0058 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(10, 20, 30, 255)).assertEqual('rgba(10,20,30,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0058 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_5900
     * @tc.name      testRgbaString0059
     * @tc.desc      Verify toRgbaString normalizes alpha 256.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaString0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0059 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(10, 20, 30, 256)).assertEqual('rgba(10,20,30,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0059 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6000
     * @tc.name      testRgbaString0060
     * @tc.desc      Verify toRgbaString normalizes alpha -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaString0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0060 begin');
      await delayTick();
      expect(ColorUtil.toRgbaString(10, 20, 30, -1)).assertEqual('rgba(10,20,30,0)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaString0060 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6100
     * @tc.name      testLerp0061
     * @tc.desc      Verify color lerp at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerp0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0061 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(10);
      expect(out.b).assertEqual(20);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0061 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6200
     * @tc.name      testLerp0062
     * @tc.desc      Verify color lerp at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerp0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0062 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(10);
      expect(out.g).assertEqual(20);
      expect(out.b).assertEqual(30);
      expect(out.a).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0062 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6300
     * @tc.name      testLerp0063
     * @tc.desc      Verify color lerp at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerp0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0063 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(25);
      expect(out.g).assertEqual(35);
      expect(out.b).assertEqual(45);
      expect(out.a).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0063 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6400
     * @tc.name      testLerp0064
     * @tc.desc      Verify color lerp at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerp0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0064 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(50);
      expect(out.g).assertEqual(60);
      expect(out.b).assertEqual(70);
      expect(out.a).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0064 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6500
     * @tc.name      testLerp0065
     * @tc.desc      Verify color lerp at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerp0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0065 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(75);
      expect(out.g).assertEqual(85);
      expect(out.b).assertEqual(95);
      expect(out.a).assertEqual(105);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0065 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6600
     * @tc.name      testLerp0066
     * @tc.desc      Verify color lerp at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerp0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0066 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(90);
      expect(out.g).assertEqual(100);
      expect(out.b).assertEqual(110);
      expect(out.a).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0066 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6700
     * @tc.name      testLerp0067
     * @tc.desc      Verify color lerp at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerp0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0067 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(100);
      expect(out.g).assertEqual(110);
      expect(out.b).assertEqual(120);
      expect(out.a).assertEqual(130);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0067 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6800
     * @tc.name      testLerp0068
     * @tc.desc      Verify color lerp at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerp0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0068 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(10);
      expect(out.b).assertEqual(20);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0068 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_6900
     * @tc.name      testLerp0069
     * @tc.desc      Verify color lerp at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerp0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0069 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(100);
      expect(out.g).assertEqual(110);
      expect(out.b).assertEqual(120);
      expect(out.a).assertEqual(130);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerp0069 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_7000
     * @tc.name      testLerpStops0070
     * @tc.desc      Verify lerpHexStops variant 0 with 2 stops at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStops0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0070 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(["#000000", "#FFFFFF"], 0.5)).assertEqual('rgba(128,128,128,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0070 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_7100
     * @tc.name      testLerpStops0071
     * @tc.desc      Verify lerpHexStops variant 1 with 3 stops at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStops0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0071 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(["#FF0000", "#00FF00", "#0000FF"], 0.25)).assertEqual('rgba(128,128,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0071 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_7200
     * @tc.name      testLerpStops0072
     * @tc.desc      Verify lerpHexStops variant 2 with 4 stops at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStops0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0072 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(["#102030", "#405060", "#708090", "#A0B0C0"], 0.75)).assertEqual('rgba(124,140,156,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0072 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_7300
     * @tc.name      testLerpStops0073
     * @tc.desc      Verify lerpHexStops variant 3 with 1 stops at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStops0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0073 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(["#FFFFFF"], 0.5)).assertEqual('rgba(255,255,255,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0073 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_7400
     * @tc.name      testLerpStops0074
     * @tc.desc      Verify lerpHexStops variant 4 with 0 stops at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStops0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0074 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops([], 0.5)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0074 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP2_7500
     * @tc.name      testLerpStops0075
     * @tc.desc      Verify lerpHexStops variant 5 with 2 stops at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStops0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0075 begin');
      await delayTick();
      expect(ColorUtil.lerpHexStops(["#GGGGGG", "#FFFFFF"], 0.5)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStops0075 end');
    })

  })
}
