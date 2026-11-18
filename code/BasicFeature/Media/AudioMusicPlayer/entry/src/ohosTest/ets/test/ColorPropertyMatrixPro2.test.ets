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

export default function ColorPropertyMatrixPro2Test() {
  describe('ColorPropertyMatrixPro2Test', () => {
    /**
     * @tc.number SUB_COLOR_PRO2_0100
     * @tc.name testColorPro20001
     * @tc.desc Verify dealColor channels for [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 0, 0);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_0200
     * @tc.name testColorPro20002
     * @tc.desc Verify dealColor channels for [255,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(255, 255, 255);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_0300
     * @tc.name testColorPro20003
     * @tc.desc Verify dealColor channels for [1,1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(1, 1, 1);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_0400
     * @tc.name testColorPro20004
     * @tc.desc Verify dealColor channels for [254,254,254]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(254, 254, 254);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_0500
     * @tc.name testColorPro20005
     * @tc.desc Verify dealColor channels for [255,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(255, 0, 0);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_0600
     * @tc.name testColorPro20006
     * @tc.desc Verify dealColor channels for [0,255,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 255, 0);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_0700
     * @tc.name testColorPro20007
     * @tc.desc Verify dealColor channels for [0,0,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 0, 255);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_0800
     * @tc.name testColorPro20008
     * @tc.desc Verify dealColor channels for [255,255,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(255, 255, 0);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_0900
     * @tc.name testColorPro20009
     * @tc.desc Verify dealColor channels for [0,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 255, 255);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1000
     * @tc.name testColorPro20010
     * @tc.desc Verify dealColor channels for [255,0,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(255, 0, 255);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1100
     * @tc.name testColorPro20011
     * @tc.desc Verify dealColor channels for [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 0, 0);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1200
     * @tc.name testColorPro20012
     * @tc.desc Verify dealColor channels for [5,5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(5, 5, 5);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1300
     * @tc.name testColorPro20013
     * @tc.desc Verify dealColor channels for [10,10,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(10, 10, 10);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1400
     * @tc.name testColorPro20014
     * @tc.desc Verify dealColor channels for [15,15,15]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(15, 15, 15);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1500
     * @tc.name testColorPro20015
     * @tc.desc Verify dealColor channels for [20,20,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(20, 20, 20);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1600
     * @tc.name testColorPro20016
     * @tc.desc Verify dealColor channels for [25,25,25]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(25, 25, 25);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1700
     * @tc.name testColorPro20017
     * @tc.desc Verify dealColor channels for [30,30,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(30, 30, 30);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1800
     * @tc.name testColorPro20018
     * @tc.desc Verify dealColor channels for [35,35,35]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(35, 35, 35);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_1900
     * @tc.name testColorPro20019
     * @tc.desc Verify dealColor channels for [40,40,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(40, 40, 40);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2000
     * @tc.name testColorPro20020
     * @tc.desc Verify dealColor channels for [45,45,45]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(45, 45, 45);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2100
     * @tc.name testColorPro20021
     * @tc.desc Verify dealColor channels for [50,50,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(50, 50, 50);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2200
     * @tc.name testColorPro20022
     * @tc.desc Verify dealColor channels for [55,55,55]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(55, 55, 55);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2300
     * @tc.name testColorPro20023
     * @tc.desc Verify dealColor channels for [60,60,60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(60, 60, 60);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2400
     * @tc.name testColorPro20024
     * @tc.desc Verify dealColor channels for [65,65,65]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(65, 65, 65);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2500
     * @tc.name testColorPro20025
     * @tc.desc Verify dealColor channels for [70,70,70]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(70, 70, 70);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2600
     * @tc.name testColorPro20026
     * @tc.desc Verify dealColor channels for [75,75,75]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(75, 75, 75);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2700
     * @tc.name testColorPro20027
     * @tc.desc Verify dealColor channels for [80,80,80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(80, 80, 80);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2800
     * @tc.name testColorPro20028
     * @tc.desc Verify dealColor channels for [85,85,85]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(85, 85, 85);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_2900
     * @tc.name testColorPro20029
     * @tc.desc Verify dealColor channels for [90,90,90]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(90, 90, 90);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3000
     * @tc.name testColorPro20030
     * @tc.desc Verify dealColor channels for [95,95,95]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(95, 95, 95);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3100
     * @tc.name testColorPro20031
     * @tc.desc Verify dealColor channels for [100,100,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(100, 100, 100);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3200
     * @tc.name testColorPro20032
     * @tc.desc Verify dealColor channels for [105,105,105]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(105, 105, 105);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3300
     * @tc.name testColorPro20033
     * @tc.desc Verify dealColor channels for [110,110,110]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(110, 110, 110);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3400
     * @tc.name testColorPro20034
     * @tc.desc Verify dealColor channels for [115,115,115]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(115, 115, 115);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3500
     * @tc.name testColorPro20035
     * @tc.desc Verify dealColor channels for [120,120,120]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(120, 120, 120);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3600
     * @tc.name testColorPro20036
     * @tc.desc Verify dealColor channels for [125,125,125]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(125, 125, 125);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3700
     * @tc.name testColorPro20037
     * @tc.desc Verify dealColor channels for [130,130,130]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(130, 130, 130);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3800
     * @tc.name testColorPro20038
     * @tc.desc Verify dealColor channels for [135,135,135]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(135, 135, 135);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_3900
     * @tc.name testColorPro20039
     * @tc.desc Verify dealColor channels for [140,140,140]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(140, 140, 140);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4000
     * @tc.name testColorPro20040
     * @tc.desc Verify dealColor channels for [145,145,145]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(145, 145, 145);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4100
     * @tc.name testColorPro20041
     * @tc.desc Verify dealColor channels for [150,150,150]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(150, 150, 150);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4200
     * @tc.name testColorPro20042
     * @tc.desc Verify dealColor channels for [155,155,155]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(155, 155, 155);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4300
     * @tc.name testColorPro20043
     * @tc.desc Verify dealColor channels for [160,160,160]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(160, 160, 160);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4400
     * @tc.name testColorPro20044
     * @tc.desc Verify dealColor channels for [165,165,165]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(165, 165, 165);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4500
     * @tc.name testColorPro20045
     * @tc.desc Verify dealColor channels for [170,170,170]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(170, 170, 170);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4600
     * @tc.name testColorPro20046
     * @tc.desc Verify dealColor channels for [175,175,175]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(175, 175, 175);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4700
     * @tc.name testColorPro20047
     * @tc.desc Verify dealColor channels for [180,180,180]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(180, 180, 180);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4800
     * @tc.name testColorPro20048
     * @tc.desc Verify dealColor channels for [185,185,185]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(185, 185, 185);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_4900
     * @tc.name testColorPro20049
     * @tc.desc Verify dealColor channels for [190,190,190]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(190, 190, 190);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5000
     * @tc.name testColorPro20050
     * @tc.desc Verify dealColor channels for [195,195,195]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(195, 195, 195);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5100
     * @tc.name testColorPro20051
     * @tc.desc Verify dealColor channels for [200,200,200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(200, 200, 200);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5200
     * @tc.name testColorPro20052
     * @tc.desc Verify dealColor channels for [205,205,205]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(205, 205, 205);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5300
     * @tc.name testColorPro20053
     * @tc.desc Verify dealColor channels for [210,210,210]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(210, 210, 210);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5400
     * @tc.name testColorPro20054
     * @tc.desc Verify dealColor channels for [215,215,215]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(215, 215, 215);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5500
     * @tc.name testColorPro20055
     * @tc.desc Verify dealColor channels for [220,220,220]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(220, 220, 220);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5600
     * @tc.name testColorPro20056
     * @tc.desc Verify dealColor channels for [225,225,225]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(225, 225, 225);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5700
     * @tc.name testColorPro20057
     * @tc.desc Verify dealColor channels for [230,230,230]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(230, 230, 230);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5800
     * @tc.name testColorPro20058
     * @tc.desc Verify dealColor channels for [235,235,235]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(235, 235, 235);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_5900
     * @tc.name testColorPro20059
     * @tc.desc Verify dealColor channels for [240,240,240]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(240, 240, 240);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6000
     * @tc.name testColorPro20060
     * @tc.desc Verify dealColor channels for [245,245,245]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(245, 245, 245);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6100
     * @tc.name testColorPro20061
     * @tc.desc Verify dealColor channels for [250,250,250]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(250, 250, 250);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6200
     * @tc.name testColorPro20062
     * @tc.desc Verify dealColor channels for [255,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(255, 255, 255);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
      expect(result[0]).assertEqual(result[1]);
      expect(result[1]).assertEqual(result[2]);
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6300
     * @tc.name testColorPro20063
     * @tc.desc Verify dealColor channels for [117,228,228]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(117, 228, 228);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6400
     * @tc.name testColorPro20064
     * @tc.desc Verify dealColor channels for [188,138,172]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(188, 138, 172);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6500
     * @tc.name testColorPro20065
     * @tc.desc Verify dealColor channels for [20,228,199]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(20, 228, 199);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6600
     * @tc.name testColorPro20066
     * @tc.desc Verify dealColor channels for [147,61,58]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(147, 61, 58);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6700
     * @tc.name testColorPro20067
     * @tc.desc Verify dealColor channels for [39,170,53]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(39, 170, 53);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6800
     * @tc.name testColorPro20068
     * @tc.desc Verify dealColor channels for [0,173,147]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(0, 173, 147);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_6900
     * @tc.name testColorPro20069
     * @tc.desc Verify dealColor channels for [136,54,107]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(136, 54, 107);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7000
     * @tc.name testColorPro20070
     * @tc.desc Verify dealColor channels for [159,64,212]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(159, 64, 212);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7100
     * @tc.name testColorPro20071
     * @tc.desc Verify dealColor channels for [17,178,75]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(17, 178, 75);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7200
     * @tc.name testColorPro20072
     * @tc.desc Verify dealColor channels for [39,140,254]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(39, 140, 254);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7300
     * @tc.name testColorPro20073
     * @tc.desc Verify dealColor channels for [48,230,86]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(48, 230, 86);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7400
     * @tc.name testColorPro20074
     * @tc.desc Verify dealColor channels for [5,224,131]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(5, 224, 131);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7500
     * @tc.name testColorPro20075
     * @tc.desc Verify dealColor channels for [111,196,45]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(111, 196, 45);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7600
     * @tc.name testColorPro20076
     * @tc.desc Verify dealColor channels for [192,91,245]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(192, 91, 245);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7700
     * @tc.name testColorPro20077
     * @tc.desc Verify dealColor channels for [32,201,163]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(32, 201, 163);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7800
     * @tc.name testColorPro20078
     * @tc.desc Verify dealColor channels for [156,96,48]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(156, 96, 48);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_7900
     * @tc.name testColorPro20079
     * @tc.desc Verify dealColor channels for [88,63,17]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(88, 63, 17);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8000
     * @tc.name testColorPro20080
     * @tc.desc Verify dealColor channels for [3,241,135]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(3, 241, 135);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8100
     * @tc.name testColorPro20081
     * @tc.desc Verify dealColor channels for [136,5,86]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(136, 5, 86);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8200
     * @tc.name testColorPro20082
     * @tc.desc Verify dealColor channels for [61,254,197]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(61, 254, 197);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8300
     * @tc.name testColorPro20083
     * @tc.desc Verify dealColor channels for [63,254,207]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(63, 254, 207);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8400
     * @tc.name testColorPro20084
     * @tc.desc Verify dealColor channels for [216,204,227]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(216, 204, 227);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8500
     * @tc.name testColorPro20085
     * @tc.desc Verify dealColor channels for [175,182,26]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(175, 182, 26);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8600
     * @tc.name testColorPro20086
     * @tc.desc Verify dealColor channels for [27,191,146]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(27, 191, 146);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8700
     * @tc.name testColorPro20087
     * @tc.desc Verify dealColor channels for [222,77,147]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(222, 77, 147);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8800
     * @tc.name testColorPro20088
     * @tc.desc Verify dealColor channels for [250,202,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(250, 202, 6);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_8900
     * @tc.name testColorPro20089
     * @tc.desc Verify dealColor channels for [143,250,183]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(143, 250, 183);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9000
     * @tc.name testColorPro20090
     * @tc.desc Verify dealColor channels for [244,81,70]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(244, 81, 70);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9100
     * @tc.name testColorPro20091
     * @tc.desc Verify dealColor channels for [166,41,145]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(166, 41, 145);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9200
     * @tc.name testColorPro20092
     * @tc.desc Verify dealColor channels for [136,154,218]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(136, 154, 218);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9300
     * @tc.name testColorPro20093
     * @tc.desc Verify dealColor channels for [80,227,85]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(80, 227, 85);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9400
     * @tc.name testColorPro20094
     * @tc.desc Verify dealColor channels for [44,236,36]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(44, 236, 36);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9500
     * @tc.name testColorPro20095
     * @tc.desc Verify dealColor channels for [173,49,197]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(173, 49, 197);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9600
     * @tc.name testColorPro20096
     * @tc.desc Verify dealColor channels for [103,66,54]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(103, 66, 54);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9700
     * @tc.name testColorPro20097
     * @tc.desc Verify dealColor channels for [151,236,221]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(151, 236, 221);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9800
     * @tc.name testColorPro20098
     * @tc.desc Verify dealColor channels for [192,21,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(192, 21, 5);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_9900
     * @tc.name testColorPro20099
     * @tc.desc Verify dealColor channels for [102,178,72]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(102, 178, 72);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COLOR_PRO2_10000
     * @tc.name testColorPro20100
     * @tc.desc Verify dealColor channels for [84,219,254]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testColorPro20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number[] = ColorConversion.dealColor(84, 219, 254);
      expect(result.length).assertEqual(3);
      expect(result[0] >= 0 && result[0] <= 255 && Math.floor(result[0]) === result[0]).assertTrue();
      expect(result[1] >= 0 && result[1] <= 255 && Math.floor(result[1]) === result[1]).assertTrue();
      expect(result[2] >= 0 && result[2] <= 255 && Math.floor(result[2]) === result[2]).assertTrue();
    });
  });
}
