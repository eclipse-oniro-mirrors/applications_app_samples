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
import { ColorConversion } from '../../../main/ets/common/utils/ColorConversion';

export default function ColorPropertyMatrixProTest() {
  describe('ColorPropertyMatrixProTest', () => {
    /**
     * @tc.number SUB_COLOR_PRO_0100
     * @tc.name testColorPro0001
     * @tc.desc Verify dealColor keeps channels in range for [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 0, 0);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_0200
     * @tc.name testColorPro0002
     * @tc.desc Verify dealColor keeps channels in range for [8,8,8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(8, 8, 8);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_0300
     * @tc.name testColorPro0003
     * @tc.desc Verify dealColor keeps channels in range for [16,16,16]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(16, 16, 16);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_0400
     * @tc.name testColorPro0004
     * @tc.desc Verify dealColor keeps channels in range for [24,24,24]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(24, 24, 24);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_0500
     * @tc.name testColorPro0005
     * @tc.desc Verify dealColor keeps channels in range for [32,32,32]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(32, 32, 32);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_0600
     * @tc.name testColorPro0006
     * @tc.desc Verify dealColor keeps channels in range for [40,40,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(40, 40, 40);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_0700
     * @tc.name testColorPro0007
     * @tc.desc Verify dealColor keeps channels in range for [48,48,48]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(48, 48, 48);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_0800
     * @tc.name testColorPro0008
     * @tc.desc Verify dealColor keeps channels in range for [56,56,56]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(56, 56, 56);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_0900
     * @tc.name testColorPro0009
     * @tc.desc Verify dealColor keeps channels in range for [64,64,64]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(64, 64, 64);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1000
     * @tc.name testColorPro0010
     * @tc.desc Verify dealColor keeps channels in range for [72,72,72]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(72, 72, 72);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1100
     * @tc.name testColorPro0011
     * @tc.desc Verify dealColor keeps channels in range for [80,80,80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(80, 80, 80);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1200
     * @tc.name testColorPro0012
     * @tc.desc Verify dealColor keeps channels in range for [88,88,88]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(88, 88, 88);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1300
     * @tc.name testColorPro0013
     * @tc.desc Verify dealColor keeps channels in range for [96,96,96]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(96, 96, 96);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1400
     * @tc.name testColorPro0014
     * @tc.desc Verify dealColor keeps channels in range for [104,104,104]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(104, 104, 104);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1500
     * @tc.name testColorPro0015
     * @tc.desc Verify dealColor keeps channels in range for [112,112,112]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(112, 112, 112);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1600
     * @tc.name testColorPro0016
     * @tc.desc Verify dealColor keeps channels in range for [120,120,120]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(120, 120, 120);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1700
     * @tc.name testColorPro0017
     * @tc.desc Verify dealColor keeps channels in range for [128,128,128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(128, 128, 128);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1800
     * @tc.name testColorPro0018
     * @tc.desc Verify dealColor keeps channels in range for [136,136,136]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(136, 136, 136);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_1900
     * @tc.name testColorPro0019
     * @tc.desc Verify dealColor keeps channels in range for [144,144,144]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(144, 144, 144);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2000
     * @tc.name testColorPro0020
     * @tc.desc Verify dealColor keeps channels in range for [152,152,152]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(152, 152, 152);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2100
     * @tc.name testColorPro0021
     * @tc.desc Verify dealColor keeps channels in range for [160,160,160]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(160, 160, 160);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2200
     * @tc.name testColorPro0022
     * @tc.desc Verify dealColor keeps channels in range for [168,168,168]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(168, 168, 168);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2300
     * @tc.name testColorPro0023
     * @tc.desc Verify dealColor keeps channels in range for [176,176,176]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(176, 176, 176);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2400
     * @tc.name testColorPro0024
     * @tc.desc Verify dealColor keeps channels in range for [184,184,184]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(184, 184, 184);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2500
     * @tc.name testColorPro0025
     * @tc.desc Verify dealColor keeps channels in range for [192,192,192]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(192, 192, 192);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2600
     * @tc.name testColorPro0026
     * @tc.desc Verify dealColor keeps channels in range for [200,200,200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(200, 200, 200);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2700
     * @tc.name testColorPro0027
     * @tc.desc Verify dealColor keeps channels in range for [208,208,208]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(208, 208, 208);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2800
     * @tc.name testColorPro0028
     * @tc.desc Verify dealColor keeps channels in range for [216,216,216]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(216, 216, 216);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_2900
     * @tc.name testColorPro0029
     * @tc.desc Verify dealColor keeps channels in range for [224,224,224]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(224, 224, 224);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_3000
     * @tc.name testColorPro0030
     * @tc.desc Verify dealColor keeps channels in range for [232,232,232]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(232, 232, 232);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_3100
     * @tc.name testColorPro0031
     * @tc.desc Verify dealColor keeps channels in range for [240,240,240]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(240, 240, 240);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_3200
     * @tc.name testColorPro0032
     * @tc.desc Verify dealColor keeps channels in range for [248,248,248]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(248, 248, 248);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO_3300
     * @tc.name testColorPro0033
     * @tc.desc Verify dealColor keeps channels in range for [255,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(255, 0, 0);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_3400
     * @tc.name testColorPro0034
     * @tc.desc Verify dealColor keeps channels in range for [0,255,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 255, 0);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_3500
     * @tc.name testColorPro0035
     * @tc.desc Verify dealColor keeps channels in range for [0,0,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 0, 255);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_3600
     * @tc.name testColorPro0036
     * @tc.desc Verify dealColor keeps channels in range for [255,255,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(255, 255, 0);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_3700
     * @tc.name testColorPro0037
     * @tc.desc Verify dealColor keeps channels in range for [0,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 255, 255);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_3800
     * @tc.name testColorPro0038
     * @tc.desc Verify dealColor keeps channels in range for [255,0,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(255, 0, 255);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_3900
     * @tc.name testColorPro0039
     * @tc.desc Verify dealColor keeps channels in range for [125,147,232]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(125, 147, 232);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4000
     * @tc.name testColorPro0040
     * @tc.desc Verify dealColor keeps channels in range for [80,189,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(80, 189, 40);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4100
     * @tc.name testColorPro0041
     * @tc.desc Verify dealColor keeps channels in range for [149,71,49]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(149, 71, 49);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4200
     * @tc.name testColorPro0042
     * @tc.desc Verify dealColor keeps channels in range for [92,67,64]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(92, 67, 64);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4300
     * @tc.name testColorPro0043
     * @tc.desc Verify dealColor keeps channels in range for [50,100,207]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(50, 100, 207);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4400
     * @tc.name testColorPro0044
     * @tc.desc Verify dealColor keeps channels in range for [132,164,217]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(132, 164, 217);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4500
     * @tc.name testColorPro0045
     * @tc.desc Verify dealColor keeps channels in range for [130,190,119]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(130, 190, 119);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4600
     * @tc.name testColorPro0046
     * @tc.desc Verify dealColor keeps channels in range for [154,126,106]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(154, 126, 106);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4700
     * @tc.name testColorPro0047
     * @tc.desc Verify dealColor keeps channels in range for [92,226,139]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(92, 226, 139);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4800
     * @tc.name testColorPro0048
     * @tc.desc Verify dealColor keeps channels in range for [35,57,43]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(35, 57, 43);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_4900
     * @tc.name testColorPro0049
     * @tc.desc Verify dealColor keeps channels in range for [236,204,132]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(236, 204, 132);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5000
     * @tc.name testColorPro0050
     * @tc.desc Verify dealColor keeps channels in range for [163,36,44]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(163, 36, 44);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5100
     * @tc.name testColorPro0051
     * @tc.desc Verify dealColor keeps channels in range for [45,253,184]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(45, 253, 184);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5200
     * @tc.name testColorPro0052
     * @tc.desc Verify dealColor keeps channels in range for [171,19,45]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(171, 19, 45);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5300
     * @tc.name testColorPro0053
     * @tc.desc Verify dealColor keeps channels in range for [225,140,132]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(225, 140, 132);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5400
     * @tc.name testColorPro0054
     * @tc.desc Verify dealColor keeps channels in range for [243,209,31]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(243, 209, 31);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5500
     * @tc.name testColorPro0055
     * @tc.desc Verify dealColor keeps channels in range for [183,108,154]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(183, 108, 154);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5600
     * @tc.name testColorPro0056
     * @tc.desc Verify dealColor keeps channels in range for [181,94,33]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(181, 94, 33);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5700
     * @tc.name testColorPro0057
     * @tc.desc Verify dealColor keeps channels in range for [105,79,151]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(105, 79, 151);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5800
     * @tc.name testColorPro0058
     * @tc.desc Verify dealColor keeps channels in range for [214,125,19]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(214, 125, 19);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_5900
     * @tc.name testColorPro0059
     * @tc.desc Verify dealColor keeps channels in range for [107,87,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(107, 87, 5);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6000
     * @tc.name testColorPro0060
     * @tc.desc Verify dealColor keeps channels in range for [16,174,31]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(16, 174, 31);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6100
     * @tc.name testColorPro0061
     * @tc.desc Verify dealColor keeps channels in range for [53,201,84]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(53, 201, 84);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6200
     * @tc.name testColorPro0062
     * @tc.desc Verify dealColor keeps channels in range for [24,177,239]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(24, 177, 239);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6300
     * @tc.name testColorPro0063
     * @tc.desc Verify dealColor keeps channels in range for [40,67,187]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(40, 67, 187);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6400
     * @tc.name testColorPro0064
     * @tc.desc Verify dealColor keeps channels in range for [9,62,121]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(9, 62, 121);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6500
     * @tc.name testColorPro0065
     * @tc.desc Verify dealColor keeps channels in range for [58,186,97]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(58, 186, 97);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6600
     * @tc.name testColorPro0066
     * @tc.desc Verify dealColor keeps channels in range for [27,139,205]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(27, 139, 205);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6700
     * @tc.name testColorPro0067
     * @tc.desc Verify dealColor keeps channels in range for [223,251,156]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(223, 251, 156);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6800
     * @tc.name testColorPro0068
     * @tc.desc Verify dealColor keeps channels in range for [48,45,76]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(48, 45, 76);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_6900
     * @tc.name testColorPro0069
     * @tc.desc Verify dealColor keeps channels in range for [176,176,192]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(176, 176, 192);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7000
     * @tc.name testColorPro0070
     * @tc.desc Verify dealColor keeps channels in range for [127,209,81]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(127, 209, 81);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7100
     * @tc.name testColorPro0071
     * @tc.desc Verify dealColor keeps channels in range for [86,208,221]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(86, 208, 221);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7200
     * @tc.name testColorPro0072
     * @tc.desc Verify dealColor keeps channels in range for [45,79,105]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(45, 79, 105);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7300
     * @tc.name testColorPro0073
     * @tc.desc Verify dealColor keeps channels in range for [41,114,96]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(41, 114, 96);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7400
     * @tc.name testColorPro0074
     * @tc.desc Verify dealColor keeps channels in range for [25,4,102]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(25, 4, 102);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7500
     * @tc.name testColorPro0075
     * @tc.desc Verify dealColor keeps channels in range for [85,105,107]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(85, 105, 107);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7600
     * @tc.name testColorPro0076
     * @tc.desc Verify dealColor keeps channels in range for [153,172,249]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(153, 172, 249);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7700
     * @tc.name testColorPro0077
     * @tc.desc Verify dealColor keeps channels in range for [189,192,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(189, 192, 3);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7800
     * @tc.name testColorPro0078
     * @tc.desc Verify dealColor keeps channels in range for [67,94,211]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(67, 94, 211);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_7900
     * @tc.name testColorPro0079
     * @tc.desc Verify dealColor keeps channels in range for [173,242,135]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(173, 242, 135);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8000
     * @tc.name testColorPro0080
     * @tc.desc Verify dealColor keeps channels in range for [160,119,207]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(160, 119, 207);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8100
     * @tc.name testColorPro0081
     * @tc.desc Verify dealColor keeps channels in range for [141,7,46]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(141, 7, 46);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8200
     * @tc.name testColorPro0082
     * @tc.desc Verify dealColor keeps channels in range for [88,206,53]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(88, 206, 53);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8300
     * @tc.name testColorPro0083
     * @tc.desc Verify dealColor keeps channels in range for [189,175,166]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(189, 175, 166);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8400
     * @tc.name testColorPro0084
     * @tc.desc Verify dealColor keeps channels in range for [95,13,27]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(95, 13, 27);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8500
     * @tc.name testColorPro0085
     * @tc.desc Verify dealColor keeps channels in range for [76,63,58]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(76, 63, 58);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8600
     * @tc.name testColorPro0086
     * @tc.desc Verify dealColor keeps channels in range for [87,230,28]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(87, 230, 28);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8700
     * @tc.name testColorPro0087
     * @tc.desc Verify dealColor keeps channels in range for [187,26,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(187, 26, 50);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8800
     * @tc.name testColorPro0088
     * @tc.desc Verify dealColor keeps channels in range for [92,233,102]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(92, 233, 102);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_8900
     * @tc.name testColorPro0089
     * @tc.desc Verify dealColor keeps channels in range for [117,31,232]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(117, 31, 232);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9000
     * @tc.name testColorPro0090
     * @tc.desc Verify dealColor keeps channels in range for [30,107,146]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(30, 107, 146);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9100
     * @tc.name testColorPro0091
     * @tc.desc Verify dealColor keeps channels in range for [163,188,98]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(163, 188, 98);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9200
     * @tc.name testColorPro0092
     * @tc.desc Verify dealColor keeps channels in range for [187,220,196]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(187, 220, 196);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9300
     * @tc.name testColorPro0093
     * @tc.desc Verify dealColor keeps channels in range for [62,101,77]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(62, 101, 77);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9400
     * @tc.name testColorPro0094
     * @tc.desc Verify dealColor keeps channels in range for [241,229,92]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(241, 229, 92);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9500
     * @tc.name testColorPro0095
     * @tc.desc Verify dealColor keeps channels in range for [186,130,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(186, 130, 100);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9600
     * @tc.name testColorPro0096
     * @tc.desc Verify dealColor keeps channels in range for [231,155,210]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(231, 155, 210);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9700
     * @tc.name testColorPro0097
     * @tc.desc Verify dealColor keeps channels in range for [104,149,110]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(104, 149, 110);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9800
     * @tc.name testColorPro0098
     * @tc.desc Verify dealColor keeps channels in range for [111,59,44]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(111, 59, 44);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_9900
     * @tc.name testColorPro0099
     * @tc.desc Verify dealColor keeps channels in range for [99,63,46]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(99, 63, 46);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO_10000
     * @tc.name testColorPro0100
     * @tc.desc Verify dealColor keeps channels in range for [148,187,39]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(148, 187, 39);
      expect(result.length).assertEqual(3);
      expect(Math.floor(result[0]) === result[0] && result[0] >= 0 && result[0] <= 255).assertTrue();
      expect(Math.floor(result[1]) === result[1] && result[1] >= 0 && result[1] <= 255).assertTrue();
      expect(Math.floor(result[2]) === result[2] && result[2] >= 0 && result[2] <= 255).assertTrue();
    });
  });
}
