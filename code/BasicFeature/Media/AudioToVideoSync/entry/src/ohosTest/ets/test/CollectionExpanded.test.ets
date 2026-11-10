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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';

export default function collectionExpandedTest() {
  describe('collectionExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0001
     * @tc.name      testExpCollection0001
     * @tc.desc      Array prefix of length 0 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 0; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(0);
      expect(values.indexOf(0)).assertEqual(-1);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(-1);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0002
     * @tc.name      testExpCollection0002
     * @tc.desc      Array prefix of length 1 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 1; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(1);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(0);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0003
     * @tc.name      testExpCollection0003
     * @tc.desc      Array prefix of length 2 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 2; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(2);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(1);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0004
     * @tc.name      testExpCollection0004
     * @tc.desc      Array prefix of length 3 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 3; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(3);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(2);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0005
     * @tc.name      testExpCollection0005
     * @tc.desc      Array prefix of length 4 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 4; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(4);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(3);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0006
     * @tc.name      testExpCollection0006
     * @tc.desc      Array prefix of length 5 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 5; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(5);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(4);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0007
     * @tc.name      testExpCollection0007
     * @tc.desc      Array prefix of length 6 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 6; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(6);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(5);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0008
     * @tc.name      testExpCollection0008
     * @tc.desc      Array prefix of length 7 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 7; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(7);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(6);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0009
     * @tc.name      testExpCollection0009
     * @tc.desc      Array prefix of length 8 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 8; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(8);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(7);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0010
     * @tc.name      testExpCollection0010
     * @tc.desc      Array prefix of length 9 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 9; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(9);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(8);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0011
     * @tc.name      testExpCollection0011
     * @tc.desc      Array prefix of length 10 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 10; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(10);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(9);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0012
     * @tc.name      testExpCollection0012
     * @tc.desc      Array prefix of length 11 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 11; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(11);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(10);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0013
     * @tc.name      testExpCollection0013
     * @tc.desc      Array prefix of length 12 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 12; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(12);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(11);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0014
     * @tc.name      testExpCollection0014
     * @tc.desc      Array prefix of length 13 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 13; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(13);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(12);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0015
     * @tc.name      testExpCollection0015
     * @tc.desc      Array prefix of length 14 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 14; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(14);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(13);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0016
     * @tc.name      testExpCollection0016
     * @tc.desc      Array prefix of length 15 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 15; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(15);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(14);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0017
     * @tc.name      testExpCollection0017
     * @tc.desc      Array prefix of length 16 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 16; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(16);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(15);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0018
     * @tc.name      testExpCollection0018
     * @tc.desc      Array prefix of length 17 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 17; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(17);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(16);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0019
     * @tc.name      testExpCollection0019
     * @tc.desc      Array prefix of length 18 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 18; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(18);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(17);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0020
     * @tc.name      testExpCollection0020
     * @tc.desc      Array prefix of length 19 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 19; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(19);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(18);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0021
     * @tc.name      testExpCollection0021
     * @tc.desc      Array prefix of length 20 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 20; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(20);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(19);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0022
     * @tc.name      testExpCollection0022
     * @tc.desc      Array prefix of length 21 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 21; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(21);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(20);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0023
     * @tc.name      testExpCollection0023
     * @tc.desc      Array prefix of length 22 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 22; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(22);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(21);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0024
     * @tc.name      testExpCollection0024
     * @tc.desc      Array prefix of length 23 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 23; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(23);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(22);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0025
     * @tc.name      testExpCollection0025
     * @tc.desc      Array prefix of length 24 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 24; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(24);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(23);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0026
     * @tc.name      testExpCollection0026
     * @tc.desc      Array prefix of length 25 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 25; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(25);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(24);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0027
     * @tc.name      testExpCollection0027
     * @tc.desc      Array prefix of length 26 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 26; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(26);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(25);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0028
     * @tc.name      testExpCollection0028
     * @tc.desc      Array prefix of length 27 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 27; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(27);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(26);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0029
     * @tc.name      testExpCollection0029
     * @tc.desc      Array prefix of length 28 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 28; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(28);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(27);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0030
     * @tc.name      testExpCollection0030
     * @tc.desc      Array prefix of length 29 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 29; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(29);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(28);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0031
     * @tc.name      testExpCollection0031
     * @tc.desc      Array prefix of length 30 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 30; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(30);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(29);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0032
     * @tc.name      testExpCollection0032
     * @tc.desc      Array prefix of length 31 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 31; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(31);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(30);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0033
     * @tc.name      testExpCollection0033
     * @tc.desc      Array prefix of length 32 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 32; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(32);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(31);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0034
     * @tc.name      testExpCollection0034
     * @tc.desc      Array prefix of length 33 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 33; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(33);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(32);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0035
     * @tc.name      testExpCollection0035
     * @tc.desc      Array prefix of length 34 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 34; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(34);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(33);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0036
     * @tc.name      testExpCollection0036
     * @tc.desc      Array prefix of length 35 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 35; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(35);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(34);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0037
     * @tc.name      testExpCollection0037
     * @tc.desc      Array prefix of length 36 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 36; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(36);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(35);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0038
     * @tc.name      testExpCollection0038
     * @tc.desc      Array prefix of length 37 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 37; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(37);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(36);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0039
     * @tc.name      testExpCollection0039
     * @tc.desc      Array prefix of length 38 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 38; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(38);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(37);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0040
     * @tc.name      testExpCollection0040
     * @tc.desc      Array prefix of length 39 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 39; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(39);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(38);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0041
     * @tc.name      testExpCollection0041
     * @tc.desc      Array prefix of length 40 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 40; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(40);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(39);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0042
     * @tc.name      testExpCollection0042
     * @tc.desc      Array prefix of length 41 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 41; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(41);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(40);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0043
     * @tc.name      testExpCollection0043
     * @tc.desc      Array prefix of length 42 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 42; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(42);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(41);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0044
     * @tc.name      testExpCollection0044
     * @tc.desc      Array prefix of length 43 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 43; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(43);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(42);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0045
     * @tc.name      testExpCollection0045
     * @tc.desc      Array prefix of length 44 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 44; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(44);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(43);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0046
     * @tc.name      testExpCollection0046
     * @tc.desc      Array prefix of length 45 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 45; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(45);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(44);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0047
     * @tc.name      testExpCollection0047
     * @tc.desc      Array prefix of length 46 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 46; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(46);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(45);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0048
     * @tc.name      testExpCollection0048
     * @tc.desc      Array prefix of length 47 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 47; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(47);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(46);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0049
     * @tc.name      testExpCollection0049
     * @tc.desc      Array prefix of length 48 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 48; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(48);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(47);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0050
     * @tc.name      testExpCollection0050
     * @tc.desc      Array prefix of length 49 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 49; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(49);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(48);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0051
     * @tc.name      testExpCollection0051
     * @tc.desc      Array prefix of length 50 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 50; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(50);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(49);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0052
     * @tc.name      testExpCollection0052
     * @tc.desc      Array prefix of length 51 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 51; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(51);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(50);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0053
     * @tc.name      testExpCollection0053
     * @tc.desc      Array prefix of length 52 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 52; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(52);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(51);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0054
     * @tc.name      testExpCollection0054
     * @tc.desc      Array prefix of length 53 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 53; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(53);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(52);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0055
     * @tc.name      testExpCollection0055
     * @tc.desc      Array prefix of length 54 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 54; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(54);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(53);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0056
     * @tc.name      testExpCollection0056
     * @tc.desc      Array prefix of length 55 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 55; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(55);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(54);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0057
     * @tc.name      testExpCollection0057
     * @tc.desc      Array prefix of length 56 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 56; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(56);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(55);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0058
     * @tc.name      testExpCollection0058
     * @tc.desc      Array prefix of length 57 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 57; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(57);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(56);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0059
     * @tc.name      testExpCollection0059
     * @tc.desc      Array prefix of length 58 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 58; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(58);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(57);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0060
     * @tc.name      testExpCollection0060
     * @tc.desc      Array prefix of length 59 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 59; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(59);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(58);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0061
     * @tc.name      testExpCollection0061
     * @tc.desc      Array prefix of length 60 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 60; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(60);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(59);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0062
     * @tc.name      testExpCollection0062
     * @tc.desc      Array prefix of length 61 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 61; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(61);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(60);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0063
     * @tc.name      testExpCollection0063
     * @tc.desc      Array prefix of length 62 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 62; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(62);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(61);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0064
     * @tc.name      testExpCollection0064
     * @tc.desc      Array prefix of length 63 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 63; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(63);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(62);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0065
     * @tc.name      testExpCollection0065
     * @tc.desc      Array prefix of length 64 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 64; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(64);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(63);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0066
     * @tc.name      testExpCollection0066
     * @tc.desc      Array prefix of length 65 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 65; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(65);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(64);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0067
     * @tc.name      testExpCollection0067
     * @tc.desc      Array prefix of length 66 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 66; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(66);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(65);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0068
     * @tc.name      testExpCollection0068
     * @tc.desc      Array prefix of length 67 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 67; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(67);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(66);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0069
     * @tc.name      testExpCollection0069
     * @tc.desc      Array prefix of length 68 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 68; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(68);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(67);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0070
     * @tc.name      testExpCollection0070
     * @tc.desc      Array prefix of length 69 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 69; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(69);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(68);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0071
     * @tc.name      testExpCollection0071
     * @tc.desc      Array prefix of length 70 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 70; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(70);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(69);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0072
     * @tc.name      testExpCollection0072
     * @tc.desc      Array prefix of length 71 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 71; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(71);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(70);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0073
     * @tc.name      testExpCollection0073
     * @tc.desc      Array prefix of length 72 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 72; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(72);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(71);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0074
     * @tc.name      testExpCollection0074
     * @tc.desc      Array prefix of length 73 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 73; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(73);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(72);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0075
     * @tc.name      testExpCollection0075
     * @tc.desc      Array prefix of length 74 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 74; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(74);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(73);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0076
     * @tc.name      testExpCollection0076
     * @tc.desc      Array prefix of length 75 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 75; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(75);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(74);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0077
     * @tc.name      testExpCollection0077
     * @tc.desc      Array prefix of length 76 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 76; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(76);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(75);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0078
     * @tc.name      testExpCollection0078
     * @tc.desc      Array prefix of length 77 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 77; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(77);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(76);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0079
     * @tc.name      testExpCollection0079
     * @tc.desc      Array prefix of length 78 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 78; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(78);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(77);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0080
     * @tc.name      testExpCollection0080
     * @tc.desc      Array prefix of length 79 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 79; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(79);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(78);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0081
     * @tc.name      testExpCollection0081
     * @tc.desc      Array prefix of length 80 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 80; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(80);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(79);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0082
     * @tc.name      testExpCollection0082
     * @tc.desc      Array prefix of length 81 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 81; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(81);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(80);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0083
     * @tc.name      testExpCollection0083
     * @tc.desc      Array prefix of length 82 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 82; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(82);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(81);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0084
     * @tc.name      testExpCollection0084
     * @tc.desc      Array prefix of length 83 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 83; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(83);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(82);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0085
     * @tc.name      testExpCollection0085
     * @tc.desc      Array prefix of length 84 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 84; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(84);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(83);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0086
     * @tc.name      testExpCollection0086
     * @tc.desc      Array prefix of length 85 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 85; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(85);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(84);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0087
     * @tc.name      testExpCollection0087
     * @tc.desc      Array prefix of length 86 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 86; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(86);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(85);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0088
     * @tc.name      testExpCollection0088
     * @tc.desc      Array prefix of length 87 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 87; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(87);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(86);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0089
     * @tc.name      testExpCollection0089
     * @tc.desc      Array prefix of length 88 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 88; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(88);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(87);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
    /**
     * @tc.number    SUB_AVS_EXP_COLL_0090
     * @tc.name      testExpCollection0090
     * @tc.desc      Array prefix of length 89 keeps order and membership.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpCollection0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let j: number = 0; j < 89; j++) {
        values.push(j);
      }
      expect(values.length).assertEqual(89);
      expect(values.indexOf(0)).assertEqual(0);
      if (values.length > 0) {
        expect(values[values.length - 1]).assertEqual(88);
      }
      expect(values.slice(0, values.length).length).assertEqual(values.length);
    })
  })
}
