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
import DateTimeUtil from '../../../main/ets/utils/DateTimeUtil';
import { paceTurn } from './TestPace';

export default function dateTimeFillWideTableTest() {
  describe('dateTimeFillWideTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_0100
     * @tc.name testFillWide0001
     * @tc.desc Verify fill keeps the three-digit value 100 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(100);
      expect(text).assertEqual('100');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_0200
     * @tc.name testFillWide0002
     * @tc.desc Verify fill keeps the three-digit value 101 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(101);
      expect(text).assertEqual('101');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_0300
     * @tc.name testFillWide0003
     * @tc.desc Verify fill keeps the three-digit value 102 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(102);
      expect(text).assertEqual('102');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_0400
     * @tc.name testFillWide0004
     * @tc.desc Verify fill keeps the three-digit value 103 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(103);
      expect(text).assertEqual('103');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_0500
     * @tc.name testFillWide0005
     * @tc.desc Verify fill keeps the three-digit value 104 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(104);
      expect(text).assertEqual('104');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_0600
     * @tc.name testFillWide0006
     * @tc.desc Verify fill keeps the three-digit value 105 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(105);
      expect(text).assertEqual('105');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_0700
     * @tc.name testFillWide0007
     * @tc.desc Verify fill keeps the three-digit value 106 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(106);
      expect(text).assertEqual('106');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_0800
     * @tc.name testFillWide0008
     * @tc.desc Verify fill keeps the three-digit value 107 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(107);
      expect(text).assertEqual('107');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_0900
     * @tc.name testFillWide0009
     * @tc.desc Verify fill keeps the three-digit value 108 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(108);
      expect(text).assertEqual('108');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1000
     * @tc.name testFillWide0010
     * @tc.desc Verify fill keeps the three-digit value 109 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(109);
      expect(text).assertEqual('109');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1100
     * @tc.name testFillWide0011
     * @tc.desc Verify fill keeps the three-digit value 110 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(110);
      expect(text).assertEqual('110');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1200
     * @tc.name testFillWide0012
     * @tc.desc Verify fill keeps the three-digit value 111 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(111);
      expect(text).assertEqual('111');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1300
     * @tc.name testFillWide0013
     * @tc.desc Verify fill keeps the three-digit value 112 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(112);
      expect(text).assertEqual('112');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1400
     * @tc.name testFillWide0014
     * @tc.desc Verify fill keeps the three-digit value 113 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(113);
      expect(text).assertEqual('113');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1500
     * @tc.name testFillWide0015
     * @tc.desc Verify fill keeps the three-digit value 114 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(114);
      expect(text).assertEqual('114');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1600
     * @tc.name testFillWide0016
     * @tc.desc Verify fill keeps the three-digit value 115 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(115);
      expect(text).assertEqual('115');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1700
     * @tc.name testFillWide0017
     * @tc.desc Verify fill keeps the three-digit value 116 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(116);
      expect(text).assertEqual('116');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1800
     * @tc.name testFillWide0018
     * @tc.desc Verify fill keeps the three-digit value 117 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(117);
      expect(text).assertEqual('117');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_1900
     * @tc.name testFillWide0019
     * @tc.desc Verify fill keeps the three-digit value 118 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(118);
      expect(text).assertEqual('118');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2000
     * @tc.name testFillWide0020
     * @tc.desc Verify fill keeps the three-digit value 119 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(119);
      expect(text).assertEqual('119');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2100
     * @tc.name testFillWide0021
     * @tc.desc Verify fill keeps the three-digit value 120 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(120);
      expect(text).assertEqual('120');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2200
     * @tc.name testFillWide0022
     * @tc.desc Verify fill keeps the three-digit value 121 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(121);
      expect(text).assertEqual('121');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2300
     * @tc.name testFillWide0023
     * @tc.desc Verify fill keeps the three-digit value 122 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(122);
      expect(text).assertEqual('122');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2400
     * @tc.name testFillWide0024
     * @tc.desc Verify fill keeps the three-digit value 123 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(123);
      expect(text).assertEqual('123');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2500
     * @tc.name testFillWide0025
     * @tc.desc Verify fill keeps the three-digit value 124 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(124);
      expect(text).assertEqual('124');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2600
     * @tc.name testFillWide0026
     * @tc.desc Verify fill keeps the three-digit value 125 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(125);
      expect(text).assertEqual('125');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2700
     * @tc.name testFillWide0027
     * @tc.desc Verify fill keeps the three-digit value 126 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(126);
      expect(text).assertEqual('126');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2800
     * @tc.name testFillWide0028
     * @tc.desc Verify fill keeps the three-digit value 127 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(127);
      expect(text).assertEqual('127');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_2900
     * @tc.name testFillWide0029
     * @tc.desc Verify fill keeps the three-digit value 128 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(128);
      expect(text).assertEqual('128');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3000
     * @tc.name testFillWide0030
     * @tc.desc Verify fill keeps the three-digit value 129 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(129);
      expect(text).assertEqual('129');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3100
     * @tc.name testFillWide0031
     * @tc.desc Verify fill keeps the three-digit value 130 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(130);
      expect(text).assertEqual('130');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3200
     * @tc.name testFillWide0032
     * @tc.desc Verify fill keeps the three-digit value 131 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(131);
      expect(text).assertEqual('131');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3300
     * @tc.name testFillWide0033
     * @tc.desc Verify fill keeps the three-digit value 132 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(132);
      expect(text).assertEqual('132');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3400
     * @tc.name testFillWide0034
     * @tc.desc Verify fill keeps the three-digit value 133 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(133);
      expect(text).assertEqual('133');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3500
     * @tc.name testFillWide0035
     * @tc.desc Verify fill keeps the three-digit value 134 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(134);
      expect(text).assertEqual('134');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3600
     * @tc.name testFillWide0036
     * @tc.desc Verify fill keeps the three-digit value 135 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(135);
      expect(text).assertEqual('135');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3700
     * @tc.name testFillWide0037
     * @tc.desc Verify fill keeps the three-digit value 136 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(136);
      expect(text).assertEqual('136');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3800
     * @tc.name testFillWide0038
     * @tc.desc Verify fill keeps the three-digit value 137 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(137);
      expect(text).assertEqual('137');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_3900
     * @tc.name testFillWide0039
     * @tc.desc Verify fill keeps the three-digit value 138 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(138);
      expect(text).assertEqual('138');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4000
     * @tc.name testFillWide0040
     * @tc.desc Verify fill keeps the three-digit value 139 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(139);
      expect(text).assertEqual('139');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4100
     * @tc.name testFillWide0041
     * @tc.desc Verify fill keeps the three-digit value 140 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(140);
      expect(text).assertEqual('140');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4200
     * @tc.name testFillWide0042
     * @tc.desc Verify fill keeps the three-digit value 141 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(141);
      expect(text).assertEqual('141');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4300
     * @tc.name testFillWide0043
     * @tc.desc Verify fill keeps the three-digit value 142 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(142);
      expect(text).assertEqual('142');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4400
     * @tc.name testFillWide0044
     * @tc.desc Verify fill keeps the three-digit value 143 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(143);
      expect(text).assertEqual('143');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4500
     * @tc.name testFillWide0045
     * @tc.desc Verify fill keeps the three-digit value 144 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(144);
      expect(text).assertEqual('144');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4600
     * @tc.name testFillWide0046
     * @tc.desc Verify fill keeps the three-digit value 145 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(145);
      expect(text).assertEqual('145');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4700
     * @tc.name testFillWide0047
     * @tc.desc Verify fill keeps the three-digit value 146 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(146);
      expect(text).assertEqual('146');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4800
     * @tc.name testFillWide0048
     * @tc.desc Verify fill keeps the three-digit value 147 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(147);
      expect(text).assertEqual('147');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_4900
     * @tc.name testFillWide0049
     * @tc.desc Verify fill keeps the three-digit value 148 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(148);
      expect(text).assertEqual('148');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5000
     * @tc.name testFillWide0050
     * @tc.desc Verify fill keeps the three-digit value 149 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(149);
      expect(text).assertEqual('149');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5100
     * @tc.name testFillWide0051
     * @tc.desc Verify fill keeps the three-digit value 150 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(150);
      expect(text).assertEqual('150');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5200
     * @tc.name testFillWide0052
     * @tc.desc Verify fill keeps the three-digit value 151 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(151);
      expect(text).assertEqual('151');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5300
     * @tc.name testFillWide0053
     * @tc.desc Verify fill keeps the three-digit value 152 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(152);
      expect(text).assertEqual('152');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5400
     * @tc.name testFillWide0054
     * @tc.desc Verify fill keeps the three-digit value 153 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(153);
      expect(text).assertEqual('153');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5500
     * @tc.name testFillWide0055
     * @tc.desc Verify fill keeps the three-digit value 154 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(154);
      expect(text).assertEqual('154');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5600
     * @tc.name testFillWide0056
     * @tc.desc Verify fill keeps the three-digit value 155 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(155);
      expect(text).assertEqual('155');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5700
     * @tc.name testFillWide0057
     * @tc.desc Verify fill keeps the three-digit value 156 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(156);
      expect(text).assertEqual('156');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5800
     * @tc.name testFillWide0058
     * @tc.desc Verify fill keeps the three-digit value 157 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(157);
      expect(text).assertEqual('157');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_5900
     * @tc.name testFillWide0059
     * @tc.desc Verify fill keeps the three-digit value 158 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(158);
      expect(text).assertEqual('158');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6000
     * @tc.name testFillWide0060
     * @tc.desc Verify fill keeps the three-digit value 159 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(159);
      expect(text).assertEqual('159');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6100
     * @tc.name testFillWide0061
     * @tc.desc Verify fill keeps the three-digit value 160 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(160);
      expect(text).assertEqual('160');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6200
     * @tc.name testFillWide0062
     * @tc.desc Verify fill keeps the three-digit value 161 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(161);
      expect(text).assertEqual('161');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6300
     * @tc.name testFillWide0063
     * @tc.desc Verify fill keeps the three-digit value 162 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(162);
      expect(text).assertEqual('162');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6400
     * @tc.name testFillWide0064
     * @tc.desc Verify fill keeps the three-digit value 163 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(163);
      expect(text).assertEqual('163');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6500
     * @tc.name testFillWide0065
     * @tc.desc Verify fill keeps the three-digit value 164 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(164);
      expect(text).assertEqual('164');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6600
     * @tc.name testFillWide0066
     * @tc.desc Verify fill keeps the three-digit value 165 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(165);
      expect(text).assertEqual('165');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6700
     * @tc.name testFillWide0067
     * @tc.desc Verify fill keeps the three-digit value 166 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(166);
      expect(text).assertEqual('166');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6800
     * @tc.name testFillWide0068
     * @tc.desc Verify fill keeps the three-digit value 167 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(167);
      expect(text).assertEqual('167');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_6900
     * @tc.name testFillWide0069
     * @tc.desc Verify fill keeps the three-digit value 168 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(168);
      expect(text).assertEqual('168');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7000
     * @tc.name testFillWide0070
     * @tc.desc Verify fill keeps the three-digit value 169 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(169);
      expect(text).assertEqual('169');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7100
     * @tc.name testFillWide0071
     * @tc.desc Verify fill keeps the three-digit value 170 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(170);
      expect(text).assertEqual('170');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7200
     * @tc.name testFillWide0072
     * @tc.desc Verify fill keeps the three-digit value 171 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(171);
      expect(text).assertEqual('171');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7300
     * @tc.name testFillWide0073
     * @tc.desc Verify fill keeps the three-digit value 172 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(172);
      expect(text).assertEqual('172');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7400
     * @tc.name testFillWide0074
     * @tc.desc Verify fill keeps the three-digit value 173 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(173);
      expect(text).assertEqual('173');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7500
     * @tc.name testFillWide0075
     * @tc.desc Verify fill keeps the three-digit value 174 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(174);
      expect(text).assertEqual('174');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7600
     * @tc.name testFillWide0076
     * @tc.desc Verify fill keeps the three-digit value 175 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(175);
      expect(text).assertEqual('175');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7700
     * @tc.name testFillWide0077
     * @tc.desc Verify fill keeps the three-digit value 176 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(176);
      expect(text).assertEqual('176');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7800
     * @tc.name testFillWide0078
     * @tc.desc Verify fill keeps the three-digit value 177 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(177);
      expect(text).assertEqual('177');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_7900
     * @tc.name testFillWide0079
     * @tc.desc Verify fill keeps the three-digit value 178 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(178);
      expect(text).assertEqual('178');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8000
     * @tc.name testFillWide0080
     * @tc.desc Verify fill keeps the three-digit value 179 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(179);
      expect(text).assertEqual('179');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8100
     * @tc.name testFillWide0081
     * @tc.desc Verify fill keeps the three-digit value 180 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(180);
      expect(text).assertEqual('180');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8200
     * @tc.name testFillWide0082
     * @tc.desc Verify fill keeps the three-digit value 181 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(181);
      expect(text).assertEqual('181');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8300
     * @tc.name testFillWide0083
     * @tc.desc Verify fill keeps the three-digit value 182 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(182);
      expect(text).assertEqual('182');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8400
     * @tc.name testFillWide0084
     * @tc.desc Verify fill keeps the three-digit value 183 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(183);
      expect(text).assertEqual('183');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8500
     * @tc.name testFillWide0085
     * @tc.desc Verify fill keeps the three-digit value 184 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(184);
      expect(text).assertEqual('184');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8600
     * @tc.name testFillWide0086
     * @tc.desc Verify fill keeps the three-digit value 185 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(185);
      expect(text).assertEqual('185');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8700
     * @tc.name testFillWide0087
     * @tc.desc Verify fill keeps the three-digit value 186 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(186);
      expect(text).assertEqual('186');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8800
     * @tc.name testFillWide0088
     * @tc.desc Verify fill keeps the three-digit value 187 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(187);
      expect(text).assertEqual('187');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_8900
     * @tc.name testFillWide0089
     * @tc.desc Verify fill keeps the three-digit value 188 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(188);
      expect(text).assertEqual('188');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9000
     * @tc.name testFillWide0090
     * @tc.desc Verify fill keeps the three-digit value 189 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(189);
      expect(text).assertEqual('189');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9100
     * @tc.name testFillWide0091
     * @tc.desc Verify fill keeps the three-digit value 190 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(190);
      expect(text).assertEqual('190');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9200
     * @tc.name testFillWide0092
     * @tc.desc Verify fill keeps the three-digit value 191 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(191);
      expect(text).assertEqual('191');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9300
     * @tc.name testFillWide0093
     * @tc.desc Verify fill keeps the three-digit value 192 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(192);
      expect(text).assertEqual('192');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9400
     * @tc.name testFillWide0094
     * @tc.desc Verify fill keeps the three-digit value 193 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(193);
      expect(text).assertEqual('193');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9500
     * @tc.name testFillWide0095
     * @tc.desc Verify fill keeps the three-digit value 194 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(194);
      expect(text).assertEqual('194');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9600
     * @tc.name testFillWide0096
     * @tc.desc Verify fill keeps the three-digit value 195 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(195);
      expect(text).assertEqual('195');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9700
     * @tc.name testFillWide0097
     * @tc.desc Verify fill keeps the three-digit value 196 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(196);
      expect(text).assertEqual('196');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9800
     * @tc.name testFillWide0098
     * @tc.desc Verify fill keeps the three-digit value 197 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(197);
      expect(text).assertEqual('197');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_9900
     * @tc.name testFillWide0099
     * @tc.desc Verify fill keeps the three-digit value 198 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(198);
      expect(text).assertEqual('198');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_FILLWIDE_10000
     * @tc.name testFillWide0100
     * @tc.desc Verify fill keeps the three-digit value 199 at its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFillWide0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(199);
      expect(text).assertEqual('199');
      expect(text.length).assertEqual(3);
      expect(/^\d{3}$/.test(text)).assertTrue();
    })
  })
}
