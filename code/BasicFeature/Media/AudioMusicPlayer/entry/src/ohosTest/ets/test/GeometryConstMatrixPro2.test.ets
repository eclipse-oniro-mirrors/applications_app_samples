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
import { angleToRadian } from '../../../main/ets/common/utils/LrcUtils';
import { Rectangle } from '../../../main/ets/common/constants/LyricConst';
import { PlayerConstants } from '../../../main/ets/common/constants/PlayerConstants';

export default function GeometryConstMatrixPro2Test() {
  describe('GeometryConstMatrixPro2Test', () => {
    /**
     * @tc.number SUB_GEOM_PRO2_0100
     * @tc.name testGeomPro20001
     * @tc.desc Verify Rectangle(0,0,10,10).isIn(0,0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 10, 10);
      expect(rect.isIn(0, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_0200
     * @tc.name testGeomPro20002
     * @tc.desc Verify Rectangle(0,0,10,10).isIn(5,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 10, 10);
      expect(rect.isIn(5, 5)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_0300
     * @tc.name testGeomPro20003
     * @tc.desc Verify Rectangle(0,0,10,10).isIn(10,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 10, 10);
      expect(rect.isIn(10, 10)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_0400
     * @tc.name testGeomPro20004
     * @tc.desc Verify Rectangle(0,0,10,10).isIn(11,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 10, 10);
      expect(rect.isIn(11, 10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_0500
     * @tc.name testGeomPro20005
     * @tc.desc Verify Rectangle(0,0,10,10).isIn(0,101)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 10, 10);
      expect(rect.isIn(0, 101)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_0600
     * @tc.name testGeomPro20006
     * @tc.desc Verify Rectangle(0,0,10,10).isIn(-10,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 10, 10);
      expect(rect.isIn(-10, -10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_0700
     * @tc.name testGeomPro20007
     * @tc.desc Verify Rectangle(0,0,10,10).isIn(-11,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 10, 10);
      expect(rect.isIn(-11, -10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_0800
     * @tc.name testGeomPro20008
     * @tc.desc Verify Rectangle(0,0,10,10).isIn(2,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 10, 10);
      expect(rect.isIn(2, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_0900
     * @tc.name testGeomPro20009
     * @tc.desc Verify Rectangle(1,1,2,2).isIn(0,0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 1, 2, 2);
      expect(rect.isIn(0, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1000
     * @tc.name testGeomPro20010
     * @tc.desc Verify Rectangle(1,1,2,2).isIn(5,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 1, 2, 2);
      expect(rect.isIn(5, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1100
     * @tc.name testGeomPro20011
     * @tc.desc Verify Rectangle(1,1,2,2).isIn(10,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 1, 2, 2);
      expect(rect.isIn(10, 10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1200
     * @tc.name testGeomPro20012
     * @tc.desc Verify Rectangle(1,1,2,2).isIn(11,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 1, 2, 2);
      expect(rect.isIn(11, 10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1300
     * @tc.name testGeomPro20013
     * @tc.desc Verify Rectangle(1,1,2,2).isIn(0,101)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 1, 2, 2);
      expect(rect.isIn(0, 101)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1400
     * @tc.name testGeomPro20014
     * @tc.desc Verify Rectangle(1,1,2,2).isIn(-10,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 1, 2, 2);
      expect(rect.isIn(-10, -10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1500
     * @tc.name testGeomPro20015
     * @tc.desc Verify Rectangle(1,1,2,2).isIn(-11,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 1, 2, 2);
      expect(rect.isIn(-11, -10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1600
     * @tc.name testGeomPro20016
     * @tc.desc Verify Rectangle(1,1,2,2).isIn(2,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 1, 2, 2);
      expect(rect.isIn(2, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1700
     * @tc.name testGeomPro20017
     * @tc.desc Verify Rectangle(-10,-10,0,0).isIn(0,0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-10, -10, 0, 0);
      expect(rect.isIn(0, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1800
     * @tc.name testGeomPro20018
     * @tc.desc Verify Rectangle(-10,-10,0,0).isIn(5,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-10, -10, 0, 0);
      expect(rect.isIn(5, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_1900
     * @tc.name testGeomPro20019
     * @tc.desc Verify Rectangle(-10,-10,0,0).isIn(10,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-10, -10, 0, 0);
      expect(rect.isIn(10, 10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2000
     * @tc.name testGeomPro20020
     * @tc.desc Verify Rectangle(-10,-10,0,0).isIn(11,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-10, -10, 0, 0);
      expect(rect.isIn(11, 10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2100
     * @tc.name testGeomPro20021
     * @tc.desc Verify Rectangle(-10,-10,0,0).isIn(0,101)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-10, -10, 0, 0);
      expect(rect.isIn(0, 101)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2200
     * @tc.name testGeomPro20022
     * @tc.desc Verify Rectangle(-10,-10,0,0).isIn(-10,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-10, -10, 0, 0);
      expect(rect.isIn(-10, -10)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2300
     * @tc.name testGeomPro20023
     * @tc.desc Verify Rectangle(-10,-10,0,0).isIn(-11,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-10, -10, 0, 0);
      expect(rect.isIn(-11, -10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2400
     * @tc.name testGeomPro20024
     * @tc.desc Verify Rectangle(-10,-10,0,0).isIn(2,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-10, -10, 0, 0);
      expect(rect.isIn(2, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2500
     * @tc.name testGeomPro20025
     * @tc.desc Verify Rectangle(5,5,5,5).isIn(0,0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(5, 5, 5, 5);
      expect(rect.isIn(0, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2600
     * @tc.name testGeomPro20026
     * @tc.desc Verify Rectangle(5,5,5,5).isIn(5,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(5, 5, 5, 5);
      expect(rect.isIn(5, 5)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2700
     * @tc.name testGeomPro20027
     * @tc.desc Verify Rectangle(5,5,5,5).isIn(10,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(5, 5, 5, 5);
      expect(rect.isIn(10, 10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2800
     * @tc.name testGeomPro20028
     * @tc.desc Verify Rectangle(5,5,5,5).isIn(11,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(5, 5, 5, 5);
      expect(rect.isIn(11, 10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_2900
     * @tc.name testGeomPro20029
     * @tc.desc Verify Rectangle(5,5,5,5).isIn(0,101)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(5, 5, 5, 5);
      expect(rect.isIn(0, 101)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3000
     * @tc.name testGeomPro20030
     * @tc.desc Verify Rectangle(5,5,5,5).isIn(-10,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(5, 5, 5, 5);
      expect(rect.isIn(-10, -10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3100
     * @tc.name testGeomPro20031
     * @tc.desc Verify Rectangle(5,5,5,5).isIn(-11,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(5, 5, 5, 5);
      expect(rect.isIn(-11, -10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3200
     * @tc.name testGeomPro20032
     * @tc.desc Verify Rectangle(5,5,5,5).isIn(2,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(5, 5, 5, 5);
      expect(rect.isIn(2, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3300
     * @tc.name testGeomPro20033
     * @tc.desc Verify Rectangle(0,0,1,100).isIn(0,0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 1, 100);
      expect(rect.isIn(0, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3400
     * @tc.name testGeomPro20034
     * @tc.desc Verify Rectangle(0,0,1,100).isIn(5,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 1, 100);
      expect(rect.isIn(5, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3500
     * @tc.name testGeomPro20035
     * @tc.desc Verify Rectangle(0,0,1,100).isIn(10,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 1, 100);
      expect(rect.isIn(10, 10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3600
     * @tc.name testGeomPro20036
     * @tc.desc Verify Rectangle(0,0,1,100).isIn(11,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 1, 100);
      expect(rect.isIn(11, 10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3700
     * @tc.name testGeomPro20037
     * @tc.desc Verify Rectangle(0,0,1,100).isIn(0,101)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 1, 100);
      expect(rect.isIn(0, 101)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3800
     * @tc.name testGeomPro20038
     * @tc.desc Verify Rectangle(0,0,1,100).isIn(-10,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 1, 100);
      expect(rect.isIn(-10, -10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_3900
     * @tc.name testGeomPro20039
     * @tc.desc Verify Rectangle(0,0,1,100).isIn(-11,-10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 1, 100);
      expect(rect.isIn(-11, -10)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4000
     * @tc.name testGeomPro20040
     * @tc.desc Verify Rectangle(0,0,1,100).isIn(2,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 1, 100);
      expect(rect.isIn(2, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4100
     * @tc.name testGeomPro20041
     * @tc.desc Verify inverted Rectangle(10,0,5,5) defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(10, 0, 5, 5);
      expect(rect.left).assertEqual(0);
      expect(rect.top).assertEqual(0);
      expect(rect.right).assertEqual(0);
      expect(rect.bottom).assertEqual(0);
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4200
     * @tc.name testGeomPro20042
     * @tc.desc Verify inverted Rectangle(0,10,5,5) defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 10, 5, 5);
      expect(rect.left).assertEqual(0);
      expect(rect.top).assertEqual(0);
      expect(rect.right).assertEqual(0);
      expect(rect.bottom).assertEqual(0);
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4300
     * @tc.name testGeomPro20043
     * @tc.desc Verify inverted Rectangle(2,2,1,1) defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(2, 2, 1, 1);
      expect(rect.left).assertEqual(0);
      expect(rect.top).assertEqual(0);
      expect(rect.right).assertEqual(0);
      expect(rect.bottom).assertEqual(0);
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4400
     * @tc.name testGeomPro20044
     * @tc.desc Verify angleToRadian(15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Math.abs(angleToRadian(15) - (Math.PI / 12)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4500
     * @tc.name testGeomPro20045
     * @tc.desc Verify angleToRadian(75)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Math.abs(angleToRadian(75) - (5 * Math.PI / 12)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4600
     * @tc.name testGeomPro20046
     * @tc.desc Verify angleToRadian(135)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Math.abs(angleToRadian(135) - (3 * Math.PI / 4)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4700
     * @tc.name testGeomPro20047
     * @tc.desc Verify angleToRadian(225)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Math.abs(angleToRadian(225) - (5 * Math.PI / 4)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4800
     * @tc.name testGeomPro20048
     * @tc.desc Verify angleToRadian(315)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Math.abs(angleToRadian(315) - (7 * Math.PI / 4)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_4900
     * @tc.name testGeomPro20049
     * @tc.desc Verify angleToRadian(-45)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Math.abs(angleToRadian(-45) - (-Math.PI / 4)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_5000
     * @tc.name testGeomPro20050
     * @tc.desc Verify angleToRadian(-60)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Math.abs(angleToRadian(-60) - (-Math.PI / 3)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_5100
     * @tc.name testGeomPro20051
     * @tc.desc Verify angleToRadian(-270)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Math.abs(angleToRadian(-270) - (-3 * Math.PI / 2)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO2_5200
     * @tc.name testGeomPro20052
     * @tc.desc Verify PlayerConstants.FONT_REDUCE value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.FONT_REDUCE).assertEqual(4);
    });

    /**
     * @tc.number SUB_GEOM_PRO2_5300
     * @tc.name testGeomPro20053
     * @tc.desc Verify PlayerConstants.LAYOUT_WEIGHT_PLAYER_CONTROL value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.LAYOUT_WEIGHT_PLAYER_CONTROL).assertEqual(1);
    });

    /**
     * @tc.number SUB_GEOM_PRO2_5400
     * @tc.name testGeomPro20054
     * @tc.desc Verify PlayerConstants.DISPLAY_PRIORITY_TWO value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.DISPLAY_PRIORITY_TWO).assertEqual(2);
    });

    /**
     * @tc.number SUB_GEOM_PRO2_5500
     * @tc.name testGeomPro20055
     * @tc.desc Verify PlayerConstants.DISPLAY_PRIORITY_THREE value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.DISPLAY_PRIORITY_THREE).assertEqual(3);
    });

    /**
     * @tc.number SUB_GEOM_PRO2_5600
     * @tc.name testGeomPro20056
     * @tc.desc Verify PlayerConstants.FONT_WEIGHT_700 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.FONT_WEIGHT_700).assertEqual(700);
    });

    /**
     * @tc.number SUB_GEOM_PRO2_5700
     * @tc.name testGeomPro20057
     * @tc.desc Verify PlayerConstants.FONT_WEIGHT_500 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.FONT_WEIGHT_500).assertEqual(500);
    });

    /**
     * @tc.number SUB_GEOM_PRO2_5800
     * @tc.name testGeomPro20058
     * @tc.desc Verify PlayerConstants.IMAGE_BLUR value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.IMAGE_BLUR).assertEqual(15);
    });
  });
}
