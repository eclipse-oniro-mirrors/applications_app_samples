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

export default function ColorLerpCubeMatrixPart1Test(): void {
  describe('ColorLerpCubeMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_CLCP1_0100
     * @tc.name      testLerpCube0001
     * @tc.desc      Verify lerp pair 0 at t=0.05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0001 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.05);
      expect(out.r).assertEqual(5);
      expect(out.g).assertEqual(15);
      expect(out.b).assertEqual(25);
      expect(out.a).assertEqual(35);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_0200
     * @tc.name      testLerpCube0002
     * @tc.desc      Verify lerp pair 0 at t=0.15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0002 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.15);
      expect(out.r).assertEqual(15);
      expect(out.g).assertEqual(25);
      expect(out.b).assertEqual(35);
      expect(out.a).assertEqual(45);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_0300
     * @tc.name      testLerpCube0003
     * @tc.desc      Verify lerp pair 0 at t=0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0003 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.35);
      expect(out.r).assertEqual(35);
      expect(out.g).assertEqual(45);
      expect(out.b).assertEqual(55);
      expect(out.a).assertEqual(65);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_0400
     * @tc.name      testLerpCube0004
     * @tc.desc      Verify lerp pair 0 at t=0.45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0004 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.45);
      expect(out.r).assertEqual(45);
      expect(out.g).assertEqual(55);
      expect(out.b).assertEqual(65);
      expect(out.a).assertEqual(75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_0500
     * @tc.name      testLerpCube0005
     * @tc.desc      Verify lerp pair 0 at t=0.55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0005 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.55);
      expect(out.r).assertEqual(55);
      expect(out.g).assertEqual(65);
      expect(out.b).assertEqual(75);
      expect(out.a).assertEqual(85);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_0600
     * @tc.name      testLerpCube0006
     * @tc.desc      Verify lerp pair 0 at t=0.65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0006 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.65);
      expect(out.r).assertEqual(65);
      expect(out.g).assertEqual(75);
      expect(out.b).assertEqual(85);
      expect(out.a).assertEqual(95);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_0700
     * @tc.name      testLerpCube0007
     * @tc.desc      Verify lerp pair 0 at t=0.85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0007 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.85);
      expect(out.r).assertEqual(85);
      expect(out.g).assertEqual(95);
      expect(out.b).assertEqual(105);
      expect(out.a).assertEqual(115);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_0800
     * @tc.name      testLerpCube0008
     * @tc.desc      Verify lerp pair 0 at t=0.95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0008 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 10, b: 20, a: 30 };
      const c2: ColorRgba = { r: 100, g: 110, b: 120, a: 130 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.95);
      expect(out.r).assertEqual(95);
      expect(out.g).assertEqual(105);
      expect(out.b).assertEqual(115);
      expect(out.a).assertEqual(125);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_0900
     * @tc.name      testLerpCube0009
     * @tc.desc      Verify lerp pair 1 at t=0.05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0009 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.05);
      expect(out.r).assertEqual(242);
      expect(out.g).assertEqual(13);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(242);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1000
     * @tc.name      testLerpCube0010
     * @tc.desc      Verify lerp pair 1 at t=0.15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0010 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.15);
      expect(out.r).assertEqual(217);
      expect(out.g).assertEqual(38);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(217);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1100
     * @tc.name      testLerpCube0011
     * @tc.desc      Verify lerp pair 1 at t=0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0011 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.35);
      expect(out.r).assertEqual(166);
      expect(out.g).assertEqual(89);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(166);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1200
     * @tc.name      testLerpCube0012
     * @tc.desc      Verify lerp pair 1 at t=0.45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0012 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.45);
      expect(out.r).assertEqual(140);
      expect(out.g).assertEqual(115);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(140);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1300
     * @tc.name      testLerpCube0013
     * @tc.desc      Verify lerp pair 1 at t=0.55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0013 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.55);
      expect(out.r).assertEqual(115);
      expect(out.g).assertEqual(140);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(115);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1400
     * @tc.name      testLerpCube0014
     * @tc.desc      Verify lerp pair 1 at t=0.65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0014 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.65);
      expect(out.r).assertEqual(89);
      expect(out.g).assertEqual(166);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(89);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1500
     * @tc.name      testLerpCube0015
     * @tc.desc      Verify lerp pair 1 at t=0.85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0015 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.85);
      expect(out.r).assertEqual(38);
      expect(out.g).assertEqual(217);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(38);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1600
     * @tc.name      testLerpCube0016
     * @tc.desc      Verify lerp pair 1 at t=0.95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0016 begin');
      await delayTick();
      const c1: ColorRgba = { r: 255, g: 0, b: 0, a: 255 };
      const c2: ColorRgba = { r: 0, g: 255, b: 0, a: 0 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.95);
      expect(out.r).assertEqual(13);
      expect(out.g).assertEqual(242);
      expect(out.b).assertEqual(0);
      expect(out.a).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0016 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1700
     * @tc.name      testLerpCube0017
     * @tc.desc      Verify lerp pair 2 at t=0.05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0017 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.05);
      expect(out.r).assertEqual(20);
      expect(out.g).assertEqual(30);
      expect(out.b).assertEqual(40);
      expect(out.a).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0017 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1800
     * @tc.name      testLerpCube0018
     * @tc.desc      Verify lerp pair 2 at t=0.15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0018 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.15);
      expect(out.r).assertEqual(39);
      expect(out.g).assertEqual(49);
      expect(out.b).assertEqual(59);
      expect(out.a).assertEqual(69);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0018 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_1900
     * @tc.name      testLerpCube0019
     * @tc.desc      Verify lerp pair 2 at t=0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0019 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.35);
      expect(out.r).assertEqual(77);
      expect(out.g).assertEqual(87);
      expect(out.b).assertEqual(97);
      expect(out.a).assertEqual(107);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0019 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2000
     * @tc.name      testLerpCube0020
     * @tc.desc      Verify lerp pair 2 at t=0.45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0020 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.45);
      expect(out.r).assertEqual(96);
      expect(out.g).assertEqual(106);
      expect(out.b).assertEqual(116);
      expect(out.a).assertEqual(126);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0020 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2100
     * @tc.name      testLerpCube0021
     * @tc.desc      Verify lerp pair 2 at t=0.55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0021 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.55);
      expect(out.r).assertEqual(115);
      expect(out.g).assertEqual(125);
      expect(out.b).assertEqual(135);
      expect(out.a).assertEqual(145);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0021 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2200
     * @tc.name      testLerpCube0022
     * @tc.desc      Verify lerp pair 2 at t=0.65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0022 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.65);
      expect(out.r).assertEqual(134);
      expect(out.g).assertEqual(144);
      expect(out.b).assertEqual(154);
      expect(out.a).assertEqual(164);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0022 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2300
     * @tc.name      testLerpCube0023
     * @tc.desc      Verify lerp pair 2 at t=0.85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0023 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.85);
      expect(out.r).assertEqual(172);
      expect(out.g).assertEqual(182);
      expect(out.b).assertEqual(192);
      expect(out.a).assertEqual(202);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0023 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2400
     * @tc.name      testLerpCube0024
     * @tc.desc      Verify lerp pair 2 at t=0.95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0024 begin');
      await delayTick();
      const c1: ColorRgba = { r: 10, g: 20, b: 30, a: 40 };
      const c2: ColorRgba = { r: 200, g: 210, b: 220, a: 230 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.95);
      expect(out.r).assertEqual(191);
      expect(out.g).assertEqual(201);
      expect(out.b).assertEqual(211);
      expect(out.a).assertEqual(221);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0024 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2500
     * @tc.name      testLerpCube0025
     * @tc.desc      Verify lerp pair 3 at t=0.05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0025 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.05);
      expect(out.r).assertEqual(13);
      expect(out.g).assertEqual(13);
      expect(out.b).assertEqual(13);
      expect(out.a).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0025 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2600
     * @tc.name      testLerpCube0026
     * @tc.desc      Verify lerp pair 3 at t=0.15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0026 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.15);
      expect(out.r).assertEqual(38);
      expect(out.g).assertEqual(38);
      expect(out.b).assertEqual(38);
      expect(out.a).assertEqual(38);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0026 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2700
     * @tc.name      testLerpCube0027
     * @tc.desc      Verify lerp pair 3 at t=0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0027 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.35);
      expect(out.r).assertEqual(89);
      expect(out.g).assertEqual(89);
      expect(out.b).assertEqual(89);
      expect(out.a).assertEqual(89);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0027 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2800
     * @tc.name      testLerpCube0028
     * @tc.desc      Verify lerp pair 3 at t=0.45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0028 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.45);
      expect(out.r).assertEqual(115);
      expect(out.g).assertEqual(115);
      expect(out.b).assertEqual(115);
      expect(out.a).assertEqual(115);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0028 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_2900
     * @tc.name      testLerpCube0029
     * @tc.desc      Verify lerp pair 3 at t=0.55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0029 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.55);
      expect(out.r).assertEqual(140);
      expect(out.g).assertEqual(140);
      expect(out.b).assertEqual(140);
      expect(out.a).assertEqual(140);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0029 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3000
     * @tc.name      testLerpCube0030
     * @tc.desc      Verify lerp pair 3 at t=0.65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0030 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.65);
      expect(out.r).assertEqual(166);
      expect(out.g).assertEqual(166);
      expect(out.b).assertEqual(166);
      expect(out.a).assertEqual(166);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0030 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3100
     * @tc.name      testLerpCube0031
     * @tc.desc      Verify lerp pair 3 at t=0.85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0031 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.85);
      expect(out.r).assertEqual(217);
      expect(out.g).assertEqual(217);
      expect(out.b).assertEqual(217);
      expect(out.a).assertEqual(217);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0031 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3200
     * @tc.name      testLerpCube0032
     * @tc.desc      Verify lerp pair 3 at t=0.95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0032 begin');
      await delayTick();
      const c1: ColorRgba = { r: 0, g: 0, b: 0, a: 0 };
      const c2: ColorRgba = { r: 255, g: 255, b: 255, a: 255 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.95);
      expect(out.r).assertEqual(242);
      expect(out.g).assertEqual(242);
      expect(out.b).assertEqual(242);
      expect(out.a).assertEqual(242);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0032 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3300
     * @tc.name      testLerpCube0033
     * @tc.desc      Verify lerp pair 4 at t=0.05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0033 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 64, b: 32, a: 16 };
      const c2: ColorRgba = { r: 16, g: 32, b: 64, a: 128 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.05);
      expect(out.r).assertEqual(122);
      expect(out.g).assertEqual(62);
      expect(out.b).assertEqual(34);
      expect(out.a).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0033 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3400
     * @tc.name      testLerpCube0034
     * @tc.desc      Verify lerp pair 4 at t=0.15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0034 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 64, b: 32, a: 16 };
      const c2: ColorRgba = { r: 16, g: 32, b: 64, a: 128 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.15);
      expect(out.r).assertEqual(111);
      expect(out.g).assertEqual(59);
      expect(out.b).assertEqual(37);
      expect(out.a).assertEqual(33);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0034 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3500
     * @tc.name      testLerpCube0035
     * @tc.desc      Verify lerp pair 4 at t=0.35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0035 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 64, b: 32, a: 16 };
      const c2: ColorRgba = { r: 16, g: 32, b: 64, a: 128 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.35);
      expect(out.r).assertEqual(89);
      expect(out.g).assertEqual(53);
      expect(out.b).assertEqual(43);
      expect(out.a).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0035 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3600
     * @tc.name      testLerpCube0036
     * @tc.desc      Verify lerp pair 4 at t=0.45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0036 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 64, b: 32, a: 16 };
      const c2: ColorRgba = { r: 16, g: 32, b: 64, a: 128 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.45);
      expect(out.r).assertEqual(78);
      expect(out.g).assertEqual(50);
      expect(out.b).assertEqual(46);
      expect(out.a).assertEqual(66);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0036 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3700
     * @tc.name      testLerpCube0037
     * @tc.desc      Verify lerp pair 4 at t=0.55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0037 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 64, b: 32, a: 16 };
      const c2: ColorRgba = { r: 16, g: 32, b: 64, a: 128 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.55);
      expect(out.r).assertEqual(66);
      expect(out.g).assertEqual(46);
      expect(out.b).assertEqual(50);
      expect(out.a).assertEqual(78);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0037 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3800
     * @tc.name      testLerpCube0038
     * @tc.desc      Verify lerp pair 4 at t=0.65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0038 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 64, b: 32, a: 16 };
      const c2: ColorRgba = { r: 16, g: 32, b: 64, a: 128 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.65);
      expect(out.r).assertEqual(55);
      expect(out.g).assertEqual(43);
      expect(out.b).assertEqual(53);
      expect(out.a).assertEqual(89);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0038 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_3900
     * @tc.name      testLerpCube0039
     * @tc.desc      Verify lerp pair 4 at t=0.85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0039 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 64, b: 32, a: 16 };
      const c2: ColorRgba = { r: 16, g: 32, b: 64, a: 128 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.85);
      expect(out.r).assertEqual(33);
      expect(out.g).assertEqual(37);
      expect(out.b).assertEqual(59);
      expect(out.a).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0039 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CLCP1_4000
     * @tc.name      testLerpCube0040
     * @tc.desc      Verify lerp pair 4 at t=0.95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpCube0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0040 begin');
      await delayTick();
      const c1: ColorRgba = { r: 128, g: 64, b: 32, a: 16 };
      const c2: ColorRgba = { r: 16, g: 32, b: 64, a: 128 };
      const out: ColorRgba = ColorUtil.lerp(c1, c2, 0.95);
      expect(out.r).assertEqual(22);
      expect(out.g).assertEqual(34);
      expect(out.b).assertEqual(62);
      expect(out.a).assertEqual(122);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpCube0040 end');
    })

  })
}
