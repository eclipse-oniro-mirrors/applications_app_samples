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
import { Rectangle, LyricFile } from '../../../main/ets/common/constants/LyricConst';
import { PlayerConstants } from '../../../main/ets/common/constants/PlayerConstants';

export default function GeometryConstMatrixProTest() {
  describe('GeometryConstMatrixProTest', () => {
    /**
     * @tc.number SUB_GEOM_PRO_0100
     * @tc.name testGeomPro0001
     * @tc.desc Verify Rectangle(0,0,0,0).isIn(0,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 0, 0);
      expect(rect.isIn(0, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_0200
     * @tc.name testGeomPro0002
     * @tc.desc Verify Rectangle(0,0,0,0).isIn(1,2) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 0, 0);
      expect(rect.isIn(1, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_0300
     * @tc.name testGeomPro0003
     * @tc.desc Verify Rectangle(0,0,0,0).isIn(3,4) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 0, 0);
      expect(rect.isIn(3, 4)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_0400
     * @tc.name testGeomPro0004
     * @tc.desc Verify Rectangle(0,0,0,0).isIn(2,3) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 0, 0);
      expect(rect.isIn(2, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_0500
     * @tc.name testGeomPro0005
     * @tc.desc Verify Rectangle(0,0,0,0).isIn(-1,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 0, 0);
      expect(rect.isIn(-1, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_0600
     * @tc.name testGeomPro0006
     * @tc.desc Verify Rectangle(0,0,0,0).isIn(0,5) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 0, 0);
      expect(rect.isIn(0, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_0700
     * @tc.name testGeomPro0007
     * @tc.desc Verify Rectangle(0,0,0,0).isIn(100,1) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 0, 0);
      expect(rect.isIn(100, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_0800
     * @tc.name testGeomPro0008
     * @tc.desc Verify Rectangle(0,0,0,0).isIn(50,50) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 0, 0);
      expect(rect.isIn(50, 50)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_0900
     * @tc.name testGeomPro0009
     * @tc.desc Verify Rectangle(1,2,3,4).isIn(0,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(rect.isIn(0, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1000
     * @tc.name testGeomPro0010
     * @tc.desc Verify Rectangle(1,2,3,4).isIn(1,2) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(rect.isIn(1, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1100
     * @tc.name testGeomPro0011
     * @tc.desc Verify Rectangle(1,2,3,4).isIn(3,4) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(rect.isIn(3, 4)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1200
     * @tc.name testGeomPro0012
     * @tc.desc Verify Rectangle(1,2,3,4).isIn(2,3) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(rect.isIn(2, 3)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1300
     * @tc.name testGeomPro0013
     * @tc.desc Verify Rectangle(1,2,3,4).isIn(-1,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(rect.isIn(-1, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1400
     * @tc.name testGeomPro0014
     * @tc.desc Verify Rectangle(1,2,3,4).isIn(0,5) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(rect.isIn(0, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1500
     * @tc.name testGeomPro0015
     * @tc.desc Verify Rectangle(1,2,3,4).isIn(100,1) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(rect.isIn(100, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1600
     * @tc.name testGeomPro0016
     * @tc.desc Verify Rectangle(1,2,3,4).isIn(50,50) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(1, 2, 3, 4);
      expect(rect.isIn(50, 50)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1700
     * @tc.name testGeomPro0017
     * @tc.desc Verify Rectangle(10,20,30,40).isIn(0,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(10, 20, 30, 40);
      expect(rect.isIn(0, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1800
     * @tc.name testGeomPro0018
     * @tc.desc Verify Rectangle(10,20,30,40).isIn(1,2) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(10, 20, 30, 40);
      expect(rect.isIn(1, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_1900
     * @tc.name testGeomPro0019
     * @tc.desc Verify Rectangle(10,20,30,40).isIn(3,4) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(10, 20, 30, 40);
      expect(rect.isIn(3, 4)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2000
     * @tc.name testGeomPro0020
     * @tc.desc Verify Rectangle(10,20,30,40).isIn(2,3) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(10, 20, 30, 40);
      expect(rect.isIn(2, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2100
     * @tc.name testGeomPro0021
     * @tc.desc Verify Rectangle(10,20,30,40).isIn(-1,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(10, 20, 30, 40);
      expect(rect.isIn(-1, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2200
     * @tc.name testGeomPro0022
     * @tc.desc Verify Rectangle(10,20,30,40).isIn(0,5) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(10, 20, 30, 40);
      expect(rect.isIn(0, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2300
     * @tc.name testGeomPro0023
     * @tc.desc Verify Rectangle(10,20,30,40).isIn(100,1) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(10, 20, 30, 40);
      expect(rect.isIn(100, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2400
     * @tc.name testGeomPro0024
     * @tc.desc Verify Rectangle(10,20,30,40).isIn(50,50) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(10, 20, 30, 40);
      expect(rect.isIn(50, 50)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2500
     * @tc.name testGeomPro0025
     * @tc.desc Verify Rectangle(-5,-5,5,5).isIn(0,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-5, -5, 5, 5);
      expect(rect.isIn(0, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2600
     * @tc.name testGeomPro0026
     * @tc.desc Verify Rectangle(-5,-5,5,5).isIn(1,2) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-5, -5, 5, 5);
      expect(rect.isIn(1, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2700
     * @tc.name testGeomPro0027
     * @tc.desc Verify Rectangle(-5,-5,5,5).isIn(3,4) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-5, -5, 5, 5);
      expect(rect.isIn(3, 4)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2800
     * @tc.name testGeomPro0028
     * @tc.desc Verify Rectangle(-5,-5,5,5).isIn(2,3) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-5, -5, 5, 5);
      expect(rect.isIn(2, 3)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_2900
     * @tc.name testGeomPro0029
     * @tc.desc Verify Rectangle(-5,-5,5,5).isIn(-1,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-5, -5, 5, 5);
      expect(rect.isIn(-1, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3000
     * @tc.name testGeomPro0030
     * @tc.desc Verify Rectangle(-5,-5,5,5).isIn(0,5) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-5, -5, 5, 5);
      expect(rect.isIn(0, 5)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3100
     * @tc.name testGeomPro0031
     * @tc.desc Verify Rectangle(-5,-5,5,5).isIn(100,1) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-5, -5, 5, 5);
      expect(rect.isIn(100, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3200
     * @tc.name testGeomPro0032
     * @tc.desc Verify Rectangle(-5,-5,5,5).isIn(50,50) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(-5, -5, 5, 5);
      expect(rect.isIn(50, 50)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3300
     * @tc.name testGeomPro0033
     * @tc.desc Verify Rectangle(0,0,100,1).isIn(0,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 100, 1);
      expect(rect.isIn(0, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3400
     * @tc.name testGeomPro0034
     * @tc.desc Verify Rectangle(0,0,100,1).isIn(1,2) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 100, 1);
      expect(rect.isIn(1, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3500
     * @tc.name testGeomPro0035
     * @tc.desc Verify Rectangle(0,0,100,1).isIn(3,4) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 100, 1);
      expect(rect.isIn(3, 4)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3600
     * @tc.name testGeomPro0036
     * @tc.desc Verify Rectangle(0,0,100,1).isIn(2,3) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 100, 1);
      expect(rect.isIn(2, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3700
     * @tc.name testGeomPro0037
     * @tc.desc Verify Rectangle(0,0,100,1).isIn(-1,0) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 100, 1);
      expect(rect.isIn(-1, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3800
     * @tc.name testGeomPro0038
     * @tc.desc Verify Rectangle(0,0,100,1).isIn(0,5) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 100, 1);
      expect(rect.isIn(0, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_3900
     * @tc.name testGeomPro0039
     * @tc.desc Verify Rectangle(0,0,100,1).isIn(100,1) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 100, 1);
      expect(rect.isIn(100, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_4000
     * @tc.name testGeomPro0040
     * @tc.desc Verify Rectangle(0,0,100,1).isIn(50,50) matches inclusive bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 0, 100, 1);
      expect(rect.isIn(50, 50)).assertFalse();
    });

    /**
     * @tc.number SUB_GEOM_PRO_4100
     * @tc.name testGeomPro0041
     * @tc.desc Verify inverted Rectangle(5,2,3,4) keeps defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(5, 2, 3, 4);
      expect(rect.left).assertEqual(0);
      expect(rect.top).assertEqual(0);
      expect(rect.right).assertEqual(0);
      expect(rect.bottom).assertEqual(0);
    });

    /**
     * @tc.number SUB_GEOM_PRO_4200
     * @tc.name testGeomPro0042
     * @tc.desc Verify inverted Rectangle(0,5,10,1) keeps defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(0, 5, 10, 1);
      expect(rect.left).assertEqual(0);
      expect(rect.top).assertEqual(0);
      expect(rect.right).assertEqual(0);
      expect(rect.bottom).assertEqual(0);
    });

    /**
     * @tc.number SUB_GEOM_PRO_4300
     * @tc.name testGeomPro0043
     * @tc.desc Verify inverted Rectangle(3,3,3,2) keeps defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rect: Rectangle = new Rectangle(3, 3, 3, 2);
      expect(rect.left).assertEqual(0);
      expect(rect.top).assertEqual(0);
      expect(rect.right).assertEqual(0);
      expect(rect.bottom).assertEqual(0);
    });

    /**
     * @tc.number SUB_GEOM_PRO_4400
     * @tc.name testGeomPro0044
     * @tc.desc Verify angleToRadian(0) equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(0);
      expect(Math.abs(radian - (0)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_4500
     * @tc.name testGeomPro0045
     * @tc.desc Verify angleToRadian(30) equals Math.PI / 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(30);
      expect(Math.abs(radian - (Math.PI / 6)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_4600
     * @tc.name testGeomPro0046
     * @tc.desc Verify angleToRadian(45) equals Math.PI / 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(45);
      expect(Math.abs(radian - (Math.PI / 4)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_4700
     * @tc.name testGeomPro0047
     * @tc.desc Verify angleToRadian(60) equals Math.PI / 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(60);
      expect(Math.abs(radian - (Math.PI / 3)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_4800
     * @tc.name testGeomPro0048
     * @tc.desc Verify angleToRadian(90) equals Math.PI / 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(90);
      expect(Math.abs(radian - (Math.PI / 2)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_4900
     * @tc.name testGeomPro0049
     * @tc.desc Verify angleToRadian(120) equals 2 * Math.PI / 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(120);
      expect(Math.abs(radian - (2 * Math.PI / 3)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_5000
     * @tc.name testGeomPro0050
     * @tc.desc Verify angleToRadian(180) equals Math.PI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(180);
      expect(Math.abs(radian - (Math.PI)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_5100
     * @tc.name testGeomPro0051
     * @tc.desc Verify angleToRadian(270) equals 3 * Math.PI / 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(270);
      expect(Math.abs(radian - (3 * Math.PI / 2)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_5200
     * @tc.name testGeomPro0052
     * @tc.desc Verify angleToRadian(360) equals 2 * Math.PI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(360);
      expect(Math.abs(radian - (2 * Math.PI)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_5300
     * @tc.name testGeomPro0053
     * @tc.desc Verify angleToRadian(-90) equals -Math.PI / 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(-90);
      expect(Math.abs(radian - (-Math.PI / 2)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_5400
     * @tc.name testGeomPro0054
     * @tc.desc Verify angleToRadian(-180) equals -Math.PI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(-180);
      expect(Math.abs(radian - (-Math.PI)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_5500
     * @tc.name testGeomPro0055
     * @tc.desc Verify angleToRadian(-360) equals -2 * Math.PI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const radian: number = angleToRadian(-360);
      expect(Math.abs(radian - (-2 * Math.PI)) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_GEOM_PRO_5600
     * @tc.name testGeomPro0056
     * @tc.desc Verify PlayerConstants.ROTATE keeps its documented value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.ROTATE).assertEqual(360);
    });

    /**
     * @tc.number SUB_GEOM_PRO_5700
     * @tc.name testGeomPro0057
     * @tc.desc Verify PlayerConstants.ANIMATION_DURATION keeps its documented value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.ANIMATION_DURATION).assertEqual(3000);
    });

    /**
     * @tc.number SUB_GEOM_PRO_5800
     * @tc.name testGeomPro0058
     * @tc.desc Verify PlayerConstants.ITERATIONS keeps its documented value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.ITERATIONS).assertEqual(-1);
    });

    /**
     * @tc.number SUB_GEOM_PRO_5900
     * @tc.name testGeomPro0059
     * @tc.desc Verify PlayerConstants.ENCODING keeps its documented value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PlayerConstants.ENCODING).assertEqual('utf-8');
    });

    /**
     * @tc.number SUB_GEOM_PRO_6000
     * @tc.name testGeomPro0060
     * @tc.desc Verify LyricFile.KRC keeps its documented value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LyricFile.KRC).assertEqual('.krc');
    });

    /**
     * @tc.number SUB_GEOM_PRO_6100
     * @tc.name testGeomPro0061
     * @tc.desc Verify LyricFile.LRC keeps its documented value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testGeomPro0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LyricFile.LRC).assertEqual('.lrc');
    });
  });
}
