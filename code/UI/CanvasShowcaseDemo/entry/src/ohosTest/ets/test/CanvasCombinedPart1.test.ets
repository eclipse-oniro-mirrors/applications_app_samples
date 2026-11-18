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

export default function CanvasCombinedPart1Test(): void {
  describe('CvG1', () => {
    /**
     * @tc.number    SUB_CANVAS_CLSP1_0100
     * @tc.name      testLerpGrid0001
     * @tc.desc      Verify lerp pair 1 at t=0. Plus Verify lerp pair 1 at t=0.1. Plus Verify lerp pair 1 at t=0.25. Plus Verify lerp pair 1 at t=0.33. Plus Verify lerp pair 1 at t=0.5. Plus Verify lerp pair 1 at t=0.66. Plus Verify lerp pair 1 at t=0.75. Plus Verify lerp pair 1 at t=0.9. Plus Verify lerp pair 1 at t=1. Plus Verify lerp pair 1 at t=-0.5. Plus Verify lerp pair 1 at t=1.5. Plus Verify lerp pair 2 at t=0. Plus Verify lerp pair 2 at t=0.1. Plus Verify lerp pair 2 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0001 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(255);
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(26);
      expect(out.g).assertEqual(26);
      expect(out.b).assertEqual(26);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(64);
      expect(out.g).assertEqual(64);
      expect(out.b).assertEqual(64);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(84);
      expect(out.g).assertEqual(84);
      expect(out.b).assertEqual(84);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(128);
      expect(out.g).assertEqual(128);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(168);
      expect(out.g).assertEqual(168);
      expect(out.b).assertEqual(168);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(191);
      expect(out.g).assertEqual(191);
      expect(out.b).assertEqual(191);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(230);
      expect(out.g).assertEqual(230);
      expect(out.b).assertEqual(230);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(255);
      expect(out.g).assertEqual(255);
      expect(out.b).assertEqual(255);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(255);
      expect(out.g).assertEqual(255);
      expect(out.b).assertEqual(255);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(255);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(230);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(26);
      expect(out.a).assertEqual(255);
      }
      {
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(191);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(64);
      expect(out.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0001 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_1500
     * @tc.name      testLerpGrid0015
     * @tc.desc      Verify lerp pair 2 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0015 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(171);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(84);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0015 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_1600
     * @tc.name      testLerpGrid0016
     * @tc.desc      Verify lerp pair 2 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0016 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(128);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0016 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_1700
     * @tc.name      testLerpGrid0017
     * @tc.desc      Verify lerp pair 2 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0017 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(87);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(168);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0017 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_1800
     * @tc.name      testLerpGrid0018
     * @tc.desc      Verify lerp pair 2 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0018 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(64);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(191);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0018 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_1900
     * @tc.name      testLerpGrid0019
     * @tc.desc      Verify lerp pair 2 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0019 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(26);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(230);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0019 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2000
     * @tc.name      testLerpGrid0020
     * @tc.desc      Verify lerp pair 2 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0020 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(255);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0020 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2100
     * @tc.name      testLerpGrid0021
     * @tc.desc      Verify lerp pair 2 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0021 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(255);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0021 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2200
     * @tc.name      testLerpGrid0022
     * @tc.desc      Verify lerp pair 2 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0022 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 0, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(0);
      expect(out.b).assertEqual(255);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0022 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2300
     * @tc.name      testLerpGrid0023
     * @tc.desc      Verify lerp pair 3 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0023 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(10);
      expect(out.g).assertEqual(20);
      expect(out.b).assertEqual(30);
      expect(out.a).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0023 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2400
     * @tc.name      testLerpGrid0024
     * @tc.desc      Verify lerp pair 3 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0024 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(29);
      expect(out.g).assertEqual(39);
      expect(out.b).assertEqual(49);
      expect(out.a).assertEqual(59);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0024 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2500
     * @tc.name      testLerpGrid0025
     * @tc.desc      Verify lerp pair 3 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0025 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(58);
      expect(out.g).assertEqual(68);
      expect(out.b).assertEqual(78);
      expect(out.a).assertEqual(88);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0025 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2600
     * @tc.name      testLerpGrid0026
     * @tc.desc      Verify lerp pair 3 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0026 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(73);
      expect(out.g).assertEqual(83);
      expect(out.b).assertEqual(93);
      expect(out.a).assertEqual(103);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0026 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2700
     * @tc.name      testLerpGrid0027
     * @tc.desc      Verify lerp pair 3 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0027 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(105);
      expect(out.g).assertEqual(115);
      expect(out.b).assertEqual(125);
      expect(out.a).assertEqual(135);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0027 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2800
     * @tc.name      testLerpGrid0028
     * @tc.desc      Verify lerp pair 3 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0028 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(135);
      expect(out.g).assertEqual(145);
      expect(out.b).assertEqual(155);
      expect(out.a).assertEqual(165);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0028 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_2900
     * @tc.name      testLerpGrid0029
     * @tc.desc      Verify lerp pair 3 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0029 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(153);
      expect(out.g).assertEqual(163);
      expect(out.b).assertEqual(173);
      expect(out.a).assertEqual(183);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0029 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3000
     * @tc.name      testLerpGrid0030
     * @tc.desc      Verify lerp pair 3 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0030 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(181);
      expect(out.g).assertEqual(191);
      expect(out.b).assertEqual(201);
      expect(out.a).assertEqual(211);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0030 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3100
     * @tc.name      testLerpGrid0031
     * @tc.desc      Verify lerp pair 3 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0031 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(200);
      expect(out.g).assertEqual(210);
      expect(out.b).assertEqual(220);
      expect(out.a).assertEqual(230);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0031 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3200
     * @tc.name      testLerpGrid0032
     * @tc.desc      Verify lerp pair 3 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0032 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(10);
      expect(out.g).assertEqual(20);
      expect(out.b).assertEqual(30);
      expect(out.a).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0032 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3300
     * @tc.name      testLerpGrid0033
     * @tc.desc      Verify lerp pair 3 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0033 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(200);
      expect(out.g).assertEqual(210);
      expect(out.b).assertEqual(220);
      expect(out.a).assertEqual(230);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0033 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3400
     * @tc.name      testLerpGrid0034
     * @tc.desc      Verify lerp pair 4 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0034 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(1);
      expect(out.g).assertEqual(2);
      expect(out.b).assertEqual(3);
      expect(out.a).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0034 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3500
     * @tc.name      testLerpGrid0035
     * @tc.desc      Verify lerp pair 4 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0035 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(26);
      expect(out.g).assertEqual(26);
      expect(out.b).assertEqual(26);
      expect(out.a).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0035 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3600
     * @tc.name      testLerpGrid0036
     * @tc.desc      Verify lerp pair 4 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0036 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(63);
      expect(out.g).assertEqual(62);
      expect(out.b).assertEqual(60);
      expect(out.a).assertEqual(58);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0036 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3700
     * @tc.name      testLerpGrid0037
     * @tc.desc      Verify lerp pair 4 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0037 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(83);
      expect(out.g).assertEqual(81);
      expect(out.b).assertEqual(78);
      expect(out.a).assertEqual(75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0037 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3800
     * @tc.name      testLerpGrid0038
     * @tc.desc      Verify lerp pair 4 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0038 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(126);
      expect(out.g).assertEqual(121);
      expect(out.b).assertEqual(117);
      expect(out.a).assertEqual(112);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0038 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_3900
     * @tc.name      testLerpGrid0039
     * @tc.desc      Verify lerp pair 4 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0039 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(165);
      expect(out.g).assertEqual(159);
      expect(out.b).assertEqual(153);
      expect(out.a).assertEqual(147);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0039 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP1_4000
     * @tc.name      testLerpGrid0040
     * @tc.desc      Verify lerp pair 4 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0040 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(188);
      expect(out.g).assertEqual(181);
      expect(out.b).assertEqual(173);
      expect(out.a).assertEqual(166);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0040 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_4100
     * @tc.name      testLerpGrid0041
     * @tc.desc      Verify lerp pair 4 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0041 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(225);
      expect(out.g).assertEqual(216);
      expect(out.b).assertEqual(207);
      expect(out.a).assertEqual(198);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0041 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_4200
     * @tc.name      testLerpGrid0042
     * @tc.desc      Verify lerp pair 4 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0042 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(250);
      expect(out.g).assertEqual(240);
      expect(out.b).assertEqual(230);
      expect(out.a).assertEqual(220);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0042 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_4300
     * @tc.name      testLerpGrid0043
     * @tc.desc      Verify lerp pair 4 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0043 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(1);
      expect(out.g).assertEqual(2);
      expect(out.b).assertEqual(3);
      expect(out.a).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0043 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_4400
     * @tc.name      testLerpGrid0044
     * @tc.desc      Verify lerp pair 4 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0044 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 240, b: 230, a: 220 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(250);
      expect(out.g).assertEqual(240);
      expect(out.b).assertEqual(230);
      expect(out.a).assertEqual(220);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0044 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_4500
     * @tc.name      testLerpGrid0045
     * @tc.desc      Verify lerp pair 5 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0045 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(128);
      expect(out.g).assertEqual(128);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0045 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_4600
     * @tc.name      testLerpGrid0046
     * @tc.desc      Verify lerp pair 5 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0046 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(115);
      expect(out.g).assertEqual(141);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(141);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0046 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_4700
     * @tc.name      testLerpGrid0047
     * @tc.desc      Verify lerp pair 5 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0047 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(96);
      expect(out.g).assertEqual(160);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(160);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0047 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_4800
     * @tc.name      testLerpGrid0048
     * @tc.desc      Verify lerp pair 5 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0048 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(86);
      expect(out.g).assertEqual(170);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(170);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0048 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_4900
     * @tc.name      testLerpGrid0049
     * @tc.desc      Verify lerp pair 5 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0049 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(64);
      expect(out.g).assertEqual(192);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(192);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0049 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5000
     * @tc.name      testLerpGrid0050
     * @tc.desc      Verify lerp pair 5 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0050 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(44);
      expect(out.g).assertEqual(212);
      expect(out.b).assertEqual(127);
      expect(out.a).assertEqual(212);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0050 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5100
     * @tc.name      testLerpGrid0051
     * @tc.desc      Verify lerp pair 5 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0051 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(32);
      expect(out.g).assertEqual(223);
      expect(out.b).assertEqual(127);
      expect(out.a).assertEqual(223);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0051 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5200
     * @tc.name      testLerpGrid0052
     * @tc.desc      Verify lerp pair 5 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0052 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(13);
      expect(out.g).assertEqual(242);
      expect(out.b).assertEqual(127);
      expect(out.a).assertEqual(242);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0052 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5300
     * @tc.name      testLerpGrid0053
     * @tc.desc      Verify lerp pair 5 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0053 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(255);
      expect(out.b).assertEqual(127);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0053 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5400
     * @tc.name      testLerpGrid0054
     * @tc.desc      Verify lerp pair 5 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0054 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(128);
      expect(out.g).assertEqual(128);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0054 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5500
     * @tc.name      testLerpGrid0055
     * @tc.desc      Verify lerp pair 5 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0055 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 128, b: 128, a: 128 };
      const c2: ColorRgba = { r: 0, g: 255, b: 127, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(0);
      expect(out.g).assertEqual(255);
      expect(out.b).assertEqual(127);
      expect(out.a).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0055 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5600
     * @tc.name      testLerpGrid0056
     * @tc.desc      Verify lerp pair 6 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0056 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(90);
      expect(out.g).assertEqual(45);
      expect(out.b).assertEqual(135);
      expect(out.a).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0056 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5700
     * @tc.name      testLerpGrid0057
     * @tc.desc      Verify lerp pair 6 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0057 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(99);
      expect(out.g).assertEqual(50);
      expect(out.b).assertEqual(126);
      expect(out.a).assertEqual(168);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0057 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5800
     * @tc.name      testLerpGrid0058
     * @tc.desc      Verify lerp pair 6 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0058 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(113);
      expect(out.g).assertEqual(56);
      expect(out.b).assertEqual(113);
      expect(out.a).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0058 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_5900
     * @tc.name      testLerpGrid0059
     * @tc.desc      Verify lerp pair 6 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0059 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(120);
      expect(out.g).assertEqual(60);
      expect(out.b).assertEqual(105);
      expect(out.a).assertEqual(140);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0059 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6000
     * @tc.name      testLerpGrid0060
     * @tc.desc      Verify lerp pair 6 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0060 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(135);
      expect(out.g).assertEqual(68);
      expect(out.b).assertEqual(90);
      expect(out.a).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0060 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6100
     * @tc.name      testLerpGrid0061
     * @tc.desc      Verify lerp pair 6 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0061 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(149);
      expect(out.g).assertEqual(75);
      expect(out.b).assertEqual(76);
      expect(out.a).assertEqual(101);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0061 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6200
     * @tc.name      testLerpGrid0062
     * @tc.desc      Verify lerp pair 6 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0062 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(158);
      expect(out.g).assertEqual(79);
      expect(out.b).assertEqual(68);
      expect(out.a).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0062 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6300
     * @tc.name      testLerpGrid0063
     * @tc.desc      Verify lerp pair 6 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0063 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(171);
      expect(out.g).assertEqual(86);
      expect(out.b).assertEqual(54);
      expect(out.a).assertEqual(72);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0063 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6400
     * @tc.name      testLerpGrid0064
     * @tc.desc      Verify lerp pair 6 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0064 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(180);
      expect(out.g).assertEqual(90);
      expect(out.b).assertEqual(45);
      expect(out.a).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0064 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6500
     * @tc.name      testLerpGrid0065
     * @tc.desc      Verify lerp pair 6 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0065 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(90);
      expect(out.g).assertEqual(45);
      expect(out.b).assertEqual(135);
      expect(out.a).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0065 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6600
     * @tc.name      testLerpGrid0066
     * @tc.desc      Verify lerp pair 6 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0066 begin');
      await delayTick();
      const c1: ColorRgba = { r: 90, g: 45, b: 135, a: 180 };
      const c2: ColorRgba = { r: 180, g: 90, b: 45, a: 60 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(180);
      expect(out.g).assertEqual(90);
      expect(out.b).assertEqual(45);
      expect(out.a).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0066 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6700
     * @tc.name      testLerpGrid0067
     * @tc.desc      Verify lerp pair 7 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0067 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(7);
      expect(out.g).assertEqual(70);
      expect(out.b).assertEqual(77);
      expect(out.a).assertEqual(177);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0067 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6800
     * @tc.name      testLerpGrid0068
     * @tc.desc      Verify lerp pair 7 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0068 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(24);
      expect(out.g).assertEqual(71);
      expect(out.b).assertEqual(76);
      expect(out.a).assertEqual(160);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0068 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_6900
     * @tc.name      testLerpGrid0069
     * @tc.desc      Verify lerp pair 7 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0069 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(50);
      expect(out.g).assertEqual(72);
      expect(out.b).assertEqual(75);
      expect(out.a).assertEqual(135);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0069 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7000
     * @tc.name      testLerpGrid0070
     * @tc.desc      Verify lerp pair 7 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0070 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(63);
      expect(out.g).assertEqual(72);
      expect(out.b).assertEqual(75);
      expect(out.a).assertEqual(121);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0070 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7100
     * @tc.name      testLerpGrid0071
     * @tc.desc      Verify lerp pair 7 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0071 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(92);
      expect(out.g).assertEqual(74);
      expect(out.b).assertEqual(74);
      expect(out.a).assertEqual(92);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0071 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7200
     * @tc.name      testLerpGrid0072
     * @tc.desc      Verify lerp pair 7 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0072 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(119);
      expect(out.g).assertEqual(75);
      expect(out.b).assertEqual(72);
      expect(out.a).assertEqual(65);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0072 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7300
     * @tc.name      testLerpGrid0073
     * @tc.desc      Verify lerp pair 7 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0073 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(135);
      expect(out.g).assertEqual(75);
      expect(out.b).assertEqual(72);
      expect(out.a).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0073 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7400
     * @tc.name      testLerpGrid0074
     * @tc.desc      Verify lerp pair 7 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0074 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(160);
      expect(out.g).assertEqual(76);
      expect(out.b).assertEqual(71);
      expect(out.a).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0074 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7500
     * @tc.name      testLerpGrid0075
     * @tc.desc      Verify lerp pair 7 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0075 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(177);
      expect(out.g).assertEqual(77);
      expect(out.b).assertEqual(70);
      expect(out.a).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0075 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7600
     * @tc.name      testLerpGrid0076
     * @tc.desc      Verify lerp pair 7 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0076 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(7);
      expect(out.g).assertEqual(70);
      expect(out.b).assertEqual(77);
      expect(out.a).assertEqual(177);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0076 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7700
     * @tc.name      testLerpGrid0077
     * @tc.desc      Verify lerp pair 7 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0077 begin');
      await delayTick();
      const c1: ColorRgba = { r: 7, g: 70, b: 77, a: 177 };
      const c2: ColorRgba = { r: 177, g: 77, b: 70, a: 7 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(177);
      expect(out.g).assertEqual(77);
      expect(out.b).assertEqual(70);
      expect(out.a).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0077 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7800
     * @tc.name      testLerpGrid0078
     * @tc.desc      Verify lerp pair 8 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0078 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(33);
      expect(out.g).assertEqual(99);
      expect(out.b).assertEqual(66);
      expect(out.a).assertEqual(132);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0078 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_7900
     * @tc.name      testLerpGrid0079
     * @tc.desc      Verify lerp pair 8 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0079 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(40);
      expect(out.g).assertEqual(96);
      expect(out.b).assertEqual(63);
      expect(out.a).assertEqual(139);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0079 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP2_8000
     * @tc.name      testLerpGrid0080
     * @tc.desc      Verify lerp pair 8 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0080 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(50);
      expect(out.g).assertEqual(91);
      expect(out.b).assertEqual(58);
      expect(out.a).assertEqual(149);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0080 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_8100
     * @tc.name      testLerpGrid0081
     * @tc.desc      Verify lerp pair 8 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0081 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(55);
      expect(out.g).assertEqual(88);
      expect(out.b).assertEqual(55);
      expect(out.a).assertEqual(154);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0081 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_8200
     * @tc.name      testLerpGrid0082
     * @tc.desc      Verify lerp pair 8 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0082 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(66);
      expect(out.g).assertEqual(83);
      expect(out.b).assertEqual(50);
      expect(out.a).assertEqual(165);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0082 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_8300
     * @tc.name      testLerpGrid0083
     * @tc.desc      Verify lerp pair 8 at t=0.66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0083 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.66);
      expect(out.r).assertEqual(77);
      expect(out.g).assertEqual(77);
      expect(out.b).assertEqual(44);
      expect(out.a).assertEqual(176);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0083 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_8400
     * @tc.name      testLerpGrid0084
     * @tc.desc      Verify lerp pair 8 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0084 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.75);
      expect(out.r).assertEqual(83);
      expect(out.g).assertEqual(74);
      expect(out.b).assertEqual(41);
      expect(out.a).assertEqual(182);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0084 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_8500
     * @tc.name      testLerpGrid0085
     * @tc.desc      Verify lerp pair 8 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0085 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.9);
      expect(out.r).assertEqual(92);
      expect(out.g).assertEqual(69);
      expect(out.b).assertEqual(36);
      expect(out.a).assertEqual(191);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0085 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_8600
     * @tc.name      testLerpGrid0086
     * @tc.desc      Verify lerp pair 8 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0086 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1);
      expect(out.r).assertEqual(99);
      expect(out.g).assertEqual(66);
      expect(out.b).assertEqual(33);
      expect(out.a).assertEqual(198);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0086 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_8700
     * @tc.name      testLerpGrid0087
     * @tc.desc      Verify lerp pair 8 at t=-0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0087 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, -0.5);
      expect(out.r).assertEqual(33);
      expect(out.g).assertEqual(99);
      expect(out.b).assertEqual(66);
      expect(out.a).assertEqual(132);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0087 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_8800
     * @tc.name      testLerpGrid0088
     * @tc.desc      Verify lerp pair 8 at t=1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0088 begin');
      await delayTick();
      const c1: ColorRgba = { r: 33, g: 99, b: 66, a: 132 };
      const c2: ColorRgba = { r: 99, g: 66, b: 33, a: 198 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 1.5);
      expect(out.r).assertEqual(99);
      expect(out.g).assertEqual(66);
      expect(out.b).assertEqual(33);
      expect(out.a).assertEqual(198);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0088 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_8900
     * @tc.name      testLerpGrid0089
     * @tc.desc      Verify lerp pair 9 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0089 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0);
      expect(out.r).assertEqual(1);
      expect(out.g).assertEqual(1);
      expect(out.b).assertEqual(1);
      expect(out.a).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0089 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_9000
     * @tc.name      testLerpGrid0090
     * @tc.desc      Verify lerp pair 9 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0090 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.1);
      expect(out.r).assertEqual(26);
      expect(out.g).assertEqual(26);
      expect(out.b).assertEqual(26);
      expect(out.a).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0090 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_9100
     * @tc.name      testLerpGrid0091
     * @tc.desc      Verify lerp pair 9 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0091 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.25);
      expect(out.r).assertEqual(64);
      expect(out.g).assertEqual(64);
      expect(out.b).assertEqual(64);
      expect(out.a).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0091 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_9200
     * @tc.name      testLerpGrid0092
     * @tc.desc      Verify lerp pair 9 at t=0.33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0092 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.33);
      expect(out.r).assertEqual(84);
      expect(out.g).assertEqual(84);
      expect(out.b).assertEqual(84);
      expect(out.a).assertEqual(84);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0092 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP3_9300
     * @tc.name      testLerpGrid0093
     * @tc.desc      Verify lerp pair 9 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpGrid0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0093 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 1, b: 1, a: 1 };
      const c2: ColorRgba = { r: 254, g: 254, b: 254, a: 254 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.5);
      expect(out.r).assertEqual(128);
      expect(out.g).assertEqual(128);
      expect(out.b).assertEqual(128);
      expect(out.a).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpGrid0093 end');
    })

  })
}
