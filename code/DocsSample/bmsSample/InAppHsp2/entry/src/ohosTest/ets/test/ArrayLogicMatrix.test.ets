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
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function arrayMatrixTest() {
  describe('ArrayMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0001
     * @tc.name      testArray0001
     * @tc.desc      Array sum of block 0 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [3, 1, 4, 1, 5];
      logCase('testArray0001', 'array 0 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(14);
      expect(values[0]).assertEqual(3);
      expect(values[4]).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0002
     * @tc.name      testArray0002
     * @tc.desc      Array sum of block 1 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [2, 7, 1, 8, 2];
      logCase('testArray0002', 'array 1 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(20);
      expect(values[0]).assertEqual(2);
      expect(values[4]).assertEqual(2);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0003
     * @tc.name      testArray0003
     * @tc.desc      Array sum of block 2 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [9, 3, 3, 6, 1];
      logCase('testArray0003', 'array 2 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(22);
      expect(values[0]).assertEqual(9);
      expect(values[4]).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0004
     * @tc.name      testArray0004
     * @tc.desc      Array sum of block 3 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [4, 4, 2, 9, 0];
      logCase('testArray0004', 'array 3 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(19);
      expect(values[0]).assertEqual(4);
      expect(values[4]).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0005
     * @tc.name      testArray0005
     * @tc.desc      Array sum of block 4 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [6, 5, 3, 1, 2];
      logCase('testArray0005', 'array 4 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(17);
      expect(values[0]).assertEqual(6);
      expect(values[4]).assertEqual(2);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0006
     * @tc.name      testArray0006
     * @tc.desc      Array sum of block 5 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [8, 6, 7, 5, 3];
      logCase('testArray0006', 'array 5 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(29);
      expect(values[0]).assertEqual(8);
      expect(values[4]).assertEqual(3);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0007
     * @tc.name      testArray0007
     * @tc.desc      Array sum of block 6 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [1, 1, 1, 1, 1];
      logCase('testArray0007', 'array 6 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(5);
      expect(values[0]).assertEqual(1);
      expect(values[4]).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0008
     * @tc.name      testArray0008
     * @tc.desc      Array sum of block 7 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [0, 2, 4, 6, 8];
      logCase('testArray0008', 'array 7 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(20);
      expect(values[0]).assertEqual(0);
      expect(values[4]).assertEqual(8);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0009
     * @tc.name      testArray0009
     * @tc.desc      Array sum of block 8 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [5, 10, 15, 20, 25];
      logCase('testArray0009', 'array 8 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(75);
      expect(values[0]).assertEqual(5);
      expect(values[4]).assertEqual(25);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0010
     * @tc.name      testArray0010
     * @tc.desc      Array sum of block 9 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [11, 13, 17, 19, 23];
      logCase('testArray0010', 'array 9 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(83);
      expect(values[0]).assertEqual(11);
      expect(values[4]).assertEqual(23);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0011
     * @tc.name      testArray0011
     * @tc.desc      Array sum of block 10 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [31, 29, 23, 19, 17];
      logCase('testArray0011', 'array 10 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(119);
      expect(values[0]).assertEqual(31);
      expect(values[4]).assertEqual(17);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0012
     * @tc.name      testArray0012
     * @tc.desc      Array sum of block 11 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [12, 24, 36, 48, 60];
      logCase('testArray0012', 'array 11 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(180);
      expect(values[0]).assertEqual(12);
      expect(values[4]).assertEqual(60);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0013
     * @tc.name      testArray0013
     * @tc.desc      Array sum of block 12 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [7, 14, 21, 28, 35];
      logCase('testArray0013', 'array 12 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(105);
      expect(values[0]).assertEqual(7);
      expect(values[4]).assertEqual(35);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0014
     * @tc.name      testArray0014
     * @tc.desc      Array sum of block 13 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [100, 90, 80, 70, 60];
      logCase('testArray0014', 'array 13 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(400);
      expect(values[0]).assertEqual(100);
      expect(values[4]).assertEqual(60);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0015
     * @tc.name      testArray0015
     * @tc.desc      Array sum of block 14 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [45, 67, 89, 12, 34];
      logCase('testArray0015', 'array 14 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(247);
      expect(values[0]).assertEqual(45);
      expect(values[4]).assertEqual(34);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0016
     * @tc.name      testArray0016
     * @tc.desc      Array sum of block 15 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [56, 78, 90, 23, 11];
      logCase('testArray0016', 'array 15 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(258);
      expect(values[0]).assertEqual(56);
      expect(values[4]).assertEqual(11);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0017
     * @tc.name      testArray0017
     * @tc.desc      Array sum of block 16 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [66, 55, 44, 33, 22];
      logCase('testArray0017', 'array 16 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(220);
      expect(values[0]).assertEqual(66);
      expect(values[4]).assertEqual(22);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0018
     * @tc.name      testArray0018
     * @tc.desc      Array sum of block 17 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [21, 43, 65, 87, 9];
      logCase('testArray0018', 'array 17 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(225);
      expect(values[0]).assertEqual(21);
      expect(values[4]).assertEqual(9);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0019
     * @tc.name      testArray0019
     * @tc.desc      Array sum of block 18 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [13, 26, 39, 52, 65];
      logCase('testArray0019', 'array 18 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(195);
      expect(values[0]).assertEqual(13);
      expect(values[4]).assertEqual(65);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0020
     * @tc.name      testArray0020
     * @tc.desc      Array sum of block 19 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [77, 88, 99, 11, 22];
      logCase('testArray0020', 'array 19 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(297);
      expect(values[0]).assertEqual(77);
      expect(values[4]).assertEqual(22);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0021
     * @tc.name      testArray0021
     * @tc.desc      Array sum of block 20 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [14, 28, 42, 56, 70];
      logCase('testArray0021', 'array 20 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(210);
      expect(values[0]).assertEqual(14);
      expect(values[4]).assertEqual(70);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0022
     * @tc.name      testArray0022
     * @tc.desc      Array sum of block 21 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [15, 30, 45, 60, 75];
      logCase('testArray0022', 'array 21 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(225);
      expect(values[0]).assertEqual(15);
      expect(values[4]).assertEqual(75);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0023
     * @tc.name      testArray0023
     * @tc.desc      Array sum of block 22 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [16, 32, 48, 64, 80];
      logCase('testArray0023', 'array 22 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(240);
      expect(values[0]).assertEqual(16);
      expect(values[4]).assertEqual(80);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0024
     * @tc.name      testArray0024
     * @tc.desc      Array sum of block 23 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [18, 27, 36, 45, 54];
      logCase('testArray0024', 'array 23 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(180);
      expect(values[0]).assertEqual(18);
      expect(values[4]).assertEqual(54);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0025
     * @tc.name      testArray0025
     * @tc.desc      Array sum of block 24 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [19, 38, 57, 76, 95];
      logCase('testArray0025', 'array 24 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(285);
      expect(values[0]).assertEqual(19);
      expect(values[4]).assertEqual(95);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0026
     * @tc.name      testArray0026
     * @tc.desc      Array sum of block 25 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [20, 40, 60, 80, 100];
      logCase('testArray0026', 'array 25 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(300);
      expect(values[0]).assertEqual(20);
      expect(values[4]).assertEqual(100);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0027
     * @tc.name      testArray0027
     * @tc.desc      Array sum of block 26 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [25, 50, 75, 100, 125];
      logCase('testArray0027', 'array 26 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(375);
      expect(values[0]).assertEqual(25);
      expect(values[4]).assertEqual(125);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0028
     * @tc.name      testArray0028
     * @tc.desc      Array sum of block 27 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [30, 60, 90, 120, 150];
      logCase('testArray0028', 'array 27 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(450);
      expect(values[0]).assertEqual(30);
      expect(values[4]).assertEqual(150);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0029
     * @tc.name      testArray0029
     * @tc.desc      Array sum of block 28 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [35, 70, 105, 140, 175];
      logCase('testArray0029', 'array 28 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(525);
      expect(values[0]).assertEqual(35);
      expect(values[4]).assertEqual(175);
    });
    /**
     * @tc.number    SUB_IHSP_ARR_0030
     * @tc.name      testArray0030
     * @tc.desc      Array sum of block 29 matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const values: number[] = [40, 80, 120, 160, 200];
      logCase('testArray0030', 'array 29 length ' + values.length);
      expect(values.length).assertEqual(5);
      let total: number = 0;
      for (let i: number = 0; i < values.length; i++) {
        total += values[i];
      }
      expect(total).assertEqual(600);
      expect(values[0]).assertEqual(40);
      expect(values[4]).assertEqual(200);
    });
;
  });
}
