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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { nativeAdd } from 'library';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function nativeAddSeriesMatrixTest() {
  describe('NativeAddSeriesMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0001
     * @tc.name      testNativeSeriesSum0001
     * @tc.desc      Accumulate 10 steps of 1 from -500 through the HAR NAPI add and expect -490
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -500;
      for (let stepIndex: number = 0; stepIndex < 10; stepIndex++) {
        total = nativeAdd(total, 1);
      }
      logCase('testNativeSeriesSum0001', `total=${total}`);
      expect(total).assertEqual(-490);
      expect(nativeAdd(-500, 10 * 1)).assertEqual(-490);
      expect(nativeAdd(-490, -(10 * 1))).assertEqual(-500);
      expect(nativeAdd(-490, -(-490))).assertEqual(0);
      expect(Math.abs(nativeAdd(-500, 10 * 1)) % 2).assertEqual(0);
      expect(nativeAdd(-500, -490)).assertEqual(-490 + -500);
      expect(nativeAdd(-500, 10 * 1) > -500).assertTrue();
      expect(nativeAdd(-500, 10)).assertEqual(-490);
      {
      let total: number = -487;
      for (let stepIndex: number = 0; stepIndex < 11; stepIndex++) {
        total = nativeAdd(total, 2);
      }
      logCase('testNativeSeriesSum0002', `total=${total}`);
      expect(total).assertEqual(-465);
      expect(nativeAdd(-487, 11 * 2)).assertEqual(-465);
      expect(nativeAdd(-465, -(11 * 2))).assertEqual(-487);
      expect(nativeAdd(-465, -(-465))).assertEqual(0);
      expect(nativeAdd(-487, 11 * 2) > -487).assertTrue();
      expect(nativeAdd(-487, 22)).assertEqual(-465);
      }
      {
      let total: number = -474;
      for (let stepIndex: number = 0; stepIndex < 12; stepIndex++) {
        total = nativeAdd(total, 3);
      }
      logCase('testNativeSeriesSum0003', `total=${total}`);
      expect(total).assertEqual(-438);
      expect(nativeAdd(-474, 12 * 3)).assertEqual(-438);
      expect(nativeAdd(-438, -(12 * 3))).assertEqual(-474);
      expect(nativeAdd(-438, -(-438))).assertEqual(0);
      expect(Math.abs(nativeAdd(-474, 12 * 3)) % 2).assertEqual(0);
      expect(nativeAdd(-474, -438)).assertEqual(-438 + -474);
      expect(nativeAdd(-474, 12 * 3) > -474).assertTrue();
      expect(nativeAdd(-474, 36)).assertEqual(-438);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0004
     * @tc.name      testNativeSeriesSum0004
     * @tc.desc      Accumulate 13 steps of 4 from -461 through the HAR NAPI add and expect -409
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -461;
      for (let stepIndex: number = 0; stepIndex < 13; stepIndex++) {
        total = nativeAdd(total, 4);
      }
      logCase('testNativeSeriesSum0004', `total=${total}`);
      expect(total).assertEqual(-409);
      expect(nativeAdd(-461, 13 * 4)).assertEqual(-409);
      expect(nativeAdd(-409, -(13 * 4))).assertEqual(-461);
      expect(nativeAdd(-409, -(-409))).assertEqual(0);
      expect(nativeAdd(-461, 13 * 4) > -461).assertTrue();
      expect(nativeAdd(-461, 52)).assertEqual(-409);
      {
      let total: number = -448;
      for (let stepIndex: number = 0; stepIndex < 14; stepIndex++) {
        total = nativeAdd(total, 5);
      }
      logCase('testNativeSeriesSum0005', `total=${total}`);
      expect(total).assertEqual(-378);
      expect(nativeAdd(-448, 14 * 5)).assertEqual(-378);
      expect(nativeAdd(-378, -(14 * 5))).assertEqual(-448);
      expect(nativeAdd(-378, -(-378))).assertEqual(0);
      expect(Math.abs(nativeAdd(-448, 14 * 5)) % 2).assertEqual(0);
      expect(nativeAdd(-448, -378)).assertEqual(-378 + -448);
      expect(nativeAdd(-448, 14 * 5) > -448).assertTrue();
      expect(nativeAdd(-448, 70)).assertEqual(-378);
      }
      {
      let total: number = -435;
      for (let stepIndex: number = 0; stepIndex < 15; stepIndex++) {
        total = nativeAdd(total, 6);
      }
      logCase('testNativeSeriesSum0006', `total=${total}`);
      expect(total).assertEqual(-345);
      expect(nativeAdd(-435, 15 * 6)).assertEqual(-345);
      expect(nativeAdd(-345, -(15 * 6))).assertEqual(-435);
      expect(nativeAdd(-345, -(-345))).assertEqual(0);
      expect(nativeAdd(-435, 15 * 6) > -435).assertTrue();
      expect(nativeAdd(-435, 90)).assertEqual(-345);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0007
     * @tc.name      testNativeSeriesSum0007
     * @tc.desc      Accumulate 16 steps of 7 from -422 through the HAR NAPI add and expect -310
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -422;
      for (let stepIndex: number = 0; stepIndex < 16; stepIndex++) {
        total = nativeAdd(total, 7);
      }
      logCase('testNativeSeriesSum0007', `total=${total}`);
      expect(total).assertEqual(-310);
      expect(nativeAdd(-422, 16 * 7)).assertEqual(-310);
      expect(nativeAdd(-310, -(16 * 7))).assertEqual(-422);
      expect(nativeAdd(-310, -(-310))).assertEqual(0);
      expect(Math.abs(nativeAdd(-422, 16 * 7)) % 2).assertEqual(0);
      expect(nativeAdd(-422, -310)).assertEqual(-310 + -422);
      expect(nativeAdd(-422, 16 * 7) > -422).assertTrue();
      expect(nativeAdd(-422, 112)).assertEqual(-310);
      {
      let total: number = -409;
      for (let stepIndex: number = 0; stepIndex < 17; stepIndex++) {
        total = nativeAdd(total, 8);
      }
      logCase('testNativeSeriesSum0008', `total=${total}`);
      expect(total).assertEqual(-273);
      expect(nativeAdd(-409, 17 * 8)).assertEqual(-273);
      expect(nativeAdd(-273, -(17 * 8))).assertEqual(-409);
      expect(nativeAdd(-273, -(-273))).assertEqual(0);
      expect(nativeAdd(-409, 17 * 8) > -409).assertTrue();
      expect(nativeAdd(-409, 136)).assertEqual(-273);
      }
      {
      let total: number = -396;
      for (let stepIndex: number = 0; stepIndex < 18; stepIndex++) {
        total = nativeAdd(total, 9);
      }
      logCase('testNativeSeriesSum0009', `total=${total}`);
      expect(total).assertEqual(-234);
      expect(nativeAdd(-396, 18 * 9)).assertEqual(-234);
      expect(nativeAdd(-234, -(18 * 9))).assertEqual(-396);
      expect(nativeAdd(-234, -(-234))).assertEqual(0);
      expect(Math.abs(nativeAdd(-396, 18 * 9)) % 2).assertEqual(0);
      expect(nativeAdd(-396, -234)).assertEqual(-234 + -396);
      expect(nativeAdd(-396, 18 * 9) > -396).assertTrue();
      expect(nativeAdd(-396, 162)).assertEqual(-234);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0010
     * @tc.name      testNativeSeriesSum0010
     * @tc.desc      Accumulate 19 steps of 10 from -383 through the HAR NAPI add and expect -193
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -383;
      for (let stepIndex: number = 0; stepIndex < 19; stepIndex++) {
        total = nativeAdd(total, 10);
      }
      logCase('testNativeSeriesSum0010', `total=${total}`);
      expect(total).assertEqual(-193);
      expect(nativeAdd(-383, 19 * 10)).assertEqual(-193);
      expect(nativeAdd(-193, -(19 * 10))).assertEqual(-383);
      expect(nativeAdd(-193, -(-193))).assertEqual(0);
      expect(nativeAdd(-383, 19 * 10) > -383).assertTrue();
      expect(nativeAdd(-383, 190)).assertEqual(-193);
      {
      let total: number = -370;
      for (let stepIndex: number = 0; stepIndex < 20; stepIndex++) {
        total = nativeAdd(total, 11);
      }
      logCase('testNativeSeriesSum0011', `total=${total}`);
      expect(total).assertEqual(-150);
      expect(nativeAdd(-370, 20 * 11)).assertEqual(-150);
      expect(nativeAdd(-150, -(20 * 11))).assertEqual(-370);
      expect(nativeAdd(-150, -(-150))).assertEqual(0);
      expect(Math.abs(nativeAdd(-370, 20 * 11)) % 2).assertEqual(0);
      expect(nativeAdd(-370, -150)).assertEqual(-150 + -370);
      expect(nativeAdd(-370, 20 * 11) > -370).assertTrue();
      expect(nativeAdd(-370, 220)).assertEqual(-150);
      }
      {
      let total: number = -357;
      for (let stepIndex: number = 0; stepIndex < 21; stepIndex++) {
        total = nativeAdd(total, 12);
      }
      logCase('testNativeSeriesSum0012', `total=${total}`);
      expect(total).assertEqual(-105);
      expect(nativeAdd(-357, 21 * 12)).assertEqual(-105);
      expect(nativeAdd(-105, -(21 * 12))).assertEqual(-357);
      expect(nativeAdd(-105, -(-105))).assertEqual(0);
      expect(nativeAdd(-357, 21 * 12) > -357).assertTrue();
      expect(nativeAdd(-357, 252)).assertEqual(-105);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0013
     * @tc.name      testNativeSeriesSum0013
     * @tc.desc      Accumulate 22 steps of 13 from -344 through the HAR NAPI add and expect -58
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -344;
      for (let stepIndex: number = 0; stepIndex < 22; stepIndex++) {
        total = nativeAdd(total, 13);
      }
      logCase('testNativeSeriesSum0013', `total=${total}`);
      expect(total).assertEqual(-58);
      expect(nativeAdd(-344, 22 * 13)).assertEqual(-58);
      expect(nativeAdd(-58, -(22 * 13))).assertEqual(-344);
      expect(nativeAdd(-58, -(-58))).assertEqual(0);
      expect(Math.abs(nativeAdd(-344, 22 * 13)) % 2).assertEqual(0);
      expect(nativeAdd(-344, -58)).assertEqual(-58 + -344);
      expect(nativeAdd(-344, 22 * 13) > -344).assertTrue();
      expect(nativeAdd(-344, 286)).assertEqual(-58);
      {
      let total: number = -331;
      for (let stepIndex: number = 0; stepIndex < 23; stepIndex++) {
        total = nativeAdd(total, 14);
      }
      logCase('testNativeSeriesSum0014', `total=${total}`);
      expect(total).assertEqual(-9);
      expect(nativeAdd(-331, 23 * 14)).assertEqual(-9);
      expect(nativeAdd(-9, -(23 * 14))).assertEqual(-331);
      expect(nativeAdd(-9, -(-9))).assertEqual(0);
      expect(nativeAdd(-331, 23 * 14) > -331).assertTrue();
      expect(nativeAdd(-331, 322)).assertEqual(-9);
      }
      {
      let total: number = -318;
      for (let stepIndex: number = 0; stepIndex < 24; stepIndex++) {
        total = nativeAdd(total, 15);
      }
      logCase('testNativeSeriesSum0015', `total=${total}`);
      expect(total).assertEqual(42);
      expect(nativeAdd(-318, 24 * 15)).assertEqual(42);
      expect(nativeAdd(42, -(24 * 15))).assertEqual(-318);
      expect(nativeAdd(42, -(42))).assertEqual(0);
      expect(Math.abs(nativeAdd(-318, 24 * 15)) % 2).assertEqual(0);
      expect(nativeAdd(-318, 42)).assertEqual(42 + -318);
      expect(nativeAdd(-318, 24 * 15) > -318).assertTrue();
      expect(nativeAdd(-318, 360)).assertEqual(42);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0016
     * @tc.name      testNativeSeriesSum0016
     * @tc.desc      Accumulate 25 steps of 16 from -305 through the HAR NAPI add and expect 95
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -305;
      for (let stepIndex: number = 0; stepIndex < 25; stepIndex++) {
        total = nativeAdd(total, 16);
      }
      logCase('testNativeSeriesSum0016', `total=${total}`);
      expect(total).assertEqual(95);
      expect(nativeAdd(-305, 25 * 16)).assertEqual(95);
      expect(nativeAdd(95, -(25 * 16))).assertEqual(-305);
      expect(nativeAdd(95, -(95))).assertEqual(0);
      expect(nativeAdd(-305, 25 * 16) > -305).assertTrue();
      expect(nativeAdd(-305, 400)).assertEqual(95);
      {
      let total: number = -292;
      for (let stepIndex: number = 0; stepIndex < 26; stepIndex++) {
        total = nativeAdd(total, 17);
      }
      logCase('testNativeSeriesSum0017', `total=${total}`);
      expect(total).assertEqual(150);
      expect(nativeAdd(-292, 26 * 17)).assertEqual(150);
      expect(nativeAdd(150, -(26 * 17))).assertEqual(-292);
      expect(nativeAdd(150, -(150))).assertEqual(0);
      expect(Math.abs(nativeAdd(-292, 26 * 17)) % 2).assertEqual(0);
      expect(nativeAdd(-292, 150)).assertEqual(150 + -292);
      expect(nativeAdd(-292, 26 * 17) > -292).assertTrue();
      expect(nativeAdd(-292, 442)).assertEqual(150);
      }
      {
      let total: number = -279;
      for (let stepIndex: number = 0; stepIndex < 27; stepIndex++) {
        total = nativeAdd(total, 1);
      }
      logCase('testNativeSeriesSum0018', `total=${total}`);
      expect(total).assertEqual(-252);
      expect(nativeAdd(-279, 27 * 1)).assertEqual(-252);
      expect(nativeAdd(-252, -(27 * 1))).assertEqual(-279);
      expect(nativeAdd(-252, -(-252))).assertEqual(0);
      expect(nativeAdd(-279, 27 * 1) > -279).assertTrue();
      expect(nativeAdd(-279, 27)).assertEqual(-252);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0019
     * @tc.name      testNativeSeriesSum0019
     * @tc.desc      Accumulate 28 steps of 2 from -266 through the HAR NAPI add and expect -210
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -266;
      for (let stepIndex: number = 0; stepIndex < 28; stepIndex++) {
        total = nativeAdd(total, 2);
      }
      logCase('testNativeSeriesSum0019', `total=${total}`);
      expect(total).assertEqual(-210);
      expect(nativeAdd(-266, 28 * 2)).assertEqual(-210);
      expect(nativeAdd(-210, -(28 * 2))).assertEqual(-266);
      expect(nativeAdd(-210, -(-210))).assertEqual(0);
      expect(Math.abs(nativeAdd(-266, 28 * 2)) % 2).assertEqual(0);
      expect(nativeAdd(-266, -210)).assertEqual(-210 + -266);
      expect(nativeAdd(-266, 28 * 2) > -266).assertTrue();
      expect(nativeAdd(-266, 56)).assertEqual(-210);
      {
      let total: number = -253;
      for (let stepIndex: number = 0; stepIndex < 29; stepIndex++) {
        total = nativeAdd(total, 3);
      }
      logCase('testNativeSeriesSum0020', `total=${total}`);
      expect(total).assertEqual(-166);
      expect(nativeAdd(-253, 29 * 3)).assertEqual(-166);
      expect(nativeAdd(-166, -(29 * 3))).assertEqual(-253);
      expect(nativeAdd(-166, -(-166))).assertEqual(0);
      expect(nativeAdd(-253, 29 * 3) > -253).assertTrue();
      expect(nativeAdd(-253, 87)).assertEqual(-166);
      }
      {
      let total: number = -240;
      for (let stepIndex: number = 0; stepIndex < 30; stepIndex++) {
        total = nativeAdd(total, 4);
      }
      logCase('testNativeSeriesSum0021', `total=${total}`);
      expect(total).assertEqual(-120);
      expect(nativeAdd(-240, 30 * 4)).assertEqual(-120);
      expect(nativeAdd(-120, -(30 * 4))).assertEqual(-240);
      expect(nativeAdd(-120, -(-120))).assertEqual(0);
      expect(Math.abs(nativeAdd(-240, 30 * 4)) % 2).assertEqual(0);
      expect(nativeAdd(-240, -120)).assertEqual(-120 + -240);
      expect(nativeAdd(-240, 30 * 4) > -240).assertTrue();
      expect(nativeAdd(-240, 120)).assertEqual(-120);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0022
     * @tc.name      testNativeSeriesSum0022
     * @tc.desc      Accumulate 31 steps of 5 from -227 through the HAR NAPI add and expect -72
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -227;
      for (let stepIndex: number = 0; stepIndex < 31; stepIndex++) {
        total = nativeAdd(total, 5);
      }
      logCase('testNativeSeriesSum0022', `total=${total}`);
      expect(total).assertEqual(-72);
      expect(nativeAdd(-227, 31 * 5)).assertEqual(-72);
      expect(nativeAdd(-72, -(31 * 5))).assertEqual(-227);
      expect(nativeAdd(-72, -(-72))).assertEqual(0);
      expect(nativeAdd(-227, 31 * 5) > -227).assertTrue();
      expect(nativeAdd(-227, 155)).assertEqual(-72);
      {
      let total: number = -214;
      for (let stepIndex: number = 0; stepIndex < 32; stepIndex++) {
        total = nativeAdd(total, 6);
      }
      logCase('testNativeSeriesSum0023', `total=${total}`);
      expect(total).assertEqual(-22);
      expect(nativeAdd(-214, 32 * 6)).assertEqual(-22);
      expect(nativeAdd(-22, -(32 * 6))).assertEqual(-214);
      expect(nativeAdd(-22, -(-22))).assertEqual(0);
      expect(Math.abs(nativeAdd(-214, 32 * 6)) % 2).assertEqual(0);
      expect(nativeAdd(-214, -22)).assertEqual(-22 + -214);
      expect(nativeAdd(-214, 32 * 6) > -214).assertTrue();
      expect(nativeAdd(-214, 192)).assertEqual(-22);
      }
      {
      let total: number = -201;
      for (let stepIndex: number = 0; stepIndex < 33; stepIndex++) {
        total = nativeAdd(total, 7);
      }
      logCase('testNativeSeriesSum0024', `total=${total}`);
      expect(total).assertEqual(30);
      expect(nativeAdd(-201, 33 * 7)).assertEqual(30);
      expect(nativeAdd(30, -(33 * 7))).assertEqual(-201);
      expect(nativeAdd(30, -(30))).assertEqual(0);
      expect(nativeAdd(-201, 33 * 7) > -201).assertTrue();
      expect(nativeAdd(-201, 231)).assertEqual(30);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0025
     * @tc.name      testNativeSeriesSum0025
     * @tc.desc      Accumulate 34 steps of 8 from -188 through the HAR NAPI add and expect 84
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -188;
      for (let stepIndex: number = 0; stepIndex < 34; stepIndex++) {
        total = nativeAdd(total, 8);
      }
      logCase('testNativeSeriesSum0025', `total=${total}`);
      expect(total).assertEqual(84);
      expect(nativeAdd(-188, 34 * 8)).assertEqual(84);
      expect(nativeAdd(84, -(34 * 8))).assertEqual(-188);
      expect(nativeAdd(84, -(84))).assertEqual(0);
      expect(Math.abs(nativeAdd(-188, 34 * 8)) % 2).assertEqual(0);
      expect(nativeAdd(-188, 84)).assertEqual(84 + -188);
      expect(nativeAdd(-188, 34 * 8) > -188).assertTrue();
      expect(nativeAdd(-188, 272)).assertEqual(84);
      {
      let total: number = -175;
      for (let stepIndex: number = 0; stepIndex < 35; stepIndex++) {
        total = nativeAdd(total, 9);
      }
      logCase('testNativeSeriesSum0026', `total=${total}`);
      expect(total).assertEqual(140);
      expect(nativeAdd(-175, 35 * 9)).assertEqual(140);
      expect(nativeAdd(140, -(35 * 9))).assertEqual(-175);
      expect(nativeAdd(140, -(140))).assertEqual(0);
      expect(nativeAdd(-175, 35 * 9) > -175).assertTrue();
      expect(nativeAdd(-175, 315)).assertEqual(140);
      }
      {
      let total: number = -162;
      for (let stepIndex: number = 0; stepIndex < 36; stepIndex++) {
        total = nativeAdd(total, 10);
      }
      logCase('testNativeSeriesSum0027', `total=${total}`);
      expect(total).assertEqual(198);
      expect(nativeAdd(-162, 36 * 10)).assertEqual(198);
      expect(nativeAdd(198, -(36 * 10))).assertEqual(-162);
      expect(nativeAdd(198, -(198))).assertEqual(0);
      expect(Math.abs(nativeAdd(-162, 36 * 10)) % 2).assertEqual(0);
      expect(nativeAdd(-162, 198)).assertEqual(198 + -162);
      expect(nativeAdd(-162, 36 * 10) > -162).assertTrue();
      expect(nativeAdd(-162, 360)).assertEqual(198);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0028
     * @tc.name      testNativeSeriesSum0028
     * @tc.desc      Accumulate 37 steps of 11 from -149 through the HAR NAPI add and expect 258
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -149;
      for (let stepIndex: number = 0; stepIndex < 37; stepIndex++) {
        total = nativeAdd(total, 11);
      }
      logCase('testNativeSeriesSum0028', `total=${total}`);
      expect(total).assertEqual(258);
      expect(nativeAdd(-149, 37 * 11)).assertEqual(258);
      expect(nativeAdd(258, -(37 * 11))).assertEqual(-149);
      expect(nativeAdd(258, -(258))).assertEqual(0);
      expect(nativeAdd(-149, 37 * 11) > -149).assertTrue();
      expect(nativeAdd(-149, 407)).assertEqual(258);
      {
      let total: number = -136;
      for (let stepIndex: number = 0; stepIndex < 38; stepIndex++) {
        total = nativeAdd(total, 12);
      }
      logCase('testNativeSeriesSum0029', `total=${total}`);
      expect(total).assertEqual(320);
      expect(nativeAdd(-136, 38 * 12)).assertEqual(320);
      expect(nativeAdd(320, -(38 * 12))).assertEqual(-136);
      expect(nativeAdd(320, -(320))).assertEqual(0);
      expect(Math.abs(nativeAdd(-136, 38 * 12)) % 2).assertEqual(0);
      expect(nativeAdd(-136, 320)).assertEqual(320 + -136);
      expect(nativeAdd(-136, 38 * 12) > -136).assertTrue();
      expect(nativeAdd(-136, 456)).assertEqual(320);
      }
      {
      let total: number = -123;
      for (let stepIndex: number = 0; stepIndex < 39; stepIndex++) {
        total = nativeAdd(total, 13);
      }
      logCase('testNativeSeriesSum0030', `total=${total}`);
      expect(total).assertEqual(384);
      expect(nativeAdd(-123, 39 * 13)).assertEqual(384);
      expect(nativeAdd(384, -(39 * 13))).assertEqual(-123);
      expect(nativeAdd(384, -(384))).assertEqual(0);
      expect(nativeAdd(-123, 39 * 13) > -123).assertTrue();
      expect(nativeAdd(-123, 507)).assertEqual(384);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0031
     * @tc.name      testNativeSeriesSum0031
     * @tc.desc      Accumulate 40 steps of 14 from -110 through the HAR NAPI add and expect 450
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -110;
      for (let stepIndex: number = 0; stepIndex < 40; stepIndex++) {
        total = nativeAdd(total, 14);
      }
      logCase('testNativeSeriesSum0031', `total=${total}`);
      expect(total).assertEqual(450);
      expect(nativeAdd(-110, 40 * 14)).assertEqual(450);
      expect(nativeAdd(450, -(40 * 14))).assertEqual(-110);
      expect(nativeAdd(450, -(450))).assertEqual(0);
      expect(Math.abs(nativeAdd(-110, 40 * 14)) % 2).assertEqual(0);
      expect(nativeAdd(-110, 450)).assertEqual(450 + -110);
      expect(nativeAdd(-110, 40 * 14) > -110).assertTrue();
      expect(nativeAdd(-110, 560)).assertEqual(450);
      {
      let total: number = -97;
      for (let stepIndex: number = 0; stepIndex < 41; stepIndex++) {
        total = nativeAdd(total, 15);
      }
      logCase('testNativeSeriesSum0032', `total=${total}`);
      expect(total).assertEqual(518);
      expect(nativeAdd(-97, 41 * 15)).assertEqual(518);
      expect(nativeAdd(518, -(41 * 15))).assertEqual(-97);
      expect(nativeAdd(518, -(518))).assertEqual(0);
      expect(nativeAdd(-97, 41 * 15) > -97).assertTrue();
      expect(nativeAdd(-97, 615)).assertEqual(518);
      }
      {
      let total: number = -84;
      for (let stepIndex: number = 0; stepIndex < 42; stepIndex++) {
        total = nativeAdd(total, 16);
      }
      logCase('testNativeSeriesSum0033', `total=${total}`);
      expect(total).assertEqual(588);
      expect(nativeAdd(-84, 42 * 16)).assertEqual(588);
      expect(nativeAdd(588, -(42 * 16))).assertEqual(-84);
      expect(nativeAdd(588, -(588))).assertEqual(0);
      expect(Math.abs(nativeAdd(-84, 42 * 16)) % 2).assertEqual(0);
      expect(nativeAdd(-84, 588)).assertEqual(588 + -84);
      expect(nativeAdd(-84, 42 * 16) > -84).assertTrue();
      expect(nativeAdd(-84, 672)).assertEqual(588);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0034
     * @tc.name      testNativeSeriesSum0034
     * @tc.desc      Accumulate 43 steps of 17 from -71 through the HAR NAPI add and expect 660
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -71;
      for (let stepIndex: number = 0; stepIndex < 43; stepIndex++) {
        total = nativeAdd(total, 17);
      }
      logCase('testNativeSeriesSum0034', `total=${total}`);
      expect(total).assertEqual(660);
      expect(nativeAdd(-71, 43 * 17)).assertEqual(660);
      expect(nativeAdd(660, -(43 * 17))).assertEqual(-71);
      expect(nativeAdd(660, -(660))).assertEqual(0);
      expect(nativeAdd(-71, 43 * 17) > -71).assertTrue();
      expect(nativeAdd(-71, 731)).assertEqual(660);
      {
      let total: number = -58;
      for (let stepIndex: number = 0; stepIndex < 44; stepIndex++) {
        total = nativeAdd(total, 1);
      }
      logCase('testNativeSeriesSum0035', `total=${total}`);
      expect(total).assertEqual(-14);
      expect(nativeAdd(-58, 44 * 1)).assertEqual(-14);
      expect(nativeAdd(-14, -(44 * 1))).assertEqual(-58);
      expect(nativeAdd(-14, -(-14))).assertEqual(0);
      expect(Math.abs(nativeAdd(-58, 44 * 1)) % 2).assertEqual(0);
      expect(nativeAdd(-58, -14)).assertEqual(-14 + -58);
      expect(nativeAdd(-58, 44 * 1) > -58).assertTrue();
      expect(nativeAdd(-58, 44)).assertEqual(-14);
      }
      {
      let total: number = -45;
      for (let stepIndex: number = 0; stepIndex < 45; stepIndex++) {
        total = nativeAdd(total, 2);
      }
      logCase('testNativeSeriesSum0036', `total=${total}`);
      expect(total).assertEqual(45);
      expect(nativeAdd(-45, 45 * 2)).assertEqual(45);
      expect(nativeAdd(45, -(45 * 2))).assertEqual(-45);
      expect(nativeAdd(45, -(45))).assertEqual(0);
      expect(nativeAdd(-45, 45 * 2) > -45).assertTrue();
      expect(nativeAdd(-45, 90)).assertEqual(45);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0037
     * @tc.name      testNativeSeriesSum0037
     * @tc.desc      Accumulate 46 steps of 3 from -32 through the HAR NAPI add and expect 106
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = -32;
      for (let stepIndex: number = 0; stepIndex < 46; stepIndex++) {
        total = nativeAdd(total, 3);
      }
      logCase('testNativeSeriesSum0037', `total=${total}`);
      expect(total).assertEqual(106);
      expect(nativeAdd(-32, 46 * 3)).assertEqual(106);
      expect(nativeAdd(106, -(46 * 3))).assertEqual(-32);
      expect(nativeAdd(106, -(106))).assertEqual(0);
      expect(Math.abs(nativeAdd(-32, 46 * 3)) % 2).assertEqual(0);
      expect(nativeAdd(-32, 106)).assertEqual(106 + -32);
      expect(nativeAdd(-32, 46 * 3) > -32).assertTrue();
      expect(nativeAdd(-32, 138)).assertEqual(106);
      {
      let total: number = -19;
      for (let stepIndex: number = 0; stepIndex < 47; stepIndex++) {
        total = nativeAdd(total, 4);
      }
      logCase('testNativeSeriesSum0038', `total=${total}`);
      expect(total).assertEqual(169);
      expect(nativeAdd(-19, 47 * 4)).assertEqual(169);
      expect(nativeAdd(169, -(47 * 4))).assertEqual(-19);
      expect(nativeAdd(169, -(169))).assertEqual(0);
      expect(nativeAdd(-19, 47 * 4) > -19).assertTrue();
      expect(nativeAdd(-19, 188)).assertEqual(169);
      }
      {
      let total: number = -6;
      for (let stepIndex: number = 0; stepIndex < 48; stepIndex++) {
        total = nativeAdd(total, 5);
      }
      logCase('testNativeSeriesSum0039', `total=${total}`);
      expect(total).assertEqual(234);
      expect(nativeAdd(-6, 48 * 5)).assertEqual(234);
      expect(nativeAdd(234, -(48 * 5))).assertEqual(-6);
      expect(nativeAdd(234, -(234))).assertEqual(0);
      expect(Math.abs(nativeAdd(-6, 48 * 5)) % 2).assertEqual(0);
      expect(nativeAdd(-6, 234)).assertEqual(234 + -6);
      expect(nativeAdd(-6, 48 * 5) > -6).assertTrue();
      expect(nativeAdd(-6, 240)).assertEqual(234);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0040
     * @tc.name      testNativeSeriesSum0040
     * @tc.desc      Accumulate 49 steps of 6 from 7 through the HAR NAPI add and expect 301
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = 7;
      for (let stepIndex: number = 0; stepIndex < 49; stepIndex++) {
        total = nativeAdd(total, 6);
      }
      logCase('testNativeSeriesSum0040', `total=${total}`);
      expect(total).assertEqual(301);
      expect(nativeAdd(7, 49 * 6)).assertEqual(301);
      expect(nativeAdd(301, -(49 * 6))).assertEqual(7);
      expect(nativeAdd(301, -(301))).assertEqual(0);
      expect(nativeAdd(7, 49 * 6) > 7).assertTrue();
      expect(nativeAdd(7, 294)).assertEqual(301);
      {
      let total: number = 20;
      for (let stepIndex: number = 0; stepIndex < 50; stepIndex++) {
        total = nativeAdd(total, 7);
      }
      logCase('testNativeSeriesSum0041', `total=${total}`);
      expect(total).assertEqual(370);
      expect(nativeAdd(20, 50 * 7)).assertEqual(370);
      expect(nativeAdd(370, -(50 * 7))).assertEqual(20);
      expect(nativeAdd(370, -(370))).assertEqual(0);
      expect(Math.abs(nativeAdd(20, 50 * 7)) % 2).assertEqual(0);
      expect(nativeAdd(20, 370)).assertEqual(370 + 20);
      expect(nativeAdd(20, 50 * 7) > 20).assertTrue();
      expect(nativeAdd(20, 350)).assertEqual(370);
      }
      {
      let total: number = 33;
      for (let stepIndex: number = 0; stepIndex < 51; stepIndex++) {
        total = nativeAdd(total, 8);
      }
      logCase('testNativeSeriesSum0042', `total=${total}`);
      expect(total).assertEqual(441);
      expect(nativeAdd(33, 51 * 8)).assertEqual(441);
      expect(nativeAdd(441, -(51 * 8))).assertEqual(33);
      expect(nativeAdd(441, -(441))).assertEqual(0);
      expect(nativeAdd(33, 51 * 8) > 33).assertTrue();
      expect(nativeAdd(33, 408)).assertEqual(441);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0043
     * @tc.name      testNativeSeriesSum0043
     * @tc.desc      Accumulate 52 steps of 9 from 46 through the HAR NAPI add and expect 514
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSeriesSum0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let total: number = 46;
      for (let stepIndex: number = 0; stepIndex < 52; stepIndex++) {
        total = nativeAdd(total, 9);
      }
      logCase('testNativeSeriesSum0043', `total=${total}`);
      expect(total).assertEqual(514);
      expect(nativeAdd(46, 52 * 9)).assertEqual(514);
      expect(nativeAdd(514, -(52 * 9))).assertEqual(46);
      expect(nativeAdd(514, -(514))).assertEqual(0);
      expect(Math.abs(nativeAdd(46, 52 * 9)) % 2).assertEqual(0);
      expect(nativeAdd(46, 514)).assertEqual(514 + 46);
      expect(nativeAdd(46, 52 * 9) > 46).assertTrue();
      expect(nativeAdd(46, 468)).assertEqual(514);
      {
      let total: number = 59;
      for (let stepIndex: number = 0; stepIndex < 53; stepIndex++) {
        total = nativeAdd(total, 10);
      }
      logCase('testNativeSeriesSum0044', `total=${total}`);
      expect(total).assertEqual(589);
      expect(nativeAdd(59, 53 * 10)).assertEqual(589);
      expect(nativeAdd(589, -(53 * 10))).assertEqual(59);
      expect(nativeAdd(589, -(589))).assertEqual(0);
      expect(nativeAdd(59, 53 * 10) > 59).assertTrue();
      expect(nativeAdd(59, 530)).assertEqual(589);
      }
      {
      let total: number = 72;
      for (let stepIndex: number = 0; stepIndex < 54; stepIndex++) {
        total = nativeAdd(total, 11);
      }
      logCase('testNativeSeriesSum0045', `total=${total}`);
      expect(total).assertEqual(666);
      expect(nativeAdd(72, 54 * 11)).assertEqual(666);
      expect(nativeAdd(666, -(54 * 11))).assertEqual(72);
      expect(nativeAdd(666, -(666))).assertEqual(0);
      expect(Math.abs(nativeAdd(72, 54 * 11)) % 2).assertEqual(0);
      expect(nativeAdd(72, 666)).assertEqual(666 + 72);
      expect(nativeAdd(72, 54 * 11) > 72).assertTrue();
      expect(nativeAdd(72, 594)).assertEqual(666);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0046
     * @tc.name      testNativeSeriesSum0046
     * @tc.desc      Accumulate 55 steps of 12 from 85 through the HAR NAPI add and expect 745
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSeriesSum0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let total: number = 85;
      for (let stepIndex: number = 0; stepIndex < 55; stepIndex++) {
        total = nativeAdd(total, 12);
      }
      logCase('testNativeSeriesSum0046', `total=${total}`);
      expect(total).assertEqual(745);
      expect(nativeAdd(85, 55 * 12)).assertEqual(745);
      expect(nativeAdd(745, -(55 * 12))).assertEqual(85);
      expect(nativeAdd(745, -(745))).assertEqual(0);
      expect(nativeAdd(85, 55 * 12) > 85).assertTrue();
      expect(nativeAdd(85, 660)).assertEqual(745);
      {
      let total: number = 98;
      for (let stepIndex: number = 0; stepIndex < 56; stepIndex++) {
        total = nativeAdd(total, 13);
      }
      logCase('testNativeSeriesSum0047', `total=${total}`);
      expect(total).assertEqual(826);
      expect(nativeAdd(98, 56 * 13)).assertEqual(826);
      expect(nativeAdd(826, -(56 * 13))).assertEqual(98);
      expect(nativeAdd(826, -(826))).assertEqual(0);
      expect(Math.abs(nativeAdd(98, 56 * 13)) % 2).assertEqual(0);
      expect(nativeAdd(98, 826)).assertEqual(826 + 98);
      expect(nativeAdd(98, 56 * 13) > 98).assertTrue();
      expect(nativeAdd(98, 728)).assertEqual(826);
      }
      {
      let total: number = 111;
      for (let stepIndex: number = 0; stepIndex < 57; stepIndex++) {
        total = nativeAdd(total, 14);
      }
      logCase('testNativeSeriesSum0048', `total=${total}`);
      expect(total).assertEqual(909);
      expect(nativeAdd(111, 57 * 14)).assertEqual(909);
      expect(nativeAdd(909, -(57 * 14))).assertEqual(111);
      expect(nativeAdd(909, -(909))).assertEqual(0);
      expect(nativeAdd(111, 57 * 14) > 111).assertTrue();
      expect(nativeAdd(111, 798)).assertEqual(909);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0049
     * @tc.name      testNativeSeriesSum0049
     * @tc.desc      Accumulate 58 steps of 15 from 124 through the HAR NAPI add and expect 994
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSeriesSum0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let total: number = 124;
      for (let stepIndex: number = 0; stepIndex < 58; stepIndex++) {
        total = nativeAdd(total, 15);
      }
      logCase('testNativeSeriesSum0049', `total=${total}`);
      expect(total).assertEqual(994);
      expect(nativeAdd(124, 58 * 15)).assertEqual(994);
      expect(nativeAdd(994, -(58 * 15))).assertEqual(124);
      expect(nativeAdd(994, -(994))).assertEqual(0);
      expect(Math.abs(nativeAdd(124, 58 * 15)) % 2).assertEqual(0);
      expect(nativeAdd(124, 994)).assertEqual(994 + 124);
      expect(nativeAdd(124, 58 * 15) > 124).assertTrue();
      expect(nativeAdd(124, 870)).assertEqual(994);
      {
      let total: number = 137;
      for (let stepIndex: number = 0; stepIndex < 59; stepIndex++) {
        total = nativeAdd(total, 16);
      }
      logCase('testNativeSeriesSum0050', `total=${total}`);
      expect(total).assertEqual(1081);
      expect(nativeAdd(137, 59 * 16)).assertEqual(1081);
      expect(nativeAdd(1081, -(59 * 16))).assertEqual(137);
      expect(nativeAdd(1081, -(1081))).assertEqual(0);
      expect(nativeAdd(137, 59 * 16) > 137).assertTrue();
      expect(nativeAdd(137, 944)).assertEqual(1081);
      }
      {
      let total: number = 150;
      for (let stepIndex: number = 0; stepIndex < 60; stepIndex++) {
        total = nativeAdd(total, 17);
      }
      logCase('testNativeSeriesSum0051', `total=${total}`);
      expect(total).assertEqual(1170);
      expect(nativeAdd(150, 60 * 17)).assertEqual(1170);
      expect(nativeAdd(1170, -(60 * 17))).assertEqual(150);
      expect(nativeAdd(1170, -(1170))).assertEqual(0);
      expect(Math.abs(nativeAdd(150, 60 * 17)) % 2).assertEqual(0);
      expect(nativeAdd(150, 1170)).assertEqual(1170 + 150);
      expect(nativeAdd(150, 60 * 17) > 150).assertTrue();
      expect(nativeAdd(150, 1020)).assertEqual(1170);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0052
     * @tc.name      testNativeSeriesSum0052
     * @tc.desc      Accumulate 10 steps of 1 from 163 through the HAR NAPI add and expect 173
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSeriesSum0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let total: number = 163;
      for (let stepIndex: number = 0; stepIndex < 10; stepIndex++) {
        total = nativeAdd(total, 1);
      }
      logCase('testNativeSeriesSum0052', `total=${total}`);
      expect(total).assertEqual(173);
      expect(nativeAdd(163, 10 * 1)).assertEqual(173);
      expect(nativeAdd(173, -(10 * 1))).assertEqual(163);
      expect(nativeAdd(173, -(173))).assertEqual(0);
      expect(nativeAdd(163, 173)).assertEqual(173 + 163);
      expect(nativeAdd(163, 10 * 1) > 163).assertTrue();
      expect(nativeAdd(163, 10)).assertEqual(173);
      {
      let total: number = 176;
      for (let stepIndex: number = 0; stepIndex < 11; stepIndex++) {
        total = nativeAdd(total, 2);
      }
      logCase('testNativeSeriesSum0053', `total=${total}`);
      expect(total).assertEqual(198);
      expect(nativeAdd(176, 11 * 2)).assertEqual(198);
      expect(nativeAdd(198, -(11 * 2))).assertEqual(176);
      expect(nativeAdd(198, -(198))).assertEqual(0);
      expect(Math.abs(nativeAdd(176, 11 * 2)) % 2).assertEqual(0);
      expect(nativeAdd(176, 11 * 2) > 176).assertTrue();
      expect(nativeAdd(176, 22)).assertEqual(198);
      }
      {
      let total: number = 189;
      for (let stepIndex: number = 0; stepIndex < 12; stepIndex++) {
        total = nativeAdd(total, 3);
      }
      logCase('testNativeSeriesSum0054', `total=${total}`);
      expect(total).assertEqual(225);
      expect(nativeAdd(189, 12 * 3)).assertEqual(225);
      expect(nativeAdd(225, -(12 * 3))).assertEqual(189);
      expect(nativeAdd(225, -(225))).assertEqual(0);
      expect(nativeAdd(189, 225)).assertEqual(225 + 189);
      expect(nativeAdd(189, 12 * 3) > 189).assertTrue();
      expect(nativeAdd(189, 36)).assertEqual(225);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0055
     * @tc.name      testNativeSeriesSum0055
     * @tc.desc      Accumulate 13 steps of 4 from 202 through the HAR NAPI add and expect 254
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSeriesSum0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let total: number = 202;
      for (let stepIndex: number = 0; stepIndex < 13; stepIndex++) {
        total = nativeAdd(total, 4);
      }
      logCase('testNativeSeriesSum0055', `total=${total}`);
      expect(total).assertEqual(254);
      expect(nativeAdd(202, 13 * 4)).assertEqual(254);
      expect(nativeAdd(254, -(13 * 4))).assertEqual(202);
      expect(nativeAdd(254, -(254))).assertEqual(0);
      expect(Math.abs(nativeAdd(202, 13 * 4)) % 2).assertEqual(0);
      expect(nativeAdd(202, 13 * 4) > 202).assertTrue();
      expect(nativeAdd(202, 52)).assertEqual(254);
      {
      let total: number = 215;
      for (let stepIndex: number = 0; stepIndex < 14; stepIndex++) {
        total = nativeAdd(total, 5);
      }
      logCase('testNativeSeriesSum0056', `total=${total}`);
      expect(total).assertEqual(285);
      expect(nativeAdd(215, 14 * 5)).assertEqual(285);
      expect(nativeAdd(285, -(14 * 5))).assertEqual(215);
      expect(nativeAdd(285, -(285))).assertEqual(0);
      expect(nativeAdd(215, 285)).assertEqual(285 + 215);
      expect(nativeAdd(215, 14 * 5) > 215).assertTrue();
      expect(nativeAdd(215, 70)).assertEqual(285);
      }
      {
      let total: number = 228;
      for (let stepIndex: number = 0; stepIndex < 15; stepIndex++) {
        total = nativeAdd(total, 6);
      }
      logCase('testNativeSeriesSum0057', `total=${total}`);
      expect(total).assertEqual(318);
      expect(nativeAdd(228, 15 * 6)).assertEqual(318);
      expect(nativeAdd(318, -(15 * 6))).assertEqual(228);
      expect(nativeAdd(318, -(318))).assertEqual(0);
      expect(Math.abs(nativeAdd(228, 15 * 6)) % 2).assertEqual(0);
      expect(nativeAdd(228, 15 * 6) > 228).assertTrue();
      expect(nativeAdd(228, 90)).assertEqual(318);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0058
     * @tc.name      testNativeSeriesSum0058
     * @tc.desc      Accumulate 16 steps of 7 from 241 through the HAR NAPI add and expect 353
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSeriesSum0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let total: number = 241;
      for (let stepIndex: number = 0; stepIndex < 16; stepIndex++) {
        total = nativeAdd(total, 7);
      }
      logCase('testNativeSeriesSum0058', `total=${total}`);
      expect(total).assertEqual(353);
      expect(nativeAdd(241, 16 * 7)).assertEqual(353);
      expect(nativeAdd(353, -(16 * 7))).assertEqual(241);
      expect(nativeAdd(353, -(353))).assertEqual(0);
      expect(nativeAdd(241, 353)).assertEqual(353 + 241);
      expect(nativeAdd(241, 16 * 7) > 241).assertTrue();
      expect(nativeAdd(241, 112)).assertEqual(353);
      {
      let total: number = 254;
      for (let stepIndex: number = 0; stepIndex < 17; stepIndex++) {
        total = nativeAdd(total, 8);
      }
      logCase('testNativeSeriesSum0059', `total=${total}`);
      expect(total).assertEqual(390);
      expect(nativeAdd(254, 17 * 8)).assertEqual(390);
      expect(nativeAdd(390, -(17 * 8))).assertEqual(254);
      expect(nativeAdd(390, -(390))).assertEqual(0);
      expect(Math.abs(nativeAdd(254, 17 * 8)) % 2).assertEqual(0);
      expect(nativeAdd(254, 17 * 8) > 254).assertTrue();
      expect(nativeAdd(254, 136)).assertEqual(390);
      }
      {
      let total: number = 267;
      for (let stepIndex: number = 0; stepIndex < 18; stepIndex++) {
        total = nativeAdd(total, 9);
      }
      logCase('testNativeSeriesSum0060', `total=${total}`);
      expect(total).assertEqual(429);
      expect(nativeAdd(267, 18 * 9)).assertEqual(429);
      expect(nativeAdd(429, -(18 * 9))).assertEqual(267);
      expect(nativeAdd(429, -(429))).assertEqual(0);
      expect(nativeAdd(267, 429)).assertEqual(429 + 267);
      expect(nativeAdd(267, 18 * 9) > 267).assertTrue();
      expect(nativeAdd(267, 162)).assertEqual(429);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0061
     * @tc.name      testNativeSeriesSum0061
     * @tc.desc      Accumulate 19 steps of 10 from 280 through the HAR NAPI add and expect 470
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSeriesSum0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let total: number = 280;
      for (let stepIndex: number = 0; stepIndex < 19; stepIndex++) {
        total = nativeAdd(total, 10);
      }
      logCase('testNativeSeriesSum0061', `total=${total}`);
      expect(total).assertEqual(470);
      expect(nativeAdd(280, 19 * 10)).assertEqual(470);
      expect(nativeAdd(470, -(19 * 10))).assertEqual(280);
      expect(nativeAdd(470, -(470))).assertEqual(0);
      expect(Math.abs(nativeAdd(280, 19 * 10)) % 2).assertEqual(0);
      expect(nativeAdd(280, 19 * 10) > 280).assertTrue();
      expect(nativeAdd(280, 190)).assertEqual(470);
      {
      let total: number = 293;
      for (let stepIndex: number = 0; stepIndex < 20; stepIndex++) {
        total = nativeAdd(total, 11);
      }
      logCase('testNativeSeriesSum0062', `total=${total}`);
      expect(total).assertEqual(513);
      expect(nativeAdd(293, 20 * 11)).assertEqual(513);
      expect(nativeAdd(513, -(20 * 11))).assertEqual(293);
      expect(nativeAdd(513, -(513))).assertEqual(0);
      expect(nativeAdd(293, 513)).assertEqual(513 + 293);
      expect(nativeAdd(293, 20 * 11) > 293).assertTrue();
      expect(nativeAdd(293, 220)).assertEqual(513);
      }
      {
      let total: number = 306;
      for (let stepIndex: number = 0; stepIndex < 21; stepIndex++) {
        total = nativeAdd(total, 12);
      }
      logCase('testNativeSeriesSum0063', `total=${total}`);
      expect(total).assertEqual(558);
      expect(nativeAdd(306, 21 * 12)).assertEqual(558);
      expect(nativeAdd(558, -(21 * 12))).assertEqual(306);
      expect(nativeAdd(558, -(558))).assertEqual(0);
      expect(Math.abs(nativeAdd(306, 21 * 12)) % 2).assertEqual(0);
      expect(nativeAdd(306, 21 * 12) > 306).assertTrue();
      expect(nativeAdd(306, 252)).assertEqual(558);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_SERIES_0064
     * @tc.name      testNativeSeriesSum0064
     * @tc.desc      Accumulate 22 steps of 13 from 319 through the HAR NAPI add and expect 605
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSeriesSum0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let total: number = 319;
      for (let stepIndex: number = 0; stepIndex < 22; stepIndex++) {
        total = nativeAdd(total, 13);
      }
      logCase('testNativeSeriesSum0064', `total=${total}`);
      expect(total).assertEqual(605);
