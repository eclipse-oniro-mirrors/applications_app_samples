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
import { GeometryUtil, Point } from '../../../main/ets/model/utils/GeometryUtil';
import { LogUtil, LogLevel } from '../../../main/ets/model/utils/LogUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_CanvasShowcase]';

export default function CanvasCombinedPart4Test(): void {
  describe('CvG4', () => {
    /**
     * @tc.number    SUB_CANVAS_CLSP8_31500
     * @tc.name      testLerpStopsGrid0315
     * @tc.desc      Verify lerpHexStops set 16 at t=0.5. Plus Verify lerpHexStops set 16 at t=0.75. Plus Verify lerpHexStops set 16 at t=0.9. Plus Verify lerpHexStops set 16 at t=1. Plus Verify lerpHexStops set 16 at t=-0.2. Plus Verify lerpHexStops set 16 at t=1.2. Plus Verify lerpHexStops set 17 at t=0. Plus Verify lerpHexStops set 17 at t=0.1. Plus Verify lerpHexStops set 17 at t=0.25. Plus Verify lerpHexStops set 17 at t=0.5. Plus Verify lerpHexStops set 17 at t=0.75. Plus Verify lerpHexStops set 17 at t=0.9. Plus Verify lerpHexStops set 17 at t=1. Plus Verify lerpHexStops set 17 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0315 begin');
      await delayTick();
      const colors: string[] = ['#111111', '#222222', '#333333'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(34,34,34,1)');
      {
      const colors: string[] = ['#111111', '#222222', '#333333'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(43,43,43,1)');
      }
      {
      const colors: string[] = ['#111111', '#222222', '#333333'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(48,48,48,1)');
      }
      {
      const colors: string[] = ['#111111', '#222222', '#333333'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(51,51,51,1)');
      }
      {
      const colors: string[] = ['#111111', '#222222', '#333333'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(17,17,17,1)');
      }
      {
      const colors: string[] = ['#111111', '#222222', '#333333'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(51,51,51,1)');
      }
      {
      const colors: string[] = ['#00FF00', '#0000FF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(0,255,0,1)');
      }
      {
      const colors: string[] = ['#00FF00', '#0000FF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(0,204,51,1)');
      }
      {
      const colors: string[] = ['#00FF00', '#0000FF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(0,128,128,1)');
      }
      {
      const colors: string[] = ['#00FF00', '#0000FF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(0,0,255,1)');
      }
      {
      const colors: string[] = ['#00FF00', '#0000FF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(128,0,128,1)');
      }
      {
      const colors: string[] = ['#00FF00', '#0000FF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(204,0,51,1)');
      }
      {
      const colors: string[] = ['#00FF00', '#0000FF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(255,0,0,1)');
      }
      {
      const colors: string[] = ['#00FF00', '#0000FF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(0,255,0,1)');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0315 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_32900
     * @tc.name      testLerpStopsGrid0329
     * @tc.desc      Verify lerpHexStops set 17 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0329 begin');
      await delayTick();
      const colors: string[] = ['#00FF00', '#0000FF', '#FF0000'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(255,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0329 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33000
     * @tc.name      testLerpStopsGrid0330
     * @tc.desc      Verify lerpHexStops set 18 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0330 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#ABCDEF', '#654321', '#FEDCBA'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(18,52,86,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0330 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33100
     * @tc.name      testLerpStopsGrid0331
     * @tc.desc      Verify lerpHexStops set 18 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0331 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#ABCDEF', '#654321', '#FEDCBA'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(64,98,132,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0331 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33200
     * @tc.name      testLerpStopsGrid0332
     * @tc.desc      Verify lerpHexStops set 18 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0332 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#ABCDEF', '#654321', '#FEDCBA'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(133,167,201,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0332 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33300
     * @tc.name      testLerpStopsGrid0333
     * @tc.desc      Verify lerpHexStops set 18 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0333 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#ABCDEF', '#654321', '#FEDCBA'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(136,136,136,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0333 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33400
     * @tc.name      testLerpStopsGrid0334
     * @tc.desc      Verify lerpHexStops set 18 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0334 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#ABCDEF', '#654321', '#FEDCBA'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(139,105,71,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0334 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33500
     * @tc.name      testLerpStopsGrid0335
     * @tc.desc      Verify lerpHexStops set 18 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0335 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#ABCDEF', '#654321', '#FEDCBA'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(208,174,140,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0335 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33600
     * @tc.name      testLerpStopsGrid0336
     * @tc.desc      Verify lerpHexStops set 18 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0336 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#ABCDEF', '#654321', '#FEDCBA'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(254,220,186,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0336 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33700
     * @tc.name      testLerpStopsGrid0337
     * @tc.desc      Verify lerpHexStops set 18 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0337 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#ABCDEF', '#654321', '#FEDCBA'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(18,52,86,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0337 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33800
     * @tc.name      testLerpStopsGrid0338
     * @tc.desc      Verify lerpHexStops set 18 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0338 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#ABCDEF', '#654321', '#FEDCBA'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(254,220,186,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0338 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_33900
     * @tc.name      testLerpStopsGrid0339
     * @tc.desc      Verify lerpHexStops set 19 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0339 begin');
      await delayTick();
      const colors: string[] = ['#888888', '#444444'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(136,136,136,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0339 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_34000
     * @tc.name      testLerpStopsGrid0340
     * @tc.desc      Verify lerpHexStops set 19 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0340 begin');
      await delayTick();
      const colors: string[] = ['#888888', '#444444'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(129,129,129,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0340 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_34100
     * @tc.name      testLerpStopsGrid0341
     * @tc.desc      Verify lerpHexStops set 19 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0341 begin');
      await delayTick();
      const colors: string[] = ['#888888', '#444444'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(119,119,119,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0341 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_34200
     * @tc.name      testLerpStopsGrid0342
     * @tc.desc      Verify lerpHexStops set 19 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0342 begin');
      await delayTick();
      const colors: string[] = ['#888888', '#444444'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(102,102,102,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0342 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_34300
     * @tc.name      testLerpStopsGrid0343
     * @tc.desc      Verify lerpHexStops set 19 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0343 begin');
      await delayTick();
      const colors: string[] = ['#888888', '#444444'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(85,85,85,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0343 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_34400
     * @tc.name      testLerpStopsGrid0344
     * @tc.desc      Verify lerpHexStops set 19 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0344 begin');
      await delayTick();
      const colors: string[] = ['#888888', '#444444'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(75,75,75,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0344 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_34500
     * @tc.name      testLerpStopsGrid0345
     * @tc.desc      Verify lerpHexStops set 19 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0345 begin');
      await delayTick();
      const colors: string[] = ['#888888', '#444444'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(68,68,68,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0345 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_34600
     * @tc.name      testLerpStopsGrid0346
     * @tc.desc      Verify lerpHexStops set 19 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0346 begin');
      await delayTick();
      const colors: string[] = ['#888888', '#444444'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(136,136,136,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0346 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP9_34700
     * @tc.name      testLerpStopsGrid0347
     * @tc.desc      Verify lerpHexStops set 19 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0347 begin');
      await delayTick();
      const colors: string[] = ['#888888', '#444444'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(68,68,68,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0347 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_0100
     * @tc.name      testParseRgb0001
     * @tc.desc      Verify parseHex(#ffffff) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0001 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#ffffff');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(255);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0001 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_0200
     * @tc.name      testParseRgb0002
     * @tc.desc      Verify parseHex(#112233) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0002 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#112233');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(17);
        expect(c.g).assertEqual(34);
        expect(c.b).assertEqual(51);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0002 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_0300
     * @tc.name      testParseRgb0003
     * @tc.desc      Verify parseHex(#7f00ff) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0003 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#7f00ff');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(127);
        expect(c.g).assertEqual(0);
        expect(c.b).assertEqual(255);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0003 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_0400
     * @tc.name      testParseRgb0004
     * @tc.desc      Verify parseHex(#7F00FF) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0004 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#7F00FF');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(127);
        expect(c.g).assertEqual(0);
        expect(c.b).assertEqual(255);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0004 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_0500
     * @tc.name      testParseRgb0005
     * @tc.desc      Verify parseHex(#804020) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0005 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#804020');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(128);
        expect(c.g).assertEqual(64);
        expect(c.b).assertEqual(32);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0005 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_0600
     * @tc.name      testParseRgb0006
     * @tc.desc      Verify parseHex(#fe8001) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0006 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#fe8001');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(254);
        expect(c.g).assertEqual(128);
        expect(c.b).assertEqual(1);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0006 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_0700
     * @tc.name      testParseRgb0007
     * @tc.desc      Verify parseHex(#FE8001) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0007 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#FE8001');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(254);
        expect(c.g).assertEqual(128);
        expect(c.b).assertEqual(1);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0007 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_0800
     * @tc.name      testParseRgb0008
     * @tc.desc      Verify parseHex(#0a141e) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0008 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0a141e');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(10);
        expect(c.g).assertEqual(20);
        expect(c.b).assertEqual(30);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0008 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_0900
     * @tc.name      testParseRgb0009
     * @tc.desc      Verify parseHex(#0A141E) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0009 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0A141E');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(10);
        expect(c.g).assertEqual(20);
        expect(c.b).assertEqual(30);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0009 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1000
     * @tc.name      testParseRgb0010
     * @tc.desc      Verify parseHex(#abcdef) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0010 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#abcdef');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(171);
        expect(c.g).assertEqual(205);
        expect(c.b).assertEqual(239);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0010 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1100
     * @tc.name      testParseRgb0011
     * @tc.desc      Verify parseHex(#24486c) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0011 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#24486c');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(36);
        expect(c.g).assertEqual(72);
        expect(c.b).assertEqual(108);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0011 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1200
     * @tc.name      testParseRgb0012
     * @tc.desc      Verify parseHex(#24486C) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0012 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#24486C');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(36);
        expect(c.g).assertEqual(72);
        expect(c.b).assertEqual(108);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0012 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1300
     * @tc.name      testParseRgb0013
     * @tc.desc      Verify parseHex(#c86432) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0013 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#c86432');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(200);
        expect(c.g).assertEqual(100);
        expect(c.b).assertEqual(50);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0013 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1400
     * @tc.name      testParseRgb0014
     * @tc.desc      Verify parseHex(#C86432) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0014 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#C86432');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(200);
        expect(c.g).assertEqual(100);
        expect(c.b).assertEqual(50);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0014 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1500
     * @tc.name      testParseRgb0015
     * @tc.desc      Verify parseHex(#05fa7d) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0015 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#05fa7d');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(5);
        expect(c.g).assertEqual(250);
        expect(c.b).assertEqual(125);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0015 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1600
     * @tc.name      testParseRgb0016
     * @tc.desc      Verify parseHex(#05FA7D) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0016 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#05FA7D');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(5);
        expect(c.g).assertEqual(250);
        expect(c.b).assertEqual(125);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0016 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1700
     * @tc.name      testParseRgb0017
     * @tc.desc      Verify parseHex(#4080c0) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0017 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#4080c0');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(64);
        expect(c.g).assertEqual(128);
        expect(c.b).assertEqual(192);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0017 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1800
     * @tc.name      testParseRgb0018
     * @tc.desc      Verify parseHex(#4080C0) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0018 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#4080C0');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(64);
        expect(c.g).assertEqual(128);
        expect(c.b).assertEqual(192);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0018 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_1900
     * @tc.name      testParseRgb0019
     * @tc.desc      Verify parseHex(#f00f5a) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0019 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#f00f5a');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(240);
        expect(c.g).assertEqual(15);
        expect(c.b).assertEqual(90);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0019 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2000
     * @tc.name      testParseRgb0020
     * @tc.desc      Verify parseHex(#F00F5A) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0020 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#F00F5A');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(240);
        expect(c.g).assertEqual(15);
        expect(c.b).assertEqual(90);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0020 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2100
     * @tc.name      testParseRgb0021
     * @tc.desc      Verify parseHex(#214263) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0021 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#214263');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(33);
        expect(c.g).assertEqual(66);
        expect(c.b).assertEqual(99);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0021 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2200
     * @tc.name      testParseRgb0022
     * @tc.desc      Verify parseHex(#020408) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0022 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#020408');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(2);
        expect(c.g).assertEqual(4);
        expect(c.b).assertEqual(8);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0022 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2300
     * @tc.name      testParseRgb0023
     * @tc.desc      Verify parseHex(#3f7fbf) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0023 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#3f7fbf');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(63);
        expect(c.g).assertEqual(127);
        expect(c.b).assertEqual(191);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0023 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2400
     * @tc.name      testParseRgb0024
     * @tc.desc      Verify parseHex(#3F7FBF) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0024 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#3F7FBF');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(63);
        expect(c.g).assertEqual(127);
        expect(c.b).assertEqual(191);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0024 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2500
     * @tc.name      testParseRgb0025
     * @tc.desc      Verify parseHex(#e06020) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0025 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#e06020');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(224);
        expect(c.g).assertEqual(96);
        expect(c.b).assertEqual(32);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0025 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2600
     * @tc.name      testParseRgb0026
     * @tc.desc      Verify parseHex(#E06020) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0026 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#E06020');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(224);
        expect(c.g).assertEqual(96);
        expect(c.b).assertEqual(32);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0026 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2700
     * @tc.name      testParseRgb0027
     * @tc.desc      Verify parseHex(#0b162c) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0027 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0b162c');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(11);
        expect(c.g).assertEqual(22);
        expect(c.b).assertEqual(44);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0027 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2800
     * @tc.name      testParseRgb0028
     * @tc.desc      Verify parseHex(#0B162C) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0028 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0B162C');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(11);
        expect(c.g).assertEqual(22);
        expect(c.b).assertEqual(44);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0028 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_2900
     * @tc.name      testParseRgb0029
     * @tc.desc      Verify parseHex(#636465) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0029 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#636465');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(99);
        expect(c.g).assertEqual(100);
        expect(c.b).assertEqual(101);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0029 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3000
     * @tc.name      testParseRgb0030
     * @tc.desc      Verify parseHex(#964b19) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0030 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#964b19');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(150);
        expect(c.g).assertEqual(75);
        expect(c.b).assertEqual(25);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0030 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3100
     * @tc.name      testParseRgb0031
     * @tc.desc      Verify parseHex(#964B19) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0031 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#964B19');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(150);
        expect(c.g).assertEqual(75);
        expect(c.b).assertEqual(25);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0031 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3200
     * @tc.name      testParseRgb0032
     * @tc.desc      Verify parseHex(#081018) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0032 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#081018');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(8);
        expect(c.g).assertEqual(16);
        expect(c.b).assertEqual(24);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0032 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3300
     * @tc.name      testParseRgb0033
     * @tc.desc      Verify parseHex(#fa0582) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0033 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#fa0582');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(250);
        expect(c.g).assertEqual(5);
        expect(c.b).assertEqual(130);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0033 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3400
     * @tc.name      testParseRgb0034
     * @tc.desc      Verify parseHex(#FA0582) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0034 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#FA0582');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(250);
        expect(c.g).assertEqual(5);
        expect(c.b).assertEqual(130);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0034 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3500
     * @tc.name      testParseRgb0035
     * @tc.desc      Verify parseHex(#306090) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0035 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#306090');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(48);
        expect(c.g).assertEqual(96);
        expect(c.b).assertEqual(144);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0035 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3600
     * @tc.name      testParseRgb0036
     * @tc.desc      Verify parseHex(#c91153) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0036 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#c91153');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(201);
        expect(c.g).assertEqual(17);
        expect(c.b).assertEqual(83);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0036 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3700
     * @tc.name      testParseRgb0037
     * @tc.desc      Verify parseHex(#C91153) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0037 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#C91153');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(201);
        expect(c.g).assertEqual(17);
        expect(c.b).assertEqual(83);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0037 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3800
     * @tc.name      testParseRgb0038
     * @tc.desc      Verify parseHex(#4d9ae7) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0038 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#4d9ae7');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(77);
        expect(c.g).assertEqual(154);
        expect(c.b).assertEqual(231);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0038 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_3900
     * @tc.name      testParseRgb0039
     * @tc.desc      Verify parseHex(#4D9AE7) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0039 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#4D9AE7');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(77);
        expect(c.g).assertEqual(154);
        expect(c.b).assertEqual(231);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0039 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP1_4000
     * @tc.name      testParseRgb0040
     * @tc.desc      Verify parseHex(#0cc858) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0040 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0cc858');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(12);
        expect(c.g).assertEqual(200);
        expect(c.b).assertEqual(88);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0040 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_4100
     * @tc.name      testParseRgb0041
     * @tc.desc      Verify parseHex(#0CC858) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0041 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0CC858');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(12);
        expect(c.g).assertEqual(200);
        expect(c.b).assertEqual(88);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0041 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_4200
     * @tc.name      testParseArgb0042
     * @tc.desc      Verify parseHex(#00010203) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0042 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#00010203');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(1);
        expect(c.g).assertEqual(2);
        expect(c.b).assertEqual(3);
        expect(c.a).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0042 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_4300
     * @tc.name      testParseArgb0043
     * @tc.desc      Verify parseHex(#ffff0080) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0043 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#ffff0080');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(0);
        expect(c.b).assertEqual(128);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0043 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_4400
     * @tc.name      testParseArgb0044
     * @tc.desc      Verify parseHex(#40102030) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0044 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#40102030');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(16);
        expect(c.g).assertEqual(32);
        expect(c.b).assertEqual(48);
        expect(c.a).assertEqual(64);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0044 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_4500
     * @tc.name      testParseArgb0045
     * @tc.desc      Verify parseHex(#80faf0e6) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0045 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#80faf0e6');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(250);
        expect(c.g).assertEqual(240);
        expect(c.b).assertEqual(230);
        expect(c.a).assertEqual(128);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0045 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_4600
     * @tc.name      testParseArgb0046
     * @tc.desc      Verify parseHex(#01000000) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0046 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#01000000');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(0);
        expect(c.b).assertEqual(0);
        expect(c.a).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0046 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_4700
     * @tc.name      testParseArgb0047
     * @tc.desc      Verify parseHex(#c87f8081) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0047 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#c87f8081');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(127);
        expect(c.g).assertEqual(128);
        expect(c.b).assertEqual(129);
        expect(c.a).assertEqual(200);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0047 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_4800
     * @tc.name      testParseArgb0048
     * @tc.desc      Verify parseHex(#215ab42d) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0048 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#215ab42d');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(90);
        expect(c.g).assertEqual(180);
        expect(c.b).assertEqual(45);
        expect(c.a).assertEqual(33);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0048 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_4900
     * @tc.name      testParseArgb0049
     * @tc.desc      Verify parseHex(#ccc9cacb) components.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0049 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#ccc9cacb');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(201);
        expect(c.g).assertEqual(202);
        expect(c.b).assertEqual(203);
        expect(c.a).assertEqual(204);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0049 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5000
     * @tc.name      testParseTrim0050
     * @tc.desc      Verify parseHex(' #12aBcD ') trims and parses.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseTrim0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseTrim0050 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex(' #12aBcD ');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(18);
        expect(c.g).assertEqual(171);
        expect(c.b).assertEqual(205);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseTrim0050 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5100
     * @tc.name      testParseTrim0051
     * @tc.desc      Verify parseHex('  #FFF000 ') trims and parses.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseTrim0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseTrim0051 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('  #FFF000 ');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(240);
        expect(c.b).assertEqual(0);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseTrim0051 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5200
     * @tc.name      testParseTrim0052
     * @tc.desc      Verify parseHex('#123456 ') trims and parses.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseTrim0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseTrim0052 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#123456 ');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(18);
        expect(c.g).assertEqual(52);
        expect(c.b).assertEqual(86);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseTrim0052 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5300
     * @tc.name      testParseInvalid0053
     * @tc.desc      Verify parseHex('#1') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0053 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#1') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0053 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5400
     * @tc.name      testParseInvalid0054
     * @tc.desc      Verify parseHex('#12') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0054 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#12') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0054 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5500
     * @tc.name      testParseInvalid0055
     * @tc.desc      Verify parseHex('#12 456') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0055 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#12 456') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0055 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5600
     * @tc.name      testParseInvalid0056
     * @tc.desc      Verify parseHex('#12-456') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0056 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#12-456') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0056 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5700
     * @tc.name      testParseInvalid0057
     * @tc.desc      Verify parseHex('#12345g') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0057 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#12345g') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0057 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5800
     * @tc.name      testParseInvalid0058
     * @tc.desc      Verify parseHex('#abcdefg') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0058 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#abcdefg') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0058 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_5900
     * @tc.name      testParseInvalid0059
     * @tc.desc      Verify parseHex('#-12345') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0059 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#-12345') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0059 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6000
     * @tc.name      testParseInvalid0060
     * @tc.desc      Verify parseHex('#.12345') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0060 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#.12345') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0060 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6100
     * @tc.name      testParseInvalid0061
     * @tc.desc      Verify parseHex(' #1234567 ') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0061 begin');
      await delayTick();
      expect(ColorUtil.parseHex(' #1234567 ') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0061 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6200
     * @tc.name      testParseInvalid0062
     * @tc.desc      Verify parseHex('0x123456') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0062 begin');
      await delayTick();
      expect(ColorUtil.parseHex('0x123456') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0062 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6300
     * @tc.name      testParseInvalid0063
     * @tc.desc      Verify parseHex('rgb(1,2,3)') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0063 begin');
      await delayTick();
      expect(ColorUtil.parseHex('rgb(1,2,3)') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0063 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6400
     * @tc.name      testToHex0064
     * @tc.desc      Verify toHex(0, 0, 0) returns #000000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0064 begin');
      await delayTick();
      expect(ColorUtil.toHex(0, 0, 0)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0064 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6500
     * @tc.name      testToHex0065
     * @tc.desc      Verify toHex(255, 255, 255) returns #FFFFFF.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0065 begin');
      await delayTick();
      expect(ColorUtil.toHex(255, 255, 255)).assertEqual('#FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0065 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6600
     * @tc.name      testToHex0066
     * @tc.desc      Verify toHex(1, 2, 3) returns #010203.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0066 begin');
      await delayTick();
      expect(ColorUtil.toHex(1, 2, 3)).assertEqual('#010203');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0066 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6700
     * @tc.name      testToHex0067
     * @tc.desc      Verify toHex(16, 32, 48) returns #102030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0067 begin');
      await delayTick();
      expect(ColorUtil.toHex(16, 32, 48)).assertEqual('#102030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0067 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6800
     * @tc.name      testToHex0068
     * @tc.desc      Verify toHex(17, 34, 51) returns #112233.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0068 begin');
      await delayTick();
      expect(ColorUtil.toHex(17, 34, 51)).assertEqual('#112233');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0068 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_6900
     * @tc.name      testToHex0069
     * @tc.desc      Verify toHex(127, 0, 255) returns #7F00FF.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0069 begin');
      await delayTick();
      expect(ColorUtil.toHex(127, 0, 255)).assertEqual('#7F00FF');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0069 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_7000
     * @tc.name      testToHex0070
     * @tc.desc      Verify toHex(128, 64, 32) returns #804020.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0070 begin');
      await delayTick();
      expect(ColorUtil.toHex(128, 64, 32)).assertEqual('#804020');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0070 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_7100
     * @tc.name      testToHex0071
     * @tc.desc      Verify toHex(254, 128, 1) returns #FE8001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0071 begin');
      await delayTick();
      expect(ColorUtil.toHex(254, 128, 1)).assertEqual('#FE8001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0071 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CRGP2_7200
     * @tc.name      testToHex0072
     * @tc.desc      Verify toHex(10, 20, 30) returns #0A141E.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0072 begin');
      await delayTick();
      expect(ColorUtil.toHex(10, 20, 30)).assertEqual('#0A141E');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0072 end');
    })

  })
}
