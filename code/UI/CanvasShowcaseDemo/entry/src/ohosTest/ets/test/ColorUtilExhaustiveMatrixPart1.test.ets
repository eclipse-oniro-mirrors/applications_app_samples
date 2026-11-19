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

export default function ColorUtilExhaustiveMatrixPart1Test(): void {
  describe('ColorUtilExhaustiveMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_CEXP1_0100
     * @tc.name      testParseRgb0001
     * @tc.desc      Verify parseHex(#000000) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0001 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#000000');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(0);
        expect(c.b).assertEqual(0);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_0200
     * @tc.name      testParseRgb0002
     * @tc.desc      Verify parseHex(#FFFFFF) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0002 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#FFFFFF');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(255);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(255);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_0300
     * @tc.name      testParseRgb0003
     * @tc.desc      Verify parseHex(#0F1020) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0003 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0F1020');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(15);
        expect(c.g).assertEqual(16);
        expect(c.b).assertEqual(32);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_0400
     * @tc.name      testParseRgb0004
     * @tc.desc      Verify parseHex(#7F80FF) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0004 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#7F80FF');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(127);
        expect(c.g).assertEqual(128);
        expect(c.b).assertEqual(255);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_0500
     * @tc.name      testParseRgb0005
     * @tc.desc      Verify parseHex(#10FF00) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0005 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#10FF00');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(16);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(0);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_0600
     * @tc.name      testParseRgb0006
     * @tc.desc      Verify parseHex(#ABCDEF) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0006 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#ABCDEF');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(171);
        expect(c.g).assertEqual(205);
        expect(c.b).assertEqual(239);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_0700
     * @tc.name      testParseRgb0007
     * @tc.desc      Verify parseHex(#010203) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0007 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#010203');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(1);
        expect(c.g).assertEqual(2);
        expect(c.b).assertEqual(3);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_0800
     * @tc.name      testParseRgb0008
     * @tc.desc      Verify parseHex(#FEDCBA) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0008 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#FEDCBA');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(254);
        expect(c.g).assertEqual(220);
        expect(c.b).assertEqual(186);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_0900
     * @tc.name      testParseRgb0009
     * @tc.desc      Verify parseHex(#00FF7F) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0009 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#00FF7F');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(127);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1000
     * @tc.name      testParseRgb0010
     * @tc.desc      Verify parseHex(#808080) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0010 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#808080');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(128);
        expect(c.g).assertEqual(128);
        expect(c.b).assertEqual(128);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1100
     * @tc.name      testParseRgb0011
     * @tc.desc      Verify parseHex(#123456) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0011 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#123456');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(18);
        expect(c.g).assertEqual(52);
        expect(c.b).assertEqual(86);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1200
     * @tc.name      testParseRgb0012
     * @tc.desc      Verify parseHex(#F0F0F0) returns RGB with alpha 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseRgb0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0012 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#F0F0F0');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.r).assertEqual(240);
        expect(c.g).assertEqual(240);
        expect(c.b).assertEqual(240);
        expect(c.a).assertEqual(255);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseRgb0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1300
     * @tc.name      testParseArgb0013
     * @tc.desc      Verify parseHex(#00112233) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0013 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#00112233');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(0);
        expect(c.r).assertEqual(17);
        expect(c.g).assertEqual(34);
        expect(c.b).assertEqual(51);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1400
     * @tc.name      testParseArgb0014
     * @tc.desc      Verify parseHex(#00AABBCC) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0014 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#00AABBCC');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(0);
        expect(c.r).assertEqual(170);
        expect(c.g).assertEqual(187);
        expect(c.b).assertEqual(204);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1500
     * @tc.name      testParseArgb0015
     * @tc.desc      Verify parseHex(#0000FF7F) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0015 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0000FF7F');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(0);
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(127);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1600
     * @tc.name      testParseArgb0016
     * @tc.desc      Verify parseHex(#01112233) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0016 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#01112233');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(1);
        expect(c.r).assertEqual(17);
        expect(c.g).assertEqual(34);
        expect(c.b).assertEqual(51);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0016 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1700
     * @tc.name      testParseArgb0017
     * @tc.desc      Verify parseHex(#01AABBCC) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0017 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#01AABBCC');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(1);
        expect(c.r).assertEqual(170);
        expect(c.g).assertEqual(187);
        expect(c.b).assertEqual(204);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0017 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1800
     * @tc.name      testParseArgb0018
     * @tc.desc      Verify parseHex(#0100FF7F) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0018 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#0100FF7F');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(1);
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(127);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0018 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_1900
     * @tc.name      testParseArgb0019
     * @tc.desc      Verify parseHex(#7F112233) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0019 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#7F112233');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(127);
        expect(c.r).assertEqual(17);
        expect(c.g).assertEqual(34);
        expect(c.b).assertEqual(51);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0019 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2000
     * @tc.name      testParseArgb0020
     * @tc.desc      Verify parseHex(#7FAABBCC) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0020 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#7FAABBCC');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(127);
        expect(c.r).assertEqual(170);
        expect(c.g).assertEqual(187);
        expect(c.b).assertEqual(204);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0020 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2100
     * @tc.name      testParseArgb0021
     * @tc.desc      Verify parseHex(#7F00FF7F) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0021 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#7F00FF7F');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(127);
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(127);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0021 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2200
     * @tc.name      testParseArgb0022
     * @tc.desc      Verify parseHex(#80112233) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0022 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#80112233');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(128);
        expect(c.r).assertEqual(17);
        expect(c.g).assertEqual(34);
        expect(c.b).assertEqual(51);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0022 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2300
     * @tc.name      testParseArgb0023
     * @tc.desc      Verify parseHex(#80AABBCC) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0023 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#80AABBCC');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(128);
        expect(c.r).assertEqual(170);
        expect(c.g).assertEqual(187);
        expect(c.b).assertEqual(204);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0023 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2400
     * @tc.name      testParseArgb0024
     * @tc.desc      Verify parseHex(#8000FF7F) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0024 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#8000FF7F');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(128);
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(127);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0024 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2500
     * @tc.name      testParseArgb0025
     * @tc.desc      Verify parseHex(#FF112233) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0025 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#FF112233');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(255);
        expect(c.r).assertEqual(17);
        expect(c.g).assertEqual(34);
        expect(c.b).assertEqual(51);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0025 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2600
     * @tc.name      testParseArgb0026
     * @tc.desc      Verify parseHex(#FFAABBCC) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0026 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#FFAABBCC');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(255);
        expect(c.r).assertEqual(170);
        expect(c.g).assertEqual(187);
        expect(c.b).assertEqual(204);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0026 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2700
     * @tc.name      testParseArgb0027
     * @tc.desc      Verify parseHex(#FF00FF7F) returns ARGB channels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseArgb0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0027 begin');
      await delayTick();
      const c: ColorRgba | null = ColorUtil.parseHex('#FF00FF7F');
      expect(c !== null).assertTrue();
      if (c !== null) {
        expect(c.a).assertEqual(255);
        expect(c.r).assertEqual(0);
        expect(c.g).assertEqual(255);
        expect(c.b).assertEqual(127);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseArgb0027 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2800
     * @tc.name      testParseInvalid0028
     * @tc.desc      Verify parseHex('') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0028 begin');
      await delayTick();
      expect(ColorUtil.parseHex('') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0028 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_2900
     * @tc.name      testParseInvalid0029
     * @tc.desc      Verify parseHex('#') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0029 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0029 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3000
     * @tc.name      testParseInvalid0030
     * @tc.desc      Verify parseHex('#12345') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0030 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#12345') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0030 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3100
     * @tc.name      testParseInvalid0031
     * @tc.desc      Verify parseHex('#1234567') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0031 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#1234567') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0031 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3200
     * @tc.name      testParseInvalid0032
     * @tc.desc      Verify parseHex('#123456789') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0032 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#123456789') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0032 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3300
     * @tc.name      testParseInvalid0033
     * @tc.desc      Verify parseHex('123456') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0033 begin');
      await delayTick();
      expect(ColorUtil.parseHex('123456') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0033 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3400
     * @tc.name      testParseInvalid0034
     * @tc.desc      Verify parseHex('##123456') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0034 begin');
      await delayTick();
      expect(ColorUtil.parseHex('##123456') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0034 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3500
     * @tc.name      testParseInvalid0035
     * @tc.desc      Verify parseHex('#GGGGGG') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0035 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#GGGGGG') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0035 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3600
     * @tc.name      testParseInvalid0036
     * @tc.desc      Verify parseHex('#12G456') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0036 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#12G456') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0036 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3700
     * @tc.name      testParseInvalid0037
     * @tc.desc      Verify parseHex('#12345Z') returns null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParseInvalid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0037 begin');
      await delayTick();
      expect(ColorUtil.parseHex('#12345Z') === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInvalid0037 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3800
     * @tc.name      testToHex0038
     * @tc.desc      Verify toHex masks channel value 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0038 begin');
      await delayTick();
      expect(ColorUtil.toHex(0, 7, 13)).assertEqual('#00070D');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0038 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_3900
     * @tc.name      testToHex0039
     * @tc.desc      Verify toHex masks channel value 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0039 begin');
      await delayTick();
      expect(ColorUtil.toHex(1, 8, 14)).assertEqual('#01080E');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0039 end');
    })

    /**
     * @tc.number    SUB_CANVAS_CEXP1_4000
     * @tc.name      testToHex0040
     * @tc.desc      Verify toHex masks channel value 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToHex0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0040 begin');
      await delayTick();
      expect(ColorUtil.toHex(15, 22, 28)).assertEqual('#0F161C');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToHex0040 end');
    })

  })
}
