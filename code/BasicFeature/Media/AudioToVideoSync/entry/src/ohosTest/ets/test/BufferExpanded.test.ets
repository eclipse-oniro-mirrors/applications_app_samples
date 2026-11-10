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
import { buffer } from '@kit.ArkTS';

export default function bufferExpandedTest() {
  describe('bufferExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0001
     * @tc.name      testExpBuffer0001
     * @tc.desc      Buffer offset 0 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(4);
      value.writeUInt8(3, 0);
      expect(value.readUInt8(0)).assertEqual(3);
      expect(buffer.byteLength(value)).assertEqual(4);
      expect(value.readUInt8(1)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0002
     * @tc.name      testExpBuffer0002
     * @tc.desc      Buffer offset 1 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(5);
      value.writeUInt8(10, 1);
      expect(value.readUInt8(1)).assertEqual(10);
      expect(buffer.byteLength(value)).assertEqual(5);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0003
     * @tc.name      testExpBuffer0003
     * @tc.desc      Buffer offset 2 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(6);
      value.writeUInt8(17, 2);
      expect(value.readUInt8(2)).assertEqual(17);
      expect(buffer.byteLength(value)).assertEqual(6);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0004
     * @tc.name      testExpBuffer0004
     * @tc.desc      Buffer offset 3 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(7);
      value.writeUInt8(24, 3);
      expect(value.readUInt8(3)).assertEqual(24);
      expect(buffer.byteLength(value)).assertEqual(7);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0005
     * @tc.name      testExpBuffer0005
     * @tc.desc      Buffer offset 4 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(8);
      value.writeUInt8(31, 4);
      expect(value.readUInt8(4)).assertEqual(31);
      expect(buffer.byteLength(value)).assertEqual(8);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0006
     * @tc.name      testExpBuffer0006
     * @tc.desc      Buffer offset 5 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(9);
      value.writeUInt8(38, 5);
      expect(value.readUInt8(5)).assertEqual(38);
      expect(buffer.byteLength(value)).assertEqual(9);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0007
     * @tc.name      testExpBuffer0007
     * @tc.desc      Buffer offset 6 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(10);
      value.writeUInt8(45, 6);
      expect(value.readUInt8(6)).assertEqual(45);
      expect(buffer.byteLength(value)).assertEqual(10);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0008
     * @tc.name      testExpBuffer0008
     * @tc.desc      Buffer offset 7 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(11);
      value.writeUInt8(52, 7);
      expect(value.readUInt8(7)).assertEqual(52);
      expect(buffer.byteLength(value)).assertEqual(11);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0009
     * @tc.name      testExpBuffer0009
     * @tc.desc      Buffer offset 8 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(12);
      value.writeUInt8(59, 8);
      expect(value.readUInt8(8)).assertEqual(59);
      expect(buffer.byteLength(value)).assertEqual(12);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0010
     * @tc.name      testExpBuffer0010
     * @tc.desc      Buffer offset 9 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(13);
      value.writeUInt8(66, 9);
      expect(value.readUInt8(9)).assertEqual(66);
      expect(buffer.byteLength(value)).assertEqual(13);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0011
     * @tc.name      testExpBuffer0011
     * @tc.desc      Buffer offset 10 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(14);
      value.writeUInt8(73, 10);
      expect(value.readUInt8(10)).assertEqual(73);
      expect(buffer.byteLength(value)).assertEqual(14);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0012
     * @tc.name      testExpBuffer0012
     * @tc.desc      Buffer offset 11 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(15);
      value.writeUInt8(80, 11);
      expect(value.readUInt8(11)).assertEqual(80);
      expect(buffer.byteLength(value)).assertEqual(15);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0013
     * @tc.name      testExpBuffer0013
     * @tc.desc      Buffer offset 12 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(16);
      value.writeUInt8(87, 12);
      expect(value.readUInt8(12)).assertEqual(87);
      expect(buffer.byteLength(value)).assertEqual(16);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0014
     * @tc.name      testExpBuffer0014
     * @tc.desc      Buffer offset 13 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(17);
      value.writeUInt8(94, 13);
      expect(value.readUInt8(13)).assertEqual(94);
      expect(buffer.byteLength(value)).assertEqual(17);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0015
     * @tc.name      testExpBuffer0015
     * @tc.desc      Buffer offset 14 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(18);
      value.writeUInt8(101, 14);
      expect(value.readUInt8(14)).assertEqual(101);
      expect(buffer.byteLength(value)).assertEqual(18);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0016
     * @tc.name      testExpBuffer0016
     * @tc.desc      Buffer offset 15 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(19);
      value.writeUInt8(108, 15);
      expect(value.readUInt8(15)).assertEqual(108);
      expect(buffer.byteLength(value)).assertEqual(19);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0017
     * @tc.name      testExpBuffer0017
     * @tc.desc      Buffer offset 16 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(20);
      value.writeUInt8(115, 16);
      expect(value.readUInt8(16)).assertEqual(115);
      expect(buffer.byteLength(value)).assertEqual(20);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0018
     * @tc.name      testExpBuffer0018
     * @tc.desc      Buffer offset 17 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(21);
      value.writeUInt8(122, 17);
      expect(value.readUInt8(17)).assertEqual(122);
      expect(buffer.byteLength(value)).assertEqual(21);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0019
     * @tc.name      testExpBuffer0019
     * @tc.desc      Buffer offset 18 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(22);
      value.writeUInt8(129, 18);
      expect(value.readUInt8(18)).assertEqual(129);
      expect(buffer.byteLength(value)).assertEqual(22);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0020
     * @tc.name      testExpBuffer0020
     * @tc.desc      Buffer offset 19 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(23);
      value.writeUInt8(136, 19);
      expect(value.readUInt8(19)).assertEqual(136);
      expect(buffer.byteLength(value)).assertEqual(23);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0021
     * @tc.name      testExpBuffer0021
     * @tc.desc      Buffer offset 20 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(24);
      value.writeUInt8(143, 20);
      expect(value.readUInt8(20)).assertEqual(143);
      expect(buffer.byteLength(value)).assertEqual(24);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0022
     * @tc.name      testExpBuffer0022
     * @tc.desc      Buffer offset 21 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(25);
      value.writeUInt8(150, 21);
      expect(value.readUInt8(21)).assertEqual(150);
      expect(buffer.byteLength(value)).assertEqual(25);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0023
     * @tc.name      testExpBuffer0023
     * @tc.desc      Buffer offset 22 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(26);
      value.writeUInt8(157, 22);
      expect(value.readUInt8(22)).assertEqual(157);
      expect(buffer.byteLength(value)).assertEqual(26);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0024
     * @tc.name      testExpBuffer0024
     * @tc.desc      Buffer offset 23 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(27);
      value.writeUInt8(164, 23);
      expect(value.readUInt8(23)).assertEqual(164);
      expect(buffer.byteLength(value)).assertEqual(27);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0025
     * @tc.name      testExpBuffer0025
     * @tc.desc      Buffer offset 24 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(28);
      value.writeUInt8(171, 24);
      expect(value.readUInt8(24)).assertEqual(171);
      expect(buffer.byteLength(value)).assertEqual(28);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0026
     * @tc.name      testExpBuffer0026
     * @tc.desc      Buffer offset 25 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(29);
      value.writeUInt8(178, 25);
      expect(value.readUInt8(25)).assertEqual(178);
      expect(buffer.byteLength(value)).assertEqual(29);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0027
     * @tc.name      testExpBuffer0027
     * @tc.desc      Buffer offset 26 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(30);
      value.writeUInt8(185, 26);
      expect(value.readUInt8(26)).assertEqual(185);
      expect(buffer.byteLength(value)).assertEqual(30);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0028
     * @tc.name      testExpBuffer0028
     * @tc.desc      Buffer offset 27 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(31);
      value.writeUInt8(192, 27);
      expect(value.readUInt8(27)).assertEqual(192);
      expect(buffer.byteLength(value)).assertEqual(31);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0029
     * @tc.name      testExpBuffer0029
     * @tc.desc      Buffer offset 28 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(32);
      value.writeUInt8(199, 28);
      expect(value.readUInt8(28)).assertEqual(199);
      expect(buffer.byteLength(value)).assertEqual(32);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0030
     * @tc.name      testExpBuffer0030
     * @tc.desc      Buffer offset 29 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(33);
      value.writeUInt8(206, 29);
      expect(value.readUInt8(29)).assertEqual(206);
      expect(buffer.byteLength(value)).assertEqual(33);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0031
     * @tc.name      testExpBuffer0031
     * @tc.desc      Buffer offset 30 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(34);
      value.writeUInt8(213, 30);
      expect(value.readUInt8(30)).assertEqual(213);
      expect(buffer.byteLength(value)).assertEqual(34);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0032
     * @tc.name      testExpBuffer0032
     * @tc.desc      Buffer offset 31 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(35);
      value.writeUInt8(220, 31);
      expect(value.readUInt8(31)).assertEqual(220);
      expect(buffer.byteLength(value)).assertEqual(35);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0033
     * @tc.name      testExpBuffer0033
     * @tc.desc      Buffer offset 32 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(36);
      value.writeUInt8(227, 32);
      expect(value.readUInt8(32)).assertEqual(227);
      expect(buffer.byteLength(value)).assertEqual(36);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0034
     * @tc.name      testExpBuffer0034
     * @tc.desc      Buffer offset 33 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(37);
      value.writeUInt8(234, 33);
      expect(value.readUInt8(33)).assertEqual(234);
      expect(buffer.byteLength(value)).assertEqual(37);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0035
     * @tc.name      testExpBuffer0035
     * @tc.desc      Buffer offset 34 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(38);
      value.writeUInt8(241, 34);
      expect(value.readUInt8(34)).assertEqual(241);
      expect(buffer.byteLength(value)).assertEqual(38);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0036
     * @tc.name      testExpBuffer0036
     * @tc.desc      Buffer offset 35 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(39);
      value.writeUInt8(248, 35);
      expect(value.readUInt8(35)).assertEqual(248);
      expect(buffer.byteLength(value)).assertEqual(39);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0037
     * @tc.name      testExpBuffer0037
     * @tc.desc      Buffer offset 36 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(40);
      value.writeUInt8(255, 36);
      expect(value.readUInt8(36)).assertEqual(255);
      expect(buffer.byteLength(value)).assertEqual(40);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0038
     * @tc.name      testExpBuffer0038
     * @tc.desc      Buffer offset 37 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(41);
      value.writeUInt8(6, 37);
      expect(value.readUInt8(37)).assertEqual(6);
      expect(buffer.byteLength(value)).assertEqual(41);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0039
     * @tc.name      testExpBuffer0039
     * @tc.desc      Buffer offset 38 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(42);
      value.writeUInt8(13, 38);
      expect(value.readUInt8(38)).assertEqual(13);
      expect(buffer.byteLength(value)).assertEqual(42);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0040
     * @tc.name      testExpBuffer0040
     * @tc.desc      Buffer offset 39 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(43);
      value.writeUInt8(20, 39);
      expect(value.readUInt8(39)).assertEqual(20);
      expect(buffer.byteLength(value)).assertEqual(43);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0041
     * @tc.name      testExpBuffer0041
     * @tc.desc      Buffer offset 40 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(44);
      value.writeUInt8(27, 40);
      expect(value.readUInt8(40)).assertEqual(27);
      expect(buffer.byteLength(value)).assertEqual(44);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0042
     * @tc.name      testExpBuffer0042
     * @tc.desc      Buffer offset 41 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(45);
      value.writeUInt8(34, 41);
      expect(value.readUInt8(41)).assertEqual(34);
      expect(buffer.byteLength(value)).assertEqual(45);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0043
     * @tc.name      testExpBuffer0043
     * @tc.desc      Buffer offset 42 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(46);
      value.writeUInt8(41, 42);
      expect(value.readUInt8(42)).assertEqual(41);
      expect(buffer.byteLength(value)).assertEqual(46);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0044
     * @tc.name      testExpBuffer0044
     * @tc.desc      Buffer offset 43 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(47);
      value.writeUInt8(48, 43);
      expect(value.readUInt8(43)).assertEqual(48);
      expect(buffer.byteLength(value)).assertEqual(47);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0045
     * @tc.name      testExpBuffer0045
     * @tc.desc      Buffer offset 44 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(48);
      value.writeUInt8(55, 44);
      expect(value.readUInt8(44)).assertEqual(55);
      expect(buffer.byteLength(value)).assertEqual(48);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0046
     * @tc.name      testExpBuffer0046
     * @tc.desc      Buffer offset 45 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(49);
      value.writeUInt8(62, 45);
      expect(value.readUInt8(45)).assertEqual(62);
      expect(buffer.byteLength(value)).assertEqual(49);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0047
     * @tc.name      testExpBuffer0047
     * @tc.desc      Buffer offset 46 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(50);
      value.writeUInt8(69, 46);
      expect(value.readUInt8(46)).assertEqual(69);
      expect(buffer.byteLength(value)).assertEqual(50);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0048
     * @tc.name      testExpBuffer0048
     * @tc.desc      Buffer offset 47 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(51);
      value.writeUInt8(76, 47);
      expect(value.readUInt8(47)).assertEqual(76);
      expect(buffer.byteLength(value)).assertEqual(51);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0049
     * @tc.name      testExpBuffer0049
     * @tc.desc      Buffer offset 48 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(52);
      value.writeUInt8(83, 48);
      expect(value.readUInt8(48)).assertEqual(83);
      expect(buffer.byteLength(value)).assertEqual(52);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0050
     * @tc.name      testExpBuffer0050
     * @tc.desc      Buffer offset 49 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(53);
      value.writeUInt8(90, 49);
      expect(value.readUInt8(49)).assertEqual(90);
      expect(buffer.byteLength(value)).assertEqual(53);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0051
     * @tc.name      testExpBuffer0051
     * @tc.desc      Buffer offset 50 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(54);
      value.writeUInt8(97, 50);
      expect(value.readUInt8(50)).assertEqual(97);
      expect(buffer.byteLength(value)).assertEqual(54);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0052
     * @tc.name      testExpBuffer0052
     * @tc.desc      Buffer offset 51 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(55);
      value.writeUInt8(104, 51);
      expect(value.readUInt8(51)).assertEqual(104);
      expect(buffer.byteLength(value)).assertEqual(55);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0053
     * @tc.name      testExpBuffer0053
     * @tc.desc      Buffer offset 52 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(56);
      value.writeUInt8(111, 52);
      expect(value.readUInt8(52)).assertEqual(111);
      expect(buffer.byteLength(value)).assertEqual(56);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0054
     * @tc.name      testExpBuffer0054
     * @tc.desc      Buffer offset 53 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(57);
      value.writeUInt8(118, 53);
      expect(value.readUInt8(53)).assertEqual(118);
      expect(buffer.byteLength(value)).assertEqual(57);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0055
     * @tc.name      testExpBuffer0055
     * @tc.desc      Buffer offset 54 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(58);
      value.writeUInt8(125, 54);
      expect(value.readUInt8(54)).assertEqual(125);
      expect(buffer.byteLength(value)).assertEqual(58);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0056
     * @tc.name      testExpBuffer0056
     * @tc.desc      Buffer offset 55 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(59);
      value.writeUInt8(132, 55);
      expect(value.readUInt8(55)).assertEqual(132);
      expect(buffer.byteLength(value)).assertEqual(59);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0057
     * @tc.name      testExpBuffer0057
     * @tc.desc      Buffer offset 56 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(60);
      value.writeUInt8(139, 56);
      expect(value.readUInt8(56)).assertEqual(139);
      expect(buffer.byteLength(value)).assertEqual(60);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0058
     * @tc.name      testExpBuffer0058
     * @tc.desc      Buffer offset 57 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(61);
      value.writeUInt8(146, 57);
      expect(value.readUInt8(57)).assertEqual(146);
      expect(buffer.byteLength(value)).assertEqual(61);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0059
     * @tc.name      testExpBuffer0059
     * @tc.desc      Buffer offset 58 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(62);
      value.writeUInt8(153, 58);
      expect(value.readUInt8(58)).assertEqual(153);
      expect(buffer.byteLength(value)).assertEqual(62);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0060
     * @tc.name      testExpBuffer0060
     * @tc.desc      Buffer offset 59 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(63);
      value.writeUInt8(160, 59);
      expect(value.readUInt8(59)).assertEqual(160);
      expect(buffer.byteLength(value)).assertEqual(63);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0061
     * @tc.name      testExpBuffer0061
     * @tc.desc      Buffer offset 60 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(64);
      value.writeUInt8(167, 60);
      expect(value.readUInt8(60)).assertEqual(167);
      expect(buffer.byteLength(value)).assertEqual(64);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0062
     * @tc.name      testExpBuffer0062
     * @tc.desc      Buffer offset 61 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(65);
      value.writeUInt8(174, 61);
      expect(value.readUInt8(61)).assertEqual(174);
      expect(buffer.byteLength(value)).assertEqual(65);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0063
     * @tc.name      testExpBuffer0063
     * @tc.desc      Buffer offset 62 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(66);
      value.writeUInt8(181, 62);
      expect(value.readUInt8(62)).assertEqual(181);
      expect(buffer.byteLength(value)).assertEqual(66);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0064
     * @tc.name      testExpBuffer0064
     * @tc.desc      Buffer offset 63 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(67);
      value.writeUInt8(188, 63);
      expect(value.readUInt8(63)).assertEqual(188);
      expect(buffer.byteLength(value)).assertEqual(67);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0065
     * @tc.name      testExpBuffer0065
     * @tc.desc      Buffer offset 64 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(68);
      value.writeUInt8(195, 64);
      expect(value.readUInt8(64)).assertEqual(195);
      expect(buffer.byteLength(value)).assertEqual(68);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0066
     * @tc.name      testExpBuffer0066
     * @tc.desc      Buffer offset 65 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(69);
      value.writeUInt8(202, 65);
      expect(value.readUInt8(65)).assertEqual(202);
      expect(buffer.byteLength(value)).assertEqual(69);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0067
     * @tc.name      testExpBuffer0067
     * @tc.desc      Buffer offset 66 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(70);
      value.writeUInt8(209, 66);
      expect(value.readUInt8(66)).assertEqual(209);
      expect(buffer.byteLength(value)).assertEqual(70);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0068
     * @tc.name      testExpBuffer0068
     * @tc.desc      Buffer offset 67 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(71);
      value.writeUInt8(216, 67);
      expect(value.readUInt8(67)).assertEqual(216);
      expect(buffer.byteLength(value)).assertEqual(71);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0069
     * @tc.name      testExpBuffer0069
     * @tc.desc      Buffer offset 68 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(72);
      value.writeUInt8(223, 68);
      expect(value.readUInt8(68)).assertEqual(223);
      expect(buffer.byteLength(value)).assertEqual(72);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0070
     * @tc.name      testExpBuffer0070
     * @tc.desc      Buffer offset 69 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(73);
      value.writeUInt8(230, 69);
      expect(value.readUInt8(69)).assertEqual(230);
      expect(buffer.byteLength(value)).assertEqual(73);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0071
     * @tc.name      testExpBuffer0071
     * @tc.desc      Buffer offset 70 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(74);
      value.writeUInt8(237, 70);
      expect(value.readUInt8(70)).assertEqual(237);
      expect(buffer.byteLength(value)).assertEqual(74);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0072
     * @tc.name      testExpBuffer0072
     * @tc.desc      Buffer offset 71 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(75);
      value.writeUInt8(244, 71);
      expect(value.readUInt8(71)).assertEqual(244);
      expect(buffer.byteLength(value)).assertEqual(75);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0073
     * @tc.name      testExpBuffer0073
     * @tc.desc      Buffer offset 72 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(76);
      value.writeUInt8(251, 72);
      expect(value.readUInt8(72)).assertEqual(251);
      expect(buffer.byteLength(value)).assertEqual(76);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0074
     * @tc.name      testExpBuffer0074
     * @tc.desc      Buffer offset 73 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(77);
      value.writeUInt8(2, 73);
      expect(value.readUInt8(73)).assertEqual(2);
      expect(buffer.byteLength(value)).assertEqual(77);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0075
     * @tc.name      testExpBuffer0075
     * @tc.desc      Buffer offset 74 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(78);
      value.writeUInt8(9, 74);
      expect(value.readUInt8(74)).assertEqual(9);
      expect(buffer.byteLength(value)).assertEqual(78);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0076
     * @tc.name      testExpBuffer0076
     * @tc.desc      Buffer offset 75 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(79);
      value.writeUInt8(16, 75);
      expect(value.readUInt8(75)).assertEqual(16);
      expect(buffer.byteLength(value)).assertEqual(79);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0077
     * @tc.name      testExpBuffer0077
     * @tc.desc      Buffer offset 76 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(80);
      value.writeUInt8(23, 76);
      expect(value.readUInt8(76)).assertEqual(23);
      expect(buffer.byteLength(value)).assertEqual(80);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0078
     * @tc.name      testExpBuffer0078
     * @tc.desc      Buffer offset 77 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(81);
      value.writeUInt8(30, 77);
      expect(value.readUInt8(77)).assertEqual(30);
      expect(buffer.byteLength(value)).assertEqual(81);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0079
     * @tc.name      testExpBuffer0079
     * @tc.desc      Buffer offset 78 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(82);
      value.writeUInt8(37, 78);
      expect(value.readUInt8(78)).assertEqual(37);
      expect(buffer.byteLength(value)).assertEqual(82);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0080
     * @tc.name      testExpBuffer0080
     * @tc.desc      Buffer offset 79 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(83);
      value.writeUInt8(44, 79);
      expect(value.readUInt8(79)).assertEqual(44);
      expect(buffer.byteLength(value)).assertEqual(83);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0081
     * @tc.name      testExpBuffer0081
     * @tc.desc      Buffer offset 80 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(84);
      value.writeUInt8(51, 80);
      expect(value.readUInt8(80)).assertEqual(51);
      expect(buffer.byteLength(value)).assertEqual(84);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0082
     * @tc.name      testExpBuffer0082
     * @tc.desc      Buffer offset 81 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(85);
      value.writeUInt8(58, 81);
      expect(value.readUInt8(81)).assertEqual(58);
      expect(buffer.byteLength(value)).assertEqual(85);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0083
     * @tc.name      testExpBuffer0083
     * @tc.desc      Buffer offset 82 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(86);
      value.writeUInt8(65, 82);
      expect(value.readUInt8(82)).assertEqual(65);
      expect(buffer.byteLength(value)).assertEqual(86);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0084
     * @tc.name      testExpBuffer0084
     * @tc.desc      Buffer offset 83 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(87);
      value.writeUInt8(72, 83);
      expect(value.readUInt8(83)).assertEqual(72);
      expect(buffer.byteLength(value)).assertEqual(87);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0085
     * @tc.name      testExpBuffer0085
     * @tc.desc      Buffer offset 84 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(88);
      value.writeUInt8(79, 84);
      expect(value.readUInt8(84)).assertEqual(79);
      expect(buffer.byteLength(value)).assertEqual(88);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0086
     * @tc.name      testExpBuffer0086
     * @tc.desc      Buffer offset 85 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(89);
      value.writeUInt8(86, 85);
      expect(value.readUInt8(85)).assertEqual(86);
      expect(buffer.byteLength(value)).assertEqual(89);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0087
     * @tc.name      testExpBuffer0087
     * @tc.desc      Buffer offset 86 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(90);
      value.writeUInt8(93, 86);
      expect(value.readUInt8(86)).assertEqual(93);
      expect(buffer.byteLength(value)).assertEqual(90);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0088
     * @tc.name      testExpBuffer0088
     * @tc.desc      Buffer offset 87 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(91);
      value.writeUInt8(100, 87);
      expect(value.readUInt8(87)).assertEqual(100);
      expect(buffer.byteLength(value)).assertEqual(91);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0089
     * @tc.name      testExpBuffer0089
     * @tc.desc      Buffer offset 88 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(92);
      value.writeUInt8(107, 88);
      expect(value.readUInt8(88)).assertEqual(107);
      expect(buffer.byteLength(value)).assertEqual(92);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0090
     * @tc.name      testExpBuffer0090
     * @tc.desc      Buffer offset 89 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(93);
      value.writeUInt8(114, 89);
      expect(value.readUInt8(89)).assertEqual(114);
      expect(buffer.byteLength(value)).assertEqual(93);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0091
     * @tc.name      testExpBuffer0091
     * @tc.desc      Buffer offset 90 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(94);
      value.writeUInt8(121, 90);
      expect(value.readUInt8(90)).assertEqual(121);
      expect(buffer.byteLength(value)).assertEqual(94);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0092
     * @tc.name      testExpBuffer0092
     * @tc.desc      Buffer offset 91 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(95);
      value.writeUInt8(128, 91);
      expect(value.readUInt8(91)).assertEqual(128);
      expect(buffer.byteLength(value)).assertEqual(95);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0093
     * @tc.name      testExpBuffer0093
     * @tc.desc      Buffer offset 92 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(96);
      value.writeUInt8(135, 92);
      expect(value.readUInt8(92)).assertEqual(135);
      expect(buffer.byteLength(value)).assertEqual(96);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0094
     * @tc.name      testExpBuffer0094
     * @tc.desc      Buffer offset 93 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(97);
      value.writeUInt8(142, 93);
      expect(value.readUInt8(93)).assertEqual(142);
      expect(buffer.byteLength(value)).assertEqual(97);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0095
     * @tc.name      testExpBuffer0095
     * @tc.desc      Buffer offset 94 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(98);
      value.writeUInt8(149, 94);
      expect(value.readUInt8(94)).assertEqual(149);
      expect(buffer.byteLength(value)).assertEqual(98);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0096
     * @tc.name      testExpBuffer0096
     * @tc.desc      Buffer offset 95 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(99);
      value.writeUInt8(156, 95);
      expect(value.readUInt8(95)).assertEqual(156);
      expect(buffer.byteLength(value)).assertEqual(99);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0097
     * @tc.name      testExpBuffer0097
     * @tc.desc      Buffer offset 96 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(100);
      value.writeUInt8(163, 96);
      expect(value.readUInt8(96)).assertEqual(163);
      expect(buffer.byteLength(value)).assertEqual(100);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0098
     * @tc.name      testExpBuffer0098
     * @tc.desc      Buffer offset 97 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(101);
      value.writeUInt8(170, 97);
      expect(value.readUInt8(97)).assertEqual(170);
      expect(buffer.byteLength(value)).assertEqual(101);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0099
     * @tc.name      testExpBuffer0099
     * @tc.desc      Buffer offset 98 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(102);
      value.writeUInt8(177, 98);
      expect(value.readUInt8(98)).assertEqual(177);
      expect(buffer.byteLength(value)).assertEqual(102);
      expect(value.readUInt8(0)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_EXP_BUFF_0100
     * @tc.name      testExpBuffer0100
     * @tc.desc      Buffer offset 99 keeps a unique byte and the expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: buffer.Buffer = buffer.alloc(103);
      value.writeUInt8(184, 99);
      expect(value.readUInt8(99)).assertEqual(184);
      expect(buffer.byteLength(value)).assertEqual(103);
      expect(value.readUInt8(0)).assertEqual(0);
    })
  })
}
