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
import { ColorUtil, ColorRgba } from '../../../main/ets/model/utils/ColorUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function ColorLerpCubeMatrixPart2Test(): void {
  describe('ColorLerpCubeMatrixPart2', () => {

    /**
     * @tc.number    SUB_CANVAS_CLCP2_4100
     * @tc.name      testLerpCube0041
     * @tc.desc      Verify lerp pair 5 at t=0.05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0041 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 251, b: 252, a: 253 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.05);
      expect(out.r).assertEqual(13);
      expect(out.g).assertEqual(14);
      expect(out.b).assertEqual(15);
      expect(out.a).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0041 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_4200
     * @tc.name      testLerpCube0042
     * @tc.desc      Verify lerp pair 5 at t=0.15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0042 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 251, b: 252, a: 253 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.15);
      expect(out.r).assertEqual(38);
      expect(out.g).assertEqual(39);
      expect(out.b).assertEqual(40);
      expect(out.a).assertEqual(41);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0042 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_4300
     * @tc.name      testLerpCube0043
     * @tc.desc      Verify lerp pair 5 at t=0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0043 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 251, b: 252, a: 253 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.35);
      expect(out.r).assertEqual(88);
      expect(out.g).assertEqual(89);
      expect(out.b).assertEqual(90);
      expect(out.a).assertEqual(91);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0043 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_4400
     * @tc.name      testLerpCube0044
     * @tc.desc      Verify lerp pair 5 at t=0.45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0044 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 251, b: 252, a: 253 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.45);
      expect(out.r).assertEqual(113);
      expect(out.g).assertEqual(114);
      expect(out.b).assertEqual(115);
      expect(out.a).assertEqual(116);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0044 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_4500
     * @tc.name      testLerpCube0045
     * @tc.desc      Verify lerp pair 5 at t=0.55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0045 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 251, b: 252, a: 253 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.55);
      expect(out.r).assertEqual(138);
      expect(out.g).assertEqual(139);
      expect(out.b).assertEqual(140);
      expect(out.a).assertEqual(141);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0045 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_4600
     * @tc.name      testLerpCube0046
     * @tc.desc      Verify lerp pair 5 at t=0.65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0046 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 251, b: 252, a: 253 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.65);
      expect(out.r).assertEqual(163);
      expect(out.g).assertEqual(164);
      expect(out.b).assertEqual(165);
      expect(out.a).assertEqual(166);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0046 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_4700
     * @tc.name      testLerpCube0047
     * @tc.desc      Verify lerp pair 5 at t=0.85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0047 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 251, b: 252, a: 253 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.85);
      expect(out.r).assertEqual(213);
      expect(out.g).assertEqual(214);
      expect(out.b).assertEqual(215);
      expect(out.a).assertEqual(216);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0047 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_4800
     * @tc.name      testLerpCube0048
     * @tc.desc      Verify lerp pair 5 at t=0.95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0048 begin');
      await delayTick();
      const c1: ColorRgba = { r: 1, g: 2, b: 3, a: 4 };
      const c2: ColorRgba = { r: 250, g: 251, b: 252, a: 253 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.95);
      expect(out.r).assertEqual(238);
      expect(out.g).assertEqual(239);
      expect(out.b).assertEqual(240);
      expect(out.a).assertEqual(241);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0048 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_4900
     * @tc.name      testLerpEdge0049
     * @tc.desc      Verify edge lerp pair 0 at t=0.02.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0049 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.02);
      expect(out.r).assertEqual(2);
      expect(out.g).assertEqual(12);
      expect(out.b).assertEqual(22);
      expect(out.a).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0049 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5000
     * @tc.name      testLerpEdge0050
     * @tc.desc      Verify edge lerp pair 0 at t=0.08.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0050 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.08);
      expect(out.r).assertEqual(8);
      expect(out.g).assertEqual(18);
      expect(out.b).assertEqual(28);
      expect(out.a).assertEqual(38);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0050 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5100
     * @tc.name      testLerpEdge0051
     * @tc.desc      Verify edge lerp pair 0 at t=0.92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0051 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.92);
      expect(out.r).assertEqual(92);
      expect(out.g).assertEqual(102);
      expect(out.b).assertEqual(112);
      expect(out.a).assertEqual(122);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0051 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5200
     * @tc.name      testLerpEdge0052
     * @tc.desc      Verify edge lerp pair 0 at t=0.98.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0052 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.98);
      expect(out.r).assertEqual(98);
      expect(out.g).assertEqual(108);
      expect(out.b).assertEqual(118);
      expect(out.a).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0052 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5300
     * @tc.name      testLerpEdge0053
     * @tc.desc      Verify edge lerp pair 1 at t=0.02.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0053 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.02);
      expect(out.r).assertEqual(250);
      expect(out.g).assertEqual(5);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0053 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5400
     * @tc.name      testLerpEdge0054
     * @tc.desc      Verify edge lerp pair 1 at t=0.08.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0054 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.08);
      expect(out.r).assertEqual(235);
      expect(out.g).assertEqual(20);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(235);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0054 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5500
     * @tc.name      testLerpEdge0055
     * @tc.desc      Verify edge lerp pair 1 at t=0.92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0055 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.92);
      expect(out.r).assertEqual(20);
      expect(out.g).assertEqual(235);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0055 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5600
     * @tc.name      testLerpEdge0056
     * @tc.desc      Verify edge lerp pair 1 at t=0.98.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0056 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.98);
      expect(out.r).assertEqual(5);
      expect(out.g).assertEqual(250);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0056 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5700
     * @tc.name      testLerpEdge0057
     * @tc.desc      Verify edge lerp pair 2 at t=0.02.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0057 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.02);
      expect(out.r).assertEqual(14);
      expect(out.g).assertEqual(24);
      expect(out.b).assertEqual(34);
      expect(out.a).assertEqual(44);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0057 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5800
     * @tc.name      testLerpEdge0058
     * @tc.desc      Verify edge lerp pair 2 at t=0.08.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0058 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.08);
      expect(out.r).assertEqual(25);
      expect(out.g).assertEqual(35);
      expect(out.b).assertEqual(45);
      expect(out.a).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0058 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_5900
     * @tc.name      testLerpEdge0059
     * @tc.desc      Verify edge lerp pair 2 at t=0.92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0059 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.92);
      expect(out.r).assertEqual(185);
      expect(out.g).assertEqual(195);
      expect(out.b).assertEqual(205);
      expect(out.a).assertEqual(215);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0059 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_6000
     * @tc.name      testLerpEdge0060
     * @tc.desc      Verify edge lerp pair 2 at t=0.98.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0060 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.98);
      expect(out.r).assertEqual(196);
      expect(out.g).assertEqual(206);
      expect(out.b).assertEqual(216);
      expect(out.a).assertEqual(226);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0060 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_6100
     * @tc.name      testLerpEdge0061
     * @tc.desc      Verify edge lerp pair 3 at t=0.02.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0061 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.02);
      expect(out.r).assertEqual(5);
      expect(out.g).assertEqual(5);
      expect(out.b).assertEqual(5);
      expect(out.a).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0061 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_6200
     * @tc.name      testLerpEdge0062
     * @tc.desc      Verify edge lerp pair 3 at t=0.08.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0062 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.08);
      expect(out.r).assertEqual(20);
      expect(out.g).assertEqual(20);
      expect(out.b).assertEqual(20);
      expect(out.a).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0062 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_6300
     * @tc.name      testLerpEdge0063
     * @tc.desc      Verify edge lerp pair 3 at t=0.92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0063 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.92);
      expect(out.r).assertEqual(235);
      expect(out.g).assertEqual(235);
      expect(out.b).assertEqual(235);
      expect(out.a).assertEqual(235);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0063 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP2_6400
     * @tc.name      testLerpEdge0064
     * @tc.desc      Verify edge lerp pair 3 at t=0.98.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpEdge0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0064 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.98);
      expect(out.r).assertEqual(250);
      expect(out.g).assertEqual(250);
      expect(out.b).assertEqual(250);
      expect(out.a).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpEdge0064 end');
    })

  })
}
