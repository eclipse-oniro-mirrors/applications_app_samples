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

export default function CanvasCombinedPart2Test(): void {
  describe('CvG2', () => {
    /**
     * @tc.number    SUB_CANVAS_CLSP3_9400
     * @tc.name      testLerpGrid0094
     * @tc.desc      Verify lerp pair 9 at t=0.66. Plus Verify lerp pair 9 at t=0.75. Plus Verify lerp pair 9 at t=0.9. Plus Verify lerp pair 9 at t=1. Plus Verify lerp pair 9 at t=-0.5. Plus Verify lerp pair 9 at t=1.5. Plus Verify lerp pair 10 at t=0. Plus Verify lerp pair 10 at t=0.1. Plus Verify lerp pair 10 at t=0.25. Plus Verify lerp pair 10 at t=0.33. Plus Verify lerp pair 10 at t=0.5. Plus Verify lerp pair 10 at t=0.66. Plus Verify lerp pair 10 at t=0.75. Plus Verify lerp pair 10 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0094 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(168);
      expect(out.g).assertEqual(168);
      expect(out.b).assertEqual(168);
      expect(out.a).assertEqual(168);
      {
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(191);
      expect(out.g).assertEqual(191);
      expect(out.b).assertEqual(191);
      expect(out.a).assertEqual(191);
      }
      {
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(229);
      expect(out.g).assertEqual(229);
      expect(out.b).assertEqual(229);
      expect(out.a).assertEqual(229);
      }
      {
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(254);
      expect(out.g).assertEqual(254);
      expect(out.b).assertEqual(254);
      expect(out.a).assertEqual(254);
      }
      {
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(1);
      expect(out.g).assertEqual(1);
      expect(out.b).assertEqual(1);
      expect(out.a).assertEqual(1);
      }
      {
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(254);
      expect(out.g).assertEqual(254);
      expect(out.b).assertEqual(254);
      expect(out.a).assertEqual(254);
      }
      {
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(100);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(200);
      expect(out.a).assertEqual(50);
      }
      {
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(90);
      expect(out.g).assertEqual(10);
      expect(out.b).assertEqual(185);
      expect(out.a).assertEqual(65);
      }
      {
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(75);
      expect(out.g).assertEqual(25);
      expect(out.b).assertEqual(163);
      expect(out.a).assertEqual(88);
      }
      {
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(67);
      expect(out.g).assertEqual(33);
      expect(out.b).assertEqual(151);
      expect(out.a).assertEqual(100);
      }
      {
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(50);
      expect(out.g).assertEqual(50);
      expect(out.b).assertEqual(125);
      expect(out.a).assertEqual(125);
      }
      {
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(34);
      expect(out.g).assertEqual(66);
      expect(out.b).assertEqual(101);
      expect(out.a).assertEqual(149);
      }
      {
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(25);
      expect(out.g).assertEqual(75);
      expect(out.b).assertEqual(88);
      expect(out.a).assertEqual(163);
      }
      {
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(10);
      expect(out.g).assertEqual(90);
      expect(out.b).assertEqual(65);
      expect(out.a).assertEqual(185);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0094 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_10800
     * @tc.name      testLerpGrid0108
     * @tc.desc      Verify lerp pair 10 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0108 begin');
      await delayTick();
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(100);
      expect(out.b).assertEqual(50);
      expect(out.a).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0108 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_10900
     * @tc.name      testLerpGrid0109
     * @tc.desc      Verify lerp pair 10 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0109 begin');
      await delayTick();
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(100);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(200);
      expect(out.a).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0109 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11000
     * @tc.name      testLerpGrid0110
     * @tc.desc      Verify lerp pair 10 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0110 begin');
      await delayTick();
      const c1: ColorRgba = { r: 100, g: 0, b: 200, a: 50 };
      const c2: ColorRgba = { r: 0, g: 100, b: 50, a: 200 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(100);
      expect(out.b).assertEqual(50);
      expect(out.a).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0110 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11100
     * @tc.name      testLerpGrid0111
     * @tc.desc      Verify lerp pair 11 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0111 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(240);
      expect(out.g).assertEqual(120);
      expect(out.b).assertEqual(60);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0111 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11200
     * @tc.name      testLerpGrid0112
     * @tc.desc      Verify lerp pair 11 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0112 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(218);
      expect(out.g).assertEqual(111);
      expect(out.b).assertEqual(59);
      expect(out.a).assertEqual(33);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0112 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11300
     * @tc.name      testLerpGrid0113
     * @tc.desc      Verify lerp pair 11 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0113 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(184);
      expect(out.g).assertEqual(98);
      expect(out.b).assertEqual(56);
      expect(out.a).assertEqual(38);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0113 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11400
     * @tc.name      testLerpGrid0114
     * @tc.desc      Verify lerp pair 11 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0114 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(166);
      expect(out.g).assertEqual(90);
      expect(out.b).assertEqual(55);
      expect(out.a).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0114 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11500
     * @tc.name      testLerpGrid0115
     * @tc.desc      Verify lerp pair 11 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0115 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(128);
      expect(out.g).assertEqual(75);
      expect(out.b).assertEqual(53);
      expect(out.a).assertEqual(45);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0115 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11600
     * @tc.name      testLerpGrid0116
     * @tc.desc      Verify lerp pair 11 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0116 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(92);
      expect(out.g).assertEqual(61);
      expect(out.b).assertEqual(50);
      expect(out.a).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0116 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11700
     * @tc.name      testLerpGrid0117
     * @tc.desc      Verify lerp pair 11 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0117 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(71);
      expect(out.g).assertEqual(53);
      expect(out.b).assertEqual(49);
      expect(out.a).assertEqual(53);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0117 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11800
     * @tc.name      testLerpGrid0118
     * @tc.desc      Verify lerp pair 11 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0118 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(38);
      expect(out.g).assertEqual(39);
      expect(out.b).assertEqual(47);
      expect(out.a).assertEqual(57);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0118 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_11900
     * @tc.name      testLerpGrid0119
     * @tc.desc      Verify lerp pair 11 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0119 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(15);
      expect(out.g).assertEqual(30);
      expect(out.b).assertEqual(45);
      expect(out.a).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0119 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_12000
     * @tc.name      testLerpGrid0120
     * @tc.desc      Verify lerp pair 11 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0120 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(240);
      expect(out.g).assertEqual(120);
      expect(out.b).assertEqual(60);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0120 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_12100
     * @tc.name      testLerpGrid0121
     * @tc.desc      Verify lerp pair 11 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0121 begin');
      await delayTick();
      const c1: ColorRgba = { r: 240, g: 120, b: 60, a: 30 };
      const c2: ColorRgba = { r: 15, g: 30, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(15);
      expect(out.g).assertEqual(30);
      expect(out.b).assertEqual(45);
      expect(out.a).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0121 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_12200
     * @tc.name      testLerpGrid0122
     * @tc.desc      Verify lerp pair 12 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0122 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(255);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0122 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_12300
     * @tc.name      testLerpGrid0123
     * @tc.desc      Verify lerp pair 12 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0123 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(26);
      expect(out.g).assertEqual(230);
      expect(out.b).assertEqual(26);
      expect(out.a).assertEqual(141);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0123 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_12400
     * @tc.name      testLerpGrid0124
     * @tc.desc      Verify lerp pair 12 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0124 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(64);
      expect(out.g).assertEqual(191);
      expect(out.b).assertEqual(64);
      expect(out.a).assertEqual(160);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0124 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_12500
     * @tc.name      testLerpGrid0125
     * @tc.desc      Verify lerp pair 12 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0125 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(84);
      expect(out.g).assertEqual(171);
      expect(out.b).assertEqual(84);
      expect(out.a).assertEqual(170);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0125 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_12600
     * @tc.name      testLerpGrid0126
     * @tc.desc      Verify lerp pair 12 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0126 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(128);
      expect(out.g).assertEqual(128);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(192);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0126 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_12700
     * @tc.name      testLerpGrid0127
     * @tc.desc      Verify lerp pair 12 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0127 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(168);
      expect(out.g).assertEqual(87);
      expect(out.b).assertEqual(168);
      expect(out.a).assertEqual(212);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0127 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_12800
     * @tc.name      testLerpGrid0128
     * @tc.desc      Verify lerp pair 12 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0128 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(191);
      expect(out.g).assertEqual(64);
      expect(out.b).assertEqual(191);
      expect(out.a).assertEqual(223);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0128 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_12900
     * @tc.name      testLerpGrid0129
     * @tc.desc      Verify lerp pair 12 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0129 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(230);
      expect(out.g).assertEqual(26);
      expect(out.b).assertEqual(230);
      expect(out.a).assertEqual(242);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0129 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13000
     * @tc.name      testLerpGrid0130
     * @tc.desc      Verify lerp pair 12 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0130 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(255);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(255);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0130 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13100
     * @tc.name      testLerpGrid0131
     * @tc.desc      Verify lerp pair 12 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0131 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(255);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0131 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13200
     * @tc.name      testLerpGrid0132
     * @tc.desc      Verify lerp pair 12 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0132 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 255, b: 0, a: 128 };
      const c2: ColorRgba = { r: 255, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(255);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(255);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0132 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13300
     * @tc.name      testLerpGrid0133
     * @tc.desc      Verify lerp pair 13 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0133 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(18);
      expect(out.g).assertEqual(52);
      expect(out.b).assertEqual(86);
      expect(out.a).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0133 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13400
     * @tc.name      testLerpGrid0134
     * @tc.desc      Verify lerp pair 13 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0134 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(28);
      expect(out.g).assertEqual(55);
      expect(out.b).assertEqual(83);
      expect(out.a).assertEqual(110);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0134 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13500
     * @tc.name      testLerpGrid0135
     * @tc.desc      Verify lerp pair 13 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0135 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(44);
      expect(out.g).assertEqual(61);
      expect(out.b).assertEqual(78);
      expect(out.a).assertEqual(95);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0135 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13600
     * @tc.name      testLerpGrid0136
     * @tc.desc      Verify lerp pair 13 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0136 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(52);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(75);
      expect(out.a).assertEqual(86);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0136 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13700
     * @tc.name      testLerpGrid0137
     * @tc.desc      Verify lerp pair 13 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0137 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(69);
      expect(out.g).assertEqual(69);
      expect(out.b).assertEqual(69);
      expect(out.a).assertEqual(69);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0137 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13800
     * @tc.name      testLerpGrid0138
     * @tc.desc      Verify lerp pair 13 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0138 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(85);
      expect(out.g).assertEqual(74);
      expect(out.b).assertEqual(64);
      expect(out.a).assertEqual(53);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0138 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_13900
     * @tc.name      testLerpGrid0139
     * @tc.desc      Verify lerp pair 13 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0139 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(95);
      expect(out.g).assertEqual(78);
      expect(out.b).assertEqual(61);
      expect(out.a).assertEqual(44);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0139 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14000
     * @tc.name      testLerpGrid0140
     * @tc.desc      Verify lerp pair 13 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0140 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(110);
      expect(out.g).assertEqual(83);
      expect(out.b).assertEqual(55);
      expect(out.a).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0140 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14100
     * @tc.name      testLerpGrid0141
     * @tc.desc      Verify lerp pair 13 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0141 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(120);
      expect(out.g).assertEqual(86);
      expect(out.b).assertEqual(52);
      expect(out.a).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0141 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14200
     * @tc.name      testLerpGrid0142
     * @tc.desc      Verify lerp pair 13 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0142 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(18);
      expect(out.g).assertEqual(52);
      expect(out.b).assertEqual(86);
      expect(out.a).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0142 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14300
     * @tc.name      testLerpGrid0143
     * @tc.desc      Verify lerp pair 13 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0143 begin');
      await delayTick();
      const c1: ColorRgba = { r: 18, g: 52, b: 86, a: 120 };
      const c2: ColorRgba = { r: 120, g: 86, b: 52, a: 18 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(120);
      expect(out.g).assertEqual(86);
      expect(out.b).assertEqual(52);
      expect(out.a).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0143 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14400
     * @tc.name      testLerpGrid0144
     * @tc.desc      Verify lerp pair 14 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0144 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(200);
      expect(out.g).assertEqual(10);
      expect(out.b).assertEqual(20);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0144 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14500
     * @tc.name      testLerpGrid0145
     * @tc.desc      Verify lerp pair 14 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0145 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(181);
      expect(out.g).assertEqual(11);
      expect(out.b).assertEqual(38);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0145 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14600
     * @tc.name      testLerpGrid0146
     * @tc.desc      Verify lerp pair 14 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0146 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(153);
      expect(out.g).assertEqual(13);
      expect(out.b).assertEqual(65);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0146 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14700
     * @tc.name      testLerpGrid0147
     * @tc.desc      Verify lerp pair 14 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0147 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(137);
      expect(out.g).assertEqual(13);
      expect(out.b).assertEqual(79);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0147 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14800
     * @tc.name      testLerpGrid0148
     * @tc.desc      Verify lerp pair 14 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0148 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(105);
      expect(out.g).assertEqual(15);
      expect(out.b).assertEqual(110);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0148 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_14900
     * @tc.name      testLerpGrid0149
     * @tc.desc      Verify lerp pair 14 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0149 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(75);
      expect(out.g).assertEqual(17);
      expect(out.b).assertEqual(139);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0149 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15000
     * @tc.name      testLerpGrid0150
     * @tc.desc      Verify lerp pair 14 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0150 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(58);
      expect(out.g).assertEqual(18);
      expect(out.b).assertEqual(155);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0150 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15100
     * @tc.name      testLerpGrid0151
     * @tc.desc      Verify lerp pair 14 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0151 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(29);
      expect(out.g).assertEqual(19);
      expect(out.b).assertEqual(182);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0151 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15200
     * @tc.name      testLerpGrid0152
     * @tc.desc      Verify lerp pair 14 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0152 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(10);
      expect(out.g).assertEqual(20);
      expect(out.b).assertEqual(200);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0152 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15300
     * @tc.name      testLerpGrid0153
     * @tc.desc      Verify lerp pair 14 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0153 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(200);
      expect(out.g).assertEqual(10);
      expect(out.b).assertEqual(20);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0153 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15400
     * @tc.name      testLerpGrid0154
     * @tc.desc      Verify lerp pair 14 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0154 begin');
      await delayTick();
      const c1: ColorRgba = { r: 200, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 10, g: 20, b: 200, a: 30 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(10);
      expect(out.g).assertEqual(20);
      expect(out.b).assertEqual(200);
      expect(out.a).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0154 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15500
     * @tc.name      testLerpGrid0155
     * @tc.desc      Verify lerp pair 15 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0155 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(55);
      expect(out.g).assertEqual(110);
      expect(out.b).assertEqual(165);
      expect(out.a).assertEqual(220);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0155 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15600
     * @tc.name      testLerpGrid0156
     * @tc.desc      Verify lerp pair 15 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0156 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(72);
      expect(out.g).assertEqual(116);
      expect(out.b).assertEqual(160);
      expect(out.a).assertEqual(204);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0156 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15700
     * @tc.name      testLerpGrid0157
     * @tc.desc      Verify lerp pair 15 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0157 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(96);
      expect(out.g).assertEqual(124);
      expect(out.b).assertEqual(151);
      expect(out.a).assertEqual(179);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0157 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15800
     * @tc.name      testLerpGrid0158
     * @tc.desc      Verify lerp pair 15 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0158 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(109);
      expect(out.g).assertEqual(128);
      expect(out.b).assertEqual(147);
      expect(out.a).assertEqual(166);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0158 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_15900
     * @tc.name      testLerpGrid0159
     * @tc.desc      Verify lerp pair 15 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0159 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(138);
      expect(out.g).assertEqual(138);
      expect(out.b).assertEqual(138);
      expect(out.a).assertEqual(138);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0159 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP4_16000
     * @tc.name      testLerpGrid0160
     * @tc.desc      Verify lerp pair 15 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0160 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(164);
      expect(out.g).assertEqual(146);
      expect(out.b).assertEqual(129);
      expect(out.a).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0160 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_16100
     * @tc.name      testLerpGrid0161
     * @tc.desc      Verify lerp pair 15 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0161 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(179);
      expect(out.g).assertEqual(151);
      expect(out.b).assertEqual(124);
      expect(out.a).assertEqual(96);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0161 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_16200
     * @tc.name      testLerpGrid0162
     * @tc.desc      Verify lerp pair 15 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0162 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(204);
      expect(out.g).assertEqual(160);
      expect(out.b).assertEqual(116);
      expect(out.a).assertEqual(72);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0162 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_16300
     * @tc.name      testLerpGrid0163
     * @tc.desc      Verify lerp pair 15 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0163 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(220);
      expect(out.g).assertEqual(165);
      expect(out.b).assertEqual(110);
      expect(out.a).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0163 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_16400
     * @tc.name      testLerpGrid0164
     * @tc.desc      Verify lerp pair 15 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0164 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(55);
      expect(out.g).assertEqual(110);
      expect(out.b).assertEqual(165);
      expect(out.a).assertEqual(220);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0164 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_16500
     * @tc.name      testLerpGrid0165
     * @tc.desc      Verify lerp pair 15 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0165 begin');
      await delayTick();
      const c1: ColorRgba = { r: 55, g: 110, b: 165, a: 220 };
      const c2: ColorRgba = { r: 220, g: 165, b: 110, a: 55 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(220);
      expect(out.g).assertEqual(165);
      expect(out.b).assertEqual(110);
      expect(out.a).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0165 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_16600
     * @tc.name      testLerpGrid0166
     * @tc.desc      Verify lerp pair 16 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0166 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(127);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(31);
      expect(out.a).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0166 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_16700
     * @tc.name      testLerpGrid0167
     * @tc.desc      Verify lerp pair 16 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0167 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(117);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(41);
      expect(out.a).assertEqual(39);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0167 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_16800
     * @tc.name      testLerpGrid0168
     * @tc.desc      Verify lerp pair 16 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0168 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(103);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(55);
      expect(out.a).assertEqual(75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0168 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_16900
     * @tc.name      testLerpGrid0169
     * @tc.desc      Verify lerp pair 16 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0169 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(95);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(63);
      expect(out.a).assertEqual(94);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0169 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17000
     * @tc.name      testLerpGrid0170
     * @tc.desc      Verify lerp pair 16 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0170 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(79);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(79);
      expect(out.a).assertEqual(135);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0170 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17100
     * @tc.name      testLerpGrid0171
     * @tc.desc      Verify lerp pair 16 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0171 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(64);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(94);
      expect(out.a).assertEqual(173);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0171 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17200
     * @tc.name      testLerpGrid0172
     * @tc.desc      Verify lerp pair 16 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0172 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(55);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(103);
      expect(out.a).assertEqual(195);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0172 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17300
     * @tc.name      testLerpGrid0173
     * @tc.desc      Verify lerp pair 16 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0173 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(41);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(117);
      expect(out.a).assertEqual(231);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0173 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17400
     * @tc.name      testLerpGrid0174
     * @tc.desc      Verify lerp pair 16 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0174 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(31);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(127);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0174 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17500
     * @tc.name      testLerpGrid0175
     * @tc.desc      Verify lerp pair 16 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0175 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(127);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(31);
      expect(out.a).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0175 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17600
     * @tc.name      testLerpGrid0176
     * @tc.desc      Verify lerp pair 16 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0176 begin');
      await delayTick();
      const c1: ColorRgba = { r: 127, g: 63, b: 31, a: 15 };
      const c2: ColorRgba = { r: 31, g: 63, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(31);
      expect(out.g).assertEqual(63);
      expect(out.b).assertEqual(127);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0176 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17700
     * @tc.name      testLerpStopsGrid0177
     * @tc.desc      Verify lerpHexStops set 1 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0177 begin');
      await delayTick();
      const colors: string[] = ['#000000', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0177 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17800
     * @tc.name      testLerpStopsGrid0178
     * @tc.desc      Verify lerpHexStops set 1 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0178 begin');
      await delayTick();
      const colors: string[] = ['#000000', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(26,26,26,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0178 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_17900
     * @tc.name      testLerpStopsGrid0179
     * @tc.desc      Verify lerpHexStops set 1 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0179 begin');
      await delayTick();
      const colors: string[] = ['#000000', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(64,64,64,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0179 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18000
     * @tc.name      testLerpStopsGrid0180
     * @tc.desc      Verify lerpHexStops set 1 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0180 begin');
      await delayTick();
      const colors: string[] = ['#000000', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(128,128,128,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0180 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18100
     * @tc.name      testLerpStopsGrid0181
     * @tc.desc      Verify lerpHexStops set 1 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0181 begin');
      await delayTick();
      const colors: string[] = ['#000000', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(191,191,191,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0181 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18200
     * @tc.name      testLerpStopsGrid0182
     * @tc.desc      Verify lerpHexStops set 1 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0182 begin');
      await delayTick();
      const colors: string[] = ['#000000', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(230,230,230,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0182 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18300
     * @tc.name      testLerpStopsGrid0183
     * @tc.desc      Verify lerpHexStops set 1 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0183 begin');
      await delayTick();
      const colors: string[] = ['#000000', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(255,255,255,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0183 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18400
     * @tc.name      testLerpStopsGrid0184
     * @tc.desc      Verify lerpHexStops set 1 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0184 begin');
      await delayTick();
      const colors: string[] = ['#000000', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0184 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18500
     * @tc.name      testLerpStopsGrid0185
     * @tc.desc      Verify lerpHexStops set 1 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0185 begin');
      await delayTick();
      const colors: string[] = ['#000000', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(255,255,255,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0185 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18600
     * @tc.name      testLerpStopsGrid0186
     * @tc.desc      Verify lerpHexStops set 2 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0186 begin');
      await delayTick();
      const colors: string[] = ['#FF0000', '#00FF00', '#0000FF'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(255,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0186 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18700
     * @tc.name      testLerpStopsGrid0187
     * @tc.desc      Verify lerpHexStops set 2 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0187 begin');
      await delayTick();
      const colors: string[] = ['#FF0000', '#00FF00', '#0000FF'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(204,51,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0187 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18800
     * @tc.name      testLerpStopsGrid0188
     * @tc.desc      Verify lerpHexStops set 2 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0188 begin');
      await delayTick();
      const colors: string[] = ['#FF0000', '#00FF00', '#0000FF'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(128,128,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0188 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_18900
     * @tc.name      testLerpStopsGrid0189
     * @tc.desc      Verify lerpHexStops set 2 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0189 begin');
      await delayTick();
      const colors: string[] = ['#FF0000', '#00FF00', '#0000FF'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(0,255,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0189 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP5_19000
     * @tc.name      testLerpStopsGrid0190
     * @tc.desc      Verify lerpHexStops set 2 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0190 begin');
      await delayTick();
      const colors: string[] = ['#FF0000', '#00FF00', '#0000FF'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(0,128,128,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0190 end');
    })

  })
}
